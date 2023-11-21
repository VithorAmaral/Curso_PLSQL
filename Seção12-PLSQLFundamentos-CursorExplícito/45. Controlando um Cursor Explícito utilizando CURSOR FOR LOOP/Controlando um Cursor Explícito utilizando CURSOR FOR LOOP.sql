set serveroutput on
set verify off

DECLARE
    CURSOR employees_cursor IS
    SELECT
        *
    FROM
        employees;

BEGIN
    FOR employees_record IN employees_cursor LOOP
        dbms_output.put_line(employees_record.employee_id
                             || ' - '
                             || employees_record.first_name
                             || ' - '
                             || employees_record.last_name
                             || ' - '
                             || employees_record.department_id
                             || ' - '
                             || employees_record.job_id
                             || ' - '
                             || employees_record.phone_number
                             || ' - '
                             || ltrim(to_char(employees_record.salary, 'L99G999G999D99')));
    END LOOP;
END;