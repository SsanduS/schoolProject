CREATE TABLE IF NOT EXISTS school.archive
(
    archive_id     int         NOT NULL,
    students_id    int         NOT NULL,
    transferdt     date        NOT NULL,
    ch_employee_id int         NOT NULL,
    ch_dt          timestamptz NOT NULL,
    CONSTRAINT PK_archive PRIMARY KEY (archive_ID)
);