CREATE FUNCTION errmessage(_errcode CHARACTER VARYING, _msg CHARACTER VARYING, _detail CHARACTER VARYING) RETURNS JSONB
	language plpgsql
as $$
DECLARE
    _errors JSONB;
BEGIN
    SELECT JSONB_AGG(ROW_TO_JSON(s))
    FROM (
        SELECT _errcode error,
               _msg     message,
               _detail  detail) s
    INTO _errors;

    RETURN JSONB_OBJECT_AGG('errors', _errors)::JSONB;
END;
$$;

