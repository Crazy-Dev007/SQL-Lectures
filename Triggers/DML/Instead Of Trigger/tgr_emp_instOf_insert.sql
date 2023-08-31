CREATE TRIGGER tgr_emp_instOf_insert
ON Employee
INSTEAD OF INSERT
AS
BEGIN
    -- Modify the inserted data
    INSERT INTO Employee ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Phone]
           ,[HireDate]
           ,[ManagerId]
           ,[Salary]
           ,[DepartmentId]
           ,[ReportsTo])
    SELECT UPPER(FirstName),[LastName]
           ,[Email]
           ,[Phone]
           ,[HireDate]
           ,[ManagerId]
           ,[Salary]
           ,[DepartmentId]
           ,[ReportsTo]
    FROM Inserted;

	PRINT 'Instead of Insert Trigger Executed '
END;