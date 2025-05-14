___
**Triger 1º tipo**  
======

1º tipo trigger que evita que se haga: el evento si se cumple condicion  
create or replace trigger [name] before|after [Event(insert,update,delet)] on [table] 
   
### **Fomate**

```
create or replace trigger [TrieggerName] 
before|after [Evento] on [tablaName]
for each row
DECLARE
   [varibale] [tipo] [:=] [definicion];
   ...
begin
   if [condicion] then
      raise_application_error([ErrorCode],'[ErrorMessage]');
   end if;
end;
```
### **Ejemplo 1**

```SQL
create or replace trigger NoDelete before insert on EMP
begin
   raise_application_error(-20002,'no borrar tabla');
end;
```

### **Ejemplo 2**

> :OLD la fila antes  
> :NEW la fila despues  
> insert no tiene :OLD y Delete tampoco hay :NEW  

```sql
create or replace trigger checkSal before insert on EMP
begin
   if :NEW.sal < 0 then
      raise_application_error(-20002,'salario negativo no puede ser');
   end if;
end;
```
  
### **Ejercicio 3**

```sql
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
```
___
**Triger 2º tipo**  
======

Triggers que actualizan datos de otra tabla  
Nececita que hace la transaccion dentro del trigger. 
  
Primero vamos a crear un tabla

```sql 
create table TriggerTest (
   id number(8),
   fecha date,
   descripecion varchar2(128)
);
```

### **Ejemplo 1**

```sql
create or replace trigger DoLogForAsig 
before update or update or delete on Asignatura
begin
   insert into TriggerTest(fecha,descripcion) values(sysdate,'Tocando el tabla Asignatura');
end;
```

### **Ejemplo 2**
> if inserting then  
> if updating then  
> if deleting then

```sql
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
```
