USE [master]
GO
/****** Object:  Database [PRU_MOK]    Script Date: 19/08/2023 7:00:47 a. m. ******/
CREATE DATABASE [PRU_MOK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRU_MOK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRU_MOK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRU_MOK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRU_MOK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRU_MOK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRU_MOK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRU_MOK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRU_MOK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRU_MOK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRU_MOK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRU_MOK] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRU_MOK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRU_MOK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRU_MOK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRU_MOK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRU_MOK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRU_MOK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRU_MOK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRU_MOK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRU_MOK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRU_MOK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRU_MOK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRU_MOK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRU_MOK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRU_MOK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRU_MOK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRU_MOK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRU_MOK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRU_MOK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRU_MOK] SET  MULTI_USER 
GO
ALTER DATABASE [PRU_MOK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRU_MOK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRU_MOK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRU_MOK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRU_MOK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRU_MOK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRU_MOK] SET QUERY_STORE = OFF
GO
USE [PRU_MOK]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 19/08/2023 7:00:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdEstudiante] [bigint] IDENTITY(1,1) NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[NumIdentificacion] [varchar](30) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 19/08/2023 7:00:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [bigint] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Editorial] [nvarchar](50) NOT NULL,
	[Autor] [varchar](50) NOT NULL,
	[Precio] [numeric](18, 0) NOT NULL,
	[Ubicacion] [varchar](100) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 19/08/2023 7:00:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [bigint] IDENTITY(1,1) NOT NULL,
	[IdLibro] [bigint] NOT NULL,
	[IdEstudiante] [bigint] NOT NULL,
	[FechaPrestamo] [smalldatetime] NOT NULL,
	[FechaDevolucion] [smalldatetime] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prestamo] PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 19/08/2023 7:00:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificacion](
	[IdTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[Abreviatura] [varchar](5) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (1, 2, N'123456789', N'ROCIO01', N'CUSPOCA01', N'KENNEDY', N'852147963', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (4, 1, N'78945613', N'SERGIO BAYARDO', N'CORDOBA', N'MODELO NORTE', N'8541235', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (8, 2, N'7412562221', N'MARIA SOFIA', N'PEREZ', N'PEREZ', N'string', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (9, 1, N'4848448', N'DIANA MARIA', N'TANCO', N'KENNERY', N'31258474', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (10, 1, N'78951243', N'PRUEBA01', N'PRUEBA02', N'Bogotá', N'78412141', 1)
INSERT [dbo].[Estudiante] ([IdEstudiante], [IdTipoIdentificacion], [NumIdentificacion], [Nombres], [Apellidos], [Direccion], [Telefono], [Activo]) VALUES (11, 2, N'147258369', N'DARIO FERNANDO', N'GOMEZ', N'SALITRE', N'6012532545', 1)
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Codigo], [Nombre], [Editorial], [Autor], [Precio], [Ubicacion], [Activo]) VALUES (1, N'LB0002', N'Casa de los espíritus', N'Planeta', N'Isabell Allende', CAST(10000 AS Numeric(18, 0)), N'Estante1', 1)
INSERT [dbo].[Libro] ([IdLibro], [Codigo], [Nombre], [Editorial], [Autor], [Precio], [Ubicacion], [Activo]) VALUES (2, N'LB0002', N'100 AÑOS DE SOLEDAD', N'PLANETA', N'GABRIEL GARCIA MÁRQUEZ', CAST(55555 AS Numeric(18, 0)), N'string', 1)
INSERT [dbo].[Libro] ([IdLibro], [Codigo], [Nombre], [Editorial], [Autor], [Precio], [Ubicacion], [Activo]) VALUES (3, N'LB0001', N'LUCES DE BOHEMIA', N'PLANETA', N'RAMÓN DEL VALLE', CAST(10000 AS Numeric(18, 0)), N'Estante1', 1)
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLibro], [IdEstudiante], [FechaPrestamo], [FechaDevolucion], [Descripcion]) VALUES (2, 2, 4, CAST(N'2023-08-18T21:03:00' AS SmallDateTime), CAST(N'2023-08-21T21:03:00' AS SmallDateTime), N'Libro Cien Años de Soledad')
INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLibro], [IdEstudiante], [FechaPrestamo], [FechaDevolucion], [Descripcion]) VALUES (3, 1, 1, CAST(N'2023-08-18T21:39:00' AS SmallDateTime), CAST(N'2023-08-20T21:39:00' AS SmallDateTime), N'Libro Casa de los espiritus')
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] ON 

INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (1, N'CC', N'CedulaCiudadanía', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (2, N'TI', N'TarjetaIdentidad', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (4, N'CI', N'CedulaCiudadanía', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (5, N'PA', N'Pasaporte', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (6, N'MSI', N'MenorSinIdentificacion', 1)
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Abreviatura], [Descripcion], [Activo]) VALUES (7, N'ASI', N'AdultoSinIdentificacion', 1)
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] OFF
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([IdEstudiante])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Estudiante]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Libro]
GO
USE [master]
GO
ALTER DATABASE [PRU_MOK] SET  READ_WRITE 
GO
