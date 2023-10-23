CREATE OR REPLACE FUNCTION cabinet_upd(_src JSONB) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
as
$$
DECLARE
BEGIN
    INSERT INTO dictionary.cabinet(cabinet_id, cabinetnumber)
    SELECT COALESCE(c.cabinet_id, nextval('dictionary.cabinet_cabinet_id_seq')) AS cabinet_id,
           s.cabinetnumber
    FROM JSONB_TO_RECORD(_src) AS s (cabinet_id SMALLINT,
                                     cabinetnumber SMALLINT)
             LEFT JOIN dictionary.cabinet c
                       ON c.cabinet_id = s.cabinet_id
    ON CONFLICT (cabinet_id) DO UPDATE
        SET cabinetnumber = excluded.cabinetnumber;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;