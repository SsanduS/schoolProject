CREATE OR REPLACE FUNCTION dictionary.status_upd(_src JSONB) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
as
$$
DECLARE
BEGIN
    INSERT INTO dictionary.status(status_id,
                                  statusname)
    SELECT COALESCE(st.status_id, nextval('dictionary.status_status_id_seq')) AS status_id,
           s.statusname
    FROM JSONB_TO_RECORD(_src) AS s (status_id SMALLINT,
                                     statusname VARCHAR(40))
             LEFT JOIN dictionary.status st
                       ON st.status_id = s.status_id
    ON CONFLICT (status_id) DO UPDATE
        SET statusname = excluded.statusname;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;