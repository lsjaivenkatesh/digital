select*from trg_dept22;
alter table trg_emp1
add constraint my_id primary key (id);

alter table trg_dept22
add constraint my2_id primary key (id);

alter table trg_emp1 
add(dep1t_id int(7));
alter table trg_emp1
add constraint my1_id 
foreign key (dep1t_id) references trg_dept22(id);


select column_name, constraint_name, referenced_column_name, referenced_table_name from
information_schema.KEY_COLUMN_USAGE where TABLE_NAME='TRG_EMP';

select schema_name from information_schema.schema;
select table_name, table_type from information_schema.tables
where table_schema='digital_batch'

alter table TRG_EMP1
ADD commission dec (2,2),
add constraint my_emp_comm_ck CHECK (commission>0);
alter table trg_emp1
drop column commission;