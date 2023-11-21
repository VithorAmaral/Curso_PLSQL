CREATE OR REPLACE TRIGGER b_u_validate_salary_employees_r_trg BEFORE
    UPDATE OF salary ON employees
    FOR EACH ROW
DECLARE
    vmaxsalary employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO vmaxsalary
    FROM
        employees;

    IF :new.salary > vmaxsalary * 1.2 THEN
        raise_application_error(-20001, 'Salario não pode ser superior ao maior salario + 20%');
    END IF;

END;