--
-- Seção 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 4 - Utilizando o comando UPDATE no PL/SQL
--

-- Utilizando o comando UPDATE no PL/SQL

SET SERVEROUTPUT ON

DECLARE
    vemployee_id employees.employee_id%TYPE := 150;
    vpercentual  NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET
        salary = salary * ( 1 + vpercentual / 100 )
    WHERE
        employee_id = vemployee_id;

    COMMIT;
END;