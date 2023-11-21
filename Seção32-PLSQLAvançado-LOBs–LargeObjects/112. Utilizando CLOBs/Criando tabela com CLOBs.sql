DROP TABLE job_resumes;

CREATE TABLE job_resumes (
    resume_id  NUMBER,
    first_name VARCHAR2(200),
    last_name  VARCHAR2(200),
    resume     CLOB
);

INSERT INTO job_resumes VALUES (
    1,
    'Paul',
    'Jones',
    empty_clob()
);

COMMIT;

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
    dbms_lob.substr(resume,
                    dbms_lob.getlength(resume),
                    1)
FROM
    job_resumes;