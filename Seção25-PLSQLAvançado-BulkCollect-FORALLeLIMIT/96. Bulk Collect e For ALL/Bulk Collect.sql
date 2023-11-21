set SERVEROUTPUT on
set verify off

CREATE OR REPLACE PROCEDURE prc_update_salary (
    ppercentual IN NUMBER
) AS
    TYPE employee_id_table_type IS
        TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
    employee_id_table employee_id_table_type;
BEGIN
    SELECT DISTINCT
        employee_id
    BULK COLLECT
    INTO employee_id_table
    FROM
        employees;

    dbms_output.put_line('Linhas recuperadas: ' || employee_id_table.count);
    FOR indice IN 1..employee_id_table.count LOOP
        UPDATE employees e
        SET
            e.salary = e.salary * ( 1 + ppercentual / 100 )
        WHERE
            e.employee_id = employee_id_table(indice);

    END LOOP;

END;