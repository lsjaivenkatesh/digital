

#4
use  company;
select max(salary) as Highest,
       min(Salary) as Lowest,
       sum(Salary) as sum,
       Round(avg(Salary),0) as average
from employee;

#5
select max(salary) as Highest,
       min(Salary) as Lowest,
       sum(Salary) as sum,
       Round(avg(Salary),0) as average
from employee
group by Job_title;

#6
select Job_title,count(*)
from employee
group by Job_title;

#7
select count(MGR) as 'Number of Manager'
from emp;

#8
select max(Sal)-min(sal) as 'Difference'
from emp;

#9
select MGR , min(Sal)
from emp
where (Sal > 1000) and MGR is not null
group by MGR
order by Sal desc;

#10
select count(*) as Total,
(select count(*) from emp where year(HireDate)='1983') as '1983',
(select count(*) from emp where year(HireDate)='1982') as '1982',
(select count(*) from emp where year(HireDate)='1980') as '1980'
from emp;

#11
select distinct Job,
    sum(case DeptNo when 10 then Sal end) as 'Dept 10',
    sum(case DeptNo when 20 then Sal end) as 'Dept 20',
    sum(case DeptNo when 30 then Sal end) as 'Dept 30',
    sum(Sal) as 'Total'
    from emp
    group by job
    order by total desc;