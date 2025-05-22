create or replace trigger checkContacto
for insert or update of codprov on contacto
compound TRIGGER

BEFORE STATEMENT IS
BEGIN
 NULL;
END BEFORE STATEMENT;

BEFORE EACH ROW IS
   num number;
BEGIN
   insert into contacto_new(codcontacto,nombrecompleto,cargo,codprov)
      values(:NEW.codcontacto,:new.nombrecompleto,:NEW.cargo,:NEW.codprov);
   select count(*) into num from contacto_new;
   dbms_output.PUT_LINE('temp: '||num);
END BEFORE EACH ROW;

AFTER EACH ROW IS
BEGIN
 NULL;
END AFTER EACH ROW;

AFTER STATEMENT IS
   v_count number := 0;
   cursor c_contacto is select * from contacto_new;
BEGIN
   for v_contacto in c_contacto loop
      DBMS_OUTPUT.PUT_LINE('codprov. '||v_contacto.codprov||' count default: '||v_count);
      select count(*) into v_count from contacto where codprov = v_contacto.codprov;
      DBMS_OUTPUT.PUT_LINE('count: '||v_count);
      if v_count > 3 then 
         raise_application_error(-20002,'un contacto tiene más que 3 proveedor');
      end if;
   end loop;
END after statement;
end;
/

insert into contacto(codcontacto,nombrecompleto,cargo,codprov) 
   values(4,'Iván Beltrán','Vendedor',1);
delete contacto where codprov = 2;

create GLOBAL TEMPORARY table contacto_new(
   codcontacto number,
   nombrecompleto varchar2(16),
   cargo varchar2(16),
   codprov number
) ON COMMIT DELETE ROWS;
create GLOBAL TEMPORARY table contacto_new as select * from contacto where CODCONTACTO = 0;
select * from CONTACTO_NEW;
select * from contacto;
drop table contacto_new;