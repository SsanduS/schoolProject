create function errmessage(_errcode character varying, _msg character varying, _detail character varying) returns jsonb
    language plpgsql
as $$
DECLARE
_errors JSONB;
BEGIN
SELECT JSONB_AGG(ROW_TO_JSON(s))
FROM (SELECT _errcode error,
             _msg     message,
             _detail  detail) s INTO _errors;

RETURN JSONB_OBJECT_AGG('errors', _errors)::JSONB;
END;
$$;