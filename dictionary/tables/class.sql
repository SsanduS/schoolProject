CREATE TABLE IF NOT EXISTS dictionary.class
(
    class_id  SMALLSERIAL NOT NULL,
    classname varchar(3)  NOT NULL,
    CONSTRAINT PK_class PRIMARY KEY (class_ID)
);

INSERT INTO dictionary.status(statusName)
VALUES ('1'),
       ('2А'),
       ('2Б'),
       ('3'),
       ('4'),
       ('5'),
       ('6'),
       ('7'),
       ('8'),
       ('9'),
       ('10'),
       ('11А'),
       ('11Б'),
       ('11В');