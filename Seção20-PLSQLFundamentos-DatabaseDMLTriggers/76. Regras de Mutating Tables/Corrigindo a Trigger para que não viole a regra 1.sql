CREATE OR REPLACE TRIGGER a_i_employees_r_trg BEFORE
    INSERT ON employees
    FOR EACH ROW
BEGIN
    :new.email := upper(substr(:new.first_name, 1, 1)
                        || upper(:new.last_name));
END;