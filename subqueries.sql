use practice1and2;
select*from emp;

#1
select ename, hiredate from emp
where deptno=(select deptno from emp 
    where ename="SMITH")and ename !="SMITH";
    
#2
select empno, ename from emp
where sal>(select avg(sal) from emp)
order by sal;

#3
select empno, ename from emp
where deptno= any(select deptno from emp
    where ename like('%u%'));
#4
SELECT ename, sal FROM emp
    WHERE mgr = (SELECT  empno
		FROM emp
		WHERE ename ='BLAKE');
#5
select deptno, ename,job from emp
where deptno=(select distinct deptno from emp
     where job="salesman");
     
#1
use practice1and2;
select ENAME,HIREDATE from emp 
where DEPTNO =(select DEPTNO from emp where ENAME="SMITHH") and ENAME!="SMITHH";

#6
use practice1and2;
select ename,SAL from emp
where SAL>(select avg(SAL) from emp) 
and DEPTNO = ANY(select DEPTNO from emp where ename like"%A%");