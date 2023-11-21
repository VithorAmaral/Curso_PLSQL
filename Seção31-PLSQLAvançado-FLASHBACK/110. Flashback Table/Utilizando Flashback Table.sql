CREATE TABLE employees_copia2
    AS
        SELECT
            *
        FROM
            employees;

ALTER TABLE vithor.employees_copia2 ENABLE ROW MOVEMENT;

SELECT
    *
FROM
    vithor.employees_copia2;

DELETE FROM vithor.employees_copia2;

COMMIT;