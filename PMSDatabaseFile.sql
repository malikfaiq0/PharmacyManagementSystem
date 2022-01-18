USE [master]
GO
/****** Object:  Database [PharmacyDatabase]    Script Date: 1/19/2022 1:56:36 AM ******/
CREATE DATABASE [PharmacyDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmacyDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PharmacyDatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PharmacyDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PharmacyDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PharmacyDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmacyDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmacyDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmacyDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmacyDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmacyDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [PharmacyDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmacyDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmacyDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmacyDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PharmacyDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PharmacyDatabase]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/19/2022 1:56:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](50) NOT NULL,
	[cat_description] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[staf_id] [int] NOT NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicines](
	[med_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
	[cat_id] [int] NOT NULL,
	[sup_id] [int] NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ord_id] [int] IDENTITY(1,1) NOT NULL,
	[ord_detail] [varchar](50) NOT NULL,
	[date_of_order] [date] NOT NULL,
	[cus_id] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [float] NOT NULL,
	[med_id] [int] NOT NULL,
	[pur_id] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchasing]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchasing](
	[pur_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_id] [int] NOT NULL,
	[med_id] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Purchasing] PRIMARY KEY CLUSTERED 
(
	[pur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[rep_id] [int] IDENTITY(1,1) NOT NULL,
	[pur_id] [int] NOT NULL,
	[ord_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[rep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[staf_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[staf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/19/2022 1:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[sup_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[sup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cat_id], [cat_name], [cat_description]) VALUES (3, N'Injection ', N'injection')
INSERT [dbo].[Categories] ([cat_id], [cat_name], [cat_description]) VALUES (1003, N'Injection ', N'for medication')
INSERT [dbo].[Categories] ([cat_id], [cat_name], [cat_description]) VALUES (3003, N'Drops', N'Eye drops')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([cus_id], [firstname], [lastname], [gender], [address], [email], [staf_id], [Phone]) VALUES (4003, N'Aliya', N'ahmed', N'Female', N'Lahore', N'fa20bsse1005@maju.edu.pk', 3002, N'03312588564')
INSERT [dbo].[Customer] ([cus_id], [firstname], [lastname], [gender], [address], [email], [staf_id], [Phone]) VALUES (5003, N'Asim', N'ahmed', N'Male', N'karachi', N'asim12@gmail.com', 3002, N'03312588564')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [username], [email], [password]) VALUES (1, N'Malik', N'malik@gmail.com', N'malik')
INSERT [dbo].[login] ([id], [username], [email], [password]) VALUES (2, N'Sufiyan khan', N'sufiankhan2056@gmail.com', N'sufi')
INSERT [dbo].[login] ([id], [username], [email], [password]) VALUES (3, N'faiq', N'malik@gmail.com', N'faiq')
INSERT [dbo].[login] ([id], [username], [email], [password]) VALUES (4, N'sufian khan', N'sufiankhan2056@gmail.com', N'N@vy2056')
SET IDENTITY_INSERT [dbo].[login] OFF
SET IDENTITY_INSERT [dbo].[Medicines] ON 

INSERT [dbo].[Medicines] ([med_id], [name], [type], [price], [quantity], [total], [cat_id], [sup_id]) VALUES (2, N'panadol', N'ned', 10, 2, 20, 3, 3)
INSERT [dbo].[Medicines] ([med_id], [name], [type], [price], [quantity], [total], [cat_id], [sup_id]) VALUES (1004, N'Telfast D', N'Allergic', 450, 2, 900, 3, 3)
INSERT [dbo].[Medicines] ([med_id], [name], [type], [price], [quantity], [total], [cat_id], [sup_id]) VALUES (2002, N'Zineyeth', N'Dust Allergies', 240, 15, 3600, 3003, 1003)
SET IDENTITY_INSERT [dbo].[Medicines] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ord_id], [ord_detail], [date_of_order], [cus_id], [unit_price], [quantity], [total], [med_id], [pur_id]) VALUES (1003, N'dopa medicines', CAST(N'2021-08-11' AS Date), 4003, 5, 2, 10, 2, NULL)
INSERT [dbo].[Order] ([ord_id], [ord_detail], [date_of_order], [cus_id], [unit_price], [quantity], [total], [med_id], [pur_id]) VALUES (2005, N'medicines', CAST(N'2022-01-01' AS Date), 4003, 5, 2, 10, 2, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Purchasing] ON 

INSERT [dbo].[Purchasing] ([pur_id], [cus_id], [med_id], [amount], [date]) VALUES (2003, 4003, 2, 50, CAST(N'2022-01-15' AS Date))
INSERT [dbo].[Purchasing] ([pur_id], [cus_id], [med_id], [amount], [date]) VALUES (3003, 4003, 2, 60, CAST(N'2022-01-15' AS Date))
INSERT [dbo].[Purchasing] ([pur_id], [cus_id], [med_id], [amount], [date]) VALUES (3004, 5003, 1004, 411, CAST(N'2022-01-11' AS Date))
SET IDENTITY_INSERT [dbo].[Purchasing] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([rep_id], [pur_id], [ord_id], [cus_id], [date]) VALUES (3, 3003, 1003, 4003, CAST(N'2022-01-13' AS Date))
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name], [status]) VALUES (1015, N'Leader', N'Active')
INSERT [dbo].[Role] ([role_id], [name], [status]) VALUES (1016, N'Manager', N'Active')
INSERT [dbo].[Role] ([role_id], [name], [status]) VALUES (1017, N'admin', N'Active')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([staf_id], [firstname], [lastname], [gender], [address], [phone], [email], [username], [password], [role_id]) VALUES (3002, N'ali', N'shakeel', N'Male', N'Karachi', N'03312547896', N'fa20bsse1005@maju.edu.pk', N'sufianarshadkhan', N'12345', 1016)
INSERT [dbo].[Staff] ([staf_id], [firstname], [lastname], [gender], [address], [phone], [email], [username], [password], [role_id]) VALUES (4002, N'Aslam', N'Kamal', N'Male', N'karachi', N'021-4587966', N'aslam12@gmail.com', N'aslam', N'aslam', 1016)
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([sup_id], [name], [address], [email], [phone]) VALUES (3, N'Sufian Khan', N'karachi', N'sufiankhan2056@gmail.com', N'0331578585')
INSERT [dbo].[Supplier] ([sup_id], [name], [address], [email], [phone]) VALUES (1003, N'Rana', N'karachi', N'rana12@gmail.com', N'0332547856')
INSERT [dbo].[Supplier] ([sup_id], [name], [address], [email], [phone]) VALUES (2003, N'Ethisham', N'karachi', N'ethisham123@gmail.com', N'021-4587966')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Staff] FOREIGN KEY([staf_id])
REFERENCES [dbo].[Staff] ([staf_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Staff]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Categories] FOREIGN KEY([cat_id])
REFERENCES [dbo].[Categories] ([cat_id])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_Categories]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Supplier] FOREIGN KEY([sup_id])
REFERENCES [dbo].[Supplier] ([sup_id])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_Supplier]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Medicines] FOREIGN KEY([med_id])
REFERENCES [dbo].[Medicines] ([med_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Medicines]
GO
ALTER TABLE [dbo].[Purchasing]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Purchasing] CHECK CONSTRAINT [FK_Purchasing_Customer]
GO
ALTER TABLE [dbo].[Purchasing]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Medicines] FOREIGN KEY([med_id])
REFERENCES [dbo].[Medicines] ([med_id])
GO
ALTER TABLE [dbo].[Purchasing] CHECK CONSTRAINT [FK_Purchasing_Medicines]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Customer]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Order] FOREIGN KEY([ord_id])
REFERENCES [dbo].[Order] ([ord_id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Order]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Purchasing] FOREIGN KEY([pur_id])
REFERENCES [dbo].[Purchasing] ([pur_id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Purchasing]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Role]
GO
USE [master]
GO
ALTER DATABASE [PharmacyDatabase] SET  READ_WRITE 
GO
