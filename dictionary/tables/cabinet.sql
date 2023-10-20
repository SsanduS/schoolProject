CREATE TABLE IF NOT EXISTS dictionary.cabinet
(
    cabinet_id    SMALLSERIAL NOT NULL,
    cabinetNumber smallint    NOT NULL,
    CONSTRAINT PK_cabinet PRIMARY KEY (cabinet_ID)
);

INSERT INTO dictionary.cabinet(cabinetNumber)
VALUES ('10'),
       ('11'),
       ('12'),
       ('13'),
       ('14'),
       ('15'),
       ('16'),
       ('17'),
       ('18'),
       ('19'),
       ('20');