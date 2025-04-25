--1
Select First_name,Last_name,salary from (Select * from employees
        where EMPLOYEE_ID in(Select manager_ID from departments)
        order by salary*(nvl(commission_pct,0)+1))
    where rownum <= 1;

--2
Select d.department_name from departments d,employees e
    where e.department_id = d.department_id
    group by d.department_id,d.department_name
    having avg(e.salary) >= 8000;

--3
Select e.First_name nomes
    from employees e
    join job_history jh on jh.employee_id = e.employee_id
    group by e.employee_id,e.First_name
    having count(*) > 1;
--4
Select First_name from employees
    where upper(first_name) like 'A%'
    and employee_id not in(Select employee_id from job_history where employee_id is not null);
--5
Select e.First_name,c.country_name from employees e
    join departments d on e.department_id = d.department_id
    join locations l on l.location_id = d.location_id
    join countries c on c.country_id = l.country_id
    where c.country_id in(Select c.country_id from employees e
            join departments d on e.department_id = d.department_id
            join locations l on l.location_id = d.location_id
            join countries c on c.country_id = l.country_id
            group by c.country_id
            having sum(e.salary*(nvl(e.commission_pct,0)+1)) > 10000);
--6
Select First_name,min(salary) from employees;
--7
Select * from employees
    where first_name in(Select first_name from employees 
        where department_id = 10)
    and job_id not in (Select job_id from employees 
        where department_id = 20 and job_id is not null);
--8
Select department_name from departments
    where department_id in(Select e.department_id from employees e, jobs j
        where j.job_id = e.job_id
        and upper(j.job_title) = 'SHIPPING CLERK');
--9
Select d.department_name,round(avg(e.salary),0) as MedSal,max(e.salary) as MaxSal,min(e.salary) as MinSal,count(e.commission_pct) as "NumComision" 
    from departments d,employees e
    where d.department_id = e.department_id(+)
    group by d.department_id,d.department_name;
--10
Select t.first_name,count(*) from employees t
    join employees te on te.manager_id = t.employee_id
    --quien de us
    where t.employee_id in(Select cj.employee_id from employees cj
        join departments d on cj.department_id = d.department_id
        join locations l on l.location_id = d.location_id
        join countries c on c.country_id = l.country_id        
        where c.country_id = 'US')        
    --quien tiene mas empregados
    group by t.employee_id,t.first_name
    having count(*) >= all(Select count(*) from employees j
        join employees e on e.manager_id = j.employee_id
        group by j.employee_id);


