CREATE TABLE IF NOT EXISTS school.TimeLesson
(
    Lesson_id      BIGINT      NOT NULL,
    class_id       SMALLINT    NOT NULL,
    day_id         SMALLINT    NOT NULL,
    lessonNumber   SMALLINT    NOT NULL,
    subject_id     SMALLINT    NOT NULL,
    cabinet_id     SMALLINT    NOT NULL,
    teacher_id     SMALLINT    NOT NULL,
    dt             DATE        NOT NULL,
    ch_employee_id INT         NOT NULL,
    ch_dt          TIMESTAMPTZ NOT NULL,
    CONSTRAINT PK_TimeLesson PRIMARY KEY (Lesson_id)
);