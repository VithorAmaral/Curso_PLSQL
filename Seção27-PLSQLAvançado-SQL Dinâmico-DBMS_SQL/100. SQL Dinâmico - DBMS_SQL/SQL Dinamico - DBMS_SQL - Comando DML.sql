SET SERVEROUTPUT ON
SET VERIFY OFF
CREATE OR REPLACE PROCEDURE prc_update_salary_employee (
    pemployee_id IN employees.employee_id%TYPE,
    ppercentual  IN NUMBER
) IS
    vcursor_id      INTEGER;
    vrows_processed INTEGER;
BEGIN
    vcursor_id := dbms_sql.open_cursor;
    dbms_sql.parse(vcursor_id, 'UPDATE employees
                              SET    salary = salary * (1 + (:gpercentual/100))
                              WHERE  employee_id = :gemployee_id', dbms_sql.native);

    dbms_sql.bind_variable(vcursor_id, ':gpercentual', ppercentual);
    dbms_sql.bind_variable(vcursor_id, ':gemployee_id', pemployee_id);
    vrows_processed := dbms_sql.execute(vcursor_id);
    dbms_sql.close_cursor(vcursor_id);
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;