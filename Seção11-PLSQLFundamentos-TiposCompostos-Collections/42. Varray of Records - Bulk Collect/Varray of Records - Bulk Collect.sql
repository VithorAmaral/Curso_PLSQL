set serveroutput on
set verify off

DECLARE
    TYPE employees_table_type IS
        VARRAY(200) OF employees%rowtype;
    employees_table employees_table_type := employees_table_type();
BEGIN
    SELECT
        *
    BULK COLLECT
    INTO employees_table
    FROM
        employees;

    FOR i IN employees_table.first..employees_table.last LOOP
        dbms_output.put_line(employees_table(i).employee_id
                             || ' - '
                             || employees_table(i).first_name
                             || ' - '
                             || employees_table(i).last_name
                             || ' - '
                             || employees_table(i).phone_number
                             || ' - '
                             || employees_table(i).job_id
                             || ' - '
                             || to_char(employees_table(i).salary, '99G999G999D99'));
    END LOOP;

END;