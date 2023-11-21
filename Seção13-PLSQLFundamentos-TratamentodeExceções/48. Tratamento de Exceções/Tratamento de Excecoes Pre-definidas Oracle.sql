set serveroutput on
set verify off
accept pemployee_id prompt 'Digite o Id do Empregado: '

DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vemployee_id employees.employee_id%TYPE := &pemployee_id;
BEGIN
    SELECT
        first_name,
        last_name
    INTO
        vfirst_name,
        vlast_name
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    dbms_output.put_line('Empregado: '
                         || vfirst_name
                         || ' '
                         || vlast_name);
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Empregado não encontrado, id = ' || to_char(vemployee_id));
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle - '
                                        || sqlcode
                                        || sqlerrm);
END;