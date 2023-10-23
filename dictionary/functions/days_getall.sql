CREATE OR REPLACE FUNCTION dictionary.days_getall(_day_id INT) RETURNS JSONB
	SECURITY DEFINER
	LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT d.day_id,
                     d.dayname
              FROM dictionary.days d
              WHERE d.day_id=Coalesce(_day_id,d.day_id)) res;
END
$$;