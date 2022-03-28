
use joints1;
create table employees(
emp_id int primary key,                  
first_name varchar(20) not null,
last_name varchar (20) not null,
mgr varchar(50) not null,
mgr_no int,
sal int ,
job_id varchar(25) ,
dept_id int,
hire_date date not null);
insert into employees values
(1,'john','rajs',' ',null,4500,'mk_m',90,'2022-02-09'),
(2,'david','davies',' ',null,5000,'mk_l',50,'2020-02-08'),
(3,'miller','matos','king',100,8500,'mk_o',50,'2019-02-20'),
(4,'blake','Ernst','kochaar',200,8000,'mk_m',60,'2019-06-19'),
(5, 'james','Lorence','mughos',300,6000,'mk_i',60,'2022-01-13'),
(6,'smith','Mourgos','higgins',400,6150,'mk_r',60,'2020-05-17');
CREATE TABLE DEPT(
DEPT_id INT NOT NULL unique,
Dept_NAME VARCHAR(14) NOT NULL,
LOC_id int NOT NULL);
INSERT INTO DEPT VALUES(90,'ACCOUNTING',1500),
(50,'RESEARCH',2000),
(60,'SALES','1200'),
(30,'OPERATIONS',1500);

create table location(
loc_id int not null unique,
city varchar(50) not null,
country_id varchar(50) not null); 
insert into location values
(1500,'adoni','44'),
(1200,'allende','60'),
(2000,'arak','46'),
(1600,'baybay','75');

create table countries(
country_id varchar(50) not null unique,
country_name varchar(50) not null);
insert into countries values
('1', 'Afghanistan'),
('29', 'Egypt'),
('44', 'India'),
('46', 'Iran'),
('60', 'Mexico'),
('75', 'Philippines');

create table job_history(
job_id varchar(50) not null unique,
job_type varchar(50) not null,
job_grade varchar(5) not null);
insert into job_history values
('mk_m','marketing','A'),
('mk_l','administration','B'),
('mk_o','shipping','C'),
('mk_i','IT','A'),
('mk_r','executive','B');

alter table employees add constraint fk_did foreign key (dept_id) references dept(dept_id);  
alter table employees add constraint fk_jid foreign key (job_id) references job_history(job_id);  
alter table location add constraint fk_cid foreign key (country_id) references countries(country_id);  
alter table dept add constraint fk_lid foreign key (loc_id) references location(loc_id);  
-- 1. Write a query to display the last name, department number, and department name for all employees.
select *from employees;
select *from job_history;
select e.last_name,d.dept_id,d.dept_name from employees as e,dept as d 
where e.dept_id=d.dept_id;
select *from location;
select *from dept;
-- 2. Create a unique listing of all jobs that are in department 50. Include the location of the Department in the output.
select e.job_id,d.loc_id,j.job_type,l.city,d.dept_id 
from employees as e
,dept as d
,job_history as j
,location as l
 where d.dept_id=50 
 and j.job_id=e.job_id
 and e.dept_id=d.dept_id
 and l.loc_id=d.loc_id;
-- 3. Write a query to display the employee last name, department name, location ID, and city of all employees.
select e.last_name,d.dept_name,l.loc_id,l.city
from employees as e,dept as d,location as l
where d.dept_id=e.dept_id
and d.loc_id=l.loc_id;

-- 4.. Display the employee last name and department name for all employees
--     who have an ‘a’ (lowercase) in their last names.

select e.last_name,d.dept_name
from employees as e,dept as d
where e.dept_id=d.dept_id and e.last_name like '%a%';

-- 5.Write a query to display the last name, job, department number, and 
-- department name for all employees who work in adoni.

select e.last_name,j.job_type,d.dept_id,d.dept_name,l.city
from employees as e,job_history as j,dept as d,location as l
where e.job_id=j.job_id
and d.dept_id=e.dept_id
and l.loc_id=d.loc_id
and l.city='adoni';

--  6.Display the employee last name and employee number 
--   along with their manager’s name and manager number. 
-- Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
select last_name as 'employee' ,emp_id as 'emp#',mgr as 'manager',mgr_no as 'mgr#' from employees;

-- 7.Modify lab4_6.sql to display all employees including 
-- King, who has no manager. Order the results by the employee number.
select last_name as 'employee' ,emp_id as 'emp#',mgr as 'manager',mgr_no as 'mgr#' from employees
order by emp_id;

-- 8.Create a query that displays employee last names, department numbers,
-- and all the employees who work in the same department as a given employee. 
-- Give each column an appropriate label.

select e.dept_id department, e.last_name employee,
	c.last_name colleague
	from employees e join employees c
	on(e.dept_id = c.dept_id)
	where e.emp_id <> c.emp_id
	order by e.dept_id, e.last_name, c.last_name;

-- 9 Show the structure of the JOB_GRADES table. Create a query that displays the name, job,department name, 
--   salary, and grade for all employees.
select e.first_name,e.last_name,e.sal,j.job_type,j.job_grade,d.dept_name
from employees as e,job_history as j,dept as d
where e.job_id=j.job_id and d.dept_id=e.dept_id;




-- 10.Create a query to display the name and hire date of any 
-- employee hired after employee Davies.
SELECT e.last_name, e.hire_date
	FROM employees e JOIN employees s
	ON (s.last_name = 'Davies')
	WHERE s.hire_date < e.hire_date;