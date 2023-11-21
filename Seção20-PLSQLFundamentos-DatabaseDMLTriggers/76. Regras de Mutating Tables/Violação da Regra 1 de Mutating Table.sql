CREATE OR REPLACE TRIGGER a_i_employees_r_trg AFTER
    INSERT ON employees
    FOR EACH ROW
BEGIN
    UPDATE employees
    SET
        email = upper(substr(:new.first_name, 1, 1)
                      || :new.last_name)
    WHERE
        employee_id = :new.employee_id;

END;