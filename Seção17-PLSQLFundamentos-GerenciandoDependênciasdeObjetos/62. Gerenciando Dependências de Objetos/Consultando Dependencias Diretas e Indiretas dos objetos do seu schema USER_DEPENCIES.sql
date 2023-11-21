SELECT
    *
FROM
    user_dependencies
START WITH referenced_name = 'EMPLOYEES'
           AND referenced_type = 'TABLE' CONNECT BY PRIOR name = referenced_name
                                                    AND type = referenced_type;