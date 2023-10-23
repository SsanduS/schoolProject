CREATE OR REPLACE FUNCTION dictionary.cabinet_getall(_cabinet_id INT) RETURNS JSONB
	SECURITY DEFINER
	LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT c.cabinet_id,
                     c.cabinetnumber
              FROM dictionary.cabinet c
              WHERE c.cabinet_id=COALESCE(_cabinet_id,c.cabinet_id)) res;
END
$$;