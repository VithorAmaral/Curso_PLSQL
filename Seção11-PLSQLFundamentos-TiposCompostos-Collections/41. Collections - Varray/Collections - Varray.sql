SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    TYPE numero_table_type IS
        VARRAY(10) OF INTEGER(2);
    numero_table numero_table_type := numero_table_type();
BEGIN
    FOR i IN 1..10 LOOP
        numero_table.extend;
        numero_table(i) := i;
    END LOOP;

    FOR i IN 1..10 LOOP
        dbms_output.put_line('Varray: Indice = '
                             || to_char(i)
                             || ', Valor = '
                             || to_char(numero_table(i)));
    END LOOP;

END;