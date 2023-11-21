BEGIN
    dbms_scheduler.create_schedule(schedule_name => 'SCH_A_CADA_15_SEGUNDOS', start_date => systimestamp, repeat_interval => 'FREQ=SECONDLY;INTERVAL=15'
    , end_date => TO_TIMESTAMP_TZ('2023-11-08 19:00:00.000000000 AMERICA/SAO_PAULO', 'YYYY-MM-DD HH24:MI:SS.FF TZR'), comments => 'A cada 15 segundos'
    );
END;