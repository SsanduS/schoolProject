CREATE TABLE IF NOT EXISTS dictionary.status
(
    status_ID  SMALLSERIAL NOT NULL,
    statusName varchar(40) NOT NULL,
    CONSTRAINT PK_status PRIMARY KEY (status_ID)
);

INSERT INTO dictionary.status(statusName)
VALUES ('Рабоатет'),
       ('Уволен'),
       ('Отпуск'),
       ('Декрет'),
       ('Больничный');