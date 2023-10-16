CREATE TABLE IF NOT EXISTS dictionary.days
(
    day_ID  SMALLSERIAL NOT NULL,
    dayName CHAR(3)     NOT NULL,
    CONSTRAINT PK_day PRIMARY KEY (day_ID)
);

INSERT INTO dictionary.days(dayName)
VALUES ('ПОН'),
       ('ВТО'),
       ('СРЕ'),
       ('ЧЕТ'),
       ('ПЯТ'),
       ('СУБ'),
       ('ВОС');