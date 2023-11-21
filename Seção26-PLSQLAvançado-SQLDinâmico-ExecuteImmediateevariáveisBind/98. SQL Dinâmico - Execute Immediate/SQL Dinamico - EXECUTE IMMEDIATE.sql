set serveroutput on
set verify off

CREATE OR REPLACE PROCEDURE prc_fetch_employees_dynamic (
    pmanager_id    IN employees.manager_id%TYPE DEFAULT NULL,
    pdepartment_id IN employees.department_id%TYPE DEFAULT NULL
) AS

    vemployees_record employees%rowtype;
    vsql              VARCHAR2(600) := 'SELECT * FROM employees where 1=1 ';
    TYPE employees_table_type IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    employees_table   employees_table_type;
BEGIN
    IF pmanager_id IS NOT NULL THEN
        vsql := vsql
                || ' AND manager_id = '
                || pmanager_id;
    END IF;

    IF pdepartment_id IS NOT NULL THEN
        vsql := vsql
                || ' AND department_id = '
                || pdepartment_id;
    END IF;

    dbms_output.put_line(vsql);
    EXECUTE IMMEDIATE vsql
    BULK COLLECT
    INTO employees_table;
    FOR i IN 1..employees_table.count LOOP
        dbms_output.put_line(employees_table(i).employee_id
                             || ' - '
                             || employees_table(i).first_name
                             || ' - '
                             || employees_table(i).last_name
                             || ' - '
                             || employees_table(i).email
                             || ' - '
                             || employees_table(i).manager_id
                             || ' - '
                             || employees_table(i).department_id);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;