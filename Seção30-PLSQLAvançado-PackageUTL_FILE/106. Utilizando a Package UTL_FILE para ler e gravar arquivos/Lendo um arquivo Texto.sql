SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    vfile     utl_file.file_type;
    vregistro VARCHAR2(400);
BEGIN
    vfile := utl_file.fopen('ARQUIVOS', 'employees.txt', 'r', 32767);
    LOOP
        utl_file.get_line(vfile, vregistro);
        dbms_output.put_line(vregistro);
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Arquivo Texto employees.txt lido com sucesso');
    WHEN utl_file.invalid_path THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Diretório Inválido');
    WHEN OTHERS THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Erro Oracle:'
                             || sqlcode
                             || sqlerrm);
END;