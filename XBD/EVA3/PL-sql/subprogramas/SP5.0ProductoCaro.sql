create or replace procedure ProductoCaro is
   nombre producto.nombrecomercial%type;
begin 
   Select nombrecomercial into nombre from producto 
      where prventa >= all(Select prventa from producto);
   dbms_output.PUT_LINE('El producto más caro es '||nombre);
end;
/
create or replace procedure ProductoCaro is
   nombre producto.nombrecomercial%type;
begin 
   Select nombrecomercial into nombre from 
      (Select nombrecomercial,max(prventa) from producto group by nombrecomercial)
      where rownum = 1;
   dbms_output.PUT_LINE('El producto más caro es '||nombre);
end;
/

EXECUTE productocaro;

   Select nombrecomercial from producto 
      where prventa >= all(Select prventa from producto);
Select nombrecomercial from 
      (Select nombrecomercial,max(prventa) from producto group by nombrecomercial)
      where rownum = 1;