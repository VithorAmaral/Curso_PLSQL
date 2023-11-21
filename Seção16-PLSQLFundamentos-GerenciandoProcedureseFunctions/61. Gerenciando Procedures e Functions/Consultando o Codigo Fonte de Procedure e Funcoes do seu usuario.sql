desc user_source;

SELECT
    line,
    text
FROM
    user_source
WHERE
        name = 'PRC_INSERE_EMPREGADO'
    AND type = 'PROCEDURE'
ORDER BY
    line;
-----------------------------------

SELECT
    line,
    text
FROM
    user_source
WHERE
        name = 'FNC_CONSULTA_SALARIO_EMPREGADO'
    AND type = 'FUNCTION'
ORDER BY
    line;