CREATE TABLE IF NOT EXISTS dictionary.days
(
    day_id  SMALLSERIAL NOT NULL,
    dayname CHAR(2)     NOT NULL,
    CONSTRAINT PK_day PRIMARY KEY (day_id)
);

INSERT INTO dictionary.days(dayName)
VALUES ('ПН'),
       ('ВТ'),
       ('СР'),
       ('ЧТ'),
       ('ПТ'),
       ('СБ'),
       ('ВС');