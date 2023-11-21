BEGIN
    pck_empregados.prc_insere_empregado('George', 'Harrison', 'GHARRISON', '515.258.5690', sysdate,
                                       'IT_PROG', 25000, NULL, 103, 60);

    COMMIT;
END;