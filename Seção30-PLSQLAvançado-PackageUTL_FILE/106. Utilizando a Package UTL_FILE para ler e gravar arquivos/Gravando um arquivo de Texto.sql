SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    vfile utl_file.file_type;
    CURSOR employees_c IS
    SELECT
        employee_id,
        first_name,
        last_name,
        job_id,
        salary
    FROM
        employees;

BEGIN
    vfile := utl_file.fopen('ARQUIVOS', 'employees.txt', 'w', 32767);
    FOR employees_r IN employees_c LOOP
        utl_file.put_line(vfile, employees_r.employee_id
                                 || ';'
                                 || employees_r.first_name
                                 || ';'
                                 || employees_r.last_name
                                 || ';'
                                 || employees_r.job_id
                                 || ';'
                                 || employees_r.salary);
    END LOOP;

    utl_file.fclose(vfile);
    dbms_output.put_line('Arquivo Texto employees.txt gerado com sucesso');
EXCEPTION
    WHEN utl_file.invalid_path THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Diretório Inválido');
    WHEN utl_file.invalid_operation THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Operação invalida no arquivo');
    WHEN utl_file.write_error THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Erro de gravação no arquivo');
    WHEN utl_file.invalid_mode THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Modo de acesso inválido');
    WHEN OTHERS THEN
        utl_file.fclose(vfile);
        dbms_output.put_line('Erro Oracle:'
                             || sqlcode
                             || sqlerrm);
END;