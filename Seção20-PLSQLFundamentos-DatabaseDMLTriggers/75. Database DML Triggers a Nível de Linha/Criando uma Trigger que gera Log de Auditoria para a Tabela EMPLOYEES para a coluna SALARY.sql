CREATE OR REPLACE TRIGGER a_iud_employees_r_trg AFTER
    INSERT OR UPDATE OF salary OR DELETE ON employees
    FOR EACH ROW
DECLARE
    vevento      employees_log.evento%TYPE;
    vemployee_id employees_log.employee_id%TYPE;
BEGIN
    CASE
        WHEN inserting THEN
            vevento := 'I';
            vemployee_id := :new.employee_id;
        WHEN updating THEN
            vevento := 'U';
            vemployee_id := :new.employee_id;
        ELSE
            vevento := 'D';
            vemployee_id := :old.employee_id;
    END CASE;

    INSERT INTO employees_log (
        employees_log_id,
        dt_log,
        usuario,
        evento,
        employee_id,
        salary_old,
        salary_new
    ) VALUES (
        employees_log_seq.NEXTVAL,
        sysdate,
        user,
        vevento,
        vemployee_id,
        :old.salary,
        :new.salary
    );

END a_iud_employees_r_trg;