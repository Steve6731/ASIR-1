--1
Select matricula from vehiculos
    where matricula in( Select matricula from alugueres
        where extract(year from data_inicial) = extract(year from sysdate));
--2        
Select matricula from vehiculos
    where exists( Select * from alugueres
        where extract(year from data_inicial) = extract(year from sysdate));
--3
Select matricula from vehiculos
minus
Select matricula from alugueres
        where extract(year from data_inicial) = extract(year from sysdate);
--4
Select distinct v.matricula from vehiculos v
    left join alugueres a on a.matricula = v.matricula
    where extract(year from a.data_inicial) != extract(year from sysdate)
    or a.matricula is null
    order by 1;

Select distinct v.matricula from vehiculos v, alugueres a 
    where a.matricula(+) = v.matricula    
    and (extract(year from data_inicial) != extract(year from sysdate)
    or a.matricula is null)
    order by 1;
--5
Select DNI,NOME from clientes 
    where DNI in (Select a.DNI from vehiculos v, alugueres a 
        where a.matricula = v.matricula
        and upper(v.marca) = 'BMW');
--6
Select a.matricula,sum(KILOMETROS) from alugueres a
    join vehiculos v on v.matricula = a.matricula
    join clientes c on a.DNI = c.DNI
    where upper(c.nome) = 'JOS� S�NCHEZ'
    group by a.matricula;
--7
Select v.marca,avg(a.kilometros) from vehiculos v,alugueres a
    where v.matricula = a.matricula(+)
    group by v.marca;
--8
Select v.marca,sum(a.kilometros) from vehiculos v,alugueres a
    where v.matricula = a.matricula
    group by v.marca
    having sum(a.kilometros) >=  all(
        Select sum(kilometros) from vehiculos v,alugueres a
            where v.matricula = a.matricula
            group by v.marca);
--9
Select distinct v.marca,v.modelo from vehiculos v,alugueres a
    where v.matricula = a.matricula(+) 
    and (sysdate > a.data_inicial + nvl(num_DIAS,0)
    or a.matricula is null);
--10
Select v.matricula from vehiculos v,alugueres a
    where v.matricula = a.matricula(+) 
    and extract(year from v.data_compra) + 3 < extract(year from sysdate)
    group by v.matricula
    having sum(kilometros) > 50000;
--11
Select c.DNI,c.NOME,sum(nvl(a.num_dias,0)*nvl(v.prezo_dia,0)) from alugueres a
    left join vehiculos v on v.matricula = a.matricula
    right join clientes c on a.DNI = c.DNI
    group by c.DNI,c.NOME;
--12
Select c.DNI,c.NOME,count(a.DNI) from clientes c,alugueres a
    where c.DNI = a.DNI(+)
    group by c.DNI,c.NOME;
--13
Select sum(nvl(a.num_dias,0)*nvl(v.prezo_dia,0)) from alugueres a
    left join vehiculos v on v.matricula = a.matricula
    left join clientes c on a.DNI = c.DNI
    where upper(c.nacionalidade) = 'ESPA�OLA';
--14
Select matricula from (Select matricula from alugueres group by matricula order by count(*) desc)
    where rownum <= 3;
--15
Select c.*,a.data_inicial,v.matricula,v.modelo from alugueres a
    left join vehiculos v on v.matricula = a.matricula
    right join clientes c on a.DNI = c.DNI;