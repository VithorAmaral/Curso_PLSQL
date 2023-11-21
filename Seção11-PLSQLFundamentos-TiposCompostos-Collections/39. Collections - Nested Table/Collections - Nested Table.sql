set serveroutput on
set verify off

DECLARE
    TYPE numero_table_type IS
        TABLE OF INTEGER(2);
    numero_table numero_table_type := numero_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        numero_table.extend;
        numero_table(i) := i;
    END LOOP;

    FOR i IN 1..10 LOOP
        dbms_output.put_line('Nested Table: Indice = '
                             || to_char(i)
                             || ', Valor = '
                             || to_char(numero_table(i)));
    END LOOP;

END;