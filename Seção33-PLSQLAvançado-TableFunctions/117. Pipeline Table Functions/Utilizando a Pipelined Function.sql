SELECT
    *
FROM
    TABLE ( fnc_fetch_employees_table_pipeline(60) );