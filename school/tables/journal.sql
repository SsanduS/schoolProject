CREATE TABLE IF NOT EXISTS school.journal
(
    journal_id     INT         NOT NULL,
    student_id     INT         NOT NULL,
    lesson_id      BIGINT      NOT NULL,
    grade          SMALLINT    NOT NULL,
    ch_employee_id INT         NOT NULL,
    ch_dt          TIMESTAMPTZ NOT NULL,
    CONSTRAINT PK_journal PRIMARY KEY (journal_id)
);