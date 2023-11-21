set serveroutput on
set verify off
accept pemployee_id prompt 'Digite o Id do empregado: '

DECLARE
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
    vsalary      employees.salary%TYPE;
BEGIN
    vsalary := fnc_consulta_salario_empregado(vemployee_id);
    dbms_output.put_line('Salario: ' || vsalary);
END;