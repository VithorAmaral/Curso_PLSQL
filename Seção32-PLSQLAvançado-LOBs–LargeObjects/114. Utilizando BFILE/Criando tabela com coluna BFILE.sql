DROP TABLE job_profiles;

CREATE TABLE job_profiles (
    resume_id       NUMBER,
    first_name      VARCHAR2(200),
    last_name       VARCHAR2(200),
    profile_picture BFILE
);