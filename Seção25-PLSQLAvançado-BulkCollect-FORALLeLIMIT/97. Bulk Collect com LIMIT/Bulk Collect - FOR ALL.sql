set serveroutput on
set verify off

CREATE OR REPLACE PROCEDURE prc_update_salary2 (
    ppercentual IN NUMBER
) AS

    vlimit            CONSTANT INTEGER(2) := 30;
    TYPE employee_id_table_type IS
        TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
    employee_id_table employee_id_table_type;
    CURSOR employees_cursor IS
    SELECT
        employee_id
    FROM
        employees;

BEGIN
    OPEN employees_cursor;
    LOOP
        FETCH employees_cursor
        BULK COLLECT INTO employee_id_table LIMIT vlimit;
        EXIT WHEN employee_id_table.count = 0;
        dbms_output.put_line('Linhas recuperadas: ' || employee_id_table.count);
        FORALL indice IN 1..employee_id_table.count
            UPDATE employees e
            SET
                e.salary = e.salary * ( 1 + ppercentual / 100 )
            WHERE
                e.employee_id = employee_id_table(indice);

    END LOOP;

    CLOSE employees_cursor;
END;