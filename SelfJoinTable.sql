create table Employees(
	employeeId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	employeeName [NVARCHAR](50) NOT NULL,
	managerId INT NULL,
)

select * from Employees
alter table Employees alter column managerId int null;
update Employees set employeeName = 'Pinak' where employeeId = 3;

select e1.employeeName as 'EmployeeName', e2.employeeName as 'Manager'from Employees as e1
left join Employees e2 on e1.managerId = e2.employeeId;