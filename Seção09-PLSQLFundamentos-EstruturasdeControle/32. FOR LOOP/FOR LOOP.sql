set serveroutput on
accept plimite prompt 'Digite o valor do limite: '

DECLARE
    vinicio INTEGER(3) := 1;
    vfim    NUMBER(3) := &plimite;
BEGIN
    FOR i IN vinicio..vfim LOOP
        dbms_output.put_line('Numero = ' || to_char(i));
    END LOOP;
END;