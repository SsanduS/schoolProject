CREATE TABLE IF NOT EXISTS school.TimeLesson
(
    Lesson_ID      Bigint   NOT NULL,
    class_id       smallint NOT NULL,
    day_id         smallint NOT NULL,
    lessonNumber   smallint NOT NULL,
    subject_id     smallint NOT NULL,
    cabinet_id     smallint NOT NULL,
    teacher_id     smallint NOT NULL,
    dt             date     NOT NULL,
    ch_employee_ID int      NOT NULL,
    ch_dt          date     NOT NULL,
    CONSTRAINT PK_TimeLesson PRIMARY KEY (Lesson_ID)
);