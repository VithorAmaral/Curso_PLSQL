DESC dba_dependencies

SELECT
    *
FROM
    dba_dependencies
START WITH referenced_owner = 'VITHOR'
           AND referenced_name = 'EMPLOYEES'
           AND referenced_type = 'TABLE' CONNECT BY PRIOR owner = referenced_owner
                                                    AND name = referenced_name
                                                    AND type = referenced_type;