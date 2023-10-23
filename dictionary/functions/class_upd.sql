CREATE OR REPLACE FUNCTION dictionary.class_upd(_src JSONB) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
as
$$
DECLARE
    _class_id  SMALLINT;
    _classname VARCHAR(3);
BEGIN

    SELECT COALESCE(c.class_id, nextval('dictionary.class_class_id_seq')) AS class_id,
           s.classname
    INTO _class_id, _classname
    FROM JSONB_TO_RECORD(_src) AS s (class_id SMALLINT,
                                     classname VARCHAR(3))
             LEFT JOIN dictionary.class c
                       ON c.class_id = s.class_id;

    IF EXISTS(SELECT 1 FROM dictionary.class c WHERE c.classname = _classname)
    THEN
        RETURN public.errmessage(_errcode := 'dictionary.class.classname.class_exists',
                                 _msg := 'Такой класс существует',
                                 _detail := NULL);
    END IF;

    INSERT INTO dictionary.class AS c(class_id,
                                      classname)
    SELECT _class_id,
           _classname
    ON CONFLICT (class_id) DO UPDATE
        SET classname = excluded.classname;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;