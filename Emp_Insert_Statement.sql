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
           ('Shrikant'
           ,'Yerawar' 
           ,'Shri888@gmail.com'
           ,'123456789'
           ,'2005-7-1'
           , 1
           ,21
           , 4)
,
			 ('Shreyas'
           ,'Shriramwar' 
           ,'Shreyas44@gmail.com'
           ,'123456788'
           ,'2007-8-2'
           , 2
           ,22
           , 5)
,
			 ('Pinak'
           ,'Warankar' 
           ,'Pinak666@gmail.com'
           ,'123455789'
           ,'2009-8-4'
           , 3
           ,25
           , 3)
,
			 ('James'
           ,'Matt' 
           ,'jimmy444@gmail.com'
           ,'113356789'
           ,'2012-11-8'
           , 6
           ,35
           , 10)
,
			 ('Jhon'
           ,'Rick' 
           ,'john888@gmail.com'
           ,'113456789'
           ,'2004-4-4'
           ,13
           ,10
           ,2)
,
			 ('Matt'
           ,'Henry' 
           ,'Matt888@gmail.com'
           ,'122446789'
           ,'2003-5-25'
           ,9
           ,22
           ,11)
,
			 ('Sam'
           ,'Curran' 
           ,'Sam888@gmail.com'
           ,'121256789'
           ,'2002-4-18'
           ,2
           ,38
           ,19)
,
			('Daniel'
           ,'Sam' 
           ,'Daniel888@gmail.com'
           ,'123556789'
           ,'2014-8-22'
           , 24
           ,39
           ,7)
,
			('Trent'
           ,'Boult' 
           ,'trent888@gmail.com'
           ,'145856789'
           ,'2015-7-11'
           ,22
           ,14
           ,6)
        
GO



