create table Department 
(
	DepartmentId smallint identity(1,1)
	,DepartmentName nvarchar(50)
)

select * from Department
select * from Employee
select * from ReportTo

--to set the deafult value of null to unknown  
update Employee set DepartmentId = 4

--delete from employee where id = null
delete from Employee where EmployeeId = 14

--To add primary key to Department Table
alter table Department add constraint pk_Department_DepartmentId primary key (DepartmentId)

--add fk to employee table
alter table Employee add constraint FK_Employee_DepartmentId foreign key(DepartmentId)
references Department(DepartmentId)
on delete cascade
on update cascade


--alter Employee table col DepartmentId to allow not null
alter table Employee alter column DepartmentId  smallint not null

