USE [master]
GO
/****** Object:  Database [HR]    Script Date: 25-08-2023 09:54:22 ******/
CREATE DATABASE [HR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HR] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HR] SET  MULTI_USER 
GO
ALTER DATABASE [HR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HR] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HR] SET QUERY_STORE = ON
GO
ALTER DATABASE [HR] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HR]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetReportsToName]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetReportsToName]
(
  @ReportsTo INT 
)
RETURNS NVARCHAR(40)
AS
BEGIN
     DECLARE @ReportsToName NVARCHAR(40) 
	 SELECT @ReportsToName = FirstName +' '+ LastName FROM Employee WHERE ReportsTo = @ReportsTo
	 RETURN @ReportsToName
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetUknownDepartmentList]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetUknownDepartmentList]()

RETURNS @DepartmentTable TABLE 
(
  DepartmentId INT
)
AS 
BEGIN
     DECLARE @UNKOWN_DEPARTMENT_TYPE INT = 4
     INSERT INTO @DepartmentTable
	 SELECT DepartmentId FROM Department

	 DELETE FROM @DepartmentTable WHERE DepartmentId <> @UNKOWN_DEPARTMENT_TYPE

	 RETURN

END
      
GO
/****** Object:  Table [dbo].[Department]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [smallint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Department_DeparmentId] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDepartmentList]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetDepartmentList]
(
  @CreatedDate DateTime
)
RETURNS TABLE 
AS 
RETURN
      SELECT * FROM [dbo].[Department] WHERE CreatedDate >= @CreatedDate
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](12) NULL,
	[HireDate] [date] NOT NULL,
	[ManagerId] [int] NOT NULL,
	[Salary] [float] NULL,
	[DepartmentId] [smallint] NOT NULL,
	[ReportsTo] [int] NULL,
 CONSTRAINT [PK_Employee_EmployeeId] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportsTo]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportsTo](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CreatedDate]) VALUES (2, N'IT', CAST(N'2023-08-01T09:20:46.083' AS DateTime))
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CreatedDate]) VALUES (3, N'Account', CAST(N'2023-08-02T09:20:46.083' AS DateTime))
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [CreatedDate]) VALUES (4, N'AKNOWN', CAST(N'2023-08-22T09:20:46.083' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (15, N'Rick', N'Newby', N'rick.newby@gmail.com', N'4545454545', CAST(N'2022-02-02' AS Date), 1, 2009, 4, 35)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (18, N'Rick', N'Newby', N'rick.newby@gmail.com', N'NULL', CAST(N'2022-02-02' AS Date), 1, 2009, 4, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (20, N'Rick', N'Newby', N'rick.newby@gmail.com', N'5454545555', CAST(N'2022-02-02' AS Date), 1, 2009, 4, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (24, N'Rich', N'Newby', N'rich.newby@gmail.com', N'4545454540', CAST(N'2022-02-02' AS Date), 1, 3000, 4, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (26, N'Rich', N'Newby', N'rich.newby@gmail.com', N'4545454541', CAST(N'2022-02-02' AS Date), 1, 3000, 4, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (32, N'brandon', N'Newby', N'brandon.newby@gmail.com', N'4545454505', CAST(N'2022-02-02' AS Date), 1, 3000, 2, 35)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (33, N'shubham', N'gill', N'shubham.gill@gmail.com', N'4545454506', CAST(N'2022-02-02' AS Date), 1, 3000, 3, 20)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (35, N'virat', N'kohli', N'virat.kohli@gmail.com', N'4545454507', CAST(N'2022-02-02' AS Date), 1, 3000, 3, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (37, N'Krushna', N'Kumbhare', N'krushna.kumbhare@gmail.com', N'3434343434', CAST(N'2023-08-25' AS Date), 1, 3000, 2, 35)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (38, N'Pooja', N'Chavan', N'pooja.chavan@gmail.com', N'9898989898', CAST(N'2023-08-25' AS Date), 1, 3000, 2, 35)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (39, N'Shreyar', N'S', N'shreyas.s@gmail.com', N'3434554555', CAST(N'2023-08-25' AS Date), 1, 3000, 2, 22)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (40, N'Shrikant', N'Y', N'shrikant.y@gmail.com', N'3434554550', CAST(N'2023-08-25' AS Date), 1, 3000, 2, 22)
GO
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [Email], [Phone], [HireDate], [ManagerId], [Salary], [DepartmentId], [ReportsTo]) VALUES (41, N'Rupesh', N'S', N'rupesh.S@gmail.com', N'3434554551', CAST(N'2023-08-25' AS Date), 1, 3000, 2, 22)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportsTo] ON 
GO
INSERT [dbo].[ReportsTo] ([ManagerId], [ManagerName]) VALUES (1, N'Rich')
GO
SET IDENTITY_INSERT [dbo].[ReportsTo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_Employee_Phone]    Script Date: 25-08-2023 09:54:22 ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UN_Employee_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_DepartmentId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[ReportsTo] ([ManagerId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_ManagerId]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CH_Employee_Salary] CHECK  (([Salary]>(2000) AND [Salary]<(4000)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CH_Employee_Salary]
GO
/****** Object:  StoredProcedure [dbo].[sp_Employee_Insert]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 
        DECLARE @Gate DATE = GETDATE()
        EXEC [dbo].[sp_Employee_Insert] 'Pooja','Chavan','pooja.chavan@gmail.com','9898989898',@Gate,1,3000,2,35 
******/
CREATE PROCEDURE [dbo].[sp_Employee_Insert]
(
   @FirstName    NVARCHAR(20)
  ,@LastName     NVARCHAR(20)
  ,@Email        NVARCHAR(50)
  ,@Phone        NVARCHAR(12)
  ,@HireDate     DATE
  ,@ManagerId    INT
  ,@Salary       FLOAT 
  ,@DepartmentId SMALLINT
  ,@ReportsTo    INT NULL
  ,@EmployeeId INT OUTPUT
)
AS 
BEGIN  
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
           (@FirstName   
           ,@LastName    
           ,@Email      
           ,@Phone      
           ,@HireDate   
           ,@ManagerId 
           ,@Salary    
           ,@DepartmentId
           ,@ReportsTo)  

SELECT @EmployeeId = MAX(EmployeeId) FROM Employee
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Employee_Insert_And_GetEmployeeDetailsById]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Employee_Insert_And_GetEmployeeDetailsById]
(
   @FirstName    NVARCHAR(20)
  ,@LastName     NVARCHAR(20)
  ,@Email        NVARCHAR(50)
  ,@Phone        NVARCHAR(12)
  ,@HireDate     DATE
  ,@ManagerId    INT
  ,@Salary       FLOAT 
  ,@DepartmentId SMALLINT
  ,@ReportsTo    INT 
)
AS 
BEGIN 

     DECLARE @EmployeeId   INT
     EXEC [sp_Employee_Insert] @FirstName,@LastName,@Email,@Phone,@HireDate,@ManagerId,@Salary,@DepartmentId,@ReportsTo,@EmployeeId OUTPUT

	 EXEC [dbo].[sp_getEmployeeDetailsById] @EmployeeId 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmployeeDetailsById]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getEmployeeDetailsById] 
( 
  @EmployeeId INT 
)
AS
  BEGIN
       SELECT E.[EmployeeId]
             ,E.[FirstName]
             ,E.[LastName]
             ,E.[Email]
             ,E.[Phone]
             ,E.[HireDate]
             ,E.[ManagerId]
             ,E.[Salary]
             ,D.DepartmentName
             ,[dbo].[fn_GetReportsToName](E.[ReportsTo]) AS [ReportsTo]
			 ,(SELECT ISNULL(E.[FirstName],NULL) +' '+ ISNULL(E.LastName,NULL) FROM Employee WHERE EmployeeId = E.ReportsTo) AS ManagerName
  FROM [dbo].[Employee] AS E
  INNER JOIN [dbo].[Department] AS D ON E.DepartmentId = D.DepartmentId
  WHERE E.EmployeeId = @EmployeeId
  END
GO
/****** Object:  StoredProcedure [dbo].[sp_getEmployeeList]    Script Date: 25-08-2023 09:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getEmployeeList] 
AS
  BEGIN
       SELECT E.[EmployeeId]
             ,E.[FirstName]
             ,E.[LastName]
             ,E.[Email]
             ,E.[Phone]
             ,E.[HireDate]
             ,E.[ManagerId]
             ,E.[Salary]
             ,D.DepartmentName
             ,[dbo].[fn_GetReportsToName](E.[ReportsTo]) AS [ReportsTo]
			 ,(SELECT ISNULL(E.[FirstName],NULL) +' '+ ISNULL(E.LastName,NULL) FROM Employee WHERE EmployeeId = E.ReportsTo) AS ManagerName
  FROM [dbo].[Employee] AS E
  INNER JOIN [dbo].[Department] AS D ON E.DepartmentId = D.DepartmentId
  END
GO
USE [master]
GO
ALTER DATABASE [HR] SET  READ_WRITE 
GO
