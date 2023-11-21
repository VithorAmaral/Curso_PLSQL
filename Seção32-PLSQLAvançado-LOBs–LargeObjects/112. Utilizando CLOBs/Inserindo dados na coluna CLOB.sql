INSERT INTO job_resumes VALUES (
    2,
    'Robert',
    'Johnson',
    'Project Manager - Scrum Master, Porto Alegre, RS, Brasil'
);

SELECT
    resume_id,
    first_name,
    last_name,
    substr(resume, 1, 30)
FROM
    job_resumes;

SELECT
    length(resume),
    dbms_lob.getlength(resume)
FROM
    job_resumes;

SELECT
    resume_id,
    first_name,
    last_name,
    dbms_lob.substr(resume,
                    dbms_lob.getlength(resume),
                    1)
FROM
    job_resumes;

COMMIT;

CREATE OR REPLACE PROCEDURE prc_insere_resume (
    presume_id IN job_resumes.resume_id%TYPE,
    presume    IN VARCHAR2
) IS
    vresume_localizador CLOB;
    vtamanho_texto      NUMBER;
    vdeslocamento       NUMBER;
BEGIN
    SELECT
        resume
    INTO vresume_localizador
    FROM
        job_resumes
    WHERE
        resume_id = presume_id
    FOR UPDATE;

    vdeslocamento := 1;
    vtamanho_texto := length(presume);
    dbms_lob.write(vresume_localizador, vtamanho_texto, vdeslocamento, presume);
    COMMIT;
END;

exec prc_insere_resume(1,'DBA - Database administrator, Porto Alegre, RS, Brasil')

SELECT
    resume_id,
    first_name,
    last_name,
    substr(resume, 1, 30)
FROM
    job_resumes;

SELECT
    resume_id,
    first_name,
    last_name,
    length(resume),
    dbms_lob.getlength(resume)
FROM
    job_resumes;

SELECT
    dbms_lob.substr(resume,
                    dbms_lob.getlength(resume),
                    1)
FROM
    job_resumes;

CREATE OR REPLACE PROCEDURE prc_exibe_resume (
    presume_id IN job_resumes.resume_id%TYPE
) IS

    vresume_localizador CLOB;
    vtamanho_texto      NUMBER;
    vdeslocamento       NUMBER;
    vtexto              VARCHAR2(32767);
    vloop               NUMBER;
    vquantidade         NUMBER := 1;
    vexibe              VARCHAR2(240);
BEGIN
    SELECT
        resume
    INTO vresume_localizador
    FROM
        job_resumes
    WHERE
        resume_id = presume_id
    FOR UPDATE;

    vdeslocamento := 1;
    vtamanho_texto := dbms_lob.getlength(vresume_localizador);
    dbms_lob.read(vresume_localizador, vtamanho_texto, vdeslocamento, vtexto);
    vloop := trunc((length(vtexto)) / 240) + 1;
    FOR i IN 1..vloop LOOP
        vexibe := substr(vtexto, vquantidade, 240);
        vquantidade := vquantidade + 240;
        dbms_output.put_line(vexibe);
    END LOOP;

    COMMIT;
END;

set SERVEROUTPUT on
exec prc_exibe_resume(1)
exec prc_exibe_resume(2)