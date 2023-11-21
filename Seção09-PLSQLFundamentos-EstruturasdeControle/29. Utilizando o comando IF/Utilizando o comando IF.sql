--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 2 - Utilizando o comando IF
--

-- Utilizando o comando IF

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '

DECLARE
    vpercentual    NUMBER(3);
    vdepartment_id employees.employee_id%TYPE := &pdepartment_id;
BEGIN
    IF vdepartment_id = 80 THEN
        vpercentual := 10; -- Sales
    ELSE
        IF vdepartment_id = 20 THEN
            vpercentual := 15; -- Marketing
        ELSE
            IF vdepartment_id = 60 THEN
                vpercentual := 20; -- IT
            ELSE
                vpercentual := 5;
            END IF;
        END IF;
    END IF;

    dbms_output.put_line('Id do Departamento: ' || vdepartment_id);
    dbms_output.put_line('Percentual: ' || vpercentual);
    UPDATE employees
    SET
        salary = salary * ( 1 + vpercentual / 100 )
    WHERE
        department_id = vdepartment_id;

    COMMIT;
END;

-- Comando IF  com ELSIF

SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '

DECLARE
    vpercentual    NUMBER(3);
    vdepartment_id employees.employee_id%TYPE := &pdepartment_id;
BEGIN
    IF vdepartment_id = 80 THEN
        vpercentual := 10; -- Sales
    ELSIF vdepartment_id = 20 THEN
        vpercentual := 15; -- Marketing
    ELSIF vdepartment_id = 60 THEN
        vpercentual := 20; -- IT
    ELSE
        vpercentual := 5;
    END IF;

    dbms_output.put_line('Id do Departamento: ' || vdepartment_id);
    dbms_output.put_line('percentual: ' || vpercentual);
    UPDATE employees
    SET
        salary = salary * ( 1 + vpercentual / 100 )
    WHERE
        department_id = vdepartment_id;

    COMMIT;
END;