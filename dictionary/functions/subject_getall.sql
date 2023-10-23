CREATE OR REPLACE FUNCTION dictionary.subject_getall(_subject_id INT) RETURNS JSONB
	SECURITY DEFINER
    LANGUAGE plpgsql
as $$
BEGIN
    RETURN JSONB_BUILD_OBJECT('data', JSON_AGG(ROW_TO_JSON(res)))
        FROM (SELECT s.subject_id,
                     s.subjectname
              FROM dictionary.subject s
              WHERE s.subject_id=Coalesce(_subject_id,s.subject_id)) res;
END
$$;