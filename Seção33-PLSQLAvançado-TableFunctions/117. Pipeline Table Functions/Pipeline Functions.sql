CREATE OR REPLACE FUNCTION fnc_fetch_employees_table_pipeline (
    pdepartment_id IN NUMBER
) RETURN employees_table
    PIPELINED
IS
    v_employees_table employees_table := employees_table();
BEGIN
    FOR e IN (
        SELECT
            employee_id,
            first_name,
            last_name,
            email,
            phone_number,
            hire_date,
            job_id,
            salary,
            commission_pct,
            manager_id,
            department_id
        FROM
            employees
        WHERE
            department_id = pdepartment_id
    ) LOOP
        PIPE ROW ( employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                                e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id,
                                e.department_id) );
    END LOOP;
END;