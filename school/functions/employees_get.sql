CREATE OR REPLACE FUNCTION school.employees_get(_employees_id SMALLINT, _phone VARCHAR(11), _id_role INT) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
AS
$$
BEGIN

    RETURN JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
        FROM (SELECT e.employees_id,
                     e.surname,
                     e.name,
                     e.patronymic,
                     e.gender,
                     e.dob,
                     e.phone,
                     e.id_role,
                     e.curator,
                     e.salary,
                     e.status_id,
                     e.subjectteach
              FROM school.employees e
              WHERE e.employees_id = COALESCE(_employees_id, e.employees_id)
                AND e.phone = COALESCE(_phone, e.phone)
                AND e.id_role = COALESCE(_id_role, e.id_role)) res;

END
$$;