--1
Select NOMBRE from ARTICULOS;
--2
Select NOMBRE,PRECIO from ARTICULOS;
--3
Select NOMBRE,PRECIO from ARTICULOS
   where precio >= 200;
--4
Select NOMBRE from ARTICULOS
   where precio BETWEEN 60 and 120;
--5
Select NOMBRE,PRECIO * 166.386 as Prescio_Pessetas from ARTICULOS;
--6
Select round(AVG(precio),2) as PrecioMedio from ARTICULOS;
--7
Select round(AVG(precio),2) as Precio_Medio_De_Fab2 from ARTICULOS
   where FABRICANTE = 2;
--8
Select CODIGO from ARTICULOS
   where PRECIO >= 180;
--9
Select NOMBRE,PRECIO from ARTICULOS
   where PRECIO >= 180
   ORDER BY PRECIO,NOMBRE;
--10
Select * from ARTICULOS,FABRICANTES
   where FABRICANTES.CODIGO = articulos.fabricante;
--11
Select a.nombre,a.precio,f.nombre from articulos a,fabricantes f
   where f.codigo = a.fabricante;
--12
Select round(avg(a.precio),2) from articulos a,fabricantes f
   where f.codigo = a.fabricante
   group by f.CODIGO,f.nombre;
--13
Select f.nombre,round(avg(a.precio),2) from articulos a,fabricantes f
   where f.codigo = a.fabricante
   group by f.CODIGO,f.nombre;
--14
Select f.nombre,round(avg(a.precio),2) from articulos a,fabricantes f
   where f.codigo = a.fabricante
   group by f.CODIGO,f.nombre
   having avg(a.precio) > 150;
--15
Select nombre from ARTICULOS
   where precio in(Select min(precio) from articulos);
--16
Select a.nombre,a.precio,f.nombre from articulos a,FABRICANTES f
   where precio in(Select max(a.precio) from articulos a,FABRICANTES f
                     where a.FABRICANTE = f.CODIGO
                     group by f.CODIGO)
   and a.FABRICANTE = f.CODIGO;
--17
INSERT into articulos(codigo,NOMBRE,PRECIO,FABRICANTE) VALUES(14,Altofalantes,70,2);
--18
Update ARTICULOS set NOMBRE = 'impresaora láser' where codigo = 8;
--19
Update ARTICULOS set PRECIO = PRECIO*0.9;
--20
Update ARTICULOS set PRECIO = PRECIO + 10 where precio > 120;
--21
Select * from ARTICULOS a,FABRICANTES f
   where f.CODIGO = a.fabricante;

Select * from ARTICULOS a
   join FABRICANTES f on f.CODIGO = a.fabricante;

Select * from ARTICULOS
   join FABRICANTES on FABRICANTES.CODIGO = ARTICULOS.fabricante;


