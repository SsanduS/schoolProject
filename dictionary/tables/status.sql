CREATE TABLE IF NOT EXISTS dictionary.status
(
    status_id  SMALLSERIAL NOT NULL,
    statusname VARCHAR(40) NOT NULL,
    CONSTRAINT PK_status PRIMARY KEY (status_id)
);

INSERT INTO dictionary.status(statusName)
VALUES ('Рабоатет'),
       ('Уволен'),
       ('Отпуск'),
       ('Декрет'),
       ('Больничный');