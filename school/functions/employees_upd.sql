CREATE OR REPLACE FUNCTION employees_upd(_src JSONB, _ch_employee_id INT) RETURNS JSONB
	SECURITY DEFINER
	LANGUAGE plpgsql
as $$
DECLARE
    _ch_dt TIMESTAMPTZ := NOW() AT TIME ZONE 'Europe/Moscow';
BEGIN
    INSERT INTO school.employees (employees_id,
                                  surname,
                                  name,
                                  patronymic,
                                  gender,
                                  dob,
                                  phone,
                                  id_role,
                                  curator,
                                  salary,
                                  status_id,
                                  subjectteach,
                                  ch_employee_id,
                                  ch_dt)
    SELECT COALESCE(e.employees_id, nextval('school.school_seq')) AS employees_id,
           s.surname,
           s.name,
           s.patronymic,
           s.gender,
           s.dob,
           s.phone,
           s.id_role,
           s.curator,
           s.salary,
           s.status_id,
           s.subjectteach,
           _ch_employee_id,
           _ch_dt
    FROM JSONB_TO_RECORD(_src) AS s (employees_id SMALLINT,
                                     surname varchar(35),
                                     name varchar(35),
                                     patronymic varchar(35),
                                     gender char(1),
                                     dob date,
                                     phone varchar(11),
                                     id_role smallint,
                                     curator smallint,
                                     salary numeric(10, 2),
                                     status_id smallint,
                                     subjectteach smallint)
             LEFT JOIN school.employees e
                       ON e.employees_id = s.employees_id
    ON CONFLICT (employees_id) DO UPDATE
        SET surname        = excluded.surname,
            name           = excluded.name,
            patronymic     = excluded.patronymic,
            gender         = excluded.gender,
            dob            = excluded.dob,
            phone          = excluded.phone,
            id_role        = excluded.id_role,
            curator        = excluded.curator,
            salary         = excluded.salary,
            status_id      = excluded.status_id,
            subjectteach   = excluded.subjectteach,
            ch_employee_id = excluded.ch_employee_id,
            ch_dt          = excluded.ch_dt;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;