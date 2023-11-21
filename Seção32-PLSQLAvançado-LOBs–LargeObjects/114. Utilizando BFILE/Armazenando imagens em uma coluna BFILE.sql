DECLARE
    vnomearquivo   VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
    vdiretorio     VARCHAR2(100) := 'IMAGENS';
    varquivoorigem BFILE;
BEGIN
    varquivoorigem := bfilename(vdiretorio, vnomearquivo);
    IF dbms_lob.fileexists(varquivoorigem) = 1 THEN
        INSERT INTO job_profiles VALUES (
            1,
            'Oracle',
            'Man',
            varquivoorigem
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;

SELECT
    *
FROM
    job_profiles;