BEGIN
    dbms_scheduler.create_program(program_name => 'VITHOR.PRC_INSERE_AGENDA', program_action => 'VITHOR.PRC_INSERE_DATA_AGENDA', program_type => 'STORED_PROCEDURE'
    , number_of_arguments => 0, comments => 'Insere dados na agenda',
                                enabled => FALSE);
/*
    dbms_scheduler.enable(name => 'HR.PRC_INSERE_AGENDA');
*/
END;