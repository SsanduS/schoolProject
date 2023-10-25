CREATE TABLE IF NOT EXISTS dictionary.cabinet
(
    cabinet_id    SMALLSERIAL NOT NULL,
    cabinename SMALLINT    NOT NULL,
    CONSTRAINT PK_cabinet PRIMARY KEY (cabinet_id)
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