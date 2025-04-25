--1
Select c.DNI,c.nomapels,p.id,p.nombre from cientificos c,ASIGNADO_A a,PROYECTO p
   where c.DNI = a.cientifico 
   and a.Proyecto = p.id;
--2
Select c.DNI,c.NomApels,count(a.proyecto) from CIENTIFICOS c,ASIGNADO_A a
   where c.DNI = a.CIENTIFICO(+)
   group by c.DNI,c.NOMAPELS;
--3
Select p.id,p.nombre,count(a.cientifico) from PROYECTO p,ASIGNADO_A a
   where p.id = a.PROYECTO(+)
   GROUP by p.id,p.nombre;
--4
Select c.DNI,c.nomapels,sum(nvl(horas,0)) from cientificos c,ASIGNADO_A a,PROYECTO p
   where c.DNI = a.cientifico(+)
   and a.Proyecto = p.id(+)
   group by c.DNI,c.NOMAPELS;
--5
Select c.DNI,c.nomapels,avg(nvl(horas,0)) from cientificos c,ASIGNADO_A a,PROYECTO p
   where c.DNI = a.cientifico 
   and a.Proyecto = p.id
   and c.DNI in(Select cientifico from ASIGNADO_A GROUP by CIENTIFICO HAVING count(*) > 1)
   group by c.DNI,c.NOMAPELS
   having avg(horas) > 50;
