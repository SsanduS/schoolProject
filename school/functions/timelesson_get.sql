CREATE OR REPLACE FUNCTION school.timelesson_get(_class_id SMALLINT, _day_id SMALLINT, _lessonnumber SMALLINT, _subject_id SMALLINT, _cabinet_id SMALLINT, _teacher_id SMALLINT, _dt DATE) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
AS
$$
BEGIN

    RETURN JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
        FROM (SELECT t.lesson_id,
                     t.class_id,
                     t.day_id,
                     t.lessonnumber,
                     t.subject_id,
                     t.cabinet_id,
                     t.teacher_id,
                     t.dt
              FROM school.timelesson t
              WHERE t.class_id = COALESCE(_class_id, t.class_id)
                AND t.day_id = COALESCE(_day_id, t.day_id)
                AND t.lessonnumber = COALESCE(_lessonnumber, t.lessonnumber)
              AND t.subject_id = COALESCE(_subject_id, t.subject_id)
              AND t.cabinet_id = COALESCE(_cabinet_id, t.cabinet_id)
              AND t.teacher_id = COALESCE(_teacher_id, t.teacher_id)
              AND t.dt = COALESCE(_dt, t.dt)) res;

END
$$;