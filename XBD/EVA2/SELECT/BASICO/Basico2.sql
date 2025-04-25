--1
Select TNOMBRE from ARTICULOS
   where CIUDAD in('CACERES');
--2
Select P#,CANTIDAD from ENVIOS
   where C# in('T1');
--3
Select distinct COLOR,CIUDAD from COMPONENTES;
--4
Select T#,ciudad from articulos
   where lower(ciudad) = '%e%d';
--5 obtener los valores de P# para los proveedores que suministran para el artículo T1 el componente C1
Select P# from envios
   where T#=1 and C#=1;
--6
Select Tnombre from articulos
   where T# = (Select T# from envios where P# = 1)
   ORDER BY Tnombre;
--7 obtener los vaores de C# para los componenetes suministrados para cualquier articulo de MADRID
Select C# from COMPONENTES
   where lower(ciudad) in('madrid');
--8 obtener todos los valores de C# de los componentes tales quee ningún otro componete tenga un valor de peso inferior.
Select C# from COMPONENTES
   where peso = (Select min(peso) from COMPONENTES);
--9 
Select P# from ENVIOS
   where T# in('1','2');
--10
Select P# from ENVIOS e,componetes c,articulos a
   where e.C# = c.C#
   and e.T# = a.T#
   and lower(a.ciudad) in ('sevilla','madrid')
   and lower(c.color) in ('rojo');
--11 obtener ,mediante subconsultas,los valores de C# para los componetes suministrados para algún artículo de sevilla por un proveedor de sevilla
Select P# from ENVIOS e,componetes c,articulos a,proveedores p
   where e.C# = c.C#
   and e.T# = a.T#
   and e.P# = p.P#
   and lower(a.ciudad) in('sevilla')
   and lower(p.ciudad) in('sevilla');
--12 obtener los valroes de T# para los artículos que usan al menos un componente que se puede obtener con el proveedor P1.
Select T# from envios
   where P#=1;
--13
Select c.ciudad as ciudad,c.C# as C#,a.ciudad as ciudad from ENVIOS e,componentes c,articulos a
   where e.C# = c.C#
   and e.T# = a.T#;
--14
Select distinct c.ciudad as ciudad,c.C# as C#,a.ciudad as ciudad from ENVIOS e,componentes c,articulos a
   where e.C# = c.C#
   and e.T# = a.T#;
--15
Select count(P#) from proveedores;
Select P#,count(T#) from ENVIOS
   GROUP by P#;
Select sum(cantidad) from ENVIOS
   where P# = 2;
--16 Para cada artículo y componente suministrado obtener los valores de C#,T# y la cantidad total corespondiente
Select sum(cantidad) from envios
   GROUP BY C#,T#;
--17
Select a.T# from ENVIOS e,componetes c,articulos a,proveedores p
   where e.C# = c.C#
   and e.T# = a.T#
   and e.P# = p.P#
   and lower(a.ciudad) != lower(p.ciudad)
   and p.CIUDAD != 'madrid';
--18 obtener los valores de P# para los proveedores que suministran al menos un componete suministrado al menos por un proveedor que suministra al menos un componente ROJO.
Select P# from ENVIOS
   where C# in(Select C# from componentes where lower(color) = 'rojo');
--19 obtener lso identificadores de artículos, T#, para los que se ha suministrado algún componene del que se hay suministrado una media superior a 320 artículos.
Select T#,avg(cantidad) from ENVIOS
   GROUP BY T#
   HAVING avg(cantidad) > 320;
--20 Seleccionar los identificadores de proveedores que hayan realizado algún envío con Cantidad mayour que la media de los envíos realizados apra el comonente a que corresponda dicho envío.
Select P#,cantidad from ENVIOS
   GROUP BY T#
   HAVING cantidad > (Select avg(cantidad));
--21
Select C# from ENVIOS
   where P# = 2 and T# = 2;
--22
Select * from ENVIOS
   where C# = (Select C# from componentes where lower(color) = rojo);
--23
Select * from preveedores
   where P# = (Select P# from envios where T# in('1','2'));
--24
Select P#,sum(e.CANTIDAD) from envios e,componentes c
   where c.C# = e.C#
   and c.color = 'ROJO'
   GROUP by e.P#;
--25
Select c.color from envios e,componentes c
   where c.C# = e.C#(+)
   and e.P = 1;
--26
Select e.P#,p.ciudad,e.C#,c.ciudad,e.T#,a.ciudad from ENVIOS e,componentes c,articulos a,proveedores p
   where e.C# = c.C#
   and e.T# = a.T#
   and e.P# = p.P#
   and lower(p.ciudad) = lower(c.ciudad)
   and lower(a.ciudad) = lower(c.ciudad);
--27
Select c.CNOMBRE,sum(e.CANTIDAD) from envios e,componentes c
   where c.C# = e.C#(+)
   group by c.C#,c.cnombre
   having sum(e.CANTIDAD) > 500;
--28
Select p.Pnombre,count(e.T#) from PROVEEDORES p,ENVIOS e
   where p.P# = e.P#(+)
   and p.ciudad = 'SEVILLA'
   group by p.P#,p.Pnombre
   having count(e.T#) < 2;
--29
Select a.T#,a.ciudad,c.C#,c.ciudad from ARTICULOS a,COMPONENTES c,ENVIOS e
   where e.T# = a.T#
   and e.C# = c.C#
   and a.ciudad = c.ciudad;
--30
Select a.T# from ARTICULOS a,COMPONENTES c,ENVIOS e
   where e.T# = a.T#
   and e.C# = c.C#
   group by a.T#
   having count(distinct e.C#) in(
      Select count(*) from COMPONENTES
   );
--31
Select e.P#,e.T# from ENVIOS e,componentes c,articulos a,proveedores p
   where e.C# = c.C#
   and e.T# = a.T#
   and e.P# = p.P#
   and c.color IN('ROJO')
   group by e.P#,e.T#
   having count(c.C#) >= 2;
--32 Propón tu mismo consultas que puedan realizarse sobre esta base de datos de ejemplo. Intenta responderla, y si te parece un problema interesante o no estás seguro dee su soluci´.on, puedes exponerlos en la clases prácticas para su resolución en grupo.