USE [master]
GO
/****** Object:  Database [MamaApp]    Script Date: 11/16/2024 1:37:32 PM ******/
CREATE DATABASE [MamaApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MamaApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MamaApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MamaApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MamaApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MamaApp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MamaApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MamaApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MamaApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MamaApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MamaApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MamaApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [MamaApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MamaApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MamaApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MamaApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MamaApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MamaApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MamaApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MamaApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MamaApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MamaApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MamaApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MamaApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MamaApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MamaApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MamaApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MamaApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MamaApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MamaApp] SET RECOVERY FULL 
GO
ALTER DATABASE [MamaApp] SET  MULTI_USER 
GO
ALTER DATABASE [MamaApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MamaApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MamaApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MamaApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MamaApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MamaApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MamaApp] SET QUERY_STORE = ON
GO
ALTER DATABASE [MamaApp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MamaApp]
GO
/****** Object:  Table [dbo].[tbl_Block]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Block](
	[BlockID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BlockName] [nvarchar](50) NULL,
	[BlockHindiName] [nvarchar](50) NULL,
	[DistrictID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_Block] PRIMARY KEY CLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Broadcast]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Broadcast](
	[BroadcastID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BroadcastType] [numeric](18, 0) NOT NULL,
	[Broadcast] [nvarchar](2500) NULL,
	[BroadcastDate] [datetime] NULL,
	[BroadcastRemark] [nvarchar](2500) NULL,
	[BroadcastStatus] [char](2) NULL,
	[ReleaseStatus] [char](1) NULL,
	[ReleaseDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Broadcast] PRIMARY KEY CLUSTERED 
(
	[BroadcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Complaint]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Complaint](
	[ComplaintID] [numeric](18, 0) IDENTITY(1000,1) NOT NULL,
	[ComplaintName] [nvarchar](50) NULL,
	[DistrictID] [numeric](18, 0) NULL,
	[BlockID] [numeric](18, 0) NULL,
	[ComplaintAddress] [nvarchar](500) NULL,
	[ConTypeID] [numeric](18, 0) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBY] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [varchar](15) NULL,
	[AssignOfficerID] [numeric](18, 0) NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_Complaint] PRIMARY KEY CLUSTERED 
(
	[ComplaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ComplaintRemark]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ComplaintRemark](
	[ComplaintRemarkID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ComplaintID] [numeric](18, 0) NULL,
	[RemarkBy] [numeric](18, 0) NULL,
	[Remark] [nvarchar](max) NULL,
	[CurrentStatus] [nvarchar](15) NULL,
	[RemarkDate] [datetime] NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_ComplaintRemark] PRIMARY KEY CLUSTERED 
(
	[ComplaintRemarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ConSubType]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ConSubType](
	[ConSubType] [nvarchar](500) NULL,
	[ConSubTypeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_ConSubType] PRIMARY KEY CLUSTERED 
(
	[ConSubTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ConType]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ConType](
	[ConType] [nvarchar](500) NULL,
	[ConTypeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_ConType] PRIMARY KEY CLUSTERED 
(
	[ConTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Designation]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Designation](
	[DesignationID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [numeric](18, 0) NOT NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_District]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_District](
	[DistrictID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NULL,
	[DistrictHindiName] [nvarchar](50) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LoginDetails]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LoginDetails](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[PersonInfoID] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [numeric](18, 0) NOT NULL,
	[UserRoleID] [numeric](18, 0) NOT NULL,
	[ISBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_LoginDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OfficerMaster]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OfficerMaster](
	[OfficerID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OfficerName] [nvarchar](50) NULL,
	[OfficerMobile] [nvarchar](20) NULL,
	[OfficerEmail] [nvarchar](50) NULL,
	[OfficerDesignation] [nvarchar](50) NULL,
	[OfficerDistrict] [numeric](18, 0) NULL,
	[CreatedBY] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[isBlocked] [char](1) NULL,
 CONSTRAINT [PK_tbl_OfficerMaster] PRIMARY KEY CLUSTERED 
(
	[OfficerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PersonInfo](
	[PersonInfoID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[DistrictID] [numeric](18, 0) NULL,
	[BlockID] [numeric](18, 0) NULL,
	[DesignationID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ISBlocked] [char](1) NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_PersonInfo] PRIMARY KEY CLUSTERED 
(
	[PersonInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Block] ON 
GO
INSERT [dbo].[tbl_Block] ([BlockID], [BlockName], [BlockHindiName], [DistrictID], [CreatedBy], [CreatedDate], [ISBlocked]) VALUES (CAST(1 AS Numeric(18, 0)), N'Ganjbasoda', N'ganjbasoda', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-16T20:47:29.187' AS DateTime), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_Block] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Complaint] ON 
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1000 AS Numeric(18, 0)), N'Rishabh Jain', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T01:16:43.380' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1001 AS Numeric(18, 0)), N'Rishabh Jain', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T01:55:37.633' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1002 AS Numeric(18, 0)), N'Rishabh Jain 1', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 1', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 1', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:22:53.550' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1003 AS Numeric(18, 0)), N'Rishabh Jain 2', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 2', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 2', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:32:26.227' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1004 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:36:47.873' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1005 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:38:29.050' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1006 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:43:32.137' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1007 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:45:19.773' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1008 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T02:57:56.683' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1009 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal 3', CAST(2 AS Numeric(18, 0)), N'9074888521', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-19T21:54:11.067' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1010 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'bHOPAL', CAST(2 AS Numeric(18, 0)), N'Rishb005@gmail.com', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-07-14T17:30:46.570' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1011 AS Numeric(18, 0)), N'Rishabh Jain 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'bHOPAL', CAST(2 AS Numeric(18, 0)), N'Rishb005@gmail.com', N'I need Money 3', CAST(1 AS Numeric(18, 0)), CAST(N'2024-07-14T17:40:57.113' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1012 AS Numeric(18, 0)), N'Issue in Lght', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal', CAST(2 AS Numeric(18, 0)), N'8130184427', N'Light nahi aa rahi hai 2 ghante se', CAST(1 AS Numeric(18, 0)), CAST(N'2024-10-26T19:44:47.233' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1013 AS Numeric(18, 0)), N'Issue in Lght test', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal', CAST(2 AS Numeric(18, 0)), N'8130184427', N'Light nahi aa rahi hai 2 ghante se', CAST(1 AS Numeric(18, 0)), CAST(N'2024-10-26T20:55:55.113' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Complaint] ([ComplaintID], [ComplaintName], [DistrictID], [BlockID], [ComplaintAddress], [ConTypeID], [MobileNo], [Description], [CreatedBY], [CreatedDate], [Status], [AssignOfficerID], [ISBlocked]) VALUES (CAST(1014 AS Numeric(18, 0)), N'Issue in Lght test chck', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'Bhopal', CAST(3 AS Numeric(18, 0)), N'8130184427', N'Light nahi aa rahi hai 2 ghante se chekc', CAST(1 AS Numeric(18, 0)), CAST(N'2024-10-26T21:18:52.897' AS DateTime), N'WIP', CAST(1 AS Numeric(18, 0)), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_Complaint] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ComplaintRemark] ON 
GO
INSERT [dbo].[tbl_ComplaintRemark] ([ComplaintRemarkID], [ComplaintID], [RemarkBy], [Remark], [CurrentStatus], [RemarkDate], [ISBlocked]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1010 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'यह शिकायत ऑफिस से दर्ज की गई है ', N'WIP', CAST(N'2024-07-14T17:30:46.573' AS DateTime), N'A')
GO
INSERT [dbo].[tbl_ComplaintRemark] ([ComplaintRemarkID], [ComplaintID], [RemarkBy], [Remark], [CurrentStatus], [RemarkDate], [ISBlocked]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1011 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'यह शिकायत ऑफिस से दर्ज की गई है ', N'WIP', CAST(N'2024-07-14T17:40:57.113' AS DateTime), N'A')
GO
INSERT [dbo].[tbl_ComplaintRemark] ([ComplaintRemarkID], [ComplaintID], [RemarkBy], [Remark], [CurrentStatus], [RemarkDate], [ISBlocked]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1012 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'यह शिकायत ऑफिस से दर्ज की गई है ', N'WIP', CAST(N'2024-10-26T19:44:47.250' AS DateTime), N'A')
GO
INSERT [dbo].[tbl_ComplaintRemark] ([ComplaintRemarkID], [ComplaintID], [RemarkBy], [Remark], [CurrentStatus], [RemarkDate], [ISBlocked]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1013 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'यह शिकायत ऑफिस से दर्ज की गई है ', N'WIP', CAST(N'2024-10-26T20:55:55.137' AS DateTime), N'A')
GO
INSERT [dbo].[tbl_ComplaintRemark] ([ComplaintRemarkID], [ComplaintID], [RemarkBy], [Remark], [CurrentStatus], [RemarkDate], [ISBlocked]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1014 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'यह शिकायत ऑफिस से दर्ज की गई है ', N'WIP', CAST(N'2024-10-26T21:18:54.380' AS DateTime), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_ComplaintRemark] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ConType] ON 
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'Sujhav', CAST(2 AS Numeric(18, 0)), CAST(N'2024-06-16T21:05:39.950' AS DateTime), CAST(1 AS Numeric(18, 0)), N'B')
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'Shikayat', CAST(3 AS Numeric(18, 0)), CAST(N'2024-09-16T12:08:27.877' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'Suggestion', CAST(4 AS Numeric(18, 0)), CAST(N'2024-09-16T12:11:16.620' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'Complaint Type', CAST(5 AS Numeric(18, 0)), CAST(N'2024-09-16T12:13:43.510' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'rwerwerwrytr', CAST(6 AS Numeric(18, 0)), CAST(N'2024-09-16T13:30:12.960' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_ConType] ([ConType], [ConTypeID], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (N'jkgfghh', CAST(7 AS Numeric(18, 0)), CAST(N'2024-09-16T13:38:11.453' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_ConType] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Designation] ON 
GO
INSERT [dbo].[tbl_Designation] ([DesignationID], [DesignationName], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (CAST(2 AS Numeric(18, 0)), N'Booth prabhari', CAST(N'2024-06-13T23:43:11.563' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Designation] ([DesignationID], [DesignationName], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (CAST(4 AS Numeric(18, 0)), N'ABC', CAST(N'2024-06-14T00:28:35.370' AS DateTime), CAST(1 AS Numeric(18, 0)), N'B')
GO
INSERT [dbo].[tbl_Designation] ([DesignationID], [DesignationName], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (CAST(10 AS Numeric(18, 0)), N'CBA', CAST(N'2024-09-16T13:43:40.373' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
INSERT [dbo].[tbl_Designation] ([DesignationID], [DesignationName], [CreatedDate], [CreatedBy], [ISBlocked]) VALUES (CAST(11 AS Numeric(18, 0)), N'Admin', CAST(N'2024-09-17T10:53:38.087' AS DateTime), CAST(1 AS Numeric(18, 0)), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_District] ON 
GO
INSERT [dbo].[tbl_District] ([DistrictID], [DistrictName], [DistrictHindiName], [CreatedBy], [CreatedDate], [ISBlocked]) VALUES (CAST(1 AS Numeric(18, 0)), N'Vidisha', N'विदिशा', CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-16T20:47:29.187' AS DateTime), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_District] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_LoginDetails] ON 
GO
INSERT [dbo].[tbl_LoginDetails] ([ID], [UserID], [Password], [PersonInfoID], [CreatedDate], [CreatedBy], [UserRoleID], [ISBlocked]) VALUES (CAST(1 AS Numeric(18, 0)), N'Admin', N'Admin', CAST(1 AS Numeric(18, 0)), CAST(N'2024-09-17T10:54:09.510' AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_LoginDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_OfficerMaster] ON 
GO
INSERT [dbo].[tbl_OfficerMaster] ([OfficerID], [OfficerName], [OfficerMobile], [OfficerEmail], [OfficerDesignation], [OfficerDistrict], [CreatedBY], [CreatedDate], [isBlocked]) VALUES (CAST(1 AS Numeric(18, 0)), N'Chandrakirti vidyarthi', N'9074888521', N'rish005@live.com', N'TechLead 1', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-17T20:07:27.150' AS DateTime), N'A')
GO
SET IDENTITY_INSERT [dbo].[tbl_OfficerMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_PersonInfo] ON 
GO
INSERT [dbo].[tbl_PersonInfo] ([PersonInfoID], [Name], [Mobile], [Email], [Address], [DistrictID], [BlockID], [DesignationID], [CreatedBy], [CreatedDate], [ISBlocked], [UserID], [Password]) VALUES (CAST(1 AS Numeric(18, 0)), N'Admin', N'9074888521', N'Admin@admin.com', N'Damoh', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-06-16T23:44:32.693' AS DateTime), N'A', N'Admin', N'Admin')
GO
INSERT [dbo].[tbl_PersonInfo] ([PersonInfoID], [Name], [Mobile], [Email], [Address], [DistrictID], [BlockID], [DesignationID], [CreatedBy], [CreatedDate], [ISBlocked], [UserID], [Password]) VALUES (CAST(3 AS Numeric(18, 0)), N'Chandrakirti', N'9074888521', N'Admin@admin.com', N'Bhopal 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-09-17T11:12:37.870' AS DateTime), N'A', N'Admin1', N'Admin1')
GO
INSERT [dbo].[tbl_PersonInfo] ([PersonInfoID], [Name], [Mobile], [Email], [Address], [DistrictID], [BlockID], [DesignationID], [CreatedBy], [CreatedDate], [ISBlocked], [UserID], [Password]) VALUES (CAST(4 AS Numeric(18, 0)), N'Admin2', N'9074888521', N'Admin@admin.com', N'Bhopal 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-09-17T12:11:01.530' AS DateTime), N'A', N'Admin2', N'Admin2')
GO
INSERT [dbo].[tbl_PersonInfo] ([PersonInfoID], [Name], [Mobile], [Email], [Address], [DistrictID], [BlockID], [DesignationID], [CreatedBy], [CreatedDate], [ISBlocked], [UserID], [Password]) VALUES (CAST(5 AS Numeric(18, 0)), N'Admin4', N'9074888521', N'Admin@admin.com', N'Bhopal 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-09-17T12:11:31.633' AS DateTime), N'A', N'Admin4', N'Admin4')
GO
INSERT [dbo].[tbl_PersonInfo] ([PersonInfoID], [Name], [Mobile], [Email], [Address], [DistrictID], [BlockID], [DesignationID], [CreatedBy], [CreatedDate], [ISBlocked], [UserID], [Password]) VALUES (CAST(6 AS Numeric(18, 0)), N'Admin3', N'9074888521', N'Admin@admin.com', N'Bhopal 3', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2024-09-17T12:12:16.277' AS DateTime), N'A', N'Admin3', N'Admin3')
GO
SET IDENTITY_INSERT [dbo].[tbl_PersonInfo] OFF
GO
ALTER TABLE [dbo].[tbl_Block] ADD  CONSTRAINT [DF_tbl_Block_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Block] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_Broadcast] ADD  CONSTRAINT [DF_tbl_Broadcast_BroadcastDate]  DEFAULT (getdate()) FOR [BroadcastDate]
GO
ALTER TABLE [dbo].[tbl_Broadcast] ADD  CONSTRAINT [DF_tbl_Broadcast_BroadcastStatus]  DEFAULT ('A') FOR [BroadcastStatus]
GO
ALTER TABLE [dbo].[tbl_Broadcast] ADD  CONSTRAINT [DF_tbl_Broadcast_ReleaseStatus]  DEFAULT ('N') FOR [ReleaseStatus]
GO
ALTER TABLE [dbo].[tbl_Broadcast] ADD  CONSTRAINT [DF_tbl_Broadcast_ReleaseDate]  DEFAULT (getdate()) FOR [ReleaseDate]
GO
ALTER TABLE [dbo].[tbl_Complaint] ADD  CONSTRAINT [DF_tbl_Complaint_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Complaint] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_ComplaintRemark] ADD  CONSTRAINT [DF_tbl_ComplaintRemark_RemarkDate]  DEFAULT (getdate()) FOR [RemarkDate]
GO
ALTER TABLE [dbo].[tbl_ComplaintRemark] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_ConSubType] ADD  CONSTRAINT [DF_tbl_ConSubType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ConSubType] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_ConType] ADD  CONSTRAINT [DF_tbl_ConType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_ConType] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_Designation] ADD  CONSTRAINT [DF_tbl_Designation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Designation] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_District] ADD  CONSTRAINT [DF_tbl_District_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_District] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_LoginDetails] ADD  CONSTRAINT [DF_tbl_LoginDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_LoginDetails] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
ALTER TABLE [dbo].[tbl_OfficerMaster] ADD  CONSTRAINT [DF_tbl_OfficerMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_PersonInfo] ADD  CONSTRAINT [DF_tbl_PersonInfo_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_PersonInfo] ADD  DEFAULT ('A') FOR [ISBlocked]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOfficerMaster]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteOfficerMaster]
    @OfficerID NUMERIC(18, 0)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[tbl_OfficerMaster]
    WHERE 
        [OfficerID] = @OfficerID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeletePersonInfo]
    @PersonInfoID NUMERIC(18, 0)
AS
BEGIN
    DELETE FROM tbl_PersonInfo
    WHERE PersonInfoID = @PersonInfoID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPersonInfo]
    @PersonInfoID NUMERIC(18, 0) = NULL
AS
BEGIN
    IF @PersonInfoID IS NOT NULL
    BEGIN
        SELECT PersonInfoID, Name, Mobile, Email, Address, p.DistrictID,d.DistrictName , p.BlockID,b.BlockName, p.DesignationID,de.DesignationName, p.CreatedBy, p.CreatedDate, p.ISBlocked, UserID, Password
        FROM tbl_PersonInfo p
		inner join [dbo].[tbl_District] d on d.DistrictID = p.DistrictID
		inner join [dbo].[tbl_Designation] de on de.DesignationID = p.DesignationID
		inner join [dbo].[tbl_Block] b on b.BlockID = p.BlockID
        WHERE PersonInfoID = @PersonInfoID;
    END
    ELSE
    BEGIN
        SELECT PersonInfoID, Name, Mobile, Email, Address, p.DistrictID,d.DistrictName , p.BlockID,b.BlockName, p.DesignationID,de.DesignationName, p.CreatedBy, p.CreatedDate, p.ISBlocked, UserID, Password
        FROM tbl_PersonInfo p
		inner join [dbo].[tbl_District] d on d.DistrictID = p.DistrictID
		inner join [dbo].[tbl_Designation] de on de.DesignationID = p.DesignationID
		inner join [dbo].[tbl_Block] b on b.BlockID = p.BlockID
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOfficerMaster]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertOfficerMaster]
    @OfficerName NVARCHAR(50),
    @OfficerMobile NVARCHAR(20),
    @OfficerEmail NVARCHAR(50),
    @OfficerDesignation NVARCHAR(50),
    @OfficerDistrict NUMERIC(18, 0),
    @CreatedBY NUMERIC(18, 0),
    @isBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[tbl_OfficerMaster]
    (
        [OfficerName], 
        [OfficerMobile], 
        [OfficerEmail], 
        [OfficerDesignation], 
        [OfficerDistrict], 
        [CreatedBY], 
        [CreatedDate], 
        [isBlocked]
    )
    VALUES
    (
        @OfficerName, 
        @OfficerMobile, 
        @OfficerEmail, 
        @OfficerDesignation, 
        @OfficerDistrict, 
        @CreatedBY, 
        GETDATE(), 
        @isBlocked
    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPersonInfo]
    @Name NVARCHAR(50),
    @Mobile NVARCHAR(20),
    @Email NVARCHAR(50),
    @Address NVARCHAR(500),
    @DistrictID NUMERIC(18, 0),
    @BlockID NUMERIC(18, 0),
    @DesignationID NUMERIC(18, 0),
    @CreatedBy NUMERIC(18, 0),
    @ISBlocked CHAR(1),
    @UserID NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
declare @count int = 0 
set @count = (select count(1) from [dbo].[tbl_PersonInfo] where UserID = @userid )
if(@count=0)
begin
    INSERT INTO tbl_PersonInfo (Name, Mobile, Email, Address, DistrictID, BlockID, DesignationID, CreatedBy, ISBlocked, CreatedDate, UserID, Password)
    VALUES (@Name, @Mobile, @Email, @Address, @DistrictID, @BlockID, @DesignationID, @CreatedBy, @ISBlocked, GETDATE(), @UserID, @Password);
	select @@ROWCOUNT as 'Status'
	end
else
begin
	select 3 as 'Status'
end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_loginUser]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_loginUser]
@userid nvarchar(30),
@password nvarchar(30)
AS
BEGIN
	SET NOCOUNT ON;
	declare @PersonInfoID int

	set @PersonInfoID = (select count(1) from [dbo].[tbl_PersonInfo] u
	inner join tbl_Designation d on d.DesignationID = u.DesignationID and d.ISBlocked='A'
	where UserID = @userid and Password = @password and u.ISBlocked = 'A' )

		if(@PersonInfoID>0)
		begin
			exec sp_GetPersonInfo @PersonInfoID
		end
    END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageBlock]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageBlock 'INSERT', NULL, 'Block A', 'ब्लॉक ए', 1, 1, 'N'

--EXEC sp_ManageBlock 'UPDATE', 1, 'Updated Block A', 'अपडेटेड ब्लॉक ए', 1, NULL, 'N'

--EXEC sp_ManageBlock 'DELETE', 1

--EXEC sp_ManageBlock 'SELECT'

--EXEC sp_ManageBlock 'SELECT', 1



CREATE PROCEDURE [dbo].[sp_ManageBlock]
    @Action NVARCHAR(10),
    @BlockID NUMERIC(18, 0) = NULL,
    @BlockName NVARCHAR(50) = NULL,
    @BlockHindiName NVARCHAR(50) = NULL,
    @DistrictID NUMERIC(18, 0) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_Block] 
        (
            [BlockName], 
            [BlockHindiName], 
            [DistrictID], 
            [CreatedBy], 
            [CreatedDate], 
            [ISBlocked]
        )
        VALUES 
        (
            @BlockName, 
            @BlockHindiName, 
            @DistrictID, 
            @CreatedBy, 
            GETDATE(), 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Block]
        SET 
            [BlockName] = @BlockName, 
            [BlockHindiName] = @BlockHindiName, 
            [DistrictID] = @DistrictID, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [BlockID] = @BlockID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_Block]
        WHERE 
            [BlockID] = @BlockID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @BlockID IS NULL
        BEGIN
            SELECT 
                [BlockID], 
                [BlockName], 
                [BlockHindiName], 
                [DistrictID], 
                [CreatedBy], 
                [CreatedDate], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_Block]
        END
        ELSE
        BEGIN
            SELECT 
                [BlockID], 
                [BlockName], 
                [BlockHindiName], 
                [DistrictID], 
                [CreatedBy], 
                [CreatedDate], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_Block]
            WHERE 
                [BlockID] = @BlockID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageBroadcast]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Insert a new broadcast
--EXEC sp_ManageBroadcast 'INSERT', NULL, 1, 'Broadcast message', NULL, 'Remark', 'A', 'N', NULL;

---- Update an existing broadcast
--EXEC sp_ManageBroadcast 'UPDATE', 1, 1, 'Updated Broadcast message', NULL, 'Updated Remark', 'A', 'Y', NULL;

---- Delete a broadcast
--EXEC sp_ManageBroadcast 'DELETE', 1;

---- Select all broadcasts
--EXEC sp_ManageBroadcast 'SELECT';

---- Select a specific broadcast by ID
--EXEC sp_ManageBroadcast 'SELECT', 1;


CREATE PROCEDURE [dbo].[sp_ManageBroadcast]
    @Action NVARCHAR(10),
    @BroadcastID NUMERIC(18, 0) = NULL,
    @BroadcastType NUMERIC(18, 0) = NULL,
    @Broadcast NVARCHAR(2500) = NULL,
    @BroadcastDate DATETIME = NULL,
    @BroadcastRemark NVARCHAR(2500) = NULL,
    @BroadcastStatus CHAR(2) = 'A',
    @ReleaseStatus CHAR(1) = 'N',
    @ReleaseDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_Broadcast]
        (
            [BroadcastType], 
            [Broadcast], 
            [BroadcastDate], 
            [BroadcastRemark], 
            [BroadcastStatus], 
            [ReleaseStatus], 
            [ReleaseDate]
        )
        VALUES 
        (
            @BroadcastType, 
            @Broadcast, 
            ISNULL(@BroadcastDate, GETDATE()), 
            @BroadcastRemark, 
            @BroadcastStatus, 
            @ReleaseStatus, 
            ISNULL(@ReleaseDate, GETDATE())
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Broadcast]
        SET 
            [BroadcastType] = @BroadcastType, 
            [Broadcast] = @Broadcast, 
            [BroadcastDate] = ISNULL(@BroadcastDate, [BroadcastDate]), 
            [BroadcastRemark] = @BroadcastRemark, 
            [BroadcastStatus] = @BroadcastStatus, 
            [ReleaseStatus] = @ReleaseStatus, 
            [ReleaseDate] = ISNULL(@ReleaseDate, [ReleaseDate])
        WHERE 
            [BroadcastID] = @BroadcastID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_Broadcast]
        WHERE 
            [BroadcastID] = @BroadcastID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @BroadcastID IS NULL
        BEGIN
            SELECT 
                [BroadcastID], 
                [BroadcastType], 
                [Broadcast], 
                [BroadcastDate], 
                [BroadcastRemark], 
                [BroadcastStatus], 
                [ReleaseStatus], 
                [ReleaseDate]
            FROM 
                [dbo].[tbl_Broadcast]
        END
        ELSE
        BEGIN
            SELECT 
                [BroadcastID], 
                [BroadcastType], 
                [Broadcast], 
                [BroadcastDate], 
                [BroadcastRemark], 
                [BroadcastStatus], 
                [ReleaseStatus], 
                [ReleaseDate]
            FROM 
                [dbo].[tbl_Broadcast]
            WHERE 
                [BroadcastID] = @BroadcastID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageComplaint]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC sp_ManageComplaint 'INSERT', NULL, 'Complaint A', 1, 1, '123 Main St', 1, 1, 'Description here', 1, 'Open', 2, 'N'
--EXEC sp_ManageComplaint 'UPDATE', 1000, 'Updated Complaint A', 1, 1, '456 Main St', 1, 1, 'Updated description here', NULL, 'Closed', 3, 'N'
--EXEC sp_ManageComplaint 'DELETE', 1000
--EXEC sp_ManageComplaint 'SELECT'
--EXEC sp_ManageComplaint 'SELECT', 1010

CREATE PROCEDURE [dbo].[sp_ManageComplaint]
    @Action NVARCHAR(10),
    @ComplaintID NUMERIC(18, 0) = NULL,
    @ComplaintName NVARCHAR(50) = NULL,
    @DistrictID NUMERIC(18, 0) = NULL,
    @BlockID NUMERIC(18, 0) = NULL,
    @ComplaintAddress NVARCHAR(500) = NULL,
    @ConTypeID NUMERIC(18, 0) = NULL,
    @MobileNo nvarchar(20) = NULL,
    @Description NVARCHAR(MAX) = NULL,
    @CreatedBY NUMERIC(18, 0) = NULL,
    @Status VARCHAR(15) = NULL,
    @AssignOfficerID NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_Complaint] 
        (
            [ComplaintName], 
            [DistrictID], 
            [BlockID], 
            [ComplaintAddress], 
            [ConTypeID], 
            [MobileNo], 
            [Description], 
            [CreatedBY], 
            [CreatedDate], 
            [Status], 
            [AssignOfficerID], 
            [ISBlocked]
        )
        VALUES 
        (
            @ComplaintName, 
            @DistrictID, 
            @BlockID, 
            @ComplaintAddress, 
            @ConTypeID, 
            @MobileNo, 
            @Description, 
            @CreatedBY, 
            GETDATE(), 
            @Status, 
            @AssignOfficerID, 
            @ISBlocked
        )
		declare @compid bigint;
		set @compid = SCOPE_IDENTITY();
		select SCOPE_IDENTITY();

		INSERT INTO [dbo].[tbl_ComplaintRemark] 
        (
            [ComplaintID], 
            [RemarkBy], 
            [Remark], 
            [CurrentStatus], 
            [RemarkDate], 
            [ISBlocked]
        )
        VALUES 
        (
            @compid, 
            @CreatedBY, 
            N'यह शिकायत ऑफिस से दर्ज की गई है ', 
            'WIP', 
            GETDATE(), 
            @ISBlocked
        )

    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Complaint]
        SET 
            [ComplaintName] = @ComplaintName, 
            [DistrictID] = @DistrictID, 
            [BlockID] = @BlockID, 
            [ComplaintAddress] = @ComplaintAddress, 
            [ConTypeID] = @ConTypeID, 
            [MobileNo] = @MobileNo, 
            [Description] = @Description, 
            [Status] = @Status, 
            [AssignOfficerID] = @AssignOfficerID, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [ComplaintID] = @ComplaintID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_Complaint]
        WHERE 
            [ComplaintID] = @ComplaintID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @ComplaintID IS NULL
        BEGIN
            SELECT 
                [ComplaintID], 
                [ComplaintName], 
                c.[DistrictID],
				d.[DistrictHindiName],
                c.[BlockID], 
				b.[BlockHindiName],
                [ComplaintAddress], 
                c.[ConTypeID],
				ISNULL(t.[ConType],'') AS ConType,
                [MobileNo], 
                [Description], 
                c.[CreatedBY], 
                c.[CreatedDate], 
                [Status], 
                [AssignOfficerID],
				o.[OfficerName],
                c.[ISBlocked]
            FROM 
                [dbo].[tbl_Complaint] c
			LEFT OUTER JOIN 
				tbl_District d on d.DistrictID =c.DistrictID
			LEFT OUTER JOIN 
				tbl_Block b on b.BlockID =c.BlockID
			LEFT OUTER JOIN 
				tbl_ConType t on t.ConTypeID = c.ConTypeID
			LEFT OUTER JOIN  
				tbl_OfficerMaster o on o.OfficerID = c.AssignOfficerID
        END
        ELSE
        BEGIN
            SELECT 
                [ComplaintID], 
                [ComplaintName], 
                c.[DistrictID],
				d.[DistrictHindiName],
                c.[BlockID], 
				b.[BlockHindiName],
                [ComplaintAddress], 
                c.[ConTypeID],
				ISNULL(t.[ConType],'') AS ConType,
                [MobileNo], 
                [Description], 
                c.[CreatedBY], 
                c.[CreatedDate], 
                [Status], 
                [AssignOfficerID],
				o.[OfficerName],
                c.[ISBlocked]
            FROM 
                [dbo].[tbl_Complaint] c
			LEFT OUTER JOIN
				tbl_District d on d.DistrictID =c.DistrictID
			LEFT OUTER JOIN
				tbl_Block b on b.BlockID =c.BlockID
			LEFT OUTER JOIN
				tbl_ConType t on t.ConTypeID = c.ConTypeID
			LEFT OUTER JOIN
				tbl_OfficerMaster o on o.OfficerID = c.AssignOfficerID
            WHERE 
                [ComplaintID] = @ComplaintID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageComplaintRemark]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageComplaintRemark 'INSERT', NULL, 1001, 1, 'This is a remark', 'Pending', 'A'

--EXEC sp_ManageComplaintRemark 'UPDATE', 1, 1001, 1, 'Updated remark', 'Resolved', 'A'

--EXEC sp_ManageComplaintRemark 'DELETE', 1

--EXEC sp_ManageComplaintRemark 'SELECT'

--EXEC sp_ManageComplaintRemark 'SELECT', 1


CREATE PROCEDURE [dbo].[sp_ManageComplaintRemark]
    @Action NVARCHAR(10),
    @ComplaintRemarkID NUMERIC(18, 0) = NULL,
    @ComplaintID NUMERIC(18, 0) = NULL,
    @RemarkBy NUMERIC(18, 0) = NULL,
    @Remark NVARCHAR(MAX) = NULL,
    @CurrentStatus NVARCHAR(15) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_ComplaintRemark] 
        (
            [ComplaintID], 
            [RemarkBy], 
            [Remark], 
            [CurrentStatus], 
            [RemarkDate], 
            [ISBlocked]
        )
        VALUES 
        (
            @ComplaintID, 
            @RemarkBy, 
            @Remark, 
            @CurrentStatus, 
            GETDATE(), 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_ComplaintRemark]
        SET 
            [ComplaintID] = @ComplaintID, 
            [RemarkBy] = @RemarkBy, 
            [Remark] = @Remark, 
            [CurrentStatus] = @CurrentStatus, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [ComplaintRemarkID] = @ComplaintRemarkID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_ComplaintRemark]
        WHERE 
            [ComplaintRemarkID] = @ComplaintRemarkID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @ComplaintID IS NULL
        BEGIN
            SELECT 
                [ComplaintRemarkID], 
                [ComplaintID], 
                [RemarkBy], 
                [Remark], 
                [CurrentStatus], 
                [RemarkDate], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ComplaintRemark]
        END
        ELSE
        BEGIN
            SELECT 
                [ComplaintRemarkID], 
                [ComplaintID], 
                [RemarkBy], 
                [Remark], 
                [CurrentStatus], 
                [RemarkDate], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ComplaintRemark]
            WHERE 
                [ComplaintID] = @ComplaintID
			ORDER BY
				[RemarkDate] DESC
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageConSubType]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageConSubType 'INSERT', NULL, 'New SubType', 1, 'A'

--EXEC sp_ManageConSubType 'UPDATE', 1, 'Updated SubType', 2, 'N'

--EXEC sp_ManageConSubType 'DELETE', 1

--EXEC sp_ManageConSubType 'SELECT'

--EXEC sp_ManageConSubType 'SELECT', 1

CREATE PROCEDURE [dbo].[sp_ManageConSubType]
    @Action NVARCHAR(10),
    @ConSubTypeID NUMERIC(18, 0) = NULL,
    @ConSubType NVARCHAR(500) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_ConSubType] 
        (
            [ConSubType], 
            [CreatedDate], 
            [CreatedBy], 
            [ISBlocked]
        )
        VALUES 
        (
            @ConSubType, 
            GETDATE(), 
            @CreatedBy, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_ConSubType]
        SET 
            [ConSubType] = @ConSubType, 
            [CreatedBy] = @CreatedBy, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [ConSubTypeID] = @ConSubTypeID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_ConSubType]
        WHERE 
            [ConSubTypeID] = @ConSubTypeID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @ConSubTypeID IS NULL
        BEGIN
            SELECT 
                [ConSubTypeID], 
                [ConSubType], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ConSubType]
        END
        ELSE
        BEGIN
            SELECT 
                [ConSubTypeID], 
                [ConSubType], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ConSubType]
            WHERE 
                [ConSubTypeID] = @ConSubTypeID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageConType]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageConType 'INSERT', NULL, 'New Type', 1, 'A'

--EXEC sp_ManageConType 'UPDATE', 1, 'Updated Type', 2, 'N'

--EXEC sp_ManageConType 'DELETE', 1


--EXEC sp_ManageConType 'SELECT'


--EXEC sp_ManageConType 'SELECT', 1


CREATE PROCEDURE [dbo].[sp_ManageConType]
    @Action NVARCHAR(10),
    @ConTypeID NUMERIC(18, 0) = NULL,
    @ConType NVARCHAR(500) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_ConType] 
        (
            [ConType], 
            [CreatedDate], 
            [CreatedBy], 
            [ISBlocked]
        )
        VALUES 
        (
            @ConType, 
            GETDATE(), 
            @CreatedBy, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_ConType]
        SET 
            [ConType] = @ConType, 
            [CreatedBy] = @CreatedBy, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [ConTypeID] = @ConTypeID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_ConType]
        WHERE 
            [ConTypeID] = @ConTypeID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @ConTypeID IS NULL
        BEGIN
            SELECT 
                [ConTypeID], 
                [ConType], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ConType]
        END
        ELSE
        BEGIN
            SELECT 
                [ConTypeID], 
                [ConType], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_ConType]
            WHERE 
                [ConTypeID] = @ConTypeID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageDesignation]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageDesignation 'INSERT', NULL, 'Manager', 1, 'A'

--EXEC sp_ManageDesignation 'UPDATE', 1, 'Senior Manager', NULL, 'N'

--EXEC sp_ManageDesignation 'DELETE', 1

--EXEC sp_ManageDesignation 'SELECT'

--EXEC sp_ManageDesignation 'SELECT', 1

CREATE PROCEDURE [dbo].[sp_ManageDesignation]
    @Action NVARCHAR(10),
    @DesignationID NUMERIC(18, 0) = NULL,
    @DesignationName NVARCHAR(100) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_Designation] 
        (
            [DesignationName], 
            [CreatedDate], 
            [CreatedBy], 
            [ISBlocked]
        )
        VALUES 
        (
            @DesignationName, 
            GETDATE(), 
            @CreatedBy, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_Designation]
        SET 
            [DesignationName] = @DesignationName, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [DesignationID] = @DesignationID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_Designation]
        WHERE 
            [DesignationID] = @DesignationID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @DesignationID IS NULL
        BEGIN
            SELECT 
                [DesignationID], 
                [DesignationName], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_Designation]
        END
        ELSE
        BEGIN
            SELECT 
                [DesignationID], 
                [DesignationName], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_Designation]
            WHERE 
                [DesignationID] = @DesignationID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageDistrict]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageDistrict 'INSERT', 1, 'District A', 'जिला ए', 1, 'A'

--EXEC sp_ManageDistrict 'UPDATE', 1, 'Updated District A', 'अद्यतन जिला ए', 2, 'N'

--EXEC sp_ManageDistrict 'DELETE', 1

--EXEC sp_ManageDistrict 'SELECT'

--EXEC sp_ManageDistrict 'SELECT', 1

CREATE PROCEDURE [dbo].[sp_ManageDistrict]
    @Action NVARCHAR(10),
    @DistrictID NUMERIC(18, 0) = NULL,
    @DistrictName NVARCHAR(50) = NULL,
    @DistrictHindiName NVARCHAR(50) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_District] 
        (
            [DistrictName], 
            [DistrictHindiName], 
            [CreatedDate], 
            [CreatedBy], 
            [ISBlocked]
        )
        VALUES 
        (
            @DistrictName, 
            @DistrictHindiName, 
            GETDATE(), 
            @CreatedBy, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_District]
        SET 
            [DistrictName] = @DistrictName, 
            [DistrictHindiName] = @DistrictHindiName, 
            [CreatedBy] = @CreatedBy, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [DistrictID] = @DistrictID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_District]
        WHERE 
            [DistrictID] = @DistrictID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @DistrictID IS NULL
        BEGIN
            SELECT 
                [DistrictID], 
                [DistrictName], 
                [DistrictHindiName], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_District]
        END
        ELSE
        BEGIN
            SELECT 
                [DistrictID], 
                [DistrictName], 
                [DistrictHindiName], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_District]
            WHERE 
                [DistrictID] = @DistrictID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManageLoginDetails]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManageLoginDetails 'INSERT', NULL, 'user123', 'password123', 1, 2, 3, 'A'

--EXEC sp_ManageLoginDetails 'UPDATE', 1, 'user123', 'newpassword123', 1, 2, 3, 'N'

--EXEC sp_ManageLoginDetails 'DELETE', 1

--EXEC sp_ManageLoginDetails 'SELECT'

--EXEC sp_ManageLoginDetails 'SELECT', 1

--
CREATE PROCEDURE [dbo].[sp_ManageLoginDetails]
    @Action NVARCHAR(10),
    @ID NUMERIC(18, 0) = NULL,
    @UserID VARCHAR(50) = NULL,
    @Password NVARCHAR(50) = NULL,
    @PersonInfoID NUMERIC(18, 0) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @UserRoleID NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_LoginDetails] 
        (
            [UserID], 
            [Password], 
            [PersonInfoID], 
            [CreatedDate], 
            [CreatedBy], 
            [UserRoleID], 
            [ISBlocked]
        )
        VALUES 
        (
            @UserID, 
            @Password, 
            @PersonInfoID, 
            GETDATE(), 
            @CreatedBy, 
            @UserRoleID, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_LoginDetails]
        SET 
            [UserID] = @UserID, 
            [Password] = @Password, 
            [PersonInfoID] = @PersonInfoID, 
            [CreatedBy] = @CreatedBy, 
            [UserRoleID] = @UserRoleID, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [ID] = @ID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_LoginDetails]
        WHERE 
            [ID] = @ID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @ID IS NULL
        BEGIN
            SELECT 
                [ID], 
                [UserID], 
                [Password], 
                [PersonInfoID], 
                [CreatedDate], 
                [CreatedBy], 
                [UserRoleID], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_LoginDetails]
        END
        ELSE
        BEGIN
            SELECT 
                [ID], 
                [UserID], 
                [Password], 
                [PersonInfoID], 
                [CreatedDate], 
                [CreatedBy], 
                [UserRoleID], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_LoginDetails]
            WHERE 
                [ID] = @ID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ManagePersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC sp_ManagePersonInfo 'INSERT', NULL, 'John Doe', '1234567890', 'john.doe@example.com', '123 Main St', 1, 1, 1, 2, 'A'

--EXEC sp_ManagePersonInfo 'UPDATE', 1, 'John Doe', '0987654321', 'john.doe@example.com', '456 Elm St', 2, 2, 2, 3, 'N'

--EXEC sp_ManagePersonInfo 'DELETE', 1

--EXEC sp_ManagePersonInfo 'SELECT'


--EXEC sp_ManagePersonInfo 'SELECT', 1


CREATE PROCEDURE [dbo].[sp_ManagePersonInfo]
    @Action NVARCHAR(10),
    @PersonInfoID NUMERIC(18, 0) = NULL,
    @Name NVARCHAR(50) = NULL,
    @Mobile NVARCHAR(20) = NULL,
    @Email NVARCHAR(50) = NULL,
    @Address NVARCHAR(500) = NULL,
    @DistrictID NUMERIC(18, 0) = NULL,
    @BlockID NUMERIC(18, 0) = NULL,
    @DesignationID NUMERIC(18, 0) = NULL,
    @CreatedBy NUMERIC(18, 0) = NULL,
    @ISBlocked CHAR(1) = 'A'
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'INSERT'
    BEGIN
        INSERT INTO [dbo].[tbl_PersonInfo] 
        (
            [Name], 
            [Mobile], 
            [Email], 
            [Address], 
            [DistrictID], 
            [BlockID], 
            [DesignationID], 
            [CreatedDate], 
            [CreatedBy], 
            [ISBlocked]
        )
        VALUES 
        (
            @Name, 
            @Mobile, 
            @Email, 
            @Address, 
            @DistrictID, 
            @BlockID, 
            @DesignationID, 
            GETDATE(), 
            @CreatedBy, 
            @ISBlocked
        )
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE [dbo].[tbl_PersonInfo]
        SET 
            [Name] = @Name, 
            [Mobile] = @Mobile, 
            [Email] = @Email, 
            [Address] = @Address, 
            [DistrictID] = @DistrictID, 
            [BlockID] = @BlockID, 
            [DesignationID] = @DesignationID, 
            [CreatedBy] = @CreatedBy, 
            [ISBlocked] = @ISBlocked
        WHERE 
            [PersonInfoID] = @PersonInfoID
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM [dbo].[tbl_PersonInfo]
        WHERE 
            [PersonInfoID] = @PersonInfoID
    END
    ELSE IF @Action = 'SELECT'
    BEGIN
        IF @PersonInfoID IS NULL
        BEGIN
            SELECT 
                [PersonInfoID], 
                [Name], 
                [Mobile], 
                [Email], 
                [Address], 
                [DistrictID], 
                [BlockID], 
                [DesignationID], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_PersonInfo]
        END
        ELSE
        BEGIN
            SELECT 
                [PersonInfoID], 
                [Name], 
                [Mobile], 
                [Email], 
                [Address], 
                [DistrictID], 
                [BlockID], 
                [DesignationID], 
                [CreatedDate], 
                [CreatedBy], 
                [ISBlocked]
            FROM 
                [dbo].[tbl_PersonInfo]
            WHERE 
                [PersonInfoID] = @PersonInfoID
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectOfficerMaster]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectOfficerMaster]
    @OfficerID NUMERIC(18, 0) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @OfficerID IS NULL
    BEGIN
        SELECT 
            [OfficerID], 
            [OfficerName], 
            [OfficerMobile], 
            [OfficerEmail], 
            [OfficerDesignation], 
            o.[OfficerDistrict],
			d.[DistrictName],
            o.[CreatedBY], 
            o.[CreatedDate], 
            o.[isBlocked]
        FROM 
            [dbo].[tbl_OfficerMaster] o
		inner join
			[dbo].[tbl_District] d
		on 
			o.[OfficerDistrict] = d.[DistrictID]
    END
    ELSE
    BEGIN
        SELECT 
            [OfficerID], 
            [OfficerName], 
            [OfficerMobile], 
            [OfficerEmail], 
            [OfficerDesignation], 
            o.[OfficerDistrict],
			d.[DistrictName],
            o.[CreatedBY], 
            o.[CreatedDate], 
            o.[isBlocked]
        FROM 
            [dbo].[tbl_OfficerMaster] o
		inner join
			[dbo].[tbl_District] d
		on 
			o.[OfficerDistrict] = d.[DistrictID]
        WHERE 
            [OfficerID] = @OfficerID
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOfficerMaster]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateOfficerMaster]
    @OfficerID NUMERIC(18, 0),
    @OfficerName NVARCHAR(50),
    @OfficerMobile NVARCHAR(20),
    @OfficerEmail NVARCHAR(50),
    @OfficerDesignation NVARCHAR(50),
    @OfficerDistrict NUMERIC(18, 0),
    @isBlocked CHAR(1)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[tbl_OfficerMaster]
    SET 
        [OfficerName] = @OfficerName, 
        [OfficerMobile] = @OfficerMobile, 
        [OfficerEmail] = @OfficerEmail, 
        [OfficerDesignation] = @OfficerDesignation, 
        [OfficerDistrict] = @OfficerDistrict, 
        [isBlocked] = @isBlocked
    WHERE 
        [OfficerID] = @OfficerID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePersonInfo]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdatePersonInfo]  
    @PersonInfoID NUMERIC(18, 0),  
    @Name NVARCHAR(50),  
    @Mobile NVARCHAR(20),  
    @Email NVARCHAR(50),  
    @Address NVARCHAR(500),  
    @DistrictID NUMERIC(18, 0),  
    @BlockID NUMERIC(18, 0),  
    @DesignationID NUMERIC(18, 0),  
    @CreatedBy NUMERIC(18, 0),  
    @ISBlocked CHAR(1),
	@UserID nvarchar(50),
	@Password nvarchar(20)
AS  
BEGIN  
Declare @count int = 0
Declare @PersonInfo int = 0
set @count = (select count(1) from tbl_PersonInfo where UserID = @UserID)
if(@count>0)
begin

set @PersonInfo = (select PersonInfoID from tbl_PersonInfo where UserID = @UserID)
print '@PersonInfo'
print @PersonInfo
print @PersonInfoID
end
if(@PersonInfo = @PersonInfoID or @count = 0)
begin
    UPDATE tbl_PersonInfo  
    SET Name = @Name,  
        Mobile = @Mobile,  
        Email = @Email,  
        Address = @Address,  
        DistrictID = @DistrictID,  
        BlockID = @BlockID,  
        DesignationID = @DesignationID,  
        CreatedBy = @CreatedBy,  
        ISBlocked = @ISBlocked,
		UserID = @UserID,
		Password = @Password
    WHERE PersonInfoID = @PersonInfoID;

	select @@ROWCOUNT as 'Status'
end
else
begin
	select -1 as 'Status'
end
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateBroadcast]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CreateBroadcast]
    @BroadcastType NUMERIC(18, 0),
    @Broadcast NVARCHAR(2500) = NULL,
    @BroadcastDate DATETIME = NULL,
    @BroadcastRemark NVARCHAR(2500) = NULL,
    @BroadcastStatus CHAR(2) = 'A',
    @ReleaseStatus CHAR(1) = 'N',
    @ReleaseDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @BroadcastDate IS NULL
    BEGIN
        SET @BroadcastDate = GETDATE();
    END
    
    IF @ReleaseDate IS NULL
    BEGIN
        SET @ReleaseDate = GETDATE();
    END

    INSERT INTO [dbo].[tbl_Broadcast] 
    (
        BroadcastType, 
        Broadcast, 
        BroadcastDate, 
        BroadcastRemark, 
        BroadcastStatus, 
        ReleaseStatus, 
        ReleaseDate
    ) 
    VALUES 
    (
        @BroadcastType, 
        @Broadcast, 
        @BroadcastDate, 
        @BroadcastRemark, 
        @BroadcastStatus, 
        @ReleaseStatus, 
        @ReleaseDate
    );

    SELECT SCOPE_IDENTITY() AS BroadcastID;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteBroadcast]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteBroadcast]
    @BroadcastID NUMERIC(18, 0)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[tbl_Broadcast]
    WHERE BroadcastID = @BroadcastID;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBroadcast]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateBroadcast]
    @BroadcastID NUMERIC(18, 0),
    @BroadcastType NUMERIC(18, 0),
    @Broadcast NVARCHAR(2500) = NULL,
    @BroadcastDate DATETIME = NULL,
    @BroadcastRemark NVARCHAR(2500) = NULL,
    @BroadcastStatus CHAR(2) = 'A',
    @ReleaseStatus CHAR(1) = 'N',
    @ReleaseDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[tbl_Broadcast]
    SET 
        BroadcastType = @BroadcastType,
        Broadcast = @Broadcast,
        BroadcastDate = @BroadcastDate,
        BroadcastRemark = @BroadcastRemark,
        BroadcastStatus = @BroadcastStatus,
        ReleaseStatus = @ReleaseStatus,
        ReleaseDate = @ReleaseDate
    WHERE 
        BroadcastID = @BroadcastID;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateReleaseStatus]    Script Date: 11/16/2024 1:37:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateReleaseStatus]
    @BroadcastID NUMERIC(18, 0),
    @ReleaseStatus CHAR(1),
    @ReleaseDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @ReleaseDate IS NULL
    BEGIN
        SET @ReleaseDate = GETDATE();
    END

    UPDATE [dbo].[tbl_Broadcast]
    SET 
        ReleaseStatus = @ReleaseStatus,
        ReleaseDate = @ReleaseDate
    WHERE 
        BroadcastID = @BroadcastID;
END;
GO
USE [master]
GO
ALTER DATABASE [MamaApp] SET  READ_WRITE 
GO
