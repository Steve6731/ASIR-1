create or replace procedure mediaTodo is
   cursor c_tipo is select distinct tipo from producto;
   media number;
   fila number := 2;
BEGIN
   for v in c_tipo loop
      if fila >= 2 then
         DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');
         fila := 0;
      end if;
      Select avg(prventa) into media from producto where tipo = V.tipo;
      dbms_output.put_line('La media del precio de venta de productos de tipo '||v.tipo||' es '||media);
      fila := fila + 1;
   end loop;
end;
/

EXECUTE mediaTodo;