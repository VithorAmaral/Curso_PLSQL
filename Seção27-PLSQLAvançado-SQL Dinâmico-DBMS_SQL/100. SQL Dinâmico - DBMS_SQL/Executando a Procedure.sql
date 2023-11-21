SELECT
    *
FROM
    employees;

exec prc_update_salary_employee(pemployee_id => 109, ppercentual => 10);

SELECT
    *
FROM
    employees;

ROLLBACK;