DECLARE
    CURSOR c_employees IS
    SELECT
        *
    FROM
        employees AS OF TIMESTAMP ( systimestamp - INTERVAL '15' MINUTE );

    r_employees c_employees%rowtype;
BEGIN
    OPEN c_employees;
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