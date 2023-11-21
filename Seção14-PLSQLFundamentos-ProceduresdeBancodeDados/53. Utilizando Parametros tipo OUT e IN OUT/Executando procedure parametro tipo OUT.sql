set serveroutput on
set verify off

DECLARE
    employees_record employees%rowtype;
BEGIN
    prc_consulta_empregado(100, employees_record.first_name, employees_record.last_name, employees_record.email, employees_record.phone_number
    ,
                          employees_record.hire_date, employees_record.job_id, employees_record.salary, employees_record.commission_pct
                          , employees_record.manager_id,
                          employees_record.department_id);

    dbms_output.put_line(employees_record.first_name
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

END;