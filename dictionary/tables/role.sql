CREATE TABLE IF NOT EXISTS dictionary.role
(
    role_id  SMALLSERIAL NOT NULL,
    rolename varchar(40) NOT NULL,
    CONSTRAINT PK_role PRIMARY KEY (role_ID)
);

INSERT INTO dictionary.role(roleName)
VALUES ('Директор'),
       ('Заместитель директора'),
       ('заведующий учебной частью'),
       ('Учитель'),
       ('Школьная медсестра'),
       ('Психолог'),
       ('Уборщик'),
       ('Водитель школьного автобуса'),
       ('Библиотекарь');