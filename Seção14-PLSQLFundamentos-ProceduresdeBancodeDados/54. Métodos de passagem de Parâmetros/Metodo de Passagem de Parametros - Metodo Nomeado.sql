set serveroutput on
set verify off

DECLARE
    vemployee_id    NUMBER := 100;
    vfirst_name     VARCHAR2(200);
    vlast_name      VARCHAR2(200);
    vemail          VARCHAR2(200);
    vphone_number   VARCHAR2(200);
    vhire_date      DATE;
    vjob_id         VARCHAR2(200);
    vsalary         NUMBER;
    vcommission_pct NUMBER;
    vmanager_id     NUMBER;
    vdepartment_id  NUMBER;
BEGIN
    prc_consluta_empregado(pemployee_id => vemployee_id, pfirst_name => vfirst_name, plast_name => vlast_name, pemail => vemail, pphone_number => vphone_number
    ,
                          phire_date => vhire_date, pjob_id => vjob_id, psalary => vsalary, pcommission_pct => vcommission_pct, pmanager_id => vmanager_id
                          ,
                          pdepartment_id => vdepartment_id);

    dbms_output.put_line('pfirst_name = ' || vfirst_name);
    dbms_output.put_line('plast_name = ' || vlast_name);
    dbms_output.put_line('pemail = ' || vemail);
    dbms_output.put_line('pphone_number = ' || vphone_number);
    dbms_output.put_line('phire_date = ' || vhire_date);
    dbms_output.put_line('pjob_id = ' || vjob_id);
    dbms_output.put_line('psalary = ' || vsalary);
    dbms_output.put_line('pcommission_pct = ' || vcommission_pct);
    dbms_output.put_line('pmanager_id = ' || vmanager_id);
    dbms_output.put_line('pdepartment_id = ' || vdepartment_id);
END;