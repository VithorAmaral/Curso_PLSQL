DECLARE
    CURSOR c_employees IS
    SELECT
        *
    FROM
        employees
    WHERE
        job_id = 'IT_PROG';

    r_employees c_employees%rowtype;
BEGIN
    dbms_flashback.enable_at_time(sysdate - 30 / 1440);
    OPEN c_employees;
    dbms_flashback.disable;
    LOOP
        FETCH c_employees INTO r_employees;
        EXIT WHEN c_employees%notfound;
        UPDATE employees
        SET
            salary = r_employees.salary
        WHERE
            employee_id = r_employees.employee_id;

    END LOOP;

    CLOSE c_employees;
    COMMIT;
END;