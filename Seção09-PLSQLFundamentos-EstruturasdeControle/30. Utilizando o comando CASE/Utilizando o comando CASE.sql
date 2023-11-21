--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 3 - Utilizando o comando CASE
--

-- Utilizando o comando CASE

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '

DECLARE
    vpercentual    NUMBER(3);
    vdepartment_id employees.employee_id%TYPE := &pdepartment_id;
BEGIN
    CASE vdepartment_id
        WHEN 80 THEN
            vpercentual := 10; -- Sales
        WHEN 20 THEN
            vpercentual := 15; -- Marketing
        WHEN 60 THEN
            vpercentual := 20; -- IT
        ELSE
            vpercentual := 5;
    END CASE;

    dbms_output.put_line('Id do Departamento: ' || vdepartment_id);
    dbms_output.put_line('percentual: ' || vpercentual);
    UPDATE employees
    SET
        salary = salary * ( 1 + vpercentual / 100 )
    WHERE
        department_id = &pdepartment_id;

    --COMMIT;
END;
 
 -- Utilizando o comando CASE

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '

DECLARE
    vpercentual    NUMBER(3);
    vdepartment_id employees.employee_id%TYPE := &pdepartment_id;
BEGIN
    CASE
        WHEN vdepartment_id = 80 THEN
            vpercentual := 10; -- Sales
        WHEN vdepartment_id = 20 THEN
            vpercentual := 15; -- Marketing
        WHEN vdepartment_id = 60 THEN
            vpercentual := 20; -- IT
        ELSE
            vpercentual := 5;
    END CASE;

    dbms_output.put_line('Id do Departamento: ' || vdepartment_id);
    dbms_output.put_line('percentual: ' || vpercentual);
    UPDATE employees
    SET
        salary = salary * ( 1 + vpercentual / 100 )
    WHERE
        department_id = &pdepartment_id;
   --COMMIT; 
END;