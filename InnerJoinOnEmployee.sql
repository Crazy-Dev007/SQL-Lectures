USE [HR]
GO

SELECT [EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[HireDate]
      ,[ManagerName]
      ,[Salary]
      ,[DepartmentName]
  FROM [dbo].[Employee]
  inner join Department on Employee.DepartmentId  = Department.DepartmentId
  inner join ReportTo on Employee.ManagerId = ReportTo.ManagerId
GO

--it gives view both table data based on there id are matching ..
