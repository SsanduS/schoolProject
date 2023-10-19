CREATE TABLE IF NOT EXISTS school.journal
(
    journal_ID     int      NOT NULL,
    student_id     int      NOT NULL,
    lesson_id      Bigint   NOT NULL,
    grade          smallint NOT NULL,
    ch_employee_ID int      NOT NULL,
    ch_dt          date     NOT NULL,
    CONSTRAINT PK_journal PRIMARY KEY (journal_ID)
);