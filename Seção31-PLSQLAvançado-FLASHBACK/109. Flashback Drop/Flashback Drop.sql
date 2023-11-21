CREATE TABLE employees_copia
    AS
        SELECT
            *
        FROM
            employees;

SELECT
    *
FROM
    user_objects
WHERE
    object_name = 'EMPLOYEES_COPIA';

SELECT
    *
FROM
    employees_copia