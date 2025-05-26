

use sajida_baloch;
alter view view_for_empolye
as
select E_id as ID, Full_name as NAMES  from employeeee

select * from view_for_empolye
-----------------


create view view_for_manger
as
select department , position,salary  from employeeee
select * from view_for_manger


alter view view_for_manger
as
select department as DEP, position as POSITION, salary as SALARY  from 
employeeee


CREATE table Employeis(
id int primary key,
names varchar(20),
email varchar(20),
salary int
);

CREATE table Log_Employeis(
log_id int primary key identity(1,1),
id int,
actiontaken varchar(20),
actiondate date
);

create trigger tri_add_data
on Employeis
after insert
as
begin
Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'inserted',getdate()
from inserted
end;
Insert into Employeis values(1,'sajida','sajida@gmail.com',5000);
select * from Employeis
select * from Log_Employeis

update Employeis set salary=10000 where id=1;
create trigger tri_update_data
on Employeis
after update
as
begin
Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'update',getdate()
from inserted
end;


delete Employeis  where id=1;
create trigger tri_deleted_data
on Employeis
after delete
as
begin
Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'delete',getdate()
from deleted
end;



create trigger tri_add_data1
on Employeis
Instead of insert
as
begin
Insert into Employeis(id,names,email,salary)
select id,names,email,salary from inserted;

Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'inserted',getdate()
from inserted
end;
Insert into Employeis values(3,'anaya','sawera@gmail.com',6000),(4,'seemaa',
'seemaa@gmail.com',7000);
select * from Employeis
select * from Log_Employeis
update Employeis set email='sawe@gmail.com' where id=2;
create trigger tri_update_data1
on Employeis
Instead of update
as
begin
update Employeis
set
names = inserted.names,
email = inserted.email,
salary = inserted.salary
from Employeis
inner join inserted
on
Employeis.id=inserted.id;

select id,names,email,salary from Employeis;

Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'update',getdate() from inserted;

end;

create trigger tri_delete_data1
on Employeis
Instead of delete
as
begin
delete Employeis
from Employeis


inner join deleted on Employeis.id=deleted.id;



Insert into Log_Employeis(id,actiontaken,actiondate)
select id,'deleted',getdate() from deleted;

end;

delete Employeis where id=1;