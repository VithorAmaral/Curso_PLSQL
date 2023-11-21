set serveroutput on

DECLARE
    vtexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
    dbms_output.put_line(vtexto);
EXCEPTION
    WHEN OTHERS
    THEN
        dbms_output.put_line('Erro Oracle: ' || sqlcode || sqlerrm);
END;
