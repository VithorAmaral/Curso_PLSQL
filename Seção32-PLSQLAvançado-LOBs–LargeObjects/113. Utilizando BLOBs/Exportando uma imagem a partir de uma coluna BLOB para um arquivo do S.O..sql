DECLARE
    varquivodestino     utl_file.file_type;
    vbuffer             RAW(32767);
    vquantidade         BINARY_INTEGER := 32767;
    vposicao            INTEGER := 1;
    vbloborigem         BLOB;
    vtamanhoblob        INTEGER;
    vnomearquivodestino varchar2(100) := 'CursoOracleCompletoCopia.jpeg';
    vdiretoriodestino   VARCHAR2(100) := 'IMAGENS';
    vresumeid           NUMBER := 1;
BEGIN
    SELECT
        profile_picture
    INTO vbloborigem
    FROM
        job_profiles
    WHERE
        resume_id = vresumeid
    FOR UPDATE;

    vtamanhoblob := dbms_lob.getlength(vbloborigem);
    dbms_output.put_line('Tamanho do arquivo ' || vtamanhoblob);
    varquivodestino := utl_file.fopen(vdiretoriodestino, vnomearquivodestino, 'wb', 32767);
    WHILE vposicao < vtamanhoblob LOOP
        dbms_lob.read(vbloborigem, vquantidade, vposicao, vbuffer);
        utl_file.put_raw(varquivodestino, vbuffer, TRUE);
        vposicao := vposicao + vquantidade;
    END LOOP;

    utl_file.fclose(varquivodestino);
EXCEPTION
    WHEN OTHERS THEN
        IF utl_file.is_open(varquivodestino) THEN
            utl_file.fclose(varquivodestino);
            raise_application_error(-20001, 'Erro Oracle '
                                            || sqlcode
                                            || sqlerrm);
        END IF;
END;