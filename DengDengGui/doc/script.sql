USE [master]
GO
/****** Object:  Database [GeneralBusinessDB]    Script Date: 2017/6/17 21:08:01 ******/
CREATE DATABASE [GeneralBusinessDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeneralBusinessDB', FILENAME = N'D:\Data\GeneralBusinessDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GeneralBusinessDB_log', FILENAME = N'D:\Data\GeneralBusinessDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GeneralBusinessDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeneralBusinessDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeneralBusinessDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GeneralBusinessDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeneralBusinessDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeneralBusinessDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeneralBusinessDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeneralBusinessDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GeneralBusinessDB] SET  MULTI_USER 
GO
ALTER DATABASE [GeneralBusinessDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeneralBusinessDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeneralBusinessDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeneralBusinessDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GeneralBusinessDB', N'ON'
GO
USE [GeneralBusinessDB]
GO
/****** Object:  Table [dbo].[BillModuleFieldRelationships]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillModuleFieldRelationships](
	[BillModuleID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[UIType] [varchar](50) NULL,
	[IsSummary] [bit] NULL,
	[Order] [int] NULL,
	[Row] [int] NULL,
	[Width] [int] NULL,
	[IsShow] [bit] NULL,
	[IsReadonly] [bit] NULL,
	[lsNotNull] [bit] NULL,
	[Formula] [varchar](100) NULL,
	[IsFatherField] [bit] NULL,
	[NextFocusField] [varchar](50) NULL,
 CONSTRAINT [PK_BillModuleFieldRelationships] PRIMARY KEY CLUSTERED 
(
	[BillModuleID] ASC,
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillModules]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillModules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ModuleTypeID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_BillModules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChartModules]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChartModules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsProcedure] [bit] NULL,
	[CommandText] [varchar](max) NULL,
	[ChartType] [varchar](50) NULL,
	[ModuleTypeID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_ChartModules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](200) NULL,
	[Address] [varchar](500) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fields]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ChineseName] [varchar](200) NOT NULL,
	[DataType] [varchar](50) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Fields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModuleTypes]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuleTypes](
	[ID] [int] NOT NULL,
	[TypeName] [varchar](50) NULL,
	[TypeTableName] [varchar](100) NULL,
 CONSTRAINT [PK_ModuleTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](100) NULL,
	[ActionDescription] [nchar](10) NULL,
	[ControllerName] [varchar](100) NULL,
	[Predicate] [varchar](10) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QueryModules]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QueryModules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsProcedure] [bit] NULL,
	[CommandText] [varchar](max) NULL,
	[ModuleTypeID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleModules]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleModules](
	[RoleID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[ModuleTypeID] [int] NOT NULL,
 CONSTRAINT [PK_RoleModules_1] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[MenuID] ASC,
	[ModuleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissionChilds]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissionChilds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[PermissionID] [int] NULL,
	[ModuleTypeID] [int] NULL,
	[ModuleID] [int] NULL,
 CONSTRAINT [PK_RolePermissionChilds] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RoleID] [int] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/6/17 21:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BillModules] ON 

INSERT [dbo].[BillModules] ([ID], [Name], [ModuleTypeID], [CompanyID]) VALUES (1, N'采购单', 1, 1)
SET IDENTITY_INSERT [dbo].[BillModules] OFF
SET IDENTITY_INSERT [dbo].[ChartModules] ON 

INSERT [dbo].[ChartModules] ([ID], [Name], [IsProcedure], [CommandText], [ChartType], [ModuleTypeID], [CompanyID]) VALUES (1, N'年度采购分析', NULL, NULL, NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[ChartModules] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([ID], [CompanyName], [Address]) VALUES (1, N'测试公司1', N'太原')
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [Name], [CompanyID]) VALUES (1, N'查询统计', 1)
INSERT [dbo].[Menus] ([ID], [Name], [CompanyID]) VALUES (2, N'单据管理', 1)
INSERT [dbo].[Menus] ([ID], [Name], [CompanyID]) VALUES (3, N'图表管理', 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
INSERT [dbo].[ModuleTypes] ([ID], [TypeName], [TypeTableName]) VALUES (1, N'单据模块', N'BillModules')
INSERT [dbo].[ModuleTypes] ([ID], [TypeName], [TypeTableName]) VALUES (2, N'查询模块', N'QueryModules')
INSERT [dbo].[ModuleTypes] ([ID], [TypeName], [TypeTableName]) VALUES (3, N'图表模块', N'ChartModules')
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (1, N'/', N'主页        ', N'homecontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (2, N'/login', N'登录页       ', N'homecontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (21, N'/login', N'提示登录      ', N'homecontroller', N'Post', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (22, N'/menumodules', N'菜单模块      ', N'managementcontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (23, N'/permissions', N'权限模块      ', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (24, N'/getpermissions', N'获取全部权限    ', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (25, N'/addpermission', N'添加权限      ', N'permissioncontroller', N'Post', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (26, N'/management/index', N'后台主页      ', N'managementcontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (27, N'/adduser', N'添加用户      ', N'permissioncontroller', N'Post', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (28, N'/users', N'用户管理      ', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (29, N'/roles', N'角色管理      ', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (30, N'/getusers', N'查询用户      ', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (31, N'/allaction', N'加载程序action', N'permissioncontroller', N'Get', 1)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (32, N'/queryusers', N'按条件查询用户   ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (33, N'/permission/index', N'权限首页      ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (34, N'/modifyuser', N'修改用户      ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (35, N'/deleteuser', N'删除用户      ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (36, N'/getroles', N'获取角色      ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (37, N'/addrole', N'添加角色      ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (38, N'/modifyrole', N'修改角色      ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (39, N'/deleterole', N'删除角色      ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (40, N'/removepermission', N'删除权限      ', N'permissioncontroller', N'Delete', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (41, N'/rolepermission', N'角色权限      ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (42, N'/getpermission', N'获取权限      ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (43, N'/savarolepermissons', N'保存角色权限    ', N'permissioncontroller', N'Post', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (44, N'/userrole', N'用户角色      ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (45, N'/getrole/{userid}', N'获取用户角色    ', N'permissioncontroller', N'Get', NULL)
INSERT [dbo].[Permissions] ([ID], [Action], [ActionDescription], [ControllerName], [Predicate], [CompanyID]) VALUES (46, N'/savauserroles', N'保存用户角色    ', N'permissioncontroller', N'Post', NULL)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[QueryModules] ON 

INSERT [dbo].[QueryModules] ([ID], [Name], [IsProcedure], [CommandText], [ModuleTypeID], [CompanyID]) VALUES (1, N'采购查询', 0, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[QueryModules] OFF
INSERT [dbo].[RoleModules] ([RoleID], [MenuID], [ModuleTypeID]) VALUES (1, 1, 1)
INSERT [dbo].[RoleModules] ([RoleID], [MenuID], [ModuleTypeID]) VALUES (1, 2, 1)
INSERT [dbo].[RoleModules] ([RoleID], [MenuID], [ModuleTypeID]) VALUES (1, 3, 1)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 1)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 2)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 21)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 22)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 23)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 24)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 25)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 26)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 27)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 28)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 29)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 30)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 31)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 32)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 33)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 34)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 35)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 36)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 37)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 38)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 39)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 40)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 41)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 42)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 43)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 44)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 45)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (1, 46)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (3, 1)
INSERT [dbo].[RolePermissions] ([RoleID], [PermissionID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [CompanyID]) VALUES (1, N'采购员', 1)
INSERT [dbo].[Roles] ([ID], [Name], [CompanyID]) VALUES (2, N'销售员', 1)
INSERT [dbo].[Roles] ([ID], [Name], [CompanyID]) VALUES (3, N'收银员', 1)
INSERT [dbo].[Roles] ([ID], [Name], [CompanyID]) VALUES (6, N'777', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[UserRoles] ([UserID], [RoleID]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [CompanyID]) VALUES (1, N'aaa', N'111', N'张三丰1', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Permissions]    Script Date: 2017/6/17 21:08:01 ******/
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [IX_Permissions] UNIQUE NONCLUSTERED 
(
	[Action] ASC,
	[ControllerName] ASC,
	[Predicate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 2017/6/17 21:08:01 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QueryModules] ADD  CONSTRAINT [DF_QueryModules_IsProcedure]  DEFAULT ((0)) FOR [IsProcedure]
GO
ALTER TABLE [dbo].[BillModuleFieldRelationships]  WITH CHECK ADD  CONSTRAINT [FK_BillModuleFieldRelationships_BillModules] FOREIGN KEY([BillModuleID])
REFERENCES [dbo].[BillModules] ([ID])
GO
ALTER TABLE [dbo].[BillModuleFieldRelationships] CHECK CONSTRAINT [FK_BillModuleFieldRelationships_BillModules]
GO
ALTER TABLE [dbo].[BillModuleFieldRelationships]  WITH CHECK ADD  CONSTRAINT [FK_BillModuleFieldRelationships_Fields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Fields] ([ID])
GO
ALTER TABLE [dbo].[BillModuleFieldRelationships] CHECK CONSTRAINT [FK_BillModuleFieldRelationships_Fields]
GO
ALTER TABLE [dbo].[BillModules]  WITH CHECK ADD  CONSTRAINT [FK_BillModules_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[BillModules] CHECK CONSTRAINT [FK_BillModules_Companies]
GO
ALTER TABLE [dbo].[BillModules]  WITH CHECK ADD  CONSTRAINT [FK_BillModules_ModuleTypes] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[ModuleTypes] ([ID])
GO
ALTER TABLE [dbo].[BillModules] CHECK CONSTRAINT [FK_BillModules_ModuleTypes]
GO
ALTER TABLE [dbo].[ChartModules]  WITH CHECK ADD  CONSTRAINT [FK_ChartModules_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[ChartModules] CHECK CONSTRAINT [FK_ChartModules_Companies]
GO
ALTER TABLE [dbo].[ChartModules]  WITH CHECK ADD  CONSTRAINT [FK_ChartModules_ModuleTypes] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[ModuleTypes] ([ID])
GO
ALTER TABLE [dbo].[ChartModules] CHECK CONSTRAINT [FK_ChartModules_ModuleTypes]
GO
ALTER TABLE [dbo].[Fields]  WITH CHECK ADD  CONSTRAINT [FK_Fields_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Fields] CHECK CONSTRAINT [FK_Fields_Companies]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Companies]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Companies]
GO
ALTER TABLE [dbo].[QueryModules]  WITH CHECK ADD  CONSTRAINT [FK_QueryModules_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[QueryModules] CHECK CONSTRAINT [FK_QueryModules_Companies]
GO
ALTER TABLE [dbo].[QueryModules]  WITH CHECK ADD  CONSTRAINT [FK_QueryModules_ModuleTypes] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[ModuleTypes] ([ID])
GO
ALTER TABLE [dbo].[QueryModules] CHECK CONSTRAINT [FK_QueryModules_ModuleTypes]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_BillModules] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[BillModules] ([ID])
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_RoleModules_BillModules]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_ChartModules] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[ChartModules] ([ID])
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_RoleModules_ChartModules]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_RoleModules_Menus]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_QueryModules] FOREIGN KEY([ModuleTypeID])
REFERENCES [dbo].[QueryModules] ([ID])
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_RoleModules_QueryModules]
GO
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RoleModules] CHECK CONSTRAINT [FK_RoleModules_Roles]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permissions] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permissions]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Companies]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Companies]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务模块ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'BillModuleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'FieldID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UI类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'UIType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否汇总' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'IsSummary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序顺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'布局行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'Row'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'占宽' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'Width'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否只读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'IsReadonly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否非空' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'lsNotNull'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'Formula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否父表字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'IsFatherField'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下一焦点字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModuleFieldRelationships', @level2type=N'COLUMN',@level2name=N'NextFocusField'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BillModules', @level2type=N'COLUMN',@level2name=N'Name'
GO
USE [master]
GO
ALTER DATABASE [GeneralBusinessDB] SET  READ_WRITE 
GO
