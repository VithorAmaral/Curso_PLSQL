set SERVEROUTPUT on
set verify off

DECLARE
    vcursor_id  INTEGER;
    vrowcount   NUMBER;
    vfirst_name VARCHAR2(30);
    vlast_name  VARCHAR2(30);
BEGIN
    vcursor_id := dbms_sql.open_cursor;
    dbms_sql.parse(vcursor_id, 'SELECT first_name, last_name FROM employees', dbms_sql.native);
    dbms_sql.define_column(vcursor_id, 1, vfirst_name, 30);
    dbms_sql.define_column(vcursor_id, 2, vlast_name, 30);
    vrowcount := dbms_sql.execute_and_fetch(vcursor_id);
    LOOP
        EXIT WHEN dbms_sql.fetch_rows(vcursor_id) = 0;
        dbms_sql.column_value(vcursor_id, 1, vfirst_name);
        dbms_sql.column_value(vcursor_id, 2, vlast_name);
        dbms_output.put_line(vlast_name
                             || ', '
                             || vfirst_name);
    END LOOP;

    dbms_sql.close_cursor(vcursor_id);
END;