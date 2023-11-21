CREATE OR REPLACE PROCEDURE prc_consulta_empregado (
    pemployee_id    IN NUMBER,
    pfirst_name     OUT NOCOPY VARCHAR2,
    plast_name      OUT NOCOPY VARCHAR2,
    pemail          OUT NOCOPY VARCHAR2,
    pphone_number   OUT NOCOPY VARCHAR2,
    phire_date      OUT NOCOPY DATE,
    pjob_id         OUT NOCOPY VARCHAR2,
    psalary         OUT NOCOPY NUMBER,
    pcommission_pct OUT NOCOPY NUMBER,
    pmanager_id     OUT NOCOPY NUMBER,
    pdepartment_id  OUT NOCOPY NUMBER
) IS
BEGIN
    SELECT
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
    INTO
        pfirst_name,
        plast_name,
        pemail,
        pphone_number,
        phire_date,
        pjob_id,
        psalary,
        pcommission_pct,
        pmanager_id,
        pdepartment_id
    FROM
        employees
    WHERE
        employee_id = pemployee_id;

EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Empregado Não existe: ' || pemployee_id);
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Orcale '
                                        || sqlcode
                                        || sqlerrm);
END;