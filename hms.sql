create database hms_;

use hms_;

create table doctor_master (
doctor_id varchar(15) unique not null primary key ,
doctor_name varchar(15) not null ,
dept varchar(15) not null);

desc doctor_master;

insert into doctor_master (doctor_id,doctor_name,dept) values
('D0001','Ram','ENT'),
('D0002','Rajan','ENT'),
('D0003','smita','Eye'),
('D0004','Bhavan','Surgery'),
('D0005','Sheela','Surgery'),
('D0006','Nethra','Surgery');

select*from doctor_master;

create table room_master (
room_no varchar(15) unique not null primary key ,
room_type varchar(15)not null ,
status varchar(15) not null );

desc room_master;

insert into room_master (room_no,room_type,status) values
('R0001','AC','occupied') ,
('R0002','Suite','vacant') ,
('R0003','Non AC','vacant') ,
('R0004','Non AC','occupied') ,
('R0005','AC','vacant') ,
('R0006','AC','occupied') ;

select*from room_master;

create table patient_master (
pid varchar(15) unique not null primary key ,
pname varchar(15) not null ,
age int(15) not null ,
Weight int(15) not null ,
Gender varchar(10) not null ,
Address varchar(50) not null ,
phoneno varchar(10) not null ,
Disease varchar(50) not null ,
Doctor_id varchar(5) ,
foreign key (Doctor_id) references doctor_master(doctor_id));

desc patient_master;

insert into patient_master (pid,pname,age,Weight,Gender,Address,phoneno,Disease,Doctor_id) values
('P0001','Gita',35,65,'F','Chennai','9867145678','Eye Infection','D0003'),
('P0002','Ashish',40,70,'M','Delhi','9845675678','Asthma','D0003'),
('P0003','Radha',25,60,'F','Chennai','9867166678','Pain in heart','D0005'),
('P0004','Chandra',28,55,'F','Bangalore','9978675567','Asthma','D0001'),
('P0005','Goyal',42,65,'M','Delhi','8967533223','Pain in Stomach','D0004') ;

select*from patient_master;

create table ROOM_ALLOCATION(
room_no Varchar(15), 
pid Varchar(15), 
admission_date date not null,
release_date date,
foreign key (room_no) references room_master(room_no),
foreign key (pid) references patient_master(pid));

desc room_allocation;

insert into room_allocation(room_no,pid,admission_date,Release_date) values
('R0001','P0001','15-10-16','26-10-16') ,
('R0002','P0002','15-11-16','26-11-16') ,
('R0002','P0003','01-12-16','30-12-16') ,
('R0004','P0001','01-01-17','30-01-17') ;

select*from room_allocation;

#1
select rm.pid, p.pname from patient_master as p, room_allocation as rm 
where rm.pid = p.pid and month(admission_date)='01';

#2
select pname,Gender from patient_master where Disease != 'Asthma' and Gender = 'F';

#3
select count(*),Gender from patient_master group by Gender;

#
select p.pid,p.pname,d.doctor_id,d.doctor_name,r.room_no,r.room_type,rm.admission_date 
from doctor_master as d, room_master as r, patient_master as p, room_allocation as rm
where p.pid=rm.pid and p.doctor_id=d.doctor_id and r.room_no=rm.room_no group by pid;

#5
select room_no from room_master where status='vacant' 
and room_no not in( select room_no from room_allocation) ;

#6
select room_no ,room_type from room_master
where room_no in (select room_no from room_allocation group by room_no having count(room_no)>1);