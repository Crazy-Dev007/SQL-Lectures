--create database HR
use HR
create table Employee (
						EmployeeId int Identity(1,1) NOT NULL,
						FirstName Nvarchar(20) NOT NULL,
						LastName Nvarchar(20) NOT NULL,
						Email Nvarchar(50) NOT NULL,
						Phone Nvarchar(10) NOT NULL,
						HireDate DATE NOT NULL,
						ManagerId int NOT NULL,
						Salary Float,
						DepartmentId Smallint NOT NULL
						CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY (EmployeeId)
)
--ALTER TABLE Employee ADD CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY (EmployeeId)
--ALTER TABLE Employee DROP CONSTRAINT PK_Employee_EmployeeId --PRIMARY KEY (EmployeeId)

