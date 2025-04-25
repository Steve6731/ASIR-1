--1
Select dni,nomApels from directores;
--2
Select * from directores
   where DNIjefe is null;
--3
Select e.nomApels,d.capacidad from directores e,despachos d
   where d.numero = e.despacho(+);
--4
Select d.numero,count(e.DNI) from directores e,despachos d
   where d.numero (+) = e.despacho
   group by d.numero;
--5
Select nomApels from DIRECTORES
   where DNIJefe in(Select DNI from DIRECTORES
      where DNIJefe is null);
--6
Select e.NOMAPELS as Empleado,nvl(j.NOMAPELS,'No tiene') as SuJefe from DIRECTORES e,DIRECTORES j
   where e.DNIJEFE = j.DNI(+);
--7
Select d.numero,count(e.DNI) from directores e,despachos d
   where d.numero = e.despacho
   group by d.numero
   having count(e.DNI) > d.CAPACIDAD;
--8
Insert into directores(DNI,NOMAPELS,DESPACHO) VALUES(28301700,"Paco Perez",124);
--9
Update DIRECTORES set DNIJEFE = 74568521 where lower(NOMAPELS) = "%perez%";
--10
DELETE DIRECTORES where DNIJEFE is null;