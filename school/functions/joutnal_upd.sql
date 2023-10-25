CREATE OR REPLACE FUNCTION school.joutnal_upd(_src jsonb,
                                              _ch_employee_id INT) RETURNS jsonb
    LANGUAGE plpgsql
    SECURITY DEFINER
AS
$$
DECLARE
    _ch_dt TIMESTAMPTZ := NOW() AT TIME ZONE 'Europe/Moscow';
BEGIN
    INSERT INTO school.journal (journal_id,
                                student_id,
                                lesson_id,
                                grade,
                                ch_employee_id,
                                ch_dt)
    SELECT COALESCE(j.journal_id, nextval('school.school_seq')) AS journal_id,
           s.student_id,
           s.lesson_id,
           s.grade,
           _ch_employee_id,
           _ch_dt
    FROM JSONB_TO_RECORD(_src) AS s (journal_id INT,
                                     student_id INT,
                                     lesson_id BIGINT,
                                     grade SMALLINT)
             LEFT JOIN school.journal j
                       ON j.journal_id = s.journal_id
    ON CONFLICT (journal_id) DO UPDATE
        SET student_id     = excluded.student_id,
            lesson_id      = excluded.lesson_id,
            lesson_id      = excluded.lesson_id,
            ch_employee_id = excluded.ch_employee_id,
            ch_dt          = excluded.ch_dt;

    RETURN JSONB_BUILD_OBJECT('data', NULL);
END
$$;