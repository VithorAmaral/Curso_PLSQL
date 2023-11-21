set serveroutput on

DECLARE
    vtotal NUMBER(38) := 1;
BEGIN
    << loop1 >> FOR i IN 1..8 LOOP
        dbms_output.put_line('I = ' || to_char(i));
        << loop2 >> FOR j IN 1..8 LOOP
            dbms_output.put_line('J = ' || to_char(j));
            dbms_output.put_line('Total = ' || to_char(vtotal, '99G999G999G999G999G999G999G999D99'));
            vtotal := vtotal * 2;
            EXIT loop1 WHEN vtotal > 1000000000000000;
        END LOOP;

    END LOOP;

    dbms_output.put_line('Total Final = ' || to_char(vtotal, '99G999G999G999G999G999G999G999D99'));
END;