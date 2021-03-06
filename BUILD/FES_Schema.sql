USE [master]
GO
/****** Object:  Database [IDFES]    Script Date: 6/10/2021 1:48:22 PM ******/
CREATE DATABASE [IDFES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IDFES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IDFES.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IDFES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IDFES_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IDFES] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IDFES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IDFES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IDFES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IDFES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IDFES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IDFES] SET ARITHABORT OFF 
GO
ALTER DATABASE [IDFES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IDFES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IDFES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IDFES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IDFES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IDFES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IDFES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IDFES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IDFES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IDFES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IDFES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IDFES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IDFES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IDFES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IDFES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IDFES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IDFES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IDFES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IDFES] SET  MULTI_USER 
GO
ALTER DATABASE [IDFES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IDFES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IDFES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IDFES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IDFES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IDFES] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [IDFES] SET QUERY_STORE = OFF
GO
USE [IDFES]
GO
/****** Object:  Default [BIT_0]    Script Date: 6/10/2021 1:48:22 PM ******/
CREATE DEFAULT [dbo].[BIT_0] 
AS
0
GO
/****** Object:  Default [BIT_1]    Script Date: 6/10/2021 1:48:22 PM ******/
CREATE DEFAULT [dbo].[BIT_1] 
AS
1
GO
/****** Object:  Default [BitToZero]    Script Date: 6/10/2021 1:48:22 PM ******/
CREATE DEFAULT [dbo].[BitToZero] 
AS
0
GO
/****** Object:  Default [Def_NumOfLevels]    Script Date: 6/10/2021 1:48:22 PM ******/
CREATE DEFAULT [dbo].[Def_NumOfLevels] 
AS
2
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[UsedByHR] [bit] NULL,
	[AliasHR] [nvarchar](50) NULL,
	[UsedByCust] [bit] NULL,
	[AliasCust] [nvarchar](50) NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK150] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChemicalType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChemicalType](
	[ChemicalTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[Symbol] [nvarchar](50) NULL,
 CONSTRAINT [PK214] PRIMARY KEY CLUSTERED 
(
	[ChemicalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[CompanyInfoID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](64) NULL,
	[CompanyCode] [nvarchar](6) NULL,
	[ABN] [nvarchar](50) NULL,
	[Address] [nvarchar](256) NULL,
	[PostalAddress] [nvarchar](256) NULL,
	[OfficeNumber] [nvarchar](30) NULL,
	[MobileNumber] [nvarchar](30) NULL,
	[Email] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[PostcodeID] [int] NULL,
	[PostalPostcodeID] [int] NULL,
	[GlobalID] [int] NULL,
 CONSTRAINT [PK105] PRIMARY KEY CLUSTERED 
(
	[CompanyInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactNumType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactNumType](
	[ContactNumTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[UsedByHR] [bit] NULL,
	[AliasHR] [nvarchar](50) NULL,
	[UsedByCust] [bit] NULL,
	[AliasCust] [nvarchar](50) NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK153] PRIMARY KEY CLUSTERED 
(
	[ContactNumTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[UsedByHR] [bit] NULL,
	[AliasHR] [nvarchar](50) NULL,
	[UsedByCust] [bit] NULL,
	[AliasCust] [nvarchar](50) NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK152] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoreGroup]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoreGroup](
	[CoreGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK268] PRIMARY KEY CLUSTERED 
(
	[CoreGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustAddress]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustAddress](
	[CustAddressID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[AddressTypeID] [int] NULL,
	[PostcodeID] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
 CONSTRAINT [PK142] PRIMARY KEY CLUSTERED 
(
	[CustAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustContact]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustContact](
	[CustContactID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[HRID] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[Caption] [nvarchar](128) NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
	[ContactTypeID] [int] NULL,
 CONSTRAINT [PK317] PRIMARY KEY CLUSTERED 
(
	[CustContactID] ASC,
	[CustomerID] ASC,
	[HRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustContactNum]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustContactNum](
	[CustContactNumID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ContactNum] [nvarchar](64) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
	[ContactNumTypeID] [int] NULL,
 CONSTRAINT [PK812] PRIMARY KEY CLUSTERED 
(
	[CustContactNumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustEmail]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustEmail](
	[CustEmailID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
	[EmailTypeID] [int] NULL,
 CONSTRAINT [PK315] PRIMARY KEY CLUSTERED 
(
	[CustEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustName] [nvarchar](64) NULL,
	[CustCode] [nvarchar](8) NULL,
	[MYOBID] [int] NULL,
	[Note] [text] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK100] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustSite]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustSite](
	[CustSiteID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[IsEnabled] [bit] NULL,
	[SiteContactID] [int] NULL,
	[Note] [text] NULL,
	[SeedDate] [datetime] NULL,
	[SeedLevel] [int] NULL,
	[DoReseed] [bit] NULL,
 CONSTRAINT [PK211] PRIMARY KEY CLUSTERED 
(
	[CustSiteID] ASC,
	[CustomerID] ASC,
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailType](
	[EmailTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[UsedByHR] [bit] NULL,
	[AliasHR] [nvarchar](50) NULL,
	[UsedByCust] [bit] NULL,
	[AliasCust] [nvarchar](50) NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK151] PRIMARY KEY CLUSTERED 
(
	[EmailTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipBrand]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipBrand](
	[EquipBrandID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK215] PRIMARY KEY CLUSTERED 
(
	[EquipBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](64) NULL,
	[ShortCaption] [nvarchar](50) NULL,
	[IsArchived] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[NetWeight] [float] NULL,
	[GrossWeight] [float] NULL,
	[Litres] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Length] [float] NULL,
	[Watt] [float] NULL,
	[EquipTypeID] [int] NULL,
	[ChemicalTypeID] [int] NULL,
	[EquipBrandID] [int] NULL,
	[LightTypeID] [int] NULL,
	[LightLampTypeID] [int] NULL,
	[LightFormFactorID] [int] NULL,
	[HydrantTypeID] [int] NULL,
 CONSTRAINT [PK177] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipType](
	[EquipTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
	[MinorLifeCycle] [float] NULL,
	[MajorLifeCycle] [float] NULL,
	[NumOfLevels] [int] NULL,
	[ServiceInterval] [float] NULL,
	[CoreGroupID] [int] NULL,
 CONSTRAINT [PK178] PRIMARY KEY CLUSTERED 
(
	[EquipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Global]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Global](
	[GlobalID] [int] NOT NULL,
	[DefNumOfLevels] [int] NULL,
	[DefStartLevel] [int] NULL,
	[TechInspectOrderRootPath] [nvarchar](2048) NULL,
	[SQLversion] [int] NULL,
	[SQLmajor] [int] NULL,
	[SQLminor] [int] NULL,
	[SQLbuild] [int] NULL,
	[Author] [nvarchar](64) NULL,
	[AuthorEmail] [nvarchar](256) NULL,
	[Copyright] [nvarchar](128) NULL,
 CONSTRAINT [PK233] PRIMARY KEY CLUSTERED 
(
	[GlobalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR](
	[HRID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](256) NULL,
	[Note] [text] NULL,
	[DOB] [datetime] NULL,
	[UserLoginName] [nvarchar](256) NULL,
	[EmergencyContactHRID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK167] PRIMARY KEY CLUSTERED 
(
	[HRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HRAddress]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRAddress](
	[HRAddressID] [int] IDENTITY(1,1) NOT NULL,
	[HRID] [int] NULL,
	[AddressTypeID] [int] NULL,
	[PostcodeID] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
 CONSTRAINT [PK141] PRIMARY KEY CLUSTERED 
(
	[HRAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HRContactNum]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRContactNum](
	[HRContactNumID] [int] IDENTITY(1,1) NOT NULL,
	[HRID] [int] NULL,
	[ContactNum] [nvarchar](64) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
	[ContactNumTypeID] [int] NULL,
 CONSTRAINT [PK811] PRIMARY KEY CLUSTERED 
(
	[HRContactNumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HREmail]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HREmail](
	[HREmailID] [int] IDENTITY(1,1) NOT NULL,
	[HRID] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SortList] [int] NULL,
	[EmailTypeID] [int] NULL,
 CONSTRAINT [PK316] PRIMARY KEY CLUSTERED 
(
	[HREmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HRZone]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRZone](
	[HRZoneID] [int] IDENTITY(1,1) NOT NULL,
	[HRID] [int] NULL,
	[PostcodeID] [int] NULL,
 CONSTRAINT [PK165] PRIMARY KEY CLUSTERED 
(
	[HRZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HydrantType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HydrantType](
	[HydrantTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
 CONSTRAINT [PK266] PRIMARY KEY CLUSTERED 
(
	[HydrantTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionOrder]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionOrder](
	[InspectionOrderID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[RequestedDT] [datetime] NULL,
	[InspectedOn] [datetime] NULL,
	[CompletedDT] [datetime] NULL,
	[ServiceInterval] [float] NULL,
	[LevelNum] [int] NULL,
	[Note] [nvarchar](128) NULL,
	[NotePortable] [nvarchar](128) NULL,
	[NoteElectrical] [nvarchar](128) NULL,
	[NoteWaterBase] [nvarchar](128) NULL,
	[NoteStructual] [nvarchar](128) NULL,
	[InspectionStatusID] [int] NULL,
	[HRID] [int] NULL,
	[CustSiteID] [int] NULL,
	[CustomerID] [int] NULL,
	[SiteID] [int] NULL,
 CONSTRAINT [PK197] PRIMARY KEY CLUSTERED 
(
	[InspectionOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InspectionStatus]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InspectionStatus](
	[InspectionStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[Description] [nvarchar](128) NULL,
	[StackOrder] [int] NULL,
 CONSTRAINT [PK235] PRIMARY KEY CLUSTERED 
(
	[InspectionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LightFormFactor]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LightFormFactor](
	[LightFormFactorID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
 CONSTRAINT [PK264] PRIMARY KEY CLUSTERED 
(
	[LightFormFactorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LightLampType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LightLampType](
	[LightLampTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
 CONSTRAINT [PK180] PRIMARY KEY CLUSTERED 
(
	[LightLampTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LightType]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LightType](
	[LightTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
 CONSTRAINT [PK179] PRIMARY KEY CLUSTERED 
(
	[LightTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Detail] [nvarchar](256) NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyInfoID] [int] NULL,
	[LogCallerID] [int] NULL,
	[LogErrLevelID] [int] NULL,
 CONSTRAINT [PK241] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogCaller]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCaller](
	[LogCallerID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK242] PRIMARY KEY CLUSTERED 
(
	[LogCallerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogErrLevel]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogErrLevel](
	[LogErrLevelID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK244] PRIMARY KEY CLUSTERED 
(
	[LogErrLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postcode]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postcode](
	[PostcodeID] [int] IDENTITY(1,1) NOT NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[sa3_Zone] [int] NULL,
	[Zone] [nvarchar](50) NULL,
 CONSTRAINT [PK171] PRIMARY KEY CLUSTERED 
(
	[PostcodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerBoard]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerBoard](
	[PowerBoardID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[PowerBoardNum] [float] NULL,
	[Location] [nvarchar](128) NULL,
	[Note] [text] NULL,
	[SiteID] [int] NULL,
 CONSTRAINT [PK275] PRIMARY KEY CLUSTERED 
(
	[PowerBoardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](128) NULL,
	[Note] [text] NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK123] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleList]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleList](
	[RoleListID] [int] IDENTITY(1,1) NOT NULL,
	[HRID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK124] PRIMARY KEY CLUSTERED 
(
	[RoleListID] ASC,
	[HRID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [nvarchar](1024) NULL,
	[Address] [nvarchar](256) NULL,
	[CreatedOn] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[PostcodeID] [int] NULL,
 CONSTRAINT [PK163] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[StationID] [int] IDENTITY(1,1) NOT NULL,
	[StationNum] [float] NULL,
	[CircuitBoardNum] [int] NULL,
	[Location] [nvarchar](128) NULL,
	[Note] [text] NULL,
	[CreatedOn] [datetime] NULL,
	[LifeCycleSeed] [datetime] NULL,
	[IsEmpty] [bit] NULL,
	[IsManaged] [bit] NULL,
	[SiteID] [int] NULL,
	[EquipmentID] [int] NULL,
	[CoreGroupID] [int] NULL,
	[PowerBoardID] [int] NULL,
 CONSTRAINT [PK154] PRIMARY KEY CLUSTERED 
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyOrder]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOrder](
	[SurveyOrderID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[RequestedDT] [datetime] NULL,
	[SurveyedOn] [datetime] NULL,
	[CompletedDT] [datetime] NULL,
	[IsArchived] [bit] NULL,
	[SurveyStatusID] [int] NULL,
	[HRID] [int] NULL,
	[CustSiteID] [int] NULL,
	[CustomerID] [int] NULL,
	[SiteID] [int] NULL,
 CONSTRAINT [PK198] PRIMARY KEY CLUSTERED 
(
	[SurveyOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyStatus]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyStatus](
	[SurveyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[Description] [nvarchar](128) NULL,
	[StackOrder] [int] NULL,
 CONSTRAINT [PK228] PRIMARY KEY CLUSTERED 
(
	[SurveyStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[StationNum] [float] NULL,
	[Location] [nvarchar](128) NULL,
	[Note] [nvarchar](128) NULL,
	[Passed] [bit] NULL,
	[IsManaged] [bit] NULL,
	[kPaStatic] [int] NULL,
	[kPaFlow] [int] NULL,
	[LitrePerSec] [int] NULL,
	[EquipmentID] [int] NULL,
	[TestLifeCycleID] [int] NULL,
	[TestActionID] [int] NULL,
	[InspectionOrderID] [int] NULL,
	[ReferenceID] [int] NULL,
	[TestA] [int] NULL,
	[TestB] [int] NULL,
 CONSTRAINT [PK217] PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestAction]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAction](
	[TestActionID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK250] PRIMARY KEY CLUSTERED 
(
	[TestActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestLifeCycle]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestLifeCycle](
	[TestLifeCycleID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK252] PRIMARY KEY CLUSTERED 
(
	[TestLifeCycleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 6/10/2021 1:48:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestResult](
	[TestResultID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
	[ShortCaption] [nvarchar](50) NULL,
 CONSTRAINT [PK267] PRIMARY KEY CLUSTERED 
(
	[TestResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddressType] ADD  CONSTRAINT [DF__AddressTy__UsedB__4AB81AF0]  DEFAULT ((0)) FOR [UsedByHR]
GO
ALTER TABLE [dbo].[AddressType] ADD  CONSTRAINT [DF__AddressTy__UsedB__4BAC3F29]  DEFAULT ((0)) FOR [UsedByCust]
GO
ALTER TABLE [dbo].[AddressType] ADD  CONSTRAINT [DF__AddressTy__IsArc__49C3F6B7]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[ContactNumType] ADD  CONSTRAINT [DF__ContactNu__UsedB__4F7CD00D]  DEFAULT ((0)) FOR [UsedByHR]
GO
ALTER TABLE [dbo].[ContactNumType] ADD  CONSTRAINT [DF__ContactNu__UsedB__5070F446]  DEFAULT ((0)) FOR [UsedByCust]
GO
ALTER TABLE [dbo].[ContactNumType] ADD  CONSTRAINT [DF__ContactNu__IsArc__4E88ABD4]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[ContactType] ADD  DEFAULT ((0)) FOR [UsedByHR]
GO
ALTER TABLE [dbo].[ContactType] ADD  DEFAULT ((0)) FOR [UsedByCust]
GO
ALTER TABLE [dbo].[ContactType] ADD  CONSTRAINT [DF__ContactTy__IsArc__3EDC53F0]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustAddress] ADD  CONSTRAINT [DF__CustAddre__IsArc__534D60F1]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustContact] ADD  CONSTRAINT [DF__CustConta__IsArc__5629CD9C]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustContactNum] ADD  CONSTRAINT [DF__CustConta__IsArc__59063A47]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustEmail] ADD  CONSTRAINT [DF__CustEmail__IsArc__5BE2A6F2]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustSite] ADD  CONSTRAINT [DF__CustSite__IsArch__41B8C09B]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[CustSite] ADD  DEFAULT ((0)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[EmailType] ADD  CONSTRAINT [DF__EmailType__UsedB__6B24EA82]  DEFAULT ((0)) FOR [UsedByHR]
GO
ALTER TABLE [dbo].[EmailType] ADD  CONSTRAINT [DF__EmailType__UsedB__6C190EBB]  DEFAULT ((0)) FOR [UsedByCust]
GO
ALTER TABLE [dbo].[EmailType] ADD  CONSTRAINT [DF__EmailType__IsArc__6A30C649]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Equipment] ADD  CONSTRAINT [DF__Equipment__IsArc__36470DEF]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[HR] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[HRAddress] ADD  CONSTRAINT [DF__HRAddress__IsArc__75A278F5]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[HRContactNum] ADD  CONSTRAINT [DF__HRContact__IsArc__7B5B524B]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[HREmail] ADD  CONSTRAINT [DF__HREmail__IsArchi__7E37BEF6]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF__Site__IsArchived__546180BB]  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Station] ADD  CONSTRAINT [DF__Station__IsEmpty__1DB06A4F]  DEFAULT ((0)) FOR [IsEmpty]
GO
ALTER TABLE [dbo].[SurveyOrder] ADD  DEFAULT ((0)) FOR [IsArchived]
GO
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [DF__Test__Passed__17AD7836]  DEFAULT ((0)) FOR [Passed]
GO
ALTER TABLE [dbo].[CompanyInfo]  WITH CHECK ADD  CONSTRAINT [Global_CompanyInfo] FOREIGN KEY([GlobalID])
REFERENCES [dbo].[Global] ([GlobalID])
GO
ALTER TABLE [dbo].[CompanyInfo] CHECK CONSTRAINT [Global_CompanyInfo]
GO
ALTER TABLE [dbo].[CompanyInfo]  WITH CHECK ADD  CONSTRAINT [Postcode_CompanyInfo] FOREIGN KEY([PostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[CompanyInfo] CHECK CONSTRAINT [Postcode_CompanyInfo]
GO
ALTER TABLE [dbo].[CompanyInfo]  WITH CHECK ADD  CONSTRAINT [Postcode_CompanyInfoPostal] FOREIGN KEY([PostalPostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[CompanyInfo] CHECK CONSTRAINT [Postcode_CompanyInfoPostal]
GO
ALTER TABLE [dbo].[CustAddress]  WITH CHECK ADD  CONSTRAINT [AddressType_CustAddress] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [dbo].[CustAddress] CHECK CONSTRAINT [AddressType_CustAddress]
GO
ALTER TABLE [dbo].[CustAddress]  WITH CHECK ADD  CONSTRAINT [Customer_CustAddress] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustAddress] CHECK CONSTRAINT [Customer_CustAddress]
GO
ALTER TABLE [dbo].[CustAddress]  WITH CHECK ADD  CONSTRAINT [Postcode_CustAddress] FOREIGN KEY([PostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[CustAddress] CHECK CONSTRAINT [Postcode_CustAddress]
GO
ALTER TABLE [dbo].[CustContact]  WITH CHECK ADD  CONSTRAINT [ContactType_CustContact] FOREIGN KEY([ContactTypeID])
REFERENCES [dbo].[ContactType] ([ContactTypeID])
GO
ALTER TABLE [dbo].[CustContact] CHECK CONSTRAINT [ContactType_CustContact]
GO
ALTER TABLE [dbo].[CustContact]  WITH CHECK ADD  CONSTRAINT [Customer_CustContact] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustContact] CHECK CONSTRAINT [Customer_CustContact]
GO
ALTER TABLE [dbo].[CustContact]  WITH CHECK ADD  CONSTRAINT [HR_CustContact] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[CustContact] CHECK CONSTRAINT [HR_CustContact]
GO
ALTER TABLE [dbo].[CustContactNum]  WITH CHECK ADD  CONSTRAINT [ContactNumType_CustContactNum] FOREIGN KEY([ContactNumTypeID])
REFERENCES [dbo].[ContactNumType] ([ContactNumTypeID])
GO
ALTER TABLE [dbo].[CustContactNum] CHECK CONSTRAINT [ContactNumType_CustContactNum]
GO
ALTER TABLE [dbo].[CustContactNum]  WITH CHECK ADD  CONSTRAINT [Customer_CustContactNum] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustContactNum] CHECK CONSTRAINT [Customer_CustContactNum]
GO
ALTER TABLE [dbo].[CustEmail]  WITH CHECK ADD  CONSTRAINT [Customer_CustEmail] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustEmail] CHECK CONSTRAINT [Customer_CustEmail]
GO
ALTER TABLE [dbo].[CustEmail]  WITH CHECK ADD  CONSTRAINT [EmailType_CustEmail] FOREIGN KEY([EmailTypeID])
REFERENCES [dbo].[EmailType] ([EmailTypeID])
GO
ALTER TABLE [dbo].[CustEmail] CHECK CONSTRAINT [EmailType_CustEmail]
GO
ALTER TABLE [dbo].[CustSite]  WITH CHECK ADD  CONSTRAINT [Customer_CustSite] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustSite] CHECK CONSTRAINT [Customer_CustSite]
GO
ALTER TABLE [dbo].[CustSite]  WITH CHECK ADD  CONSTRAINT [HR_CustSite] FOREIGN KEY([SiteContactID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[CustSite] CHECK CONSTRAINT [HR_CustSite]
GO
ALTER TABLE [dbo].[CustSite]  WITH CHECK ADD  CONSTRAINT [Site_CustSite] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[CustSite] CHECK CONSTRAINT [Site_CustSite]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [ChemicalType_Equipment] FOREIGN KEY([ChemicalTypeID])
REFERENCES [dbo].[ChemicalType] ([ChemicalTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [ChemicalType_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [EquipBrand_Equipment] FOREIGN KEY([EquipBrandID])
REFERENCES [dbo].[EquipBrand] ([EquipBrandID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [EquipBrand_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [EquipType_Equipment] FOREIGN KEY([EquipTypeID])
REFERENCES [dbo].[EquipType] ([EquipTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [EquipType_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [HydrantType_Equipment] FOREIGN KEY([HydrantTypeID])
REFERENCES [dbo].[HydrantType] ([HydrantTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [HydrantType_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [LightFormFactor_Equipment] FOREIGN KEY([LightFormFactorID])
REFERENCES [dbo].[LightFormFactor] ([LightFormFactorID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [LightFormFactor_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [LightLampType_Equipment] FOREIGN KEY([LightLampTypeID])
REFERENCES [dbo].[LightLampType] ([LightLampTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [LightLampType_Equipment]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [LightType_Equipment] FOREIGN KEY([LightTypeID])
REFERENCES [dbo].[LightType] ([LightTypeID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [LightType_Equipment]
GO
ALTER TABLE [dbo].[EquipType]  WITH CHECK ADD  CONSTRAINT [CoreGroup_EquipType] FOREIGN KEY([CoreGroupID])
REFERENCES [dbo].[CoreGroup] ([CoreGroupID])
GO
ALTER TABLE [dbo].[EquipType] CHECK CONSTRAINT [CoreGroup_EquipType]
GO
ALTER TABLE [dbo].[HRAddress]  WITH CHECK ADD  CONSTRAINT [AddressType_HRAddress] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [dbo].[HRAddress] CHECK CONSTRAINT [AddressType_HRAddress]
GO
ALTER TABLE [dbo].[HRAddress]  WITH CHECK ADD  CONSTRAINT [HR_HRAddress] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[HRAddress] CHECK CONSTRAINT [HR_HRAddress]
GO
ALTER TABLE [dbo].[HRAddress]  WITH CHECK ADD  CONSTRAINT [Postcode_HRAddress] FOREIGN KEY([PostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[HRAddress] CHECK CONSTRAINT [Postcode_HRAddress]
GO
ALTER TABLE [dbo].[HRContactNum]  WITH CHECK ADD  CONSTRAINT [ContactNumType_HRContactNum] FOREIGN KEY([ContactNumTypeID])
REFERENCES [dbo].[ContactNumType] ([ContactNumTypeID])
GO
ALTER TABLE [dbo].[HRContactNum] CHECK CONSTRAINT [ContactNumType_HRContactNum]
GO
ALTER TABLE [dbo].[HRContactNum]  WITH CHECK ADD  CONSTRAINT [HR_HRContactNum] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[HRContactNum] CHECK CONSTRAINT [HR_HRContactNum]
GO
ALTER TABLE [dbo].[HREmail]  WITH CHECK ADD  CONSTRAINT [EmailType_HREmail] FOREIGN KEY([EmailTypeID])
REFERENCES [dbo].[EmailType] ([EmailTypeID])
GO
ALTER TABLE [dbo].[HREmail] CHECK CONSTRAINT [EmailType_HREmail]
GO
ALTER TABLE [dbo].[HREmail]  WITH CHECK ADD  CONSTRAINT [HR_HREmail] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[HREmail] CHECK CONSTRAINT [HR_HREmail]
GO
ALTER TABLE [dbo].[HRZone]  WITH CHECK ADD  CONSTRAINT [HR_HRZone] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[HRZone] CHECK CONSTRAINT [HR_HRZone]
GO
ALTER TABLE [dbo].[HRZone]  WITH CHECK ADD  CONSTRAINT [Postcode_HRZone] FOREIGN KEY([PostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[HRZone] CHECK CONSTRAINT [Postcode_HRZone]
GO
ALTER TABLE [dbo].[InspectionOrder]  WITH CHECK ADD  CONSTRAINT [CustSite_InspectionOrder] FOREIGN KEY([CustSiteID], [CustomerID], [SiteID])
REFERENCES [dbo].[CustSite] ([CustSiteID], [CustomerID], [SiteID])
GO
ALTER TABLE [dbo].[InspectionOrder] CHECK CONSTRAINT [CustSite_InspectionOrder]
GO
ALTER TABLE [dbo].[InspectionOrder]  WITH CHECK ADD  CONSTRAINT [HR_InspectionOrder] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[InspectionOrder] CHECK CONSTRAINT [HR_InspectionOrder]
GO
ALTER TABLE [dbo].[InspectionOrder]  WITH CHECK ADD  CONSTRAINT [InspectionStatus_InspectionOrder] FOREIGN KEY([InspectionStatusID])
REFERENCES [dbo].[InspectionStatus] ([InspectionStatusID])
GO
ALTER TABLE [dbo].[InspectionOrder] CHECK CONSTRAINT [InspectionStatus_InspectionOrder]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [CompanyInfo_Log] FOREIGN KEY([CompanyInfoID])
REFERENCES [dbo].[CompanyInfo] ([CompanyInfoID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [CompanyInfo_Log]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [LogCaller_Log] FOREIGN KEY([LogCallerID])
REFERENCES [dbo].[LogCaller] ([LogCallerID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [LogCaller_Log]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [LogErrLevel_Log] FOREIGN KEY([LogErrLevelID])
REFERENCES [dbo].[LogErrLevel] ([LogErrLevelID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [LogErrLevel_Log]
GO
ALTER TABLE [dbo].[PowerBoard]  WITH CHECK ADD  CONSTRAINT [Site_PowerBoard] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[PowerBoard] CHECK CONSTRAINT [Site_PowerBoard]
GO
ALTER TABLE [dbo].[RoleList]  WITH CHECK ADD  CONSTRAINT [HR_RoleList] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleList] CHECK CONSTRAINT [HR_RoleList]
GO
ALTER TABLE [dbo].[RoleList]  WITH CHECK ADD  CONSTRAINT [Role_RoleList] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleList] CHECK CONSTRAINT [Role_RoleList]
GO
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [Postcode_Site] FOREIGN KEY([PostcodeID])
REFERENCES [dbo].[Postcode] ([PostcodeID])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [Postcode_Site]
GO
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [CoreGroup_Station] FOREIGN KEY([CoreGroupID])
REFERENCES [dbo].[CoreGroup] ([CoreGroupID])
GO
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [CoreGroup_Station]
GO
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [Equipment_Station] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [Equipment_Station]
GO
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [PowerBoard_Station] FOREIGN KEY([PowerBoardID])
REFERENCES [dbo].[PowerBoard] ([PowerBoardID])
GO
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [PowerBoard_Station]
GO
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [Site_Station] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [Site_Station]
GO
ALTER TABLE [dbo].[SurveyOrder]  WITH CHECK ADD  CONSTRAINT [CustSite_SurveyOrder] FOREIGN KEY([CustSiteID], [CustomerID], [SiteID])
REFERENCES [dbo].[CustSite] ([CustSiteID], [CustomerID], [SiteID])
GO
ALTER TABLE [dbo].[SurveyOrder] CHECK CONSTRAINT [CustSite_SurveyOrder]
GO
ALTER TABLE [dbo].[SurveyOrder]  WITH CHECK ADD  CONSTRAINT [HR_SurveyOrder] FOREIGN KEY([HRID])
REFERENCES [dbo].[HR] ([HRID])
GO
ALTER TABLE [dbo].[SurveyOrder] CHECK CONSTRAINT [HR_SurveyOrder]
GO
ALTER TABLE [dbo].[SurveyOrder]  WITH CHECK ADD  CONSTRAINT [SurveyStatus_SurveyOrder] FOREIGN KEY([SurveyStatusID])
REFERENCES [dbo].[SurveyStatus] ([SurveyStatusID])
GO
ALTER TABLE [dbo].[SurveyOrder] CHECK CONSTRAINT [SurveyStatus_SurveyOrder]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [Equipment_Test] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [Equipment_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [InspectionOrder_Test] FOREIGN KEY([InspectionOrderID])
REFERENCES [dbo].[InspectionOrder] ([InspectionOrderID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [InspectionOrder_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [TestAction_Test] FOREIGN KEY([TestActionID])
REFERENCES [dbo].[TestAction] ([TestActionID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [TestAction_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [TestLifeCycle_Test] FOREIGN KEY([TestLifeCycleID])
REFERENCES [dbo].[TestLifeCycle] ([TestLifeCycleID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [TestLifeCycle_Test]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [TestResult_T36] FOREIGN KEY([TestB])
REFERENCES [dbo].[TestResult] ([TestResultID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [TestResult_T36]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [TestResult_Test] FOREIGN KEY([TestA])
REFERENCES [dbo].[TestResult] ([TestResultID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [TestResult_Test]
GO
USE [master]
GO
ALTER DATABASE [IDFES] SET  READ_WRITE 
GO
