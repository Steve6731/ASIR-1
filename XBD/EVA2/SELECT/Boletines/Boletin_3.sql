--1
Select * from almacenes;
--2
Select * from cajas
   where valor > 150;
--3
Select DISTINCT contenido from cajas;
--4
Select avg(valor) from cajas;
--5
Select avg(valor) from cajas
   GROUP by almacen;
--6
Select almacen from cajas 
   group by almacen
   having AVG(valor) > 150;
--7
Select c.NumReferencia,a.lugar from almacenes a,cajas c
   where c.almacen = a.codigo;
--8
Select almacen,count(*) from cajas
   GROUP BY almacen;
--9
Select a.codigo from almacenes a,cajas c
   where c.almacen = a.codigo
   group by a.codigo
   having COUNT(c.NumReferencia) > a.capacidad;
--10
Select c.NumReferencia,a.lugar from almacenes a,cajas c
   where c.almacen = a.codigo
   and a.lugar = 'Bilbao';
--11
Insert into almacen(codigo,lugar,capacidad) VALUES(999,Barcelona,3);
--12
Insert into cajas(NumReferencia,contenido,valor,almacen) VALUES(H5RT,Papel,200,2);
--13
Update cajas set valor = valor*0.85;
--14
Update cajas set valor = valor*0.8
   where valor > (Select avg(valor) from caja);
--15
DELETE from cajas where valor > 100;
--16
Delete from almacenes where codigo in(
   Select a.codigo from almacenes a,cajas c
   where c.almacen = a.codigo
   group by a.codigo
   having COUNT(c.NumReferencia) > a.capacidad);


--clase
Select a.codigo,a.LUGAR,count(c.NumReferencia) from almacenes a,cajas c
   where c.almacen = a.codigo
   group by a.codigo,a.lugar
   having count(c.NumReferencia) > (Select count(c.NumReferencia) from almacenes a,cajas c where c.almacen = a.codigo and a.codigo = 2 group by a.codigo);