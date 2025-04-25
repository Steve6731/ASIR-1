--1
Select p.nombre,count(v.producto) from productos p,venta v
   where p.codigo = v.producto(+)
   GROUP BY p.CODIGO,p.NOMBRE
   order by count(v.PRODUCTO) desc;
--2
Select p.nombre,c.nomapels,m.piso from venta v,cajeros c,productos p,MAQUINAS_REGISTRADORAS m
   where p.codigo = v.PRODUCTO
   and m.CODIGO = v.MAQUINA
   and c.CODIGO = v.CAJERO;

Select * from venta;

--3
Select m.piso,count(v.PRODUCTO) from MAQUINAS_REGISTRADORAS m,venta v
   where m.CODIGO = v.MAQUINA(+)
   group by m.CODIGO,m.PISO
   order by m.CODIGO;

Select m.piso,sum(precio) from venta v,productos p,MAQUINAS_REGISTRADORAS m
   where p.codigo(+) = v.PRODUCTO
   and m.CODIGO = v.MAQUINA(+)
   group by m.CODIGO,m.piso
   order by 1;

Select * from MAQUINAS_REGISTRADORAS;
--4
Select c.NOMAPELS,sum(precio) from venta v,cajeros c,productos p,MAQUINAS_REGISTRADORAS m
   where p.codigo = v.PRODUCTO
   and m.CODIGO = v.MAQUINA
   and c.CODIGO = v.CAJERO
   group by c.codigo,c.NOMAPELS;
--5
Select c.NOMAPELS,sum(precio) from venta v,cajeros c,productos p,MAQUINAS_REGISTRADORAS m
   where p.codigo = v.PRODUCTO
   and m.CODIGO = v.MAQUINA
   and c.CODIGO = v.CAJERO
   group by c.codigo,c.NOMAPELS
   having sum(precio) < 500;