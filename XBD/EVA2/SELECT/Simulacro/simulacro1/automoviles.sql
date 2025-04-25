--1
Select m.nombre,c.nombre,c.modelo from coches c,marcas m
   where lower(m.ciudad) in("madrid")
   and c.codmarca = m.codmarca
   order by m.nombre,c.nombre;
--2
Select m.nombre,c.nombre,c.modelo from coches c,marcas m
   where lower(c.modelo) in("td")
   and c.codmarca = m.codmarca
   order by m.nombre,c.nombre;
--3
Select conc.nombre,count(*) from coches c ,distribucion d,concesionarios conc
   where lower(c.modelo) in("td")
   and conc.codconc = d.codconc
   and d.codcoche = c.codcoche
   group by conc.codconc,conc.nombre;
--4
Select cn.nombre,avg(cantidad) from disctribucion d,concesionarios cn
   where d.codconc = cn.codconc;
--5
Select v.codcoche from ventas v
   join clientes cl on cl.DNI = v.DNI
   where upper(cl.ciudad) = 'MADRID';
--6
Select v.codcoche from ventas v
   join clientes cl on cl.DNI = v.DNI
   join concesionarios cn on cn.codconc = v.codconc
   where upper(cl.ciudad) = 'MADRID'
   and upper(cn.ciudad) = 'MADRID';
--7
Select cl.* from ventas v
   join clientes cl on cl.DNI = v.DNI
   join concesionarios cn on cn.codconc = v.codconc
   where upper(cl.ciudad) = upper(cn.ciudad)
   ORDER by cl.apellidos,nombre;
--8
Select cl.codcoche from ventas v
   join clientes cl on cl.DNI = v.DNI
   join concesionarios cn on cn.codconc = v.codconc
   where upper(cn.ciudad) = 'MADRID'
   order by cl.DNI;
--9
Select v.color, count(*) from ventas v
   where extract(year from fecha) = 2000
   group by v.color
   order by count(*);
--10
Select nombre from (Select nombre from concesionarios order by nombre)
   where rownum <= 3;
--11
Select cn.nombre,cc.modelo from concesionarios cn
   left join distribucion d on cn.codconc = d.codconc
   left join coches cc on cc.codcoche = d.codcoche;
--12
Select cl.DNI from clientes cl
   join ventas v on cl.DNI = v.DNI
   join coches cc on cc.codcoche = v.codcoche
   where color = 'vermella'
   and modelo = 'GTI';
--13
--Select nombre,avg(NumCoche) from concesionarios t,(
--   Select d.cantidad-count(v.codcoche) as NumCoche from concesionarios cn,ventas v,distribucion d
--      where cn.codconc = d.codconc
--      and cn.codconc = v.codconc
--      and cn.codconc = t.codconc
--      group by cn.codconc)
--   group by codconc,nombre;
--14
--Select v.*,cl.* from ventas v,clientes cl,
--15
Select apellidos,nombre from clientes
   where DNI in(Select DNI from VENTAS where color = 'branco')
   and DNI in(Select DNI from VENTAS where color = 'vermello');
--16
Select * from clientes
   where DNI not in(Select DNI from ventas
      where color = 'vermello'
      and DNI is not null
      and codconc not in(Select codconc from concesionarios
         where upper(ciudad) = 'MADRID'
      ));
--17
Select color from ventas
   group by color
   having count(*) >= (Select count(*) from ventas
      group by color);
--18
