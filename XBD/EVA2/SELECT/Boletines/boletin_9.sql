--1
Select DNI,NOMAPELS from investigadores
   where DNI in(Select DNI from reserva
      group by DNI
      having count(*) > 1);
--2
Select i.DNI,i.NOMAPELS,fi.nombre,e.NUMSERIE,e.NOMBRE,fe.nombre,r.COMIENZO,r.FIN
   from investigadores i,reserva r,equipos e,facultad fi,facultad fe
   where i.DNI = r.DNI
   and r.NUMSERIE = e.NUMSERIE
   and fi.codigo = i.facultad
   and fe.codigo = e.facultad;
--3
Select distinct i.DNI,i.NOMAPELS
   from investigadores i,reserva r,equipos e
   where i.DNI = r.DNI
   and r.NUMSERIE = e.NUMSERIE
   and e.FACULTAD != i.FACULTAD
   order by dni;

Select DNI,NOMAPELS from INVESTIGADORES t
   where DNI in (Select DNI from reserva
      where numserie in(Select numserie from equipos
         where facultad != t.facultad))
   order by dni;
--4
Select nombre from facultad
   where codigo not in(
      Select facultad from investigadores where codigo is not null
         and DNI in(Select DNI from RESERVA));

Select nombre from FACULTAD
   where codigo in(
      Select codigo from facultad
      MINUS
      Select facultad from investigadores where codigo is not null
         and DNI in(Select DNI from RESERVA)
   );

--5
Select f.nombre,i.NOMAPELS from FACULTAD f,INVESTIGADORES i
   where i.FACULTAD = f.codigo
   and DNI not in(Select DNI from RESERVA where DNI is not null);

Select f.nombre,i.NOMAPELS from FACULTAD f,INVESTIGADORES i
   where i.FACULTAD = f.codigo
   and DNI in(
      Select DNI from INVESTIGADORES
      MINUS
      Select DNI from reserva
   );
--6
Select NUMSERIE,NOMBRE from equipos
   where numserie in(
      Select NUMSERIE from EQUIPOS
      MINUS
      Select NUMSERIE from reserva
   );

Select NUMSERIE,NOMBRE from equipos
   where numserie not in(Select NUMSERIE from RESERVA where numserie is not null);

Select e.numserie,e.nombre from equipos e,reserva r
   where e.NUMSERIE = r.NUMSERIE(+)
   group by e.numserie,e.nombre
   having count(r.NUMSERIE) = 0;

Select numserie,nombre from EQUIPOS t
   where not exists (Select * from reserva where t.NUMSERIE=numserie);

Select numserie,nombre from EQUIPOS t
   where numserie not in (Select numserie from reserva where t.NUMSERIE=numserie);