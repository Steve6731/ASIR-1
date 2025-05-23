create or replace trigger CheckProfDept 
before insert or update on departamento
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
create or replace trigger CheckDeptProf
before update on profesor
for each row
declare
   v_dept departamento%rowtype;
begin
   select * into v_dept from departamento where DNI = :NEW.DNI;
   if v_dept.coddep != :NEW.coddep then
      raise_application_error(-20001,'El profesor es jefe de departamento: '||v_coddep||
      ', no puede cambiar al otro departamento.');
   end if;
end;
/
create or replace trigger CheckProfDeptV2 
before insert or update or delete on departamento
for each row
declare
   v_dep profesor%rowtype;
begin
   select * into v_dep from profesor where DNI = :NEW.DNI and coddep = :NEW.coddep;
exception
   when NO_DATA_FOUND then raise_application_error(-20002,'El profesor no es de este departemto');
end;
/

create table auditoriaMatricula(
   CodAudiMatr number,
   CodLinMatr varchar2(64),
   fecha date,
   UserName varchar2(128),
   NewVar varchar(128),
   OldVar varchar(128)
);

update lineamatricula set nota = 6 where codmatr = 5 and codasig = 1;

create or replace trigger DoLogForLineaMatr before update on LineaMatricula
for each row
declare
   v_cod auditoriaMatricula.CodAudiMatr%type;
begin
   select nvl(max(codaudimatr),0)+1 into v_cod from auditoriaMatricula;
   insert into auditoriaMatricula(CodAudiMatr,CodLinMatr,fecha,UserName,NewVar,OldVar) 
   values(v_cod,:OLD.codmatr||'-'||:OLD.codasig,sysdate,user,:OLD.nota,:NEW.nota);
end;
/





create or replace trigger ProfnoAlum
before update or insert on Alumno
for each row
declare
   v_DNI profesor.DNI%type;
begin
   select DNI into v_DNI from profesor where DNI = :NEW.DNI;
   raise_application_error(-20002,'El profesor no puede ser Alumno');
   exception
      when NO_DATA_FOUND then null;
end;