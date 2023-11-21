desc user_errors

column position format a4
column text format a60

SELECT
    line
    || '/'
    || position position,
    text
FROM
    user_errors
WHERE
    name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
ORDER BY
    line;