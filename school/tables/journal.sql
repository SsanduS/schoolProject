CREATE TABLE IF NOT EXISTS school.journal
(
    journal_id     int         NOT NULL,
    student_id     int         NOT NULL,
    lesson_id      Bigint      NOT NULL,
    grade          smallint    NOT NULL,
    ch_employee_id int         NOT NULL,
    ch_dt          timestamptz NOT NULL,
    CONSTRAINT PK_journal PRIMARY KEY (journal_ID)
);