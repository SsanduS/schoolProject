CREATE OR REPLACE FUNCTION whsync.students_export(_log_id BIGINT) RETURNS JSONB
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
DECLARE
    _dt  TIMESTAMPTZ := now() AT TIME ZONE 'Europe/Moscow';
    _res JSONB;
BEGIN
    DELETE
    FROM whsync.studentssync ss
    WHERE ss.log_id <= _log_id
      AND ss.sync_dt IS NOT NULL;

    WITH sync_cte AS (SELECT ss.log_id,
                             ss.students_id,
                             ss.surname,
                             ss.stuname,
                             ss.patronymic,
                             ss.class_id,
                             ss.dob,
                             ss.gender,
                             ss.isactive,
                             ss.ch_employee_id,
                             ss.ch_dt
                      FROM whsync.studentssync ss
                      ORDER BY ss.log_id
                      LIMIT 100)

       , cte_upd AS (
        UPDATE whsync.studentssync ss
            SET sync_dt = _dt
            FROM sync_cte sc
            WHERE ss.log_id = sc.log_id)

    SELECT JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(sc)))
    INTO _res
    FROM sync_cte sc;

    RETURN _res;
END
$$;