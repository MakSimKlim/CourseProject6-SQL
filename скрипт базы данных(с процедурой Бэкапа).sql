USE [master]
GO
/****** Object:  Database [DBFlatSale]    Script Date: 27.02.2024 15:06:20 ******/
CREATE DATABASE [DBFlatSale]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBFlatSale', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBFlatSale.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBFlatSale_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBFlatSale_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBFlatSale] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBFlatSale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBFlatSale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBFlatSale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBFlatSale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBFlatSale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBFlatSale] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBFlatSale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBFlatSale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBFlatSale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBFlatSale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBFlatSale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBFlatSale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBFlatSale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBFlatSale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBFlatSale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBFlatSale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBFlatSale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBFlatSale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBFlatSale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBFlatSale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBFlatSale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBFlatSale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBFlatSale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBFlatSale] SET RECOVERY FULL 
GO
ALTER DATABASE [DBFlatSale] SET  MULTI_USER 
GO
ALTER DATABASE [DBFlatSale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBFlatSale] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBFlatSale] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBFlatSale] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBFlatSale] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBFlatSale] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBFlatSale', N'ON'
GO
ALTER DATABASE [DBFlatSale] SET QUERY_STORE = OFF
GO
USE [DBFlatSale]
GO
/****** Object:  Table [dbo].[ApartmentFinishing]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentFinishing](
	[AppartmentFinishingID] [int] NOT NULL,
	[ApartmentID] [int] NOT NULL,
	[CoefficientID] [int] NOT NULL,
 CONSTRAINT [PK_ApartmentFinishing_1] PRIMARY KEY CLUSTERED 
(
	[AppartmentFinishingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [decimal](8, 2) NOT NULL,
	[Rooms] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[IsSold] [bit] NOT NULL,
 CONSTRAINT [PK__Apartmen__CBDF57442A2312FB] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buyers]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyers](
	[BuyerID] [int] IDENTITY(1,1) NOT NULL,
	[FullNameBuyer] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DateBirthday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BuyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinishingPriceCoefficients]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishingPriceCoefficients](
	[CoefficientID] [int] IDENTITY(1,1) NOT NULL,
	[FinishingTypeID] [int] NOT NULL,
	[PriceCoefficient] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoefficientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinishingTypes]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishingTypes](
	[FinishingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[FinishingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealtorCompanyLinks]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealtorCompanyLinks](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[RealtorID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realtors]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realtors](
	[RealtorID] [int] IDENTITY(1,1) NOT NULL,
	[FullNameRealtors] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DateBirthday] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RealtorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealtorSalaryLinks]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealtorSalaryLinks](
	[RealtorSalaryLinksID] [nchar](10) NOT NULL,
	[RealtorID] [int] NOT NULL,
	[SalaryID] [int] NOT NULL,
 CONSTRAINT [PK_RealtorSalaryLinks] PRIMARY KEY CLUSTERED 
(
	[RealtorSalaryLinksID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealtyCompanies]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealtyCompanies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salary]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[SalaryID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] NOT NULL,
	[ApartmentID] [int] NULL,
	[RealtorID] [int] NULL,
	[BuyerID] [int] NULL,
	[SaleDate] [date] NULL,
	[FinishingTypeID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (1, 26, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (2, 33, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (3, 39, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (4, 13, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (5, 23, 4)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (6, 40, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (7, 21, 2)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (8, 11, 2)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (9, 8, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (10, 28, 2)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (11, 19, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (12, 2, 2)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (13, 10, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (14, 5, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (15, 30, 4)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (16, 7, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (17, 37, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (18, 25, 4)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (19, 12, 4)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (20, 4, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (21, 34, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (22, 17, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (23, 3, 3)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (24, 1, 1)
INSERT [dbo].[ApartmentFinishing] ([AppartmentFinishingID], [ApartmentID], [CoefficientID]) VALUES (25, 38, 3)
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 

INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (1, CAST(60.00 AS Decimal(8, 2)), 1, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (2, CAST(80.00 AS Decimal(8, 2)), 2, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (3, CAST(100.00 AS Decimal(8, 2)), 3, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (4, CAST(120.00 AS Decimal(8, 2)), 4, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (5, CAST(60.00 AS Decimal(8, 2)), 1, 2, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (6, CAST(80.00 AS Decimal(8, 2)), 2, 2, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (7, CAST(100.00 AS Decimal(8, 2)), 3, 2, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (8, CAST(120.00 AS Decimal(8, 2)), 4, 2, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (9, CAST(60.00 AS Decimal(8, 2)), 1, 3, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (10, CAST(80.00 AS Decimal(8, 2)), 2, 3, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (11, CAST(100.00 AS Decimal(8, 2)), 3, 3, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (12, CAST(120.00 AS Decimal(8, 2)), 4, 3, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (13, CAST(60.00 AS Decimal(8, 2)), 1, 4, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (14, CAST(80.00 AS Decimal(8, 2)), 2, 4, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (15, CAST(100.00 AS Decimal(8, 2)), 3, 4, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (16, CAST(120.00 AS Decimal(8, 2)), 4, 4, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (17, CAST(60.00 AS Decimal(8, 2)), 1, 5, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (18, CAST(80.00 AS Decimal(8, 2)), 2, 5, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (19, CAST(100.00 AS Decimal(8, 2)), 3, 5, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (20, CAST(120.00 AS Decimal(8, 2)), 4, 5, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (21, CAST(60.00 AS Decimal(8, 2)), 1, 6, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (22, CAST(80.00 AS Decimal(8, 2)), 2, 6, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (23, CAST(100.00 AS Decimal(8, 2)), 3, 6, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (24, CAST(120.00 AS Decimal(8, 2)), 4, 6, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (25, CAST(60.00 AS Decimal(8, 2)), 1, 7, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (26, CAST(80.00 AS Decimal(8, 2)), 2, 7, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (27, CAST(100.00 AS Decimal(8, 2)), 3, 7, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (28, CAST(120.00 AS Decimal(8, 2)), 4, 7, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (29, CAST(60.00 AS Decimal(8, 2)), 1, 8, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (30, CAST(80.00 AS Decimal(8, 2)), 2, 8, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (31, CAST(100.00 AS Decimal(8, 2)), 3, 8, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (32, CAST(120.00 AS Decimal(8, 2)), 4, 8, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (33, CAST(60.00 AS Decimal(8, 2)), 1, 9, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (34, CAST(80.00 AS Decimal(8, 2)), 2, 9, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (35, CAST(100.00 AS Decimal(8, 2)), 3, 9, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (36, CAST(120.00 AS Decimal(8, 2)), 4, 9, 0)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (37, CAST(60.00 AS Decimal(8, 2)), 1, 10, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (38, CAST(80.00 AS Decimal(8, 2)), 2, 10, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (39, CAST(100.00 AS Decimal(8, 2)), 3, 10, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [Area], [Rooms], [Floor], [IsSold]) VALUES (40, CAST(120.00 AS Decimal(8, 2)), 4, 10, 1)
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Buyers] ON 

INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (1, N'Сергей Петрович Кузнецов', N'sfgsg@example.com', N'+79001234567', CAST(N'1958-04-23' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (3, N'Владислав Владимирович Носов', N'hgjdjh@example.com', N'+79023456789', CAST(N'1960-02-15' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (4, N'Геннадий Птрович Смирнов', N'xnnxbx@example.com', N'+79034567890', CAST(N'1964-08-20' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (5, N'Иван Сергеевич Репин', N'xnbnbvn@example.com', N'+79045678901', CAST(N'2002-01-29' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (6, N'Совостьян Данилович Артемов', N'xbncxnc@example.com', N'+79056789012', CAST(N'1961-07-13' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (7, N'Влас Максимович Залужный', N'cmmvb@example.com', N'+79067890123', CAST(N'1989-12-24' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (8, N'Алексей Григорьевич Ветров', N'erag@example.com', N'+79078901234', CAST(N'1999-03-17' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (9, N'Андрей Сидорович Козлов', N'xncchj9@example.com', N'+79089012345', CAST(N'1978-06-11' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (10, N'Анастасия Петровна Иванова', N'hgcgmn@example.com', N'+79090123456', CAST(N'1982-09-05' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (11, N'Любовь Ивановна Петросян', N'fghsdhd@example.com', N'+79101234567', CAST(N'2001-10-30' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (12, N'Евгений Иванович Леонов', N'sdhfghgf@example.com', N'+79112345678', CAST(N'1963-05-25' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (13, N'Лариса Дмитриевна Смолина', N'fgszzbvc@example.com', N'+79123456789', CAST(N'1975-08-19' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (14, N'Валерий Геннадьевич Якубов', N'erteet@example.com', N'+79134567890', CAST(N'1995-11-13' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (15, N'Вячеслав Иванович Власов', N'retgedgf@example.com', N'+79145678901', CAST(N'1986-02-07' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (16, N'Кирилл Александрович Василенко', N'ertgdfgf@example.com', N'+79156789012', CAST(N'1972-05-03' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (17, N'Василиса Александрована Грабарь', N'gdfgdfg@example.com', N'+79167890123', CAST(N'1996-07-28' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (18, N'Сергей Александрович Путин', N'bcvbcb@example.com', N'+79178901234', CAST(N'1965-10-22' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (19, N'Валерий Винеаминович Ленин', N'sdfgfh9@example.com', N'+79189012345', CAST(N'1979-01-16' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (20, N'Иосиф Виссарионович Сталин', N'fhgfh0@example.com', N'+79190123456', CAST(N'1983-04-12' AS Date))
INSERT [dbo].[Buyers] ([BuyerID], [FullNameBuyer], [Email], [PhoneNumber], [DateBirthday]) VALUES (21, N'Гирри Ананасович Абрикосов', N'email@example.com', N'+79101234567', CAST(N'1980-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Buyers] OFF
GO
SET IDENTITY_INSERT [dbo].[FinishingPriceCoefficients] ON 

INSERT [dbo].[FinishingPriceCoefficients] ([CoefficientID], [FinishingTypeID], [PriceCoefficient]) VALUES (1, 1, CAST(1.00 AS Decimal(5, 2)))
INSERT [dbo].[FinishingPriceCoefficients] ([CoefficientID], [FinishingTypeID], [PriceCoefficient]) VALUES (2, 2, CAST(1.20 AS Decimal(5, 2)))
INSERT [dbo].[FinishingPriceCoefficients] ([CoefficientID], [FinishingTypeID], [PriceCoefficient]) VALUES (3, 3, CAST(1.40 AS Decimal(5, 2)))
INSERT [dbo].[FinishingPriceCoefficients] ([CoefficientID], [FinishingTypeID], [PriceCoefficient]) VALUES (4, 4, CAST(1.80 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[FinishingPriceCoefficients] OFF
GO
SET IDENTITY_INSERT [dbo].[FinishingTypes] ON 

INSERT [dbo].[FinishingTypes] ([FinishingTypeID], [TypeName], [Description]) VALUES (1, N'Без отделки', N'Квартира без внутренней отделки')
INSERT [dbo].[FinishingTypes] ([FinishingTypeID], [TypeName], [Description]) VALUES (2, N'Предчистовая отделка', N'Квартира с предчистовой отделкой')
INSERT [dbo].[FinishingTypes] ([FinishingTypeID], [TypeName], [Description]) VALUES (3, N'Чистовая отделка', N'Квартира с чистовой отделкой')
INSERT [dbo].[FinishingTypes] ([FinishingTypeID], [TypeName], [Description]) VALUES (4, N'Дизайнерская отделка', N'Квартира с дизайнерской отделкой')
SET IDENTITY_INSERT [dbo].[FinishingTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[RealtorCompanyLinks] ON 

INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (1, 1, 1)
INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (2, 2, 1)
INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (3, 3, 1)
INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (4, 4, 2)
INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (5, 5, 2)
INSERT [dbo].[RealtorCompanyLinks] ([LinkID], [RealtorID], [CompanyID]) VALUES (6, 6, 2)
SET IDENTITY_INSERT [dbo].[RealtorCompanyLinks] OFF
GO
SET IDENTITY_INSERT [dbo].[Realtors] ON 

INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (1, N'Валерий Ефимович Коненко', N'realtorDSFSDF@example.com', N'+79102345678', CAST(N'1970-08-04' AS Date))
INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (2, N'Геннадий Назарович Шаповалов', N'realtorSDFSDF@example.com', N'+79113456789', CAST(N'1975-04-14' AS Date))
INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (3, N'Алексей Сергеевич Слон', N'realtorDFGDFG@example.com', N'+79124567890', CAST(N'1980-09-03' AS Date))
INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (4, N'Василий Иосифович Виторган', N'realtorGDFGD@example.com', N'+79135678901', CAST(N'1990-09-17' AS Date))
INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (5, N'Виктор Владимирович Лазаренко', N'realtorCBCVB@example.com', N'+79146789012', CAST(N'1980-05-27' AS Date))
INSERT [dbo].[Realtors] ([RealtorID], [FullNameRealtors], [Email], [PhoneNumber], [DateBirthday]) VALUES (6, N'Иван Петрович Смирнов', N'realtorJKYHJK@example.com', N'+79168901234', CAST(N'1975-07-20' AS Date))
SET IDENTITY_INSERT [dbo].[Realtors] OFF
GO
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'1         ', 1, 1)
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'2         ', 2, 2)
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'3         ', 3, 3)
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'4         ', 4, 4)
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'5         ', 5, 5)
INSERT [dbo].[RealtorSalaryLinks] ([RealtorSalaryLinksID], [RealtorID], [SalaryID]) VALUES (N'6         ', 6, 6)
GO
SET IDENTITY_INSERT [dbo].[RealtyCompanies] ON 

INSERT [dbo].[RealtyCompanies] ([CompanyID], [CompanyName], [Address], [Phone], [Email]) VALUES (1, N'RealtStroy', N'г.Москва, ул.Ленина, 36, оф.205', N'+79503658977', N'RealtStroy@yandex.ru')
INSERT [dbo].[RealtyCompanies] ([CompanyID], [CompanyName], [Address], [Phone], [Email]) VALUES (2, N'FlatSoldRealty', N'г.Москва, ул.Пушкина, 48, оф 306', N'+74954569871', N'FlatSoldRealty@yandex.ru')
SET IDENTITY_INSERT [dbo].[RealtyCompanies] OFF
GO
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (1, CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (2, CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (3, CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (4, CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (5, CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[Salary] ([SalaryID], [Amount]) VALUES (6, CAST(100000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (1, 26, 3, 7, CAST(N'2023-12-01' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (2, 33, 1, 3, CAST(N'2023-12-12' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (3, 39, 2, 15, CAST(N'2023-12-15' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (4, 13, 5, 6, CAST(N'2023-12-15' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (5, 23, 1, 6, CAST(N'2023-12-25' AS Date), 4)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (6, 40, 3, 9, CAST(N'2023-12-26' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (7, 21, 5, 6, CAST(N'2023-12-28' AS Date), 2)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (8, 11, 3, 1, CAST(N'2023-12-30' AS Date), 2)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (9, 8, 4, 15, CAST(N'2023-12-31' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (10, 28, 5, 7, CAST(N'2024-01-09' AS Date), 2)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (11, 19, 5, 6, CAST(N'2024-01-10' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (12, 2, 4, 16, CAST(N'2024-01-12' AS Date), 2)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (13, 10, 5, 4, CAST(N'2024-01-13' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (14, 5, 3, 15, CAST(N'2024-01-18' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (15, 30, 2, 6, CAST(N'2024-01-20' AS Date), 4)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (16, 7, 4, 14, CAST(N'2024-01-28' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (17, 37, 6, 8, CAST(N'2024-01-31' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (18, 25, 3, 3, CAST(N'2024-02-01' AS Date), 4)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (19, 12, 1, 16, CAST(N'2024-02-10' AS Date), 4)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (20, 4, 4, 8, CAST(N'2024-02-11' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (21, 34, 4, 5, CAST(N'2024-02-15' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (22, 17, 5, 14, CAST(N'2024-02-16' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (23, 3, 2, 7, CAST(N'2024-02-16' AS Date), 3)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (24, 1, 4, 14, CAST(N'2024-02-16' AS Date), 1)
INSERT [dbo].[Sales] ([SaleID], [ApartmentID], [RealtorID], [BuyerID], [SaleDate], [FinishingTypeID]) VALUES (25, 38, 4, 8, CAST(N'2024-02-20' AS Date), 3)
GO
ALTER TABLE [dbo].[ApartmentFinishing]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentFinishing_Apartments] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartments] ([ApartmentID])
GO
ALTER TABLE [dbo].[ApartmentFinishing] CHECK CONSTRAINT [FK_ApartmentFinishing_Apartments]
GO
ALTER TABLE [dbo].[ApartmentFinishing]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentFinishing_FinishingPriceCoefficients] FOREIGN KEY([CoefficientID])
REFERENCES [dbo].[FinishingPriceCoefficients] ([CoefficientID])
GO
ALTER TABLE [dbo].[ApartmentFinishing] CHECK CONSTRAINT [FK_ApartmentFinishing_FinishingPriceCoefficients]
GO
ALTER TABLE [dbo].[FinishingPriceCoefficients]  WITH CHECK ADD  CONSTRAINT [FK_FinishingPriceCoefficients_FinishingTypes] FOREIGN KEY([FinishingTypeID])
REFERENCES [dbo].[FinishingTypes] ([FinishingTypeID])
GO
ALTER TABLE [dbo].[FinishingPriceCoefficients] CHECK CONSTRAINT [FK_FinishingPriceCoefficients_FinishingTypes]
GO
ALTER TABLE [dbo].[RealtorCompanyLinks]  WITH CHECK ADD  CONSTRAINT [FK_RealtorCompanyLinks_Realtors] FOREIGN KEY([RealtorID])
REFERENCES [dbo].[Realtors] ([RealtorID])
GO
ALTER TABLE [dbo].[RealtorCompanyLinks] CHECK CONSTRAINT [FK_RealtorCompanyLinks_Realtors]
GO
ALTER TABLE [dbo].[RealtorCompanyLinks]  WITH CHECK ADD  CONSTRAINT [FK_RealtorCompanyLinks_RealtyCompanies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[RealtyCompanies] ([CompanyID])
GO
ALTER TABLE [dbo].[RealtorCompanyLinks] CHECK CONSTRAINT [FK_RealtorCompanyLinks_RealtyCompanies]
GO
ALTER TABLE [dbo].[RealtorSalaryLinks]  WITH CHECK ADD  CONSTRAINT [FK__RealtorSa__Realt__5DCAEF64] FOREIGN KEY([RealtorID])
REFERENCES [dbo].[Realtors] ([RealtorID])
GO
ALTER TABLE [dbo].[RealtorSalaryLinks] CHECK CONSTRAINT [FK__RealtorSa__Realt__5DCAEF64]
GO
ALTER TABLE [dbo].[RealtorSalaryLinks]  WITH CHECK ADD  CONSTRAINT [FK__RealtorSa__Salar__5EBF139D] FOREIGN KEY([SalaryID])
REFERENCES [dbo].[Salary] ([SalaryID])
GO
ALTER TABLE [dbo].[RealtorSalaryLinks] CHECK CONSTRAINT [FK__RealtorSa__Salar__5EBF139D]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Apartments] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartments] ([ApartmentID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Apartments]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Buyers] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Buyers] ([BuyerID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Buyers]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Realtors] FOREIGN KEY([RealtorID])
REFERENCES [dbo].[Realtors] ([RealtorID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Realtors]
GO
/****** Object:  StoredProcedure [dbo].[BackupDBFlatSale]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BackupDBFlatSale]
AS
BEGIN
    EXEC sp_addumpdevice 
    @devtype = 'disk', 
    @logicalname = 'MyFolder', 
    @physicalname = 'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\DBFlatSale(с процедурой Бэкапа).bak'

    BACKUP DATABASE DBFlatSale
    TO MyFolder
    WITH INIT;

    EXEC sp_dropdevice 'MyFolder'
END

GO
/****** Object:  StoredProcedure [dbo].[CreateInsurersAndLinks]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateInsurersAndLinks]
AS
BEGIN
    SET NOCOUNT ON;

    -- Создание таблицы Insurers
    IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Insurers' AND xtype='U')
    CREATE TABLE Insurers (
        InsurerID int PRIMARY KEY,
        FullNameInsurer varchar(255),
        Email varchar(255),
        PhoneNumber varchar(20),
        DateBirthday date
    );

    -- Создание таблицы InsurerCompanyLinks
    IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='InsurerCompanyLinks' AND xtype='U')
    CREATE TABLE InsurerCompanyLinks (
        LinkID int PRIMARY KEY,
        InsurerID int,
        CompanyID int,
        FOREIGN KEY (InsurerID) REFERENCES Insurers(InsurerID),
        FOREIGN KEY (CompanyID) REFERENCES RealtyCompanies(CompanyID)
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteInsurersAndLinks]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInsurersAndLinks]
AS
BEGIN
    SET NOCOUNT ON;

    -- Проверка наличия таблицы InsurerCompanyLinks перед удалением
    IF EXISTS (SELECT * FROM sysobjects WHERE name='InsurerCompanyLinks' AND xtype='U')
    DROP TABLE InsurerCompanyLinks;

    -- Проверка наличия таблицы Insurers перед удалением
    IF EXISTS (SELECT * FROM sysobjects WHERE name='Insurers' AND xtype='U')
    DROP TABLE Insurers;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewBuyer]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Хранимая процедура для добавления нового покупателя
CREATE PROCEDURE [dbo].[sp_AddNewBuyer]
    @FullNameBuyer NVARCHAR(100),
    @Email NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @DateBirthday DATE
AS
BEGIN
    INSERT INTO [dbo].[Buyers] (FullNameBuyer, Email, PhoneNumber, DateBirthday)
    VALUES (@FullNameBuyer, @Email, @PhoneNumber, @DateBirthday)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ViewApartmentDetails]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewApartmentDetails]
AS
BEGIN
    DECLARE @CostPerSquareMeter MONEY = 200000;

    SELECT 
        a.ApartmentID as 'Номер квартиры',
        a.Floor as 'Этаж',
        a.Rooms as 'Кол-во комнат',
        a.Area as 'Площадь',
        ISNULL(ft.TypeName, 'Без отделки') as 'Отделка',
        ISNULL(fpc.PriceCoefficient, 1) as 'Ценовой коэффициент',
        (a.Area * ISNULL(fpc.PriceCoefficient, 1) * @CostPerSquareMeter) as 'Общая стоимость',
        CASE 
            WHEN a.IsSold = 1 THEN 'Продана'
            ELSE 'Не продана'
        END as 'Статус продажи',
        s.SaleDate as 'Дата продажи'
    FROM Apartments a
    LEFT JOIN ApartmentFinishing af ON a.ApartmentID = af.ApartmentID AND a.IsSold = 1
    LEFT JOIN FinishingPriceCoefficients fpc ON af.CoefficientID = fpc.CoefficientID
    LEFT JOIN FinishingTypes ft ON fpc.FinishingTypeID = ft.FinishingTypeID
    LEFT JOIN Sales s ON a.ApartmentID = s.ApartmentID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewBuyerDetails]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewBuyerDetails]
AS
BEGIN
    DECLARE @CostPerSquareMeter MONEY = 200000;

    SELECT 
        b.FullNameBuyer as 'Имя покупателя',
        COUNT(s.SaleID) as 'Количество купленных квартир',
        SUM(a.Area * ISNULL(fpc.PriceCoefficient, 1) * @CostPerSquareMeter) as 'Общая стоимость',
        DATEDIFF(YEAR, b.DateBirthday, GETDATE()) as 'Возраст'
    FROM Buyers b
    LEFT JOIN Sales s ON b.BuyerID = s.BuyerID
    LEFT JOIN Apartments a ON s.ApartmentID = a.ApartmentID
    LEFT JOIN ApartmentFinishing af ON a.ApartmentID = af.ApartmentID AND a.IsSold = 1
    LEFT JOIN FinishingPriceCoefficients fpc ON af.CoefficientID = fpc.CoefficientID
    GROUP BY b.FullNameBuyer, b.DateBirthday
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewRealtorSalary]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewRealtorSalary]
    @CompanyID INT
AS
BEGIN
    SELECT r.FullNameRealtors, rc.CompanyName as RealtyCompany, SUM(s.Amount) as TotalSalary
    FROM Realtors r
    JOIN RealtorSalaryLinks rsl ON r.RealtorID = rsl.RealtorID
    JOIN Salary s ON rsl.SalaryID = s.SalaryID
    JOIN RealtorCompanyLinks rcl ON r.RealtorID = rcl.RealtorID
    JOIN RealtyCompanies rc ON rcl.CompanyID = rc.CompanyID
    WHERE rcl.CompanyID = @CompanyID
    GROUP BY r.FullNameRealtors, rc.CompanyName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewRealtorSales]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewRealtorSales]
AS
BEGIN
    DECLARE @CostPerSquareMeter MONEY = 200000;

    SELECT 
        r.FullNameRealtors as 'Имя риэлтора',
        rc.CompanyName as 'Риэлторское агентство',
        COUNT(s.SaleID) as 'Количество проданных квартир',
        SUM(a.Area * @CostPerSquareMeter) as 'Общая сумма продаж'
    FROM Realtors r
    JOIN Sales s ON r.RealtorID = s.RealtorID
    JOIN Apartments a ON s.ApartmentID = a.ApartmentID
    JOIN RealtorCompanyLinks rcl ON r.RealtorID = rcl.RealtorID
    JOIN RealtyCompanies rc ON rcl.CompanyID = rc.CompanyID
    GROUP BY r.FullNameRealtors, rc.CompanyName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewSalesDetails]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewSalesDetails]
AS
BEGIN
    SELECT 
        a.ApartmentID as 'Номер квартиры',
        a.Rooms as 'Кол-во комнат',
        a.Floor as 'Этаж',
        b.FullNameBuyer as 'Имя покупателя',
        r.FullNameRealtors as 'Имя риэлтора',
        s.SaleDate as 'Дата продажи'
    FROM Sales s
    JOIN Apartments a ON s.ApartmentID = a.ApartmentID
    JOIN Buyers b ON s.BuyerID = b.BuyerID
    JOIN Realtors r ON s.RealtorID = r.RealtorID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewSoldApartmentsLastYear]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewSoldApartmentsLastYear]
AS
BEGIN
    DECLARE @CostPerSquareMeter MONEY = 200000;
    DECLARE @LastYear DATE = DATEADD(YEAR, -1, GETDATE());

    SELECT 
        a.ApartmentID as 'Номер квартиры',
        b.FullNameBuyer as 'Имя владельца',
        rc.CompanyName as 'Риэлторское агентство',
        (a.Area * ISNULL(fpc.PriceCoefficient, 1) * @CostPerSquareMeter) as 'Полная стоимость',
        s.SaleDate as 'Дата продажи'
    FROM Apartments a
    JOIN Sales s ON a.ApartmentID = s.ApartmentID
    JOIN Buyers b ON s.BuyerID = b.BuyerID
    LEFT JOIN ApartmentFinishing af ON a.ApartmentID = af.ApartmentID AND a.IsSold = 1
    LEFT JOIN FinishingPriceCoefficients fpc ON af.CoefficientID = fpc.CoefficientID
    LEFT JOIN RealtorCompanyLinks rcl ON s.RealtorID = rcl.RealtorID
    LEFT JOIN RealtyCompanies rc ON rcl.CompanyID = rc.CompanyID
    WHERE YEAR(s.SaleDate) = YEAR(@LastYear) AND a.IsSold = 1
END
GO
/****** Object:  Trigger [dbo].[trg_PreventApartmentDeletion]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Триггер для предотвращения удаления квартир
CREATE TRIGGER [dbo].[trg_PreventApartmentDeletion]
ON [dbo].[Apartments]
FOR DELETE
AS
BEGIN
    RAISERROR ('Удаление квартир не разрешено.', 16, 1);
    ROLLBACK TRANSACTION;
END







GO
ALTER TABLE [dbo].[Apartments] ENABLE TRIGGER [trg_PreventApartmentDeletion]
GO
/****** Object:  Trigger [dbo].[trg_PreventApartmentUpdate]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Триггер для предотвращения изменения физических характеристик квартир
CREATE TRIGGER [dbo].[trg_PreventApartmentUpdate]
ON [dbo].[Apartments]
FOR UPDATE
AS
BEGIN
    IF UPDATE(Rooms) OR UPDATE(Floor) OR UPDATE(Area)
    BEGIN
        RAISERROR ('Изменение физических характеристик квартир не разрешено.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
ALTER TABLE [dbo].[Apartments] ENABLE TRIGGER [trg_PreventApartmentUpdate]
GO
/****** Object:  Trigger [dbo].[trg_PreventBuyerDeletion]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_PreventBuyerDeletion]
ON [dbo].[Buyers]
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Sales WHERE BuyerID IN (SELECT BuyerID FROM DELETED))
    BEGIN
        RAISERROR ('Удаление покупателей, которые купили хотя бы одну квартиру, не разрешено.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
ALTER TABLE [dbo].[Buyers] ENABLE TRIGGER [trg_PreventBuyerDeletion]
GO
/****** Object:  Trigger [dbo].[trg_PreventSaleDeletion]    Script Date: 27.02.2024 15:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_PreventSaleDeletion]
ON [dbo].[Sales]
FOR DELETE
AS
BEGIN
    RAISERROR ('Удаление продаж не разрешено.', 16, 1);
    ROLLBACK TRANSACTION;
END
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [trg_PreventSaleDeletion]
GO
USE [master]
GO
ALTER DATABASE [DBFlatSale] SET  READ_WRITE 
GO
