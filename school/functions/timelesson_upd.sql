CREATE OR REPLACE FUNCTION school.timelesson_upd(_scr JSONB,
                                                 _ch_employee_id INT) RETURNS JSONB
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
DECLARE
    _lesson_id    BIGINT;
    _class_id     SMALLINT;
    _day_id       SMALLINT;
    _lessonnumber SMALLINT;
    _subject_id   SMALLINT;
    _cabinet_id   SMALLINT;
    _teacher_id   SMALLINT;
    _dt           DATE;
    ch_dt         TIMESTAMPTZ := NOW();
    _fin JSON;


BEGIN
    SET TIME ZONE 'Europe/Moscow';

    SELECT COALESCE(t.lesson_id, NEXTVAL('school.school_seq')) AS lesson_id,
           s.class_id,
           s.day_id,
           s.lessonnumber,
           s.subject_id,
           s.cabinet_id,
           s.teacher_id,
           s.dt
    INTO _lesson_id,
        _class_id,
        _day_id,
        _lessonnumber,
        _subject_id,
        _cabinet_id,
        _teacher_id,
        _dt
    FROM JSONB_TO_RECORD(_scr) AS s (lesson_id BIGINT,
                                     class_id SMALLINT,
                                     day_id SMALLINT,
                                     lessonnumber SMALLINT,
                                     subject_id SMALLINT,
                                     cabinet_id SMALLINT,
                                     teacher_id SMALLINT,
                                     dt DATE)
             LEFT JOIN school.timelesson t ON t.lesson_id = s.lesson_id;


    WITH ins AS (
        INSERT INTO school.timelesson AS c (lesson_id,
                                            class_id,
                                            day_id,
                                            lessonnumber,
                                            subject_id,
                                            cabinet_id,
                                            teacher_id,
                                            dt,
                                            ch_dt,
                                            ch_employee_id)
            SELECT _lesson_id,
                   _class_id,
                   _day_id,
                   _lessonnumber,
                   _subject_id,
                   _cabinet_id,
                   _teacher_id,
                   _dt,
                   _ch_employee_id
            ON CONFLICT (lesson_id) DO UPDATE
                SET class_id = excluded.class_id,
                    day_id = excluded.day_id,
                    lessonnumber = excluded.lessonnumber,
                    subject_id = excluded.subject_id,
                    cabinet_id = excluded.cabinet_id,
                    teacher_id = excluded.teacher_id,
                    dt = excluded.dt,
                    ch_employee_id = excluded.ch_employee_id
            RETURNING c.*)


       , his AS (
        INSERT INTO history.timelessonchanges (lesson_id,
                                               class_id,
                                               day_id,
                                               lessonnumber,
                                               subject_id,
                                               cabinet_id,
                                               teacher_id,
                                               dt,
                                               ch_employee_id,
                                               ch_dt)
            SELECT i.lesson_id,
                   i.class_id,
                   i.day_id,
                   i.lessonnumber,
                   i.subject_id,
                   i.cabinet_id,
                   i.teacher_id,
                   i.dt,
                   i.ch_employee_id,
                   i.ch_dt
            FROM ins i)

    SELECT JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
    INTO _fin
    FROM (SELECT i.lesson_id,
                 i.class_id,
                 i.day_id,
                 i.lessonnumber,
                 i.subject_id,
                 i.cabinet_id,
                 i.teacher_id,
                 i.dt
          FROM ins i) res;

    RETURN _fin;
END
$$;