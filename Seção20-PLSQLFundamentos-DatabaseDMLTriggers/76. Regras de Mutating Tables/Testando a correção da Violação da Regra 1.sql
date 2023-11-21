BEGIN
    prc_insere_empregado('David', 'Bowie', 'DBOWIE', '515.656.5458', sysdate,
                        'IT_PROG', 15000, NULL, 103, 60);

    COMMIT;
END;

DELETE FROM employees where last_name = 'Bowie';