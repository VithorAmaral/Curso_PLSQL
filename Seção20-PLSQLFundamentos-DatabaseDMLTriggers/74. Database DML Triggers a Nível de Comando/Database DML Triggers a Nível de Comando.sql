CREATE OR REPLACE TRIGGER b_i_employees_s_trg BEFORE
    INSERT ON employees
BEGIN
    IF ( to_char(sysdate, 'DAY') IN ( 'SABADO', 'DOMINGO' ) OR TO_NUMBER(to_char(sysdate, 'HH24')) NOT BETWEEN 8 AND 18 ) THEN
        raise_application_error(-20001, 'O cadastramento de Empregados só é permitido em dias de semana dentro do horario comercial')
        ;
    END IF;
END;