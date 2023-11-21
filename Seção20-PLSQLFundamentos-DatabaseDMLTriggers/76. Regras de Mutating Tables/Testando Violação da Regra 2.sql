set verify off

UPDATE employees
SET
    salary = 70000
WHERE
    employee_id = 100;

COMMIT;
