CREATE TABLE IF NOT EXISTS history.studentschanges
(
    log_id         BIGSERIAL   NOT NULL,
    students_id    INT         NOT NULL,
    surname        VARCHAR(35) NOT NULL,
    StuName        VARCHAR(35) NOT NULL,
    patronymic     VARCHAR(35),
    class_id       INT         NOT NULL,
    dob            DATE        NOT NULL,
    gender         CHAR(1)     NOT NULL,
    IsActive       BOOLEAN     NOT NULL,
    ch_employee_id INT,
    ch_dt          TIMESTAMPTZ
) PARTITION BY RANGE (ch_dt);

CREATE INDEX IF NOT EXISTS ix_studentschanges_ch_dt ON history.studentschanges (ch_dt);

CREATE INDEX IF NOT EXISTS ix_studentschanges_log_id ON history.studentschanges (log_id);

CREATE TABLE history.studentschanges_202310 PARTITION OF history.studentschanges FOR VALUES FROM ('2023-10-01') TO ('2023-11-01');
CREATE TABLE history.studentschanges_202311 PARTITION OF history.studentschanges FOR VALUES FROM ('2023-11-01') TO ('2023-12-01');
CREATE TABLE history.studentschanges_202312 PARTITION OF history.studentschanges FOR VALUES FROM ('2023-12-01') TO ('2024-01-01');
CREATE TABLE history.studentschanges_202401 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
CREATE TABLE history.studentschanges_202402 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');
CREATE TABLE history.studentschanges_202403 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');
CREATE TABLE history.studentschanges_202404 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-04-01') TO ('2024-05-01');
CREATE TABLE history.studentschanges_202405 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-05-01') TO ('2024-06-01');
CREATE TABLE history.studentschanges_202406 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-06-01') TO ('2024-07-01');
CREATE TABLE history.studentschanges_202407 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-07-01') TO ('2024-08-01');
CREATE TABLE history.studentschanges_202408 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-08-01') TO ('2024-09-01');
CREATE TABLE history.studentschanges_202409 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-09-01') TO ('2024-10-01');
CREATE TABLE history.studentschanges_202410 PARTITION OF history.studentschanges FOR VALUES FROM ('2024-10-01') TO ('2024-11-01');