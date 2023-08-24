create table ReportTo
(
	ManagerId int identity(1,1) not null
	,ManagerName nvarchar(50)
)
--add primary key
alter table ReportTo add constraint PK_ReportTo_ManagerId primary key(ManagerId)

--add FK to Employee table 
alter table Employee add constraint FK_Employee_ManagerId foreign key(ManagerId)
references ReportTo(ManagerId)
on delete cascade
on update cascade
