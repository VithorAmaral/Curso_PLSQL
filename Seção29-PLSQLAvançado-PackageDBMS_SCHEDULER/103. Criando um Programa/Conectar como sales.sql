DROP TABLE agenda;

CREATE TABLE agenda (
    agenda_id   NUMBER,
    agenda_data DATE
);

DROP SEQUENCE agenda_seq;

CREATE SEQUENCE agenda_seq START WITH 1 INCREMENT BY 1 NOCACHE NOMAXVALUE NOCYCLE;

CREATE OR REPLACE PROCEDURE prc_insere_data_agenda IS
BEGIN
    INSERT INTO agenda VALUES (
        agenda_seq.NEXTVAL,
        sysdate
    );

    COMMIT;
END;