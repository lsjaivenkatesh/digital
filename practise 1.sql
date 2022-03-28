use practice1and2;
SELECT ename, job, sal AS Sal FROM emp;

use basic_select;
desc practice_details;
select * from practice_details;

SELECT empno, ename,(
Sal * 12) 'ANNUAL SALARIES'
FROM emp;

use basic_select;
desc practice_details;
select * from practice_details;

use practice1and2;
desc emp;
select ENAME,EMPNO, JOB, MGR, HIREDATE as STARTDATE,SAL, COMM, DEPTNO from emp;

use practice1and2;
select distinct JOB from emp;

use practice1and2;
select EMPNO as 'EMP #', ENAME as Employee,JOB as 'Job Title',HIREDATE as 'Hire Date'from emp;