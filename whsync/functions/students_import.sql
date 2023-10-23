CREATE OR REPLACE FUNCTION whsync.students_import(_src JSONB) RETURNS JSONB
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
BEGIN
    SET TIME ZONE 'Europe/Moscow';

    WITH cte AS (SELECT s.students_id,
                        s.surname,
                        s.stuname,
                        s.patronymic,
                        s.class_id,
                        s.dob,
                        s.gender,
                        s.isactive,
                        s.dt_import,
                        ROW_NUMBER() OVER (PARTITION BY s.students_id ORDER BY s.dt_import DESC) RN
                 FROM JSONB_TO_RECORDSET(_src) AS s (students_id INT,
                                                     surname VARCHAR(35),
                                                     stuname VARCHAR(35),
                                                     patronymic VARCHAR(35),
                                                     class_id SMALLINT,
                                                     dob DATE,
                                                     gender CHAR(1),
                                                     isactive BOOLEAN,
                                                     dt_import TIMESTAMPTZ))

    INSERT
    INTO school.students AS sd (students_id,
                                surname,
                                stuname,
                                patronymic,
                                class_id,
                                dob,
                                gender,
                                isactive,
                                dt_import)
    SELECT s.students_id,
           s.surname,
           s.stuname,
           s.patronymic,
           s.class_id,
           s.dob,
           s.gender,
           s.isactive,
           s.dt_import
    FROM cte s
    WHERE rn = 1
    ON CONFLICT (students_id) DO UPDATE
        SET surname    = excluded.surname,
            stuname    = excluded.stuname,
            patronymic = excluded.patronymic,
            class_id   = excluded.class_id,
            dob        = excluded.dob,
            gender     = excluded.gender,
            isactive   = excluded.isactive,
            dt_import  = excluded.dt_import
    WHERE sd.dt_import <= excluded.dt_import;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;