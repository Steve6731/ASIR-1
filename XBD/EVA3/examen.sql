create or replace trigger checkComision
before insert or update of commission_pct on employees
for each row
declare
   v_job job_history%rowtype;
begin
   select * into v_job from job_history where employee_id = :new.employee_id;
   exception
      when no_data_found then raise_application_error(-20002,
         'El empleado'||:NEW.first_name||' '||:NEW.last_name||
         'no tiene ningun trabajo previos.');
end;
/
create or replace trigger JobLog
before update of job_id on employees
for each row
declare
   v_start_date job_histroy.start_date%type;
begin
   begin
      select max(end_date) into v_start_date from job_history where employee_id = :NEW.employee_id;
      exception
         when no_date_found then v_start_date := :NEW.hire_date;
   end;
   insert into job_history(employee_id,start_date,end_date,job_id,department_id)
      values(:old.employee_id,v_start_date,sysdate,:OLD.job_id,:OLD.department_id);
end;
/
create or replace function diferenciaSalario(
   p_employee_id employees.employee_id%type
) return number as
   Job_media number;
   v_emp employees%rowtype;
   DiferenSal number;
   CobraMenos EXCEPTION;
begin
   select * into v_emp from employee 
      where employee_id = p_employee_id;
   select (min_salary+max_salary)/2 into Job_media from jobs 
      where job_id = v_emp.job_id;

   DiferenSal := v_emp.salary - Job_media;
   if DiferenSal < 0 then 
      raise CobraMenos;
   else
      return DiferenSal;
   end if;

   exception
      when CobraMenos then raise(-20001,
      'Empleado ('||v_emp.first_name||' '||v_emp.last_name||
      ') cobra menos.');
end;
/
create or replace procedure listEmp(
   id_pais countries.country_id%tyoe
) is
   cursor c_dept is Select * from departments 
      where location_id = (Select location_id from locations where country_id = id_pais);
   cursor c_emp;
begin
   for v_dept in c_dept loop
   dbms_output.put_line('Department: '||department_name||' ('||department_id||')');
   declare
      cursor c_emp is select * from employees where department_id = v_dept.department_id;
   begin
      for v_emp in c_emp loop
         dbms_output.put_line('    Empleado: '||v_emp.first_name||' '||v_emp.last_name);
      end loop;
   end;
   end loop;
end;
/
create or replace trigger SubaSoldo
before insert or update of manager_id on departments
for each row
begin
   update employees set salary = salary *1.1 where employee_id = :new.manager_id;
end;
/