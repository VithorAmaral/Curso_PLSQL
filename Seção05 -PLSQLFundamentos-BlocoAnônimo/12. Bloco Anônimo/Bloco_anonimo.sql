set serveroutput on

DECLARE
    vnumero1 NUMBER(11, 2) := 500;
    vnumero2 NUMBER(11, 2) := 400;
    vmedia   NUMBER(11, 2);
BEGIN
    vmedia := ( vnumero1 + vnumero2 ) / 2;
    dbms_output.put_line('Média = ' || vmedia);
END;