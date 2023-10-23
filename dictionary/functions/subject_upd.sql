CREATE OR REPLACE FUNCTION dictionary.subject_upd(_src JSONB) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
as
$$
BEGIN
    INSERT INTO dictionary.subject (subject_id,
                                    subjectname)
    SELECT COALESCE(sub.subject_id, nextval('dictionary.subject_subject_id_seq')) AS subject_id, s.subjectname
    FROM JSONB_TO_RECORD(_src) AS s (subject_id INT,
                                     subjectname VARCHAR(70))
             LEFT JOIN dictionary.subject sub
                       ON sub.subject_id = s.subject_id
    ON CONFLICT (subject_id) DO UPDATE
        SET subjectname = excluded.subjectname;

    RETURN JSONB_BUILD_OBJECT('data', NULL);

END
$$;