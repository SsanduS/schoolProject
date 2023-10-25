CREATE OR REPLACE FUNCTION school.students_get(_students_id INT, _surname VARCHAR(35), _stuname VARCHAR(35),
                                               _patronymic VARCHAR(35), _class_id INT, _isactive BOOLEAN) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
AS
$$
BEGIN

    RETURN JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
        FROM (SELECT s.students_id,
                     s.surname,
                     s.stuname,
                     s.patronymic,
                     s.class_id,
                     s.dob,
                     s.gender,
                     s.isactive
              FROM school.students s
              WHERE s.students_id = COALESCE(_students_id, s.students_id)
                AND s.surname = COALESCE(_surname, s.surname)
                AND s.stuname = COALESCE(_stuname, s.stuname)
                AND s.patronymic = COALESCE(_patronymic, s.patronymic)
                AND s.class_id = COALESCE(_class_id, s.class_id)
                AND s.isactive = COALESCE(_isactive, s.isactive)) res;

END
$$;