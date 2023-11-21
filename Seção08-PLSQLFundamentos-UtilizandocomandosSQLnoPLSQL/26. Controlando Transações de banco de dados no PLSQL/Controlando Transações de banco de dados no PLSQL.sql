---
-- Seção 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 6 - Controlando Transações do Banco de Dados
--

-- Controlando Transações do Banco de Dados

SET SERVEROUTPUT ON

DECLARE
    vemployee_id employees.employee_id%TYPE := 150;
BEGIN
    UPDATE employees
    SET
        salary = 15000
    WHERE
        employee_id = vemployee_id;

    COMMIT;
END; 

SET SERVEROUTPUT ON

DECLARE
    vemployee_id employees.employee_id%TYPE := 150;
BEGIN
    UPDATE employees
    SET
        salary = 20000
    WHERE
        employee_id = vemployee_id;

    ROLLBACK;
END;

BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    ) VALUES (
        employees_seq.NEXTVAL,
        'Kobe',
        'Bryant',
        'KBRYANT',
        '515.123.45568',
        sysdate,
        'IT_PROG',
        15000,
        0.4,
        103,
        60
    );

    SAVEPOINT insertok;
    UPDATE employees
    SET
        salary = 30000
    WHERE
        job_id = 'IT_PROG';

    ROLLBACK TO insertok;
    COMMIT;
END;