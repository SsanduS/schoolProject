CREATE TABLE IF NOT EXISTS school.students
(
    students_id    int         NOT NULL,
    surname        varchar(35) NOT NULL,
    StuName        varchar(35) NOT NULL,
    patronymic     varchar(35),
    class_id       int         NOT NULL,
    dob            date        NOT NULL,
    gender         char(1)     NOT NULL,
    IsActive       boolean     NOT NULL,
    ch_employee_id int         NOT NULL,
    ch_dt          timestamptz NOT NULL,
    CONSTRAINT PK_Student PRIMARY KEY (students_ID)
);