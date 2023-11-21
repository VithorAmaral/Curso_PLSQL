CREATE TABLE employees_log (
    employees_log_id NUMBER(11) NOT NULL,
    dt_log           DATE DEFAULT sysdate NOT NULL,
    usuario          VARCHAR2(30),
    evento           CHAR(1) NOT NULL,
    employee_id      NUMBER(6) NOT NULL,
    salary_old       NUMBER(8, 2),
    salary_new       NUMBER(8, 2)
);

ALTER TABLE employees_log ADD CONSTRAINT employees_log_pk PRIMARY KEY ( employees_log_id );

CREATE SEQUENCE employees_log_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE NOMAXVALUE;