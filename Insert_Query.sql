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
           ,[DepartmentId])
     VALUES
           ('Akash'
           ,'blaze'
           ,'AkashBlaze090@gmail.com'
           ,'32149788794'
           ,'2005-07-1'
           ,1
           ,3100
           ,null)
GO


