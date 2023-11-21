BEGIN
    dbms_scheduler.create_job(job_name => '"VITHOR". "JOB_INSERE_DATA_AGENDA"', program_name => '"VITHOR". "PRC_INSERE_AGENDA"', schedule_name => '"VITHOR". "SCH_A_CADA_15_SEGUNDOS"'
    , enabled => TRUE, auto_drop => FALSE,
                             comments => 'Job Insere Data na Agenda', job_style => 'REGULAR');
/*
    dbms_scheduler.enable(name => '"VITHOR". "JOB_INSERE_DATA_AGENDA"');
*/
END;