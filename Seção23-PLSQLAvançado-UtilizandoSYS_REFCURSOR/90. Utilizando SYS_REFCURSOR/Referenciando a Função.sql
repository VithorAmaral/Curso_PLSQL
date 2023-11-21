CREATE OR REPLACE PROCEDURE prc_display_employees2 (
    pemployee_id IN NUMBER
) IS
    employees_cursor SYS_REFCURSOR;
    vfirst_name      employees.first_name%TYPE;
    vlast_name       employees.last_name%TYPE;
BEGIN
    employees_cursor := fnc_get_employees(pemployee_id);
    LOOP
        FETCH employees_cursor INTO
            vfirst_name,
            vlast_name;
        EXIT WHEN employees_cursor%notfound;
        dbms_output.put_line(vfirst_name
                             || ' '
                             || vlast_name);
    END LOOP;

    CLOSE employees_cursor;
END prc_display_employees2;