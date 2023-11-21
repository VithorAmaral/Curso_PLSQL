--
-- Seção 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 2 - Utilizando o comando SELECT no PL/SQL
--

-- Utilizando o comando SELECT no PL/SQL

SET SERVEROUTPUT ON

DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vsalary      employees.salary%TYPE;
    vemployee_id employees.employee_id%TYPE := 121;
BEGIN
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vfirst_name,
        vlast_name,
        vsalary
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    dbms_output.put_line('Employee Id: ' || vemployee_id);
    dbms_output.put_line('Fist Name: ' || vfirst_name);
    dbms_output.put_line('Last Name: ' || vlast_name);
    dbms_output.put_line('Salary: ' || vsalary);
END;

-- Erro ORA-01403 - No Data Found

SET SERVEROUTPUT ON

DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vsalary      employees.salary%TYPE;
    vemployee_id employees.employee_id%TYPE := 50;
BEGIN
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vfirst_name,
        vlast_name,
        vsalary
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    dbms_output.put_line('Employee Id: ' || vemployee_id);
    dbms_output.put_line('Fist Name: ' || vfirst_name);
    dbms_output.put_line('Last Name: ' || vlast_name);
    dbms_output.put_line('Salary: ' || vsalary);
END;

SET SERVEROUTPUT ON

DECLARE
    vjob_id     employees.job_id%TYPE := 'IT_PROG';
    vavg_salary employees.salary%TYPE;
    vsum_salary employees.salary%TYPE;
BEGIN
    SELECT
        round(AVG(salary),
              2),
        round(SUM(salary),
              2)
    INTO
        vavg_salary,
        vsum_salary
    FROM
        employees
    WHERE
        job_id = vjob_id;

    dbms_output.put_line('Cargo: ' || vjob_id);
    dbms_output.put_line('Média de salários: ' || vavg_salary);
    dbms_output.put_line('Somatório de salarios: ' || vsum_salary);
END;

-- Erro ORA-01422 - Too Many Rows

SET SERVEROUTPUT ON

DECLARE
    vjob_id     employees.job_id%TYPE;
    vavg_salary employees.salary%TYPE;
    vsum_salary employees.salary%TYPE;
BEGIN
    SELECT
        job_id,
        round(AVG(salary),
              2),
        round(SUM(salary),
              2)
    INTO
        vjob_id,
        vavg_salary,
        vsum_salary
    FROM
        employees
    GROUP BY
        job_id;

    dbms_output.put_line('Cargo: ' || vjob_id);
    dbms_output.put_line('Média de salários: ' || vavg_salary);
    dbms_output.put_line('Somatório de salarios: ' || vsum_salary);
END;