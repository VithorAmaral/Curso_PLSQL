SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    fnc_consulta_titulo_cargo_empregado(job_id) "JOB TITLE"
FROM
    employees