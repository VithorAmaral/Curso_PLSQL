BEGIN
    prc_insere_empregado('David', 'Bowie', 'DBOWIE', '515.127.4861', sysdate,
                        'IT_PROG', 15000, NULL, 103, 60);

    COMMIT;
END;