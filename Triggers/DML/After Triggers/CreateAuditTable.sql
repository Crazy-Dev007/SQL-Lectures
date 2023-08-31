create table EmployeeAudit(
	id int identity(1,1) not null primary key,
	actionName nvarchar(50),
	insertId datetime
)

-- drop column 
-- alter table EmployeeAudit drop column insertId ;

select * from EmployeeAudit
select * from Employee

-- af update
update Employee set FirstName = 'Rutuja' where EmployeeId = 38


-- af delete
delete from Employee where EmployeeId = 37;




