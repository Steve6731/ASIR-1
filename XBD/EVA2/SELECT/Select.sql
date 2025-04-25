------------Where-----------
select ENAME,EMPNO,JOB from EMP 
    where JOB IN ('CLERK','SALESMAN','ANALYST') and sal > 1250;
----------------------------
select ENAME,EMPNO,SAL,COMM from EMP 
    where SAL > 2500 or sal + comm > 2500;

-----Ejercicio de order---Tienda informatica-
SELECT NOMBRECOMERCIAL,NOMBREINT,PRCOSTE 
    from TIENDAINFORMATICA.PRODUCTO
    order by PRCOSTE;
----------------------------
SELECT CODPRODUCTO,NOMBREINT,PRVENTA 
    from PRODUCTO
    ORDER by PRVENTA DESC;
----------------------------
select * 
    from CLIENTE
    ORDER by TELEFONO;
----------------------------
SELECT NOMBRE 
    from EMPLEADO
    ORDER by DNIEMPL;
----------------------------
SELECT CODPROV,NOMBREPROV 
    from proveedor
    ORDER by GERENTE;

Select DNICL From CLIENTE
    where ciudad not in('Málaga','Córdaba','Santander') and NOMBRE not in('Rosa','Elena') and PRAPELLIDO ='Salas'
    ORDER by SGAPELLIDO;

SELECT DNIEMPL FROM EMPLEADO
    where ciudad in('Sevilla','Barcelona','Madrid') and SGAPELLIDO is NULL
    ORDER by DNIEMPL;

SELECT CODPRODUCTO FROM PRODUCTO
    WHERE canVende
    order by CODPRODUCTO desc;

SELECT NOMBRE,PRAPELLIDO,SGAPELLIDO from CLIENTE
    where nombre in('María','Rosa','García') and PRAPELLIDO in('Blaasco','Palacios','García') and SGAPELLIDO in('Beltran','Gómez')
    order by SGAPELLIDO DESC;

-----------------------------
SELECT ename,sal,sqrt(sal) as raiz from emp;
SELECT ename,substr(ename,2,3) as dosletras,length(ename) as longitud from emp;
select sysdate from dual;
SELECT ename,comm,nvl(comm,0) as commsinull from emp;
SELECT sum(sal+nvl(comm,0)) as gasto from emp where deptno=10;

---------Ejer.Clase----------
--a  Mostrar cuántos productos tienen que su precio de coste es menor que la mitad del precio de venta
select count(*) from producto 
    where prcoste < prventa * 0.5;
--b  Mostrar el precio más caro de los productos con IVA del 10 %
select max(prventa) from PRODUCTO
    where IVA = 10;
--c Mostrar el precio más barato de los productos
select min(prventa) from PRODUCTO;
--d Contar cuantos productos de tipo portátil (tipo=’P’) tienen un precio de coste menor que la tercera parte del precio de venta.
select count(*) from PRODUCTO
    where tipo = 'P' and PRCOSTE*3 < PRVENTA;
--e  Mostrar la suma de la diferencia del precio de venta con respecto al de coste de todos los productos de tipo periférico (Tipo=’F’).
select SUM(prventa-prcoste) as todo from PRODUCTO
    where tipo = 'F';
--f Mostrar la media de la diferencia de los precios de venta con respecto al de coste de todos los productos cuyo tipo es Sobremesa (Tipo=’S’) o Portátil (Tipo=’P’).
SELECT AVG(prventa-prcoste) as Ganancia_Media from PRODUCTO
    where tipo = 'S' or tipo = 'P';
--g  Mostrar los precios de coste y de venta con un solo decimal de aquellos productos cuyo tipo sea Componentes (Tipo='C’).
select round(prcoste,1),round(prventa,1) from PRODUCTO
    where tipo = 'C';
--h Mostrar los precios de coste redondeados con 1 decimal de aquellos productos cuyo precio de venta es solo un 20 % más que el de coste y su tipo es C, F o D
select round(prcoste,1) from PRODUCTO
    where prventa = 1.2 * prcoste and tipo in('C','F','D');
--i Mostrar el resto de la división del precio de venta con el de coste para aquellos productos con IVA del 10 % o del 21 %.
select mod(prventa,prcoste) from PRODUCTO
    where IVA in(10,21);
--j Mostrar cuántas ventas se han realizado. Como cada fila que hay en la tabla Venta representa una venta, basta con contar el número de filas que tiene esa tabla.
SELECT COUNT(*) from venta;

------UDC.Eje.Funcion---elscott---
--1 Muestra cuántos empleados hay y a cuánto ascienden sus ingresos (sumando los de todos e incluyendo salario y comisión) que sean SALESMAN o CLERK
select COUNT(*),SUM(sal+nvl(comm,0)) as SumaDeTodo from EMP
    where JOB in('SALESMAN','CLERK');

--2 Cuántos empleados tienen comisión, cuántos no tienen comisión, a cuánto asciende el salario medio, y cuánto asciende la comisión media.
Select count(COMM),count(*)-count(COMM),avg(COMM),avg(sal) from EMP;  --Select avg(Nvl(COMM,0)) from EMP;

--3 Cuántos empleados trabajan para los departamentos 20 y 30, y cuántos trabajos distintos se desempeñan en esos departamentos.
Select count(*),count(distinct JOB) from EMP
    where DEPTNO = 20 or DEPTNO = 30;

--4  Cuántos empleados tienen jefe, cuántos son jefes y cuántos no son jefes.
Select count(MGR),count(distinct MGR),count(*)-count(MGR) from EMP;

--5 Cuántos son los ingresos (salario más comisión) medios de los empleados contratados después del 01-08-1981.
SELECT avg(SAL+Nvl(COMM,0)) from EMP
    where HIREDATE > '1/8/81';

---------------GROUP BY---------------------

Select DEPTNO,count(*) from EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

Select DEPTNO,count(*),SUM(SAL) as SumaDeTodo,round(AVG(SAL+NVL(COMM,0)),2) as medioDeIngresos from EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

----------Ejercicios agrupación 1------elscott--
select * from emp;
-- 1. Cuántos empleados hay en cada departamento, cuántos tienen comisión, cuántos no tienen comisión y cuales son los ingresos medios (incluyendo salario y comisión.
Select count(*),count(COMM),count(*)-count(COMM),round(avg(sal+nvl(COMM,0)),2) as IngresosMedio from EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
--2. Muestra los departamentos que tienen empleados con comisión. No puede haber valores repetidos.
Select DEPTNO from EMP
    where COMM is not null
    GROUP BY DEPTNO;
--3. Para cada departamento muestra la comisión media, si no tiene empleados con comisión, se debe indicar con un 0.
Select DEPTNO,Round(AVG(nvl(COMM,0)),2) from EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
--4. Para cada departamento muestra cuántos puestos de trabajo distintos desempeñan sus trabajadores.
Select DEPTNO,COUNT(DISTINCT JOB) from EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
--5. Para cada departamento muestra cuántos empleados hay de cada puesto de trabajo.
Select Deptno,JOB,Count(*) from EMP
    GROUP BY DEPTNO,JOB
    ORDER BY DEPTNO;

----------Ejercicios agrupación 2-----elscott-
-- 1. Para cada departamento muestra cuántos empleados tienen unos ingresos (sal+comm) superiores a 2500 €.
Select DEPTNO,count(*) from EMP
    where sal+nvl(COMM,0) > 2500
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
--2. Muestra los departamentos con unos ingresos medios superiores a los 2500 €. Muestra para cada uno, cuántos empleados tienen.
Select DEPTNO,count(*) from EMP
    GROUP BY DEPTNO
    HAVING AVG(sal+nvl(COMM,0)) > 2500
    ORDER BY DEPTNO;
--3. Departamentos con al menos dos ‘MANAGER’
Select DEPTNO,count(MGR) as Cantidad_MGR from EMP
    GROUP BY DEPTNO
    HAVING count(MGR) > 2
    ORDER BY DEPTNO;
--4. Departamentos con al menos dos empleados con comisión. Para cada departamento muestra cuántos empleados tiene (en total) y cuántos con comisión.
Select DEPTNO,count(*),count(COMM) from EMP
    GROUP BY DEPTNO
    HAVING count(COMM) >= 2
    ORDER BY DEPTNO; 
--5. Departamentos con al menos dos empleados con el mismo puesto de trabajo. No puede aparecer repetidos
Select distinct DEPTNO,count(job) as MAX_MISMO_JOB_mas2 from EMP
    GROUP BY DEPTNO,JOB
    HAVING COUNT(JOB) >= 2
    ORDER BY DEPTNO;

------------Ejercicios JOIN--------elscott---
--cross join
Select ename,sal,dname from emp,dept;--显示行数 = 表1行数x表2行数

Select ename,sal,dname from emp e,dept d
    where e.deptno = d.deptno and sal > 2500;--只显示对应的
--inner join
Select ename,sal,dname from emp join dept
    on emp.deptno = dept.deptno
    where sal > 2500;

--more table
Select ename,dname,pname from emp,dept,pro
    where emp.deptno = dept.deptno and pro.deptno = dept.deptno;

Select ename,dname,pname from EMP
    join dept on emp.deptno = dept.deptno
    join pro on pro.deptno = dept.deptno;

--table a si mismo

Select Emple.ename,Jefe.ename from emp Emple,emp Jefe
    where Emple.mgr = Jefe.empno;

------------Ejercicios JOIN--------academia---
--a) Mostrar el DNl de los profesores que pertenecen al departamento de Informática y Comunicaciones.
Select profesor.DNI,departamento.nombre 
    from Profesor,departamento
    where profesor.CODDEP = departamento.CODDEP 
    and departamento.nombre = 'Informática y Comunicaciones';
--b) Mostrar el DNl de los alumnos bilingües que se han matriculado en el año 2029.
Select Curso,alumno.DNI from Alumno,Matricula
    where matricula.dni = alumno.dni and curso = 2029 and lower(B) = 's';
--c) Mostrar el nombre y el primer apellido de los alumnos bilingües que se han obtenido una calificación superior a 7.
Select nombre||' '||prapellido as nombre ,B,nota 
    from Alumno,Matricula,Lineamatricula
    where alumno.DNI = matricula.DNI
    and matricula.CODMATR = Lineamatricula.CODMATR
    and nota > 7 and lower(b) = 's';
--d) Mostrar el nombre y los apellidos de los alumnos que se encuentran matriculados en las asignaturas Gestión de Base de Datos y Acceso a Datos.
Select alumno.NOMBRE||' '||alumno.prapellido||' '||alumno.sgapellido as nombre,asignatura.NOMBRE 
    from alumno,Matricula,Lineamatricula,ASIGNATURA
    where alumno.DNI = matricula.DNI
    and matricula.CODMATR = Lineamatricula.CODMATR
    and Lineamatricula.CODASIG = ASIGNATURA.CODASIG
    and lower(ASIGNATURA.NOMBRE) in ('bases de datos','acceso a datos','gestión de bases de datos');
--e) Mostrar el nombre y apellidos de los alumnos que han aprobado asignaturas del ciclo con sigla DAM.
Select alumno.nombre||' '||alumno.prapellido||' '||alumno.sgapellido as nobmre,nota,ciclo.sigla
    from Alumno,Matricula,Lineamatricula,asignatura,ciclo
    where alumno.DNI = matricula.DNI
    and matricula.CODMATR = Lineamatricula.CODMATR
    and lineamatricula.CODASIG = asignatura.CODASIG
    and asignatura.CODCF = ciclo.CODCF
    and nota >= 5
    and lower(ciclo.sigla) = 'daw';

---------Eje.UDC.JOIN---elscott----
--1. Para cada proyecto muestra su nombre y el nombre del departamento que los controla.
Select PNAME,DNAME 
    from DEPT,PRO
    where dept.deptno = pro.deptno;
--2. Para cada empleado muestra su nombre y los códigos de proyectos para los que trabaja.
Select ENAME,PRONO from EMP,EMPPRO
    where emp.empno = emppro.empno;
--3. Para cada empleado muestra su nombre y los códigos de proyectos para los que trabaja. Si hay empleados que no trabajan en proyectos, éstos deben aparecer con el código de proyecto a nulo.
Select ENAME,PRONO from EMP 
    left join EMPPRO on EMP.EMPNO=EMPPRO.EMPNO;
--4. Para cada empleado muestra el nombre de su jefe, si no tiene jefe, muestra un nulo en el nombre del jefe.
Select E.ENAME as EMPREADO,J.ENAME as JEFE from EMP E 
    left join EMP J on J.EMPNO = E.MGR;
Select E.ENAME as EMPREADO,J.ENAME as JEFE from EMP E,EMP J 
    where E.MGR = J.EMPNO(+);
--5. Para cada empleado muestra su nombre, el nombre de su jefe, y el departamento para el que trabaja su jefe.
Select E.ENAME as Empleado,J.ENAME as "Su Jefe",D.DNAME from DEPT D,EMP E,EMP J
    where E.MGR = J.EMPNO 
    and J.DEPTNO = D.deptno;
--6. Devuelve los empleados que tienen un salario más alto que su jefe.
Select E.ENAME as Empleado,J.ENAME as "Su Jefe" from EMP E,EMP J
    where E.MGR = J.EMPNO 
    and E.SAL+nvl(E.COMM,0) > J.SAL+nvl(J.COMM,0);

------------Ejercicios JOIN ON--------academia---
--a Mostrar el DNI de los profesores que pertenecen al departamento de informática y comunicaciones cuyo DNI es mayor que 44200200.
Select PROFESOR.DNI as profesor,DEPARTAMENTO.NOMBRE as DEPARTAMENTO 
    from PROFESOR,DEPARTAMENTO
    where profesor.coddep = departamento.coddep(+)
    and lower(departamento.nombre) in ('informática y comunicaciones')
    and PROFESOR.DNI >= 44200200;
--b Mostrar el DNl de los profesores que pertenecen al departamento de administración y finanzas cuyo primer apellido empieza por P y el segundo apellido termina por z y fueron contratados en el curso 2022.
Select P.DNI as PROFESOR,D.NOMBRE as DEPARTAMENTO,C.CURSO as AÑO 
    from PROFESOR P,DEPARTAMENTO D,CONTRATO C
    where P.DNI = C.DNI(+) and P.DNI = D.DNI(+)
    and lower(D.NOMBRE) in ('administración y finanzas')
    and lower(P.NOMBRE) = '%z' and lower(P.PRAPELLIDO) = 'p%'
    and C.CURSO = 2022; 
--c Mostrar el nombre y el primer apellido de los profesores que han impartido la asignatura Acceso a datos.
Select P.NOMBRE||' '||P.PRAPELLIDO as PROFESOR,A.NOMBRE 
    from PROFESOR P,CONTRATO C,LINEACONTRATO L,ASIGNATURA A
    where P.DNI = C.DNI and C.CODCONT = L.CODCONT and L.CODASIG = A.CODASIG
    and lower(A.nombre) in ('acceso a datos');
--d Mostrar el nombre y los apellidos de los alumnos que se encuentran matriculados en la asignatura de Gestión de Base de Datos y de Acceso a Datos y que han aprobado la asignatura.
Select S.nombre||' '||S.PRAPELLIDO||' '||S.SGAPELLIDO as Alumno,A.NOMBRE,L.NOTA
    from alumno S,matricula M,lineamatricula L,asignatura A
    where S.DNI = M.DNI and M.CODMATR = L.CODMATR and L.CODASIG = A.CODASIG
    and lower(A.NOMBRE) in ('gestión de bases de datos','acceso a datos') 
    and L.nota >= 5;
--e Mostrar el nombre y apellidos de los alumnos que han aprobado asignaturas del ciclo con sigla ASIR, cuyo segundo apellido tiene una z. Mostrar los registros ordenados por el primer apellido y luego por el segundo
Select S.nombre||' '||S.PRAPELLIDO||' '||S.SGAPELLIDO as Alumno,A.NOMBRE,L.NOTA
    from alumno S,matricula M,lineamatricula L,asignatura A,ciclo C
    where S.DNI = M.DNI and M.CODMATR = L.CODMATR and L.CODASIG = A.CODASIG and A.CODCF = C.CODCF
    and C.SIGLA in ('ASIR') and S.SGAPELLIDO = '%z%'
    ORDER BY S.PRAPELLIDO,S.SGAPELLIDO;

---------Eje.UDC.JOIN---elscott----
--1. Para empleado muestra su nombre y cuántas horas trabajó en proyectos.
Select e.ENAME,ep.HOURS from emppro ep,emp e
    where e.empno = ep.EMPNO(+);
--2. Para cada departamento, muestra su nombre y cuántos empleados tiene.
Select d.DNAME,d.DEPTNO,count(*) from emp e,dept d--做区分,后面还有差不多的
    where e.deptno(+) = d.deptno
    GROUP by d.deptno,dname
    order by d.deptno;
--3. Para cada jefe, muestra su nombre y cuántos subordinados tiene.
Select j.ename,count(e.empno) as "cantidad de EMP" from emp e,emp j
    where j.empno = e.mgr
    GROUP by j.ename;
--4. Muestra el nombre de proyectos donde se ha trabajado (en total, todos los empleados) más de 15 horas
Select p.PNAME,sum(ep.hours) from emppro ep,pro p
    where ep.PRONO(+) = p.PRONO
    GROUP by p.PRONO,p.PNAME
    having sum(ep.hours) > 15;
--5. Muestra los departamentos (nombre) que controlan más de dos proyectos.
Select d.dname,count(p.prono) from pro p,dept d
    where p.deptno(+) = d.DEPTNO
    group by d.deptno,d.dname
    having count(p.prono) >= 2;
--6. Muestra los departamentos (nombre) donde hay por lo menos dos empleados con el mismo puesto de trabajo. No debe aparecer repetidos.
Select d.dname,e.job,count(*) from dept d, emp e
    where d.DEPTNO(+) = e.DEPTNO
    group by d.deptno,d.dname,e.job
    having count(*) >= 2;
--7. Para cada departamento mostrar su nombre y cuántos empleados tiene, si no tiene ninguno, indicarlo con un 0.
Select d.dname,count(e.empno) from dept d, emp e
    where d.DEPTNO = e.DEPTNO(+)
    group by d.deptno,d.dname;
--8. Para cada empleado mostrar las horas que trabajó en proyectos, si no trabajó en ninguno, indicarlo con un 0.
Select e.ENAME,sum(nvl(ep.hours,0)) from emppro ep,emp e
    where ep.EMPNO(+) = e.EMPNO
    GROUP by e.EMPNO,e.ENAME;
--9. Para cada jefe, cuántos subordinados ganan más que él, si no gana ninguno indicarlo con un cero.
Select j.ename,count(e.empno) as "cantidad de EMP" from emp e,emp j
    where j.empno = e.mgr(+) and (j.sal < e.sal or e.sal is null)
    GROUP by j.ename,j.empno;
Select j.ename,count(e.empno) as "cantidad de EMP" from emp e
    right join emp j on j.empno = e.mgr
    where j.sal < e.sal or e.sal is null
    GROUP by j.ename,j.empno;

------subconsultas---elscott---
Select e.ename from emp e,dept d 
    where e.deptno = d.deptno and d.dname = 'RESEARCH';

Select ename from emp where deptno = 10;

Select ename from emp 
    where deptno = (Select deptno from dept where dname = "Research");

Select ename,sal from emp
    where sal > (Select avg(sal) from emp);

-----Eje. subconsultas---academia---
--a) Mostrar las asignaturas impartidas por los profesores del departamento de informática y comunicaciones ordenados de mayor a menor número de horas.
Select nombre from asignatura
    where codasig in(
        select codasig from lineacontrato where codcont in(
            select codcont from contrato where DNI in(
                Select DNI from profesor where coddep in(
                    Select coddep from departamento 
                        where lower(nombre) in('informática y comunicaciones')))))
    order by numhoras desc;
--b) Mostrar Ia calificación más alta que tienen los alumnos bilingües en asignaturas no bilingües del ciclo formativo con sigla ASIR.
Select s.nombre,s.B as "B alum",c.sigla,l.nota,a.B as "B asig" 
    from alumno s,matricula m,lineamatricula l,asignatura a,ciclo c
    where s.DNI = m.DNI 
    and m.codmatr = l.codmatr 
    and l.codasig = a.codasig 
    and a.codcf = c.CODCF
    and lower(s.B) = 's' 
    and lower(a.B) = 'n'
    and lower(c.sigla) = 'asir' 
    and nota in(Select max(nota) from lineamatricula);
--c) Mostrar el nombre y apellidos de los alumnos que tienen una calificación mayor o igual que 9 ordenados por el primer apellido.
Select nombre,prapllidos,sgapllidos from ALUMNO
    where DNI in(Select DNI from matricula 
        where codmatr in(Select codmatr from lineamatricula
            where nota >= 9))
    order by prapellido,sgapellido;
--d) Mostrar el nombre y apellidos de los profesores que imparten clases de las asignaturas Gestión de Bases de Datos y Acceso de Datos.
Select nombre,prapellido,sgapellido from PROFESOR
    where DNI in(Select DNI from CONTRATO 
        where codcont in(Select codcont from LINEACONTRATO
            where codasig in(Select codasig from ASIGNATURA
                where lower(nombre) in('gestión de bases de datos','acceso de datos'))));
--e) Mostrar el nombre de ciclo que tiene Ia asignatura de máxima duración.
Select c.nombre,c.sigla,a.numhoras from ciclo c,asignatura a
    where a.numhoras in(Select max(numhoras) from asignatura);
--f) Mostrar el nombre y apellidos de los alumnos bilingües que están matriculados en asignaturas bilingües de más de 150 horas y son del ciclo con sigla DAM o DAW.
Select s.nombre,s.prapellido,s.sgapellido,s.B as "B alum",c.sigla,a.B as "B asig",a.NUMHORAS
    from alumno s,matricula m,lineamatricula l,asignatura a,ciclo c
    where s.DNI = m.DNI 
    and m.codmatr = l.codmatr 
    and l.codasig = a.codasig 
    and a.codcf = c.CODCF
    and a.NUMHORAS > 150
    and s.B in('S')
    and a.B in('S')
    and lower(c.sigla) in('daw');

Select nombre,prapellido,sgapellido,B from alumno
    where B = 'S' and DNI in(Select DNI from matricula
        where codmatr in(Select codmatr from LINEAMATRICULA
            where codasig in(Select codasig from ASIGNATURA
                where B = 'S' and numhoras > 150 and codcf in(Select codcf from ciclo 
                    where sigla = 'DAW'))));

-- g) Mostrar el nombre de las asignaturas que son bilingües y pertenecen al ciclo con sigla DAW o DAM impartidas por el jefe de los departamentos cuyo nombre empieza por I.
Select nombre from asignatura
    where codcf in(Select codcf from ciclo where sigla in('DAW','DAM'))
    and codasig in(Select codasig from LINEACONTRATO 
        where codcont in(Select codcont from contrato
            where DNI in(Select p.DNI from profesor p,departamento d,profesor jp
                            where d.coddep = p.coddep and jp.DNI = d.DNI
                            and lower(jp.NOMBRE) in('i%'))));

Select d.nombre,jp.nombre from profesor jp,departamento d--Mostrar los jefes de los departamentos cuyo nombre empieza
    where jp.DNI(+) = d.DNI;

--Ejercicios.UDC subconsultas--elscott
--1. Empleados que tienen un salario mayor al salario medio de la empresa
Select Ename,salfrom emp
    where sal > (Select avg(sal) from emp);
--2. Para cada departamento mostrar cuántos empleados tiene que ganen más del salario medio de la empresa. Muestra el nombre del departamento.
Select DNAME,count(empno) from emp e, dept d
    where sal > (Select avg(sal) from emp)
    and e.deptno(+) = d.deptno
    group by d.deptno,d.dname;
--3. Empleados que son jefe. Muestra su nombre.
Select Ename from emp
    where empno in(Select mgr from emp);
--4. Empleados que no son jefe. Muestra su nombre.
Select Ename from emp
    where empno in(Select mgr from emp);
--5. Muestra el empleado/s (nombre) con el salario más alto.
Select ename from emp
    where sal in(Select Max(sal) from emp);
--6. Muestra el departamento (nombre) con la suma de salarios más alta.

Select d.dname,sum(e.sal) from dept d,emp e
    where e.deptno = d.deptno
    group by d.deptno,d.dname
    having sum(e.sal) >= all(
        Select sum(e.sal) from emp e,dept d
            where e.deptno = d.deptno
            group by d.deptno);

Select d.dname,sum(e.sal) from dept d,emp e
    where e.deptno = d.deptno
    group by d.deptno,d.dname
    having sum(e.sal) = (
        Select max(sum(e.sal)) from emp e,dept d
            where e.deptno = d.deptno
            group by d.deptno);

Select d.dname,sum(e.sal) from dept d,emp e
    where e.deptno = d.deptno
    group by d.deptno,d.dname;

--7. Para los departamentos que tienen empleados con comisión, muestra cuántos empleados tienen comisión, y cuántos no. Muestra nombre del departamento.
Select d.dname,count(e.comm) as "Cantidad de empleados que hay",count(e.empno)-count(e.comm) as "Cantidad de empleados que no hay"
    from dept d,emp e
    where e.deptno(+) = d.deptno
    group by d.deptno,d.dname;

---------eje.all,any---------
Select empno,sum(hours) from emppro 
    group by empno
    having sum(hours) >= all(select sum(hours) from emppro group by empno);

--题目: 每个项目工作时间最长的人

Select * from emppro--显示来自emppro表的全部
    where hours in--筛选符合返回数组的hours
        (Select max(hours) from emppro group by prono);--获取某个项目最长时间的列表

--问题: 最长时间并没有和对应项目绑定
--如果项目a最高为4，b为9。返回列表为:[4,9]
--则如果项目b中有工作时长为4的人那么项目b就不会只显示9，也会显示4
--因此我们需要返回与与对应项目绑定的时间列表

Select * from emppro--显示来自emppro表的全部
    where (prono,hours) in--筛选符合返回数组的hours
        (Select prono,max(hours) from emppro group by prono);--获取某个项目最长时间的列表,且与项目绑定

--更好的解:
Select * from emppro t 
    where hours in
        (Select max(hours) from emppro where t.prono = prono);
Select * from emppro t 
    where EXISTS
        (Select max(hours) from emppro where t.prono = prono);
--根据deepseek的解释上式等于:
Select * from emppro--显示来自emppro表的全部
    where (prono,hours) in (t.prno,t.hours);--获取某个项目最长时间的列表,且与项目绑定

-----eje.UDC--correladas--elscott---
--1
Select ename,sal,deptno from emp
    where empno in(Select empno from emp t
        where sal in(Select max(sal) from EMP
            where deptno = t.deptno));
--2
Select empno from emppro t
    where hours in(Select max(hours) from emppro 
        where prono = t.prono)
    order by t.PRONO;

--3
Select ename from emp
    where empno in(Select empno from emppro t
        where hours in(Select max(hours) from emppro 
            where prono = t.prono)
    );
--4
Select p.pname,e.ename from emp e,emppro ep,pro p
    where e.empno = ep.empno
    and p.prono = ep.prono
    and e.empno in(Select empno from emppro t
        where hours in(Select max(hours) from emppro 
            where prono = t.prono)
        and prono = p.prono);
--5
Select d.dname, count(e.empno) from dept d,emp e
    where e.sal > (Select avg(sal) from emp where deptno = d.deptno group by deptno)
    and e.deptno = d.deptno
    group by d.deptno,d.dname;
--6
Select d.dname, count(e.empno) from dept d,emp e
    where e.sal > (Select j.sal from emp t,emp j where t.empno = e.empno and e.MGR = j.empno)
    and e.deptno(+) = d.deptno
    group by d.deptno,d.dname;

--los departamento que no hay empleados---elscott
--join
Select * from dept d, emp e
    where e.deptno(+) = d.deptno
    and e.deptno is null;
--Subconsulta(in)
Select * from dept
    where deptno not in(Select deptno from emp 
        where detpno is not null);
--Exists
Select dname from dept t
    where not exists(select * from emp where deptno = t.deptno);
--Operadores de conjuntos
Select dname from dept where deptno in(
    Select deptno from DEPT
    minus
    Select deptno from EMP);

Select nombre from pelicula
    where codigo not in(Select pelicula from salas where pelicula is not null);

--eje. consulta --- tienda informatica

Select nombrecomercial,prventa from PRODUCTO
    where prventa in(Select min(prventa) from producto);

Select * from prducto where rownum = 1;--new

Select * from (Select * from producto order by prventa)
    where rownum = 1;

Select * from (
    Select nombrecomercial,prventa,rownum as fila from (
        Select * from producto order by prventa 
    ))
    Where fila BETWEEN 2 and 4;

Select codproducto,NOMBRECOMERCIAL,prventa from producto order by prventa
    offset 2 rows    
    fetch first 3 rows only;



