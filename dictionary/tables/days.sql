CREATE TABLE IF NOT EXISTS dictionary.days
(
    day_ID  SMALLSERIAL NOT NULL,
    dayName CHAR(2)     NOT NULL,
    CONSTRAINT PK_day PRIMARY KEY (day_ID)
);

INSERT INTO dictionary.days(dayName)
VALUES ('ПН'),
       ('ВТ'),
       ('СР'),
       ('ЧТ'),
       ('ПТ'),
       ('СБ'),
       ('ВС');