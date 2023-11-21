CREATE OR REPLACE PROCEDURE prc_aumenta_salario_empregado (
    pemployee_id IN NUMBER,
    ppercentual  IN NUMBER
) IS
BEGIN
    UPDATE employees
    SET
        salary = salary * ( 1 + ppercentual / 100 )
    WHERE
        employee_id = pemployee_id;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle: '
                                        || sqlcode
                                        || ' - '
                                        || sqlerrm);
END;