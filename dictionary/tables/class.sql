CREATE TABLE IF NOT EXISTS dictionary.class
(
    class_id  SMALLSERIAL NOT NULL,
    classname VARCHAR(3)  NOT NULL,
    CONSTRAINT PK_class PRIMARY KEY (class_id)
);

INSERT INTO dictionary.class(classname)
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