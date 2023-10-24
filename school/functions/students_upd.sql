CREATE OR REPLACE FUNCTION school.students_upd(_src JSONB, _ch_employee_id INT) RETURNS JSONB
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
DECLARE
    _students_id INT;
    _surname     VARCHAR(35);
    _stuname     VARCHAR(35);
    _patronymic  VARCHAR(35);
    _class_id    SMALLINT;
    _dob         DATE;
    _gender      CHAR(1);
    _isactive    BOOLEAN;
    _ch_dt       TIMESTAMPTZ := NOW() AT TIME ZONE 'Europe/Moscow';
    _fin         JSON;
BEGIN
    SELECT COALESCE(c.students_id, NEXTVAL('school.school_seq')) AS students_id,
           c.surname,
           c.stuname,
           c.patronymic,
           c.class_id,
           c.dob,
           c.gender,
           c.isactive
    INTO _students_id,
        _surname,
        _stuname,
        _patronymic,
        _class_id,
        _dob,
        _gender,
        _isactive
    FROM JSONB_TO_RECORD(_src) AS c (students_id INT,
                                     surname VARCHAR(35),
                                     stuname VARCHAR(35),
                                     patronymic VARCHAR(35),
                                     class_id SMALLINT,
                                     dob DATE,
                                     gender CHAR(1),
                                     isactive BOOLEAN)
             LEFT JOIN school.students s
                       ON s.students_id = c.students_id;

    IF EXISTS(SELECT 1
              FROM school.students s
              WHERE s.surname = _surname
                AND s.stuname = _stuname
                AND s.patronymic = _patronymic
                AND s.dob = _dob)
    THEN
        RETURN public.errmessage(_errcode := 'school.students.students_exists',
                                 _msg := 'Такой студент уже существует',
                                 _detail := NULL);
    END IF;

    WITH ins AS (
        INSERT INTO school.students AS st (students_id,
                                           surname,
                                           stuname,
                                           patronymic,
                                           class_id,
                                           dob,
                                           gender,
                                           isactive,
                                           ch_employee_id,
                                           ch_dt)
            SELECT _students_id,
                   _surname,
                   _stuname,
                   _patronymic,
                   _class_id,
                   _dob,
                   _gender,
                   _isactive,
                   _ch_employee_id,
                   _ch_dt
            ON CONFLICT (students_id) DO UPDATE
                SET surname = excluded.surname,
                    stuname = excluded.stuname,
                    patronymic = excluded.patronymic,
                    class_id = excluded.class_id,
                    dob = excluded.dob,
                    gender = excluded.gender,
                    isactive = excluded.isactive,
                    ch_employee_id = excluded.ch_employee_id,
                    ch_dt = excluded.ch_dt
            RETURNING st.*)

       , his AS (
        INSERT INTO history.studentschanges (students_id,
                                             surname,
                                             stuname,
                                             patronymic,
                                             class_id,
                                             dob,
                                             gender,
                                             isactive,
                                             ch_employee_id,
                                             ch_dt)
            SELECT i.students_id,
                   i.surname,
                   i.stuname,
                   i.patronymic,
                   i.class_id,
                   i.dob,
                   i.gender,
                   i.isactive,
                   i.ch_employee_id,
                   i.ch_dt
            FROM ins i)

       , sync AS (
        INSERT INTO whsync.studentssync (students_id,
                                         surname,
                                         stuname,
                                         patronymic,
                                         class_id,
                                         dob,
                                         gender,
                                         isactive,
                                         ch_employee_id,
                                         ch_dt)
            SELECT i.students_id,
                   i.surname,
                   i.stuname,
                   i.patronymic,
                   i.class_id,
                   i.dob,
                   i.gender,
                   i.isactive,
                   i.ch_employee_id,
                   i.ch_dt
            FROM ins i)

    SELECT JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
    INTO _fin
    FROM (SELECT i.students_id,
                 i.surname,
                 i.stuname,
                 i.patronymic
          FROM ins i) res;

    RETURN _fin;
END
$$;