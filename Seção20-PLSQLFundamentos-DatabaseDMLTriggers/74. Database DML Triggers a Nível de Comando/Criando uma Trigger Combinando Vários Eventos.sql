CREATE OR REPLACE TRIGGER b_iud_valida_horario_employees_s_trg BEFORE
    INSERT OR UPDATE OR DELETE ON employees
BEGIN
    IF ( to_char(sysdate, 'DAY') IN ( 'SABADO', 'DOMINGO' ) OR TO_NUMBER(to_char(sysdate, 'HH24')) NOT BETWEEN 8 AND 18 ) THEN
        CASE
            WHEN inserting THEN
                raise_application_error(-20001, 'O cadastramento de Empregados só é permitido em dias de semana, dentro do horário comercial'
                );
            WHEN deleting THEN
                raise_application_error(-20001, 'A deleção de Empregados só é permitido em dias de semana, dentro do horário comercial'
                );
            ELSE
                raise_application_error(-20001, 'A atualização de Empregados só é permitido em dias de semana, dentro do horário comercial'
                );
        END CASE;

    END IF;
END;