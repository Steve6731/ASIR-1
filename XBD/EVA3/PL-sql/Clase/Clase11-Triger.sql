--1º tipo trigger que evita que se haga: el evento si se cumple condicion
--create or replace trigger [name] before|after [Event(insert,update,delet)] on [table]
create or replace trigger NoDelete before insert on EMP
begin
   raise_application_error(-20002,'no borrar tabla');
end;
/
-- :OLD la fila antes
-- :NEW la fila despues
-- insert no tiene :OLD Delete tampoco hay :NEW
create or replace trigger checkSal before insert on EMP
begin
   if :NEW.sal < 0 then
      raise_application_error(-20002,'salario negativo no puede ser');
   end if;
end;
/

create or replace trigger checkB before insert on Asignatura
--for each row
--DECLARE
begin
   if :NEW.B != "S" and :NEW.B != "N" then
      raise_application_error(-20002,'el Bilingue solo puede ser S or N ');
   end if;
end;
/

create or replace trigger checkHora before insert on Asignatura
for each row
DECLARE
   test asignatura%rowtype;
begin
   if :NEW.numhoras < 0 or :NEW.numhoras > :OLD.nomhoras*1.2 then
      raise_application_error(-20002,'numhoras no puede ser negativo');
   end if;
   select * into test from asignatura where codcf = :NEW.codcf;
   exception when NO_DATA_FOUND then raise_application_error(-20001,'Ciclo no existen');
end;
/
drop trigger DoLogForAsig;

create table TriggerTest (
   id number(8),
   fecha date,
   descripecion varchar2(128)
);

create or replace trigger DoLogForAsig  
before insert or update or delete on Asignatura
for each row
Declare
   test asignatura%rowtype;
   New_CicloCod Asignatura.codcf%type;
   logCod triggertest.id%type;
begin
   select max(id)+1 into logCod from triggertest;
   if inserting then
   begin
      select * into test from asignatura where codcf = :NEW.codcf;
      exception when NO_DATA_FOUND then 
         insert into ciclo(codcf,nombre,sigla)
         values(:NEW.codcf,'nombre'||:NEW.codcf,'SIG'||:NEW.codcf);
   end;
      insert into TriggerTest(id,fecha,descripecion) 
      values(logCod,sysdate,'Insertado row('||:NEW.codasig||' , '||
      :NEW.nombre||' , '||:NEW.numhoras||' , '||
      :NEW.B||' , '||:NEW.codcf||')');
   end if;
   if updating then
      insert into TriggerTest(id,fecha,descripecion) 
      values(logCod,sysdate,'Update row('
      ||:OLD.codasig||' , '||:OLD.nombre
      ||' , '||:OLD.numhoras||' , '||
      :OLD.B||' , '||:OLD.codcf||') to ('
      ||:NEW.codasig||' , '||:NEW.nombre
      ||' , '||:NEW.numhoras||' , '||
      :NEW.B||' , '||:NEW.codcf||')'
      );
   end if;
   if deleting then
      insert into TriggerTest(id,fecha,descripecion) 
      values(logCod,sysdate,'Delte row('
      ||:OLD.codasig||' , '||:OLD.nombre
      ||' , '||:OLD.numhoras||' , '||
      :OLD.B||' , '||:OLD.codcf||')');
   end if;
   
end;
/
delete Asignatura where codcf = 5;
insert into Asignatura(codasig,nombre,numhoras,B,codcf)
values(10,'AsigName1',100,'B',5);

select * from ciclo;
select * from triggertest;
select * from ASIGNATURA;
delete TRIGGERTEST  where id is null;

insert into TriggerTest(id,fecha,descripecion) 
      values(1,sysdate,'test');
DECLARE
   test asignatura%rowtype;
begin
   select * into test from asignatura where codcf = 5;
   exception when NO_DATA_FOUND then 
      dbms_output.put_line('no found');
end;
/


create or replace trigger AnoPorDefecto
before insert on matricula
for each row
begin
   if :NEW.curso is null then
      :new.curso := extract(year from sysdate);
   end if;
end;
/
insert into matricula(codmatr,dni) values(7,12345678);
select * from matricula;
delete matricula where dni = 12345678;


create or replace trigger LastModificate
before insert or update on alumno
for each row
begin
   :new.lastModi := sysdate;
end;
/
alter table alumno add column dateUM DATE;