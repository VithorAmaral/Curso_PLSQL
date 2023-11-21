set serveroutput on
declare
vnumero number(11,2) := 1200.50;
begin
dbms_output.put_line('Numero = ' || vnumero);
end;