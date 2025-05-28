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
create or replace procedure muestraDept as
   cursor c_DEPT is select * from Departamento;
   v_DEPT c_DEPT%rowtype;
   NO_PROF_FOUND EXCEPTION;
   PRAGMA exception_init(NO_PROF_FOUND,-20001);
BEGIN
   open c_DEPT;
   fetch c_DEPT into v_DEPT;
   while c_DEPT%found loop
      dbms_output.PUT_LINE('----'||v_dept.nombre);
      begin
         muestraPROF(v_DEPT.CODDEP);
         exception 
            when NO_PROF_FOUND then dbms_output.PUT_LINE('Departamento vacio');
            when others then  DBMS_OUTPUT.PUT_LINE('Osttias: '||sqlcode||' '||sqlerrm);
      end;
      fetch c_DEPT into v_DEPT;
   end loop;
   close c_DEPT;
end;
/

create or replace procedure muestraPROF(
   p_deptID profesor.CODDEP%type
) as
   cursor c_PROF is select * from profesor where CODDEP = p_deptID;
   v_PROF c_PROF%rowtype;
BEGIN
   select * into V_PROF from profesor where CODDEP = p_deptID;
   dbms_output.put_line(v_PROF.nombre||' '||v_PROF.DNI);
   
   exception 
      when TOO_MANY_ROWS then 
         open c_PROF;
         fetch c_PROF into v_PROF;
         while c_PROF%found loop
            dbms_output.put_line(v_PROF.nombre||' '||v_PROF.DNI);
            fetch c_PROF into v_PROF;
         end loop;
         close c_PROF;
      when NO_DATA_FOUND then raise_application_error(-20001,'Departamento Vacio');
end;
/

create or replace procedure siempreInserta(
   P_nombre Departamento.nombre%type
) as
   sinNombre exception;
   pragma exception_init(sinNombre,-1400);
begin
   insert into Departamento(nombre) values(P_nombre);

   exception when sinNombre then
      insert into Departamento(nombre) values('Desconocido');
end;
/
--exceptcion profesor sin departmento, si departamento es 0. lista dept
execute muestraDept;