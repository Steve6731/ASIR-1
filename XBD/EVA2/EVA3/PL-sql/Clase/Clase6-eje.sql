--dar DNi volver nombre,salary,saltotal
create or replace procedure muestra (
   p_id employees.employee_id%type
) as 
--   vfn employees.first_name%type;
--   vln employees.last_name%type;
   vemp employees%rowtype;
   vdep departments.department_name%type;
BEGIN
--   Select first_name,last_name into vfn,vln
   Select * into vemp
      from employees where employee_id= p_id;
   Select department_name into vdep from departments
      where department_id in (select department_id from employees 
         where employee_id=p_id);
   DBMS_OUTPUT.PUT_LINE(vemp.first_name||' '||vemp.last_name||'Esta en el departmento: '||vdep);
end;
/

EXECUTE muestra(172);