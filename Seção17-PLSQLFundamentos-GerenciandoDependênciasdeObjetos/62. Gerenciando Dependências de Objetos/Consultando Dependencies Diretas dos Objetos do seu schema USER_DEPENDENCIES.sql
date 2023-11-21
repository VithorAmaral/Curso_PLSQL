DESC USER_DEPENDENCIES

SELECT
    *
FROM
    user_dependencies
WHERE
        referenced_name = 'EMPLOYEES'
    AND referenced_type = 'TABLE';