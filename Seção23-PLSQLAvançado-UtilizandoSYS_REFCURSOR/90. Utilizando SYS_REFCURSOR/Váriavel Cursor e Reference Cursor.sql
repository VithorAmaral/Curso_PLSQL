CREATE OR REPLACE FUNCTION fnc_get_employees (
    pemployee_id IN NUMBER
) RETURN SYS_REFCURSOR IS
    employees_cursor SYS_REFCURSOR;
BEGIN
    OPEN employees_cursor FOR SELECT
                                                            first_name,
                                                            last_name
                                                        FROM
                                                            employees
                              WHERE
                                  employee_id = pemployee_id;

    RETURN employees_cursor;
END fnc_get_employees;