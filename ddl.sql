create database abb ;
use abb;
create table TRG_DEPT(
	id int(7),
    name varchar(25)
);
desc TRG_DEPT;

use departments;
desc department;
insert into department (code , name , budget) values (23, 'customer', 50000);
select * from department;

use abb;
create table TRG_EMP(
	id int(7),
    last_name varchar(25),
    first_name varchar(25),
    dept_id int(7)
);desc TRG_EMP;

use abb;
alter table TRG_EMP modify last_name varchar(40);

use abb;
create table TRG_EMPOLYEES(
	id int(7),
    last_name varchar(25),
    first_name varchar(25),
    dept_id int(7),
    salary double
);desc TRG_EMPOLYEES;

use abb;
create table dummy(
	id int(7),
    name varchar(25)
);
drop table dummy;
desc dummy;

use abb;
alter table TRG_EMPOLYEES rename TRG_EMP2;

use abb;
alter table TRG_EMP2 drop column first_name;
desc TRG_EMP2;

