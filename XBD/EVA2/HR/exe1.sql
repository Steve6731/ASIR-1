create or replace procedure checkSal is
   cursor c_emp is select * from employees;
   v_max jobs.max_salary%type;
   v_min jobs.min_salary%type;
begin
   for v_emp in c_emp loop
      select max_salary,min_salary into v_max,v_min
         from jobs where job_id = v_emp.job_id;
      if v_emp.salary < v_min or v_emp.salary < v_max then
         dbms_output.put_line(v_emp.firs_name||last_name||job_id||v_max||v_min);
      end if;
   end loop;

end;
   