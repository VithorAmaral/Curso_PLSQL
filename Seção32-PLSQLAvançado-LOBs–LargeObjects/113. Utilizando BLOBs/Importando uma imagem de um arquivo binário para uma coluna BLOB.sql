DECLARE
    varquivoorigem BFILE;
    vblobdestino   BLOB;
    vnomearquivo   VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
    vdiretorio     VARCHAR2(100) := 'IMAGENS';
BEGIN
    varquivoorigem := bfilename(vdiretorio, vnomearquivo);
    IF dbms_lob.fileexists(varquivoorigem) = 1 THEN
        INSERT INTO job_profiles VALUES (
            1,
            'Oracle',
            'Man',
            empty_blob()
        ) RETURNING profile_picture INTO vblobdestino;

        dbms_lob.open(varquivoorigem, dbms_lob.lob_readonly);
        dbms_lob.loadfromfile(vblobdestino, varquivoorigem, dbms_lob.getlength(varquivoorigem));
        dbms_lob.close(varquivoorigem);
        COMMIT;
    ELSE
        dbms_output.put_line('Arquivo: '
                             || vnomearquivo
                             || ' não existe!');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_lob.close(varquivoorigem);
        raise_application_error(-20001, 'Erro Oracle '
                                        || sqlcode
                                        || sqlerrm);
END;

SELECT
    *
FROM
    job_profiles;