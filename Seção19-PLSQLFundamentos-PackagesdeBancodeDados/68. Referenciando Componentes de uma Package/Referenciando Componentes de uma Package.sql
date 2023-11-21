BEGIN
    pck_empregados.prc_insere_empregado('John', 'Lenon', 'JLENON', '515.244.4861', sysdate,
                                       'IT_PROG', 15000, NULL, 103, 60);

    COMMIT;
END;