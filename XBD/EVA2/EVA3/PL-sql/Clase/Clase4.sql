--dar DNi volver nombre,salary,saltotal

create or replace procedure informacionEmp (
   ID employees.employee_id%type
) IS nombre employees.First_name%type;
     sal employees.salary%type;
     salario_total number := saltotal(ID);
BEGIN
   Select First_name,salary into nombre,sal from employees where employee_id = ID;
   dbms_output.PUT_LINE('Nombre:'||nombre||' Salario:'||sal||' Salario Total:'||salario_total);
end;
/