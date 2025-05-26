

create database sajida_baloch;

use sajida_baloch

create table employeeee(

E_id int primary key identity(1,1),
Full_name varchar(20),
department varchar(20),
position varchar(20),
salary int 
);

create table empolyeAuditlog(
AuditID int primary key identity(1,1),
E_id int,
ActionTaken varchar(50),
Actiondate datetime
);

select * from employeeee
select * from empolyeAuditlog

Insert into employeeee values('seema','it','manger',5000);

create trigger maintion_log_of_update_emp1
on employeeee
after update
as
begin
insert into empolyeAuditlog(E_id,ActionTaken,Actiondate)
select E_id,'update',getdate()
from inserted

end;





update employeeee set salary=7000 where E_id=1

delete from employeeee  where E_id=1

create trigger maintion_log_of_update_emp1
on employeeee
after update
as
begin
insert into empolyeAuditlog(E_id,ActionTaken,Actiondate)
select E_id,'update',getdate()
from inserted

end;

create trigger maintion_log_of_delete_emp1
on employeeee
after delete
as
begin
insert into empolyeAuditlog(E_id,ActionTaken,Actiondate)
select E_id,'deleted',getdate()
from deleted

end;



create table products(

P_id int primary key identity(1,1),
P_name varchar(20),
Category varchar(20),
price int,
stock varchar(20)
);

create table productsActvitylog(

Log_id int primary key identity(1,1),
P_id int,
ActionTaken varchar(50),
Actiondate datetime
);

select * from products
select * from productsActvitylog


---------------insert--------
Insert into products values('vivo','smartphone', 3000,'NO');
create trigger maintion_log_of_insert_pro5
on products
instead of insert
as
begin
insert into productsActvitylog(P_id,ActionTaken,Actiondate)
select P_id,'inserted',getdate()
from inserted;
end;

-------------------update------
create trigger maintion_log_of_update_pro3
on products
instead of update
as
begin
insert into productsActvitylog(P_id,ActionTaken,Actiondate)
select P_id,'update',getdate()
from inserted;
end;
update products set price=7000 where P_id=1

------------------delete---------
create trigger maintion_log_of_delete_pro2
on products
instead of delete
as
begin
insert into productsActvitylog(P_id,ActionTaken,Actiondate)
select P_id,'deleted',getdate()
from deleted;
end;
delete from products  where P_id=1



