USE [HR]
GO

INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Phone]
           ,[HireDate]
           ,[ManagerId]
           ,[Salary]
           ,[DepartmentId]
           ,[ReportsTo])
     VALUES
           ('Riki'
           ,'Chada'
           ,'riki@rediffmail.com'
           ,123432434
           ,GETDATE()
           ,1
           ,3500
           ,2
           ,23)
GO


