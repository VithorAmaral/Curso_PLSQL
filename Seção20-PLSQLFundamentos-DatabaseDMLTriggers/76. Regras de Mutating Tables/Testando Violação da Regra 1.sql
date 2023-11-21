SET VERIFY OFF

BEGIN
    prc_insere_empregado('Eric', 'Clapton', 'ECLAPTON', '515.188.4861', sysdate,
                        'IT_PROG', 15000, NULL, 103, 60);

    COMMIT;
END;