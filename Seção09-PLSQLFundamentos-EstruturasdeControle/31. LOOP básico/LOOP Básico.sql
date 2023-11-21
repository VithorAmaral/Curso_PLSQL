set serveroutput on
accept plimite prompt 'Digite o valor do limite: '

DECLARE
    vnumero NUMBER(38) := 1;
    vlimite NUMBER(38) := &plimite;
BEGIN
    LOOP
        dbms_output.put_line('Número = ' || to_char(vnumero));
        EXIT WHEN vnumero = vlimite;
        vnumero := vnumero + 1;
    END LOOP;
END;