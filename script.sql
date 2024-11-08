USE [master]
GO
/****** Object:  Database [DBVentaBlazor]    Script Date: 11/6/2024 5:26:42 PM ******/
CREATE DATABASE [DBVentaBlazor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVentaBlazor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MYDB\MSSQL\DATA\DBVentaBlazor.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBVentaBlazor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MYDB\MSSQL\DATA\DBVentaBlazor_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBVentaBlazor] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVentaBlazor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVentaBlazor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBVentaBlazor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVentaBlazor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVentaBlazor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBVentaBlazor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVentaBlazor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBVentaBlazor] SET  MULTI_USER 
GO
ALTER DATABASE [DBVentaBlazor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVentaBlazor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVentaBlazor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVentaBlazor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBVentaBlazor] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DBVentaBlazor]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumeroDocumento]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroDocumento](
	[idNumeroDocumento] [int] IDENTITY(1,1) NOT NULL,
	[ultimo_Numero] [int] NOT NULL,
	[fechaRegistro] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[idNumeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreApellidos] [varchar](100) NULL,
	[correo] [varchar](40) NULL,
	[idRol] [int] NULL,
	[clave] [varchar](40) NULL,
	[esActivo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 11/6/2024 5:26:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroDocumento] [varchar](40) NULL,
	[tipoPago] [varchar](50) NULL,
	[fechaRegistro] [datetime] NULL DEFAULT (getdate()),
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
USE [master]
GO
ALTER DATABASE [DBVentaBlazor] SET  READ_WRITE 
GO
