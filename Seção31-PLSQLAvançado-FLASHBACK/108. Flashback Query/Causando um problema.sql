SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'FI_ACCOUNT';

UPDATE employees
SET
    salary = salary * 2
WHERE
    job_id = 'FI_ACCOUNT';

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
    job_id = 'FI_ACCOUNT';

COMMIT;