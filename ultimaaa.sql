USE [master]
GO
/****** Object:  Database [cursos]    Script Date: 08/12/2017 18:26:21 ******/
CREATE DATABASE [cursos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cursos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NILDS\MSSQL\DATA\cursos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cursos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NILDS\MSSQL\DATA\cursos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cursos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cursos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cursos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cursos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cursos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cursos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cursos] SET ARITHABORT OFF 
GO
ALTER DATABASE [cursos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cursos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cursos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cursos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cursos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cursos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cursos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cursos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cursos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cursos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cursos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cursos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cursos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cursos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cursos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cursos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cursos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cursos] SET RECOVERY FULL 
GO
ALTER DATABASE [cursos] SET  MULTI_USER 
GO
ALTER DATABASE [cursos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cursos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cursos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cursos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [cursos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cursos', N'ON'
GO
USE [cursos]
GO
/****** Object:  User [yo]    Script Date: 08/12/2017 18:26:21 ******/
CREATE USER [yo] FOR LOGIN [yo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[aula]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plazas] [int] NULL,
	[nombre] [varchar](50) NULL,
	[nro_aula] [varchar](50) NULL,
	[ubicacion] [varchar](50) NULL,
 CONSTRAINT [PK_aula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carrera]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carrera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_tipocarrera] [int] NULL,
	[total_creditos] [int] NULL,
 CONSTRAINT [PK_carrera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[curso]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[curso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creditos] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_curso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_cc]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_cc](
	[id_carrera] [int] NOT NULL,
	[id_curso] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[ci] [varchar](50) NULL,
	[id_grupo] [int] NULL,
 CONSTRAINT [PK_estudiante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grupo]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grupo](
	[horario] [varchar](20) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[id_aula] [int] NULL,
	[id_curso] [int] NULL,
	[id_profesor] [int] NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_grupo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inscripcion]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inscripcion](
	[horario] [varchar](20) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_matricula] [int] NULL,
	[id_pago] [int] NULL,
	[id_alumno] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_inscripcion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[matricula]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matricula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[id_carrera] [int] NULL,
 CONSTRAINT [PK_matricula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nota]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nota](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[puntaje] [decimal](10, 2) NULL,
 CONSTRAINT [PK_nota] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pago]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](10, 2) NULL,
	[estado] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profesor]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profesor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ci] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[titulo] [varchar](50) NULL,
	[especialidad] [varchar](50) NULL,
 CONSTRAINT [PK_profesor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipocarrera]    Script Date: 08/12/2017 18:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipocarrera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[tiempo] [varchar](50) NULL,
 CONSTRAINT [PK_tipocarrera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[carrera]  WITH CHECK ADD  CONSTRAINT [FK_carrera_tipocarrera] FOREIGN KEY([id_tipocarrera])
REFERENCES [dbo].[tipocarrera] ([id])
GO
ALTER TABLE [dbo].[carrera] CHECK CONSTRAINT [FK_carrera_tipocarrera]
GO
ALTER TABLE [dbo].[detalle_cc]  WITH CHECK ADD  CONSTRAINT [FK_detalle_cc_carrera] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[carrera] ([id])
GO
ALTER TABLE [dbo].[detalle_cc] CHECK CONSTRAINT [FK_detalle_cc_carrera]
GO
ALTER TABLE [dbo].[detalle_cc]  WITH CHECK ADD  CONSTRAINT [FK_detalle_cc_curso] FOREIGN KEY([id_curso])
REFERENCES [dbo].[curso] ([id])
GO
ALTER TABLE [dbo].[detalle_cc] CHECK CONSTRAINT [FK_detalle_cc_curso]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_grupo] FOREIGN KEY([id_grupo])
REFERENCES [dbo].[grupo] ([id])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_grupo]
GO
ALTER TABLE [dbo].[grupo]  WITH CHECK ADD  CONSTRAINT [FK_grupo_aula] FOREIGN KEY([id_aula])
REFERENCES [dbo].[aula] ([id])
GO
ALTER TABLE [dbo].[grupo] CHECK CONSTRAINT [FK_grupo_aula]
GO
ALTER TABLE [dbo].[grupo]  WITH CHECK ADD  CONSTRAINT [FK_grupo_curso] FOREIGN KEY([id_curso])
REFERENCES [dbo].[curso] ([id])
GO
ALTER TABLE [dbo].[grupo] CHECK CONSTRAINT [FK_grupo_curso]
GO
ALTER TABLE [dbo].[grupo]  WITH CHECK ADD  CONSTRAINT [FK_grupo_profesor] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[profesor] ([id])
GO
ALTER TABLE [dbo].[grupo] CHECK CONSTRAINT [FK_grupo_profesor]
GO
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_estudiante] FOREIGN KEY([id_alumno])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_estudiante]
GO
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_matricula] FOREIGN KEY([id_matricula])
REFERENCES [dbo].[matricula] ([id])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_matricula]
GO
ALTER TABLE [dbo].[inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_inscripcion_pago] FOREIGN KEY([id_pago])
REFERENCES [dbo].[pago] ([id])
GO
ALTER TABLE [dbo].[inscripcion] CHECK CONSTRAINT [FK_inscripcion_pago]
GO
ALTER TABLE [dbo].[matricula]  WITH CHECK ADD  CONSTRAINT [FK_matricula_carrera] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[carrera] ([id])
GO
ALTER TABLE [dbo].[matricula] CHECK CONSTRAINT [FK_matricula_carrera]
GO
USE [master]
GO
ALTER DATABASE [cursos] SET  READ_WRITE 
GO
