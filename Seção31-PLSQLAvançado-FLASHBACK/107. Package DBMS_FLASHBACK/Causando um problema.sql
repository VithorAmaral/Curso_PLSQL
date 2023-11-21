SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG';

UPDATE employees
SET
    salary = salary * 2
WHERE
    job_id = 'IT_PROG';

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG';

COMMIT;
---------------------------------------
SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG';