set verify off
update employees
set salary = 30000
where employee_id = 100;
commit;