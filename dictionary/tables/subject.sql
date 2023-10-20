CREATE TABLE IF NOT EXISTS dictionary.subject
(
    subject_id  SMALLSERIAL NOT NULL,
    subjectname varchar(70) NOT NULL,
    CONSTRAINT PK_subject PRIMARY KEY (subject_ID)
);

INSERT INTO dictionary.subject(subjectName)
VALUES ('Русский язык'),
       ('Литература'),
       ('Иностарнанный язык'),
       ('Музыка'),
       ('История'),
       ('История России. Всеобщая история'),
       ('География'),
       ('Биология'),
       ('Алгебра'),
       ('Геометрия'),
       ('Экономика'),
       ('Право'),
       ('Физика'),
       ('Информатика'),
       ('Экология'),
       ('Обществознание'),
       ('Основы безопасности жизнедеятельности(ОБЖ)');