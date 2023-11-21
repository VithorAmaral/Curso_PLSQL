set serveroutput on

DECLARE
    vdata1 DATE := '29/04/20';
    vdata2 DATE := '29/04/2020';
BEGIN
    dbms_output.put_line('Data1 = ' || vdata1);
    dbms_output.put_line('Data2 = ' || vdata2);
END;