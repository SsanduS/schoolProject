CREATE TABLE IF NOT EXISTS school.archive
(
    archive_id     INT         NOT NULL,
    students_id    INT         NOT NULL,
    transferdt     DATE        NOT NULL,
    ch_employee_id INT         NOT NULL,
    ch_dt          TIMESTAMPTZ NOT NULL,
    CONSTRAINT PK_archive PRIMARY KEY (archive_id)
);