create or replace procedure muestraDept as
   cursor c_DEPT is select * from Departamento;
   cursor c_profesor is select * from profesor;
   v_DEPT c_DEPT%rowtype;
   v_profesor c_DEPT%rowtype;
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
            when NO_PROF_FOUND then dbms_output.PUT_LINE('');
            when others then  DBMS_OUTPUT.PUT_LINE('Osttias: '||sqlcode||' '||sqlerrm);
      end;
      fetch c_DEPT into v_DEPT;
   end loop;
   close c_DEPT;
   dbms_output.PUT_LINE('----Profesores sin sociado');
   for v_profesor in c_profesor loop
      dbms_output.put_line(v_PROF.nombre||' '||v_PROF.DNI);
      begin
         muestraPROF(v_DEPT.CODDEP);
         exception 
            when NO_DATA_FOUND then dbms_output.PUT_LINE('');
            when others then  DBMS_OUTPUT.PUT_LINE('Osttias: '||sqlcode||' '||sqlerrm);
      end;
   end loop;
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
      when NO_DATA_FOUND then raise_application_error(-20001,'No hay profesor sociado');
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
--insert ciclo(nombre,sigla),busca maximo codcf y +1 y excepcion

--borraSeguro(codCiclo) si no existe inserta en la tabla log(id.mesaje) el mensaje 'ciclo '||codCiclo||' no existe'
--si existe lo borra y escribe en el log 'ciclo codigo borrado'
execute muestraDept;