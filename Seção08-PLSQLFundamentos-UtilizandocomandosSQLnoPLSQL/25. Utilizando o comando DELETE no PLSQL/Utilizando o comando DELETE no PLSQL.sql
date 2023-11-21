---
-- Seção 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 5 - Utilizando o comando DELETE no PL/SQL
--

-- Utilizando o comando DELETE no PL/SQL

-- DELETE no PL/SQL

SET SERVEROUTPUT ON

DECLARE
    vemployee_id employees.employee_id%TYPE := 207;
BEGIN
    DELETE FROM employees
    WHERE
        employee_id = vemployee_id;

    COMMIT;
END;