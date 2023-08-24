CREATE TABLE Employee(
			EmployeeId INT IDENTITY(1,1) NOT NULL,
			FirstName NVARCHAR(20) NOT NULL,
			LastName NVARCHAR(20) NOT NULL,
			Email NVARCHAR(50),
			Phone NVARCHAR(12),
			HireDate DATE NOT NULL,
			ManagerId INT NOT NULL
			, Salary FLOAT,
			DepartmentId SMALLINT NULL

CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY (EmployeeId)

)


ALTER TABLE Employee ADD CONSTRAINT PK_Employee_EmployeeId PRIMARY KEY (EmployeeId)

ALTER TABLE Employee DROP CONSTRAINT PK_Employee_EmployeeId --PRIMARY KEY (EmployeeId)