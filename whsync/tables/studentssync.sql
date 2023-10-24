CREATE TABLE IF NOT EXISTS whsync.studentssync
(
    log_id         BIGSERIAL                NOT NULL,
    students_id    INT                      NOT NULL
        CONSTRAINT pk_student PRIMARY KEY,
    surname        VARCHAR(35)              NOT NULL,
    stuname        VARCHAR(35)              NOT NULL,
    patronymic     VARCHAR(35),
    class_id       INT                      NOT NULL,
    dob            DATE                     NOT NULL,
    gender         CHAR                     NOT NULL,
    isactive       BOOLEAN                  NOT NULL,
    ch_employee_id INT                      NOT NULL,
    ch_dt          TIMESTAMP WITH TIME ZONE NOT NULL,
    sync_dt        TIMESTAMP WITH TIME ZONE
);
