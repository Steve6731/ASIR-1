create or replace procedure mediaC is
   media producto.prventa%type;
BEGIN
   Select avg(prventa) into media from producto where tipo = 'C';
   dbms_output.put_line('La media del precio de venta de productos de tipo C es '||media);
end;
/

EXECUTE mediaC;