CREATE TABLE IF NOT EXISTS school.students
(
    students_id    INT         NOT NULL,
    surname        VARCHAR(35) NOT NULL,
    StuName        VARCHAR(35) NOT NULL,
    patronymic     VARCHAR(35),
    class_id       INT         NOT NULL,
    dob            DATE        NOT NULL,
    gender         CHAR(1)     NOT NULL,
    IsActive       BOOLEAN     NOT NULL,
    dt_import      TIMESTAMPTZ,
    ch_employee_id INT,
    ch_dt          TIMESTAMPTZ,
    CONSTRAINT PK_Student PRIMARY KEY (students_id)
);