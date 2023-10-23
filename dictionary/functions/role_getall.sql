CREATE OR REPLACE FUNCTION dictionary.role_getall(_role_id INT) RETURNS JSONB
	SECURITY DEFINER
    LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT r.role_id,
                     r.rolename
              FROM dictionary.role r
              WHERE r.role_id=COALESCE(_role_id,r.role_id)) res;
END
$$;