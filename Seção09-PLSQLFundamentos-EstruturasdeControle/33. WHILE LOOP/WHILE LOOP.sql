set serveroutput on
accept plimite prompt 'Digite o valor do limite: '

DECLARE
    vnumero NUMBER(38) := 1;
    vlimite NUMBER(38) := &plimite;
BEGIN
    WHILE vnumero <= vlimite LOOP
        dbms_output.put_line('Número = ' || to_char(vnumero));
        vnumero := vnumero + 1;
    END LOOP;
END;