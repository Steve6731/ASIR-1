create or replace procedure CuandoCompra is
   cursor c_proveedor is 
      select p.gerente as nombre,count(c.codcompra) as cantidad from proveedor p,compra c
         where p.codprov = c.codprov(+)
         group by p.codprov,gerente;
   Codigo compra.codprov%type := 5;
begin 
   for lina in c_proveedor loop
      dbms_output.put_line('Al proveedor '||lina.nombre||' se le ha hecho '||lina.cantidad||' compras');
   end loop;
end;
/

EXECUTE CUANDOCOMPRA;