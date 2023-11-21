desc user_objects

SELECT
    object_name,
    object_type,
    last_ddl_time,
    TIMESTAMP,
    status
FROM
    user_objects
WHERE
    status = 'INVALID';