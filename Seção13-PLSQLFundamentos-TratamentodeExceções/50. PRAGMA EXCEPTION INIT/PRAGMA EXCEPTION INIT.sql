DECLARE
    vfirst_name   employees.first_name%TYPE := 'Robert';
    vlast_name    employees.last_name%TYPE := 'Ford';
    vjob_id       employees.job_id%TYPE := 'XX_YYYY';
    vphone_number employees.phone_number%TYPE := '650.511.9844';
    vemail        employees.email%TYPE := 'RFORD';
    efk_inexistente EXCEPTION;
    PRAGMA exception_init ( efk_inexistente, -2291 );
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        phone_number,
        email,
        hire_date,
        job_id
    ) VALUES (
        employees_seq.NEXTVAL,
        vfirst_name,
        vlast_name,
        vphone_number,
        vemail,
        sysdate,
        vjob_id
    );

    COMMIT;
EXCEPTION
    WHEN efk_inexistente THEN
        raise_application_error(-20003, 'Job inexistente!');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;