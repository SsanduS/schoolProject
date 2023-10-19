CREATE TABLE IF NOT EXISTS school.employees
(
    Employees_ID   smallint       NOT NULL,
    surname        varchar(35)    NOT NULL,
    name           varchar(35)    NOT NULL,
    patronymic     varchar(35),
    gender         char(1)        NOT NULL,
    DOB            date           NOT NULL,
    phone          varchar(11)    NOT NULL,
    id_role        int            NOT NULL,
    curator        int            NOT NULL,
    salary         decimal(10, 2) NOT NULL,
    status_id      int            NOT NULL,
    subjectTeach   smallint,
    ch_employee_ID int            NOT NULL,
    ch_dt          date           NOT NULL,
    CONSTRAINT PK_employee PRIMARY KEY (Employees_ID)
);