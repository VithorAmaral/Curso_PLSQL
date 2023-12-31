--
-- Seção 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 3 - Utilizando o comando INSERT no PL/SQL
--

-- Utilizando o comando INSERT no PL/SQL

SET SERVEROUTPUT ON

DECLARE
    vfirst_name employees.first_name%TYPE;
    vlast_name  employees.last_name%TYPE;
    vsalary     employees.salary%TYPE;
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

    COMMIT;
END;