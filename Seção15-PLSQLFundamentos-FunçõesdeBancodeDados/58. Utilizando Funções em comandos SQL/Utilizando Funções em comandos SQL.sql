CREATE OR REPLACE FUNCTION fnc_consulta_titulo_cargo_empregado (
    pjob_id IN jobs.job_id%TYPE
) RETURN VARCHAR2 IS
    vjob_title jobs.job_title%TYPE;
BEGIN
    SELECT
        job_title
    INTO vjob_title
    FROM
        jobs
    WHERE
        job_id = pjob_id;

    RETURN ( vjob_title );
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20001, 'Job inexistente');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Erro Oracle '
                                        || sqlcode
                                        || ' - '
                                        || sqlerrm);
END;