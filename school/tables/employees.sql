CREATE TABLE IF NOT EXISTS school.employees
(
    employees_id   SMALLINT       NOT NULL,
    surname        VARCHAR(35)    NOT NULL,
    name           VARCHAR(35)    NOT NULL,
    patronymic     VARCHAR(35),
    gender         CHAR(1)        NOT NULL,
    dob            DATE           NOT NULL,
    phone          VARCHAR(11)    NOT NULL,
    id_role        INT            NOT NULL,
    curator        INT,
    salary         DECIMAL(10, 2) NOT NULL,
    status_id      INT            NOT NULL,
    subjectTeach   SMALLINT,
    ch_employee_id INT            NOT NULL,
    ch_dt          TIMESTAMPTZ    NOT NULL,
    CONSTRAINT PK_employee PRIMARY KEY (employees_id)
);