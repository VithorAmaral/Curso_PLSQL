set serveroutput on

DECLARE
    vcaracteretamfixo     CHAR(2) := 'RS';
    vcaracteretamvariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
    dbms_output.put_line('String Caracteres Tam Fixo = ' || vcaracteretamfixo);
    dbms_output.put_line('String Caracteres Tam Variável = ' || vcaracteretamvariavel);
END;