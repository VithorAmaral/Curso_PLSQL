BEGIN
    dbms_scheduler.drop_schedule(schedule_name => 'SCH_A_CADA_15_SEGUNDOS', force => FALSE);
END;