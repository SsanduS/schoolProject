CREATE OR REPLACE FUNCTION role_upd(_src JSONB) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
as
$$
DECLARE
BEGIN
    INSERT INTO dictionary.role(role_id, rolename)
    SELECT COALESCE(r.role_id, nextval('dictionary.role_role_id_seq')) AS role_id,
           s.rolename
    FROM JSONB_TO_RECORD(_src) AS s (role_id SMALLINT,
                                     rolename VARCHAR(40))
             LEFT JOIN dictionary.role r
                       ON r.role_id = s.role_id
    ON CONFLICT (role_id) DO UPDATE
        SET rolename = excluded.rolename;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;