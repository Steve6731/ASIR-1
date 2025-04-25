--practica propuestas-vistas
drop view xuan;
create view xuan as
   Select codproducto,nombrecomercial,numVenta from (
      Select p.codproducto,p.nombrecomercial,count(v.codventa) as numVenta from producto p ,lineaventa lv,venta v
         where v.codventa(+) = lv.codventa
         and p.codproducto = lv.codproducto(+)
         group by p.codproducto,p.nombrecomercial
         order by 3)
      where rownum <= 5;

Select p.nombrecomercial,count(v.codventa) from producto p ,lineaventa lv,venta v
   where v.codventa(+) = lv.codventa
   and p.codproducto = lv.codproducto(+)
   group by p.codproducto,p.nombrecomercial
   order by 1;

Select column_name,updatable from user_updateble_columns where table_name = 'xuan';

Select * from xuan;

--practica propuestas-vistas materialezadas
Select * from tabla;

create materialized view log 
   on tabla with rowid,primary key including new VALUES;

CREATE MATERIALIZED VIEW xuan
   BUILD IMMEDIATE 
   REFRESH FAST 
   ON COMMIT AS 
      SELECT * FROM tabla;

drop MATERIALIZED VIEW xuan

--sinimo
Select * from manuel.foo;
Create synonym fooManuel for manuel.foo;
Select * from fooManuel;
Select * from fu;

Drop SYNONYM fooManuel;