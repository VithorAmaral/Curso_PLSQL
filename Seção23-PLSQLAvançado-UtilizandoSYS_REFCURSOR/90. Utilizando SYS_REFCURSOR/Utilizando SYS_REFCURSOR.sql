CREATE OR REPLACE PROCEDURE prc_cursor_employees (
    pemployees_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN pemployees_cursor FOR SELECT
                                   first_name,
                                   last_name
                               FROM
                                   employees;

END prc_cursor_employees;