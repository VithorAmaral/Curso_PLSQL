desc user_objects
------------------------------------------------------

SELECT
    object_name,
    object_type,
    last_ddl_time,
    TIMESTAMP,
    status
FROM
    user_objects
WHERE
    object_type IN ( 'PROCEDURE', 'FUNCTION' );
-------------------------------------------------------

SELECT
    object_name,
    object_type,
    last_ddl_time,
    TIMESTAMP,
    status
FROM
    all_objects
WHERE
    object_type IN ( 'PROCEDURE', 'FUNCTION' );