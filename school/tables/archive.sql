CREATE TABLE IF NOT EXISTS school.archive
(
    archive_ID  int  NOT NULL,
    students_id int  NOT NULL,
    transferDt  date NOT NULL,
    CONSTRAINT PK_archive PRIMARY KEY (archive_ID)
);