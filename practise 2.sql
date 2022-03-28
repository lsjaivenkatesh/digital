use practice1and2;
select ENAME,SAL from emp where SAL > 2000;

use practice1and2;
select ENAME,DEPTNO from emp where EMPNO = 7902;

use practice1and2;
select ENAME,SAL from emp where SAL < 2000;

use practice1and2;
select ENAME,JOB,HIREDATE from emp
where HIREDATE between '1981-02-20' and '1981-05-1' order by HIREDATE ASC ;

use practice1and2;
select ENAME,DEPTNO from emp where DEPTNO=10 or DEPTNO=30 order by ENAME ASC;

use practice1and2;
select ENAME 'Employee',SAL 'Monthly Salary' from emp 
where (SAL between 2000 and 3000) and DEPTNO in (10,30);

use practice1and2;
select ENAME, HIREDATE from emp where year(HIREDATE) = 1981;

use practice1and2;
select ENAME, JOB from emp where MGR is null;

use practice1and2;
select *from emp;
select ENAME, SAL,COMM from emp where COMM is not null order by SAL DESC;

use practice1and2;
select ENAME from emp where ENAME like "__A%";

use practice1and2;
select ENAME from emp 
where ENAME like '%A%' 
and ENAME like'%E%';

use practice1and2;
select ENAME,JOB,SAL from emp where JOB in ('SALESMAN','CLERK') and SAL not in (1600,8000,1300);