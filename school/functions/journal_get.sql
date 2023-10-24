CREATE OR REPLACE FUNCTION school.journal_get(_student_id INT, _lesson_id BIGINT, _grade SMALLINT) RETURNS JSONB
    SECURITY DEFINER
    LANGUAGE plpgsql
AS
$$
BEGIN

    RETURN JSONB_BUILD_OBJECT('data', JSONB_AGG(ROW_TO_JSON(res)))
        FROM (SELECT j.journal_id,
                     j.student_id,
                     j.lesson_id,
                     j.grade
              FROM school.journal j
              WHERE j.student_id = COALESCE(_student_id, j.student_id)
                AND j.lesson_id = COALESCE(_lesson_id, j.lesson_id)
                AND j.grade = COALESCE(_grade, j.grade)) res;

END
$$;