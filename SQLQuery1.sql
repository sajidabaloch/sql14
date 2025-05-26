


use sajida_baloch;

create table student(
id int primary key identity,
names varchar(20),
department varchar(20),
salary int,
joining_date date

); 

select * from student

insert into student values('saweera','it',5000,'2022-04-12'),
('seema','it',5000,'2022-04-12'),
('saim','it',5000,'2022-04-12'),
('asim','it',5000,'2022-04-12');

if  exists (select 1 from student where id=)
print 'student exist';
else 
print 'not exist'; 


declare @id int=5;
if @id >=3
print 'student exist';
else 
print 'not exist'; 



if  exists (select * from student where salary=5000)
select * from student where id=1
else 
print 'not exist'; 