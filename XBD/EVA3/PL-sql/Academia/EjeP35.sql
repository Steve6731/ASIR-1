create or replace trigger DoLogForAsig  
before insert or update or delete on Asignatura
for each row
declare
   v_coddep profesor.coddep%type;
begin
   select coddep into v_coddep from profesor where DNI = :NEW.DNI;
   if v_coddep != :NEW.coddep then
      raise_application_error(20001,'El profesor no es de este departemto');
   end if;
end;
/
create table auditoriaMatricula(
   CodAudiMatr number,
   CodLinMatr number,
   fecha date,
   UserName varchar2(128),
   NewVar varchar(128),
   OldVar varchar(128)
);
create or replace trigger DoLogForLineaMatr
before update on LineaMatricula
for each row
declare
   v_cod auditoriaMatricula.CodAudiMatr%type;
begin
   select nvl(max(codaudimatr),0)+1 into v_cod from auditoriaMatricula;
   insert into TriggerTest(
      CodAudiMatr,CodLinMatr,fecha,
      UserName,NewVa,OldVar
      ) 
   values(
      v_cod,:OLD.codlinmatr||'-'||codasig,
      sysdate,user,
      :OLD.nota,:NEW.nota
   );
end;
/
create or replace trigger ProfnoAlum
before update or insert on Alumno
for each row
begin
   select DNI into v_DNI from profesor where DNI = :NEW.DNI;
   if v_DNI is not null then 
      raise_application_error(-20002,'El profesor no puede ser Alumno');
   end if;
   exception
      when NO_DATA_FOUND then 
         dbms_output.put_line('DNI valido');
end;