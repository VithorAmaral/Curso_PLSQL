set serveroutput on
set verify off
accept pemployee_id prompt 'Digite o Id do empregado: '

DECLARE
    employee_record employees%rowtype;
    vemployee_id    employees.employee_id%TYPE := &pemployee_id;
BEGIN
    SELECT
        *
    INTO employee_record
    FROM
        employees
    WHERE
        employee_id = &pemployee_id;

    dbms_output.put_line(employee_record.employee_id
                         || ' - '
                         || employee_record.first_name
                         || ' - '
                         || employee_record.last_name
                         || ' - '
                         || employee_record.phone_number
                         || ' - '
                         || employee_record.job_id);

END;