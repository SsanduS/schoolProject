CREATE OR REPLACE FUNCTION dictionary.class_getall(_class_id INT) RETURNS JSONB
	SECURITY DEFINER
	LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT c.class_id,
                     c.classname
              FROM dictionary.class c
              WHERE c.class_id=COALESCE(_class_id,c.class_id)) res;
END
$$;