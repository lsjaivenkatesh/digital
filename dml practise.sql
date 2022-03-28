create database my_employees1;
use my_employees1;
create table emp1(
id int not null,
last_name varchar(25),
first_name varchar(25),
user_id varchar(8),
sal int
);


desc emp1;



insert into emp1 values(1,'Patel','Ralph','rpatel',895);

insert into emp1 values(2,'Dancs','Betty','bdancs',860);

select * from emp1;

insert into emp1 values(3,'Shellby','Thomas','tshellby',880);

update emp1 set last_name="Drexler" where id = 3;

update emp1 set sal = 1000 where sal<900;

delete from emp1 where first_name ="Betty";

delete from emp1;