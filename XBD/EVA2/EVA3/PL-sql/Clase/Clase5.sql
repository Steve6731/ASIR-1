--dar DNi volver nombre,salary,saltotal
create or replace procedure informacionEmp (
   ID employees.employee_id%type
) IS 
type rEmpleado is record(
   nombre employees.frist_name%type,
   apellido empoyees.last_name%type,
   salary employees.salary%type
);
   v_empleado rEmpleado;
--   v_empleado emloyees%rowtype;
   v_st number := salariototal(ID);
BEGIN
   select first_name,last_name,salary into v_empleado from employees where employee_id=id;
end;
/
