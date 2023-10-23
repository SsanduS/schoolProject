CREATE OR REPLACE FUNCTION dictionary.status_getall(_status_id INT) RETURNS JSONB
	SECURITY DEFINER
    LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT s.status_id,
                     s.statusname
              FROM dictionary.status s
              WHERE s.status_id=Coalesce(_status_id,s.status_id)) res;
END
$$;