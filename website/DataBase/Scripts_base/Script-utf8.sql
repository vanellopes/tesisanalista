USE [master]
GO
/****** Object:  Database [Veterinaria]    Script Date: 03/04/2013 21:52:19 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Veterinaria')
BEGIN
CREATE DATABASE [Veterinaria] ON  PRIMARY 
( NAME = N'VeterinariaFurious', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Veterinaria.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VeterinariaFurious_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Veterinaria_1.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Veterinaria] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Veterinaria] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Veterinaria] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Veterinaria] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Veterinaria] SET ARITHABORT OFF
GO
ALTER DATABASE [Veterinaria] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Veterinaria] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Veterinaria] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Veterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Veterinaria] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Veterinaria] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Veterinaria] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Veterinaria] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Veterinaria] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Veterinaria] SET  DISABLE_BROKER
GO
ALTER DATABASE [Veterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Veterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Veterinaria] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Veterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Veterinaria] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Veterinaria] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Veterinaria] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Veterinaria] SET  READ_WRITE
GO
ALTER DATABASE [Veterinaria] SET RECOVERY FULL
GO
ALTER DATABASE [Veterinaria] SET  MULTI_USER
GO
ALTER DATABASE [Veterinaria] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Veterinaria] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Veterinaria', N'ON'
GO
USE [Veterinaria]
GO
/****** Object:  User [vetuser]    Script Date: 03/04/2013 21:52:19 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'vetuser')
CREATE USER [vetuser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ubicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ubicacion](
	[Ubicacion_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ubicacion] ON
INSERT [dbo].[Ubicacion] ([Ubicacion_Id], [Descripcion]) VALUES (1, N'página principal')
INSERT [dbo].[Ubicacion] ([Ubicacion_Id], [Descripcion]) VALUES (2, N'páginas del cliente')
INSERT [dbo].[Ubicacion] ([Ubicacion_Id], [Descripcion]) VALUES (3, N'páginas del dueño')
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
/****** Object:  Table [dbo].[TipoSangre]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoSangre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoSangre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_TipoSangre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TipoSangre] ON
INSERT [dbo].[TipoSangre] ([Id], [Nombre]) VALUES (1, N'ORH+')
INSERT [dbo].[TipoSangre] ([Id], [Nombre]) VALUES (2, N'ORH-')
INSERT [dbo].[TipoSangre] ([Id], [Nombre]) VALUES (3, N'AB+')
INSERT [dbo].[TipoSangre] ([Id], [Nombre]) VALUES (4, N'AB-')
SET IDENTITY_INSERT [dbo].[TipoSangre] OFF
/****** Object:  Table [dbo].[Tamano]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tamano]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tamano](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Tamano] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tamano] ON
INSERT [dbo].[Tamano] ([Id], [Nombre]) VALUES (1, N'Pequeño')
INSERT [dbo].[Tamano] ([Id], [Nombre]) VALUES (2, N'Mediano')
INSERT [dbo].[Tamano] ([Id], [Nombre]) VALUES (3, N'Grande')
SET IDENTITY_INSERT [dbo].[Tamano] OFF
/****** Object:  Table [dbo].[Raza]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Raza]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Raza](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Raza] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Raza] ON
INSERT [dbo].[Raza] ([Id], [Nombre]) VALUES (1, N'Perro Peruano')
INSERT [dbo].[Raza] ([Id], [Nombre]) VALUES (2, N'Bulldog')
INSERT [dbo].[Raza] ([Id], [Nombre]) VALUES (3, N'Cocker Spaniel')
INSERT [dbo].[Raza] ([Id], [Nombre]) VALUES (4, N'Pastor Aleman')
SET IDENTITY_INSERT [dbo].[Raza] OFF
/****** Object:  Table [dbo].[Publicacidad]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publicacidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Publicacidad](
	[Publicidad_Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Contenido] [varchar](max) NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[Tarifa] [money] NULL,
	[NumeroClicks] [int] NULL,
	[Ubicacion_Id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Publicacidad] ON
INSERT [dbo].[Publicacidad] ([Publicidad_Id], [Titulo], [Contenido], [FechaInicio], [FechaFin], [Tarifa], [NumeroClicks], [Ubicacion_Id]) VALUES (1, N'Basquet Olimpiadas', N'Se esta realizando las olimpiadas', CAST(0x0000A0A70147F011 AS DateTime), CAST(0x0000A0A70147F011 AS DateTime), 10.5000, 1000, 1)
INSERT [dbo].[Publicacidad] ([Publicidad_Id], [Titulo], [Contenido], [FechaInicio], [FechaFin], [Tarifa], [NumeroClicks], [Ubicacion_Id]) VALUES (2, N'Basquet Olimpiadas', N'Se esta realizando las olimpiadas', CAST(0x0000A0A70172F9B6 AS DateTime), CAST(0x0000A0A70172F9B6 AS DateTime), 10.5000, 1000, 1)
SET IDENTITY_INSERT [dbo].[Publicacidad] OFF
/****** Object:  Table [dbo].[Producto]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[idproducto] [int] NULL,
	[nombreproducto] [varchar](200) NULL,
	[precio] [decimal](18, 2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Producto] ([idproducto], [nombreproducto], [precio]) VALUES (1, N'Champu', CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[Producto] ([idproducto], [nombreproducto], [precio]) VALUES (2, N'Locion Antipulgas', CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[Producto] ([idproducto], [nombreproducto], [precio]) VALUES (3, N'Rico Can', CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[Producto] ([idproducto], [nombreproducto], [precio]) VALUES (4, N'Correa', CAST(8.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[Paciente]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[Paciente_Id] [int] IDENTITY(1,1) NOT NULL,
	[Dueno_Id] [int] NOT NULL,
	[Especie_Id] [int] NOT NULL,
	[Raza_Id] [int] NOT NULL,
	[Genero_Id] [int] NOT NULL,
	[TipoSangre_Id] [int] NOT NULL,
	[Esterilizado] [char](1) NOT NULL,
	[Tamano_Id] [int] NOT NULL,
	[Actividad_Id] [int] NOT NULL,
	[Peso] [numeric](5, 2) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[NotasMedicas] [varchar](1000) NULL,
	[CondicionesEspeciales] [varchar](1000) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[Paciente_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON
INSERT [dbo].[Paciente] ([Paciente_Id], [Dueno_Id], [Especie_Id], [Raza_Id], [Genero_Id], [TipoSangre_Id], [Esterilizado], [Tamano_Id], [Actividad_Id], [Peso], [FechaNacimiento], [NotasMedicas], [CondicionesEspeciales]) VALUES (1, 5, 2, 1, 2, 1, N'1', 1, 2, CAST(15.20 AS Numeric(5, 2)), CAST(0x04360B00 AS Date), N'No hay notas', N'No hay condicones especiales')
INSERT [dbo].[Paciente] ([Paciente_Id], [Dueno_Id], [Especie_Id], [Raza_Id], [Genero_Id], [TipoSangre_Id], [Esterilizado], [Tamano_Id], [Actividad_Id], [Peso], [FechaNacimiento], [NotasMedicas], [CondicionesEspeciales]) VALUES (3, 14, 4, 4, 3, 1, N'0', 1, 1, CAST(30.00 AS Numeric(5, 2)), CAST(0x41360B00 AS Date), N'eeeeeeeeeeeeeeeeeeee', N'eeeeeeeeeeeeeeeeeee')
INSERT [dbo].[Paciente] ([Paciente_Id], [Dueno_Id], [Especie_Id], [Raza_Id], [Genero_Id], [TipoSangre_Id], [Esterilizado], [Tamano_Id], [Actividad_Id], [Peso], [FechaNacimiento], [NotasMedicas], [CondicionesEspeciales]) VALUES (5, 14, 1, 2, 1, 1, N'0', 2, 1, CAST(80.00 AS Numeric(5, 2)), CAST(0x41360B00 AS Date), N'Nota', N'condiciones')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
/****** Object:  Table [dbo].[FacturaCab]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacturaCab]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FacturaCab](
	[codFactura] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[feRegistro] [varchar](10) NULL,
	[status] [char](1) NULL,
	[RUC] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codFactura] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[FacturaCab] ([codFactura], [idCliente], [idPaciente], [feRegistro], [status], [RUC]) VALUES (1, 5, 1, N'2012-08-10', N'X', N'45842412121')
INSERT [dbo].[FacturaCab] ([codFactura], [idCliente], [idPaciente], [feRegistro], [status], [RUC]) VALUES (2, 14, 3, N'2012-08-11', N'A', N'56546546546')
INSERT [dbo].[FacturaCab] ([codFactura], [idCliente], [idPaciente], [feRegistro], [status], [RUC]) VALUES (3, 5, 1, N'2012-08-11', N'A', N'13213123213')
INSERT [dbo].[FacturaCab] ([codFactura], [idCliente], [idPaciente], [feRegistro], [status], [RUC]) VALUES (4, 14, 3, N'2012-08-11', N'X', N'56576676576')
INSERT [dbo].[FacturaCab] ([codFactura], [idCliente], [idPaciente], [feRegistro], [status], [RUC]) VALUES (5, 14, 3, N'2012-08-11', N'A', N'56576676576')
/****** Object:  Table [dbo].[Especie]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Especie]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Especie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Especie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Especie] ON
INSERT [dbo].[Especie] ([Id], [Nombre]) VALUES (1, N'Mamifero')
INSERT [dbo].[Especie] ([Id], [Nombre]) VALUES (2, N'Ave')
INSERT [dbo].[Especie] ([Id], [Nombre]) VALUES (3, N'Batracio')
INSERT [dbo].[Especie] ([Id], [Nombre]) VALUES (4, N'Reptil')
SET IDENTITY_INSERT [dbo].[Especie] OFF
/****** Object:  Table [dbo].[Doctor]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[doctorID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[paterno] [varchar](100) NULL,
	[materno] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[username] [nchar](100) NULL,
	[password] [varchar](200) NOT NULL,
	[grupoID] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON
INSERT [dbo].[Doctor] ([doctorID], [nombre], [paterno], [materno], [email], [telefono], [username], [password], [grupoID]) VALUES (1, N'Samuel', N'Salazar', N'Rodriguez', N'samuel.salazar@gmail.com', N'1234567', N'sam                                                                                                 ', N'123456', 2)
INSERT [dbo].[Doctor] ([doctorID], [nombre], [paterno], [materno], [email], [telefono], [username], [password], [grupoID]) VALUES (7, N'Rocio', N'Miranda', N'Mendez', N'rocio@gmail.com', N'', N'rociom                                                                                              ', N'123456', 1)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[Persona_Id] [int] NOT NULL,
	[Nombres] [varchar](60) NOT NULL,
	[apellido_paterno] [varchar](50) NOT NULL,
	[apellido_materno] [varchar](50) NULL,
	[email] [varchar](60) NULL,
	[telefono] [varchar](15) NULL,
	[tipo_persona] [char](1) NOT NULL,
	[direccion] [varchar](200) NULL,
	[imagen] [varchar](200) NULL,
	[celular] [varchar](15) NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Persona_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (1, N'jose', N'zamudio', N'risco', N'libra5100@hotmail.com', N'5342031', N'C', N'SMP', N'', N'997480042', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (2, N'jose3', N'zamudio3', N'risco3', N'libra2033@hotmail.com', N'5342031', N'C', N'SMP', N'', N'997480042', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (3, N'jose3', N'zamudio3', N'risco3', N'libra2033@hotmail.com', N'5342031', N'C', N'SMP', N'', N'997480042', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (4, N'Melissa', N'Almora B', N'', N'', N'', N'C', N'', NULL, N'', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (5, N'Cinthya', N'Ferreyra', N'Bardales', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (6, N'Angel', N'Ruiz', N'm', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (7, N'Camila', N'Rios', N'Salazar', N'camila@gmail.com', N'', N'C', N'Lima', NULL, N'', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (8, N'Priscilla ', N'Salome', N'', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (9, N'Jhosep', N'laines ', N'', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (10, N'Nilda', N'Panduro', N'', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (11, N'James', N'Villacorta', N'', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (12, N'Leonidas', N'Pizango', N'', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (13, N'Lucia', N'Lujan', N'apagueño ', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (14, N'Jessica', N'Ferbandez ', N'Bardales ', N'', N'', N'C', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (15, N'Rosa ', N'Valderrama', N'Lopez', N'', N'', N'C', N'', NULL, N'', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (16, N'Luis', N'Vargas', N'', N'', N'123455555', N'C', N'Lima', NULL, N'123456789', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (17, N'Erika', N'Peve', N'Peña', N'', N'77821122', N'C', N'', NULL, N'12354566', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (18, N'eduardo', N'zamudio', N'risco', N'libra5100@hotmail.com', N'5342031', N'C', N'SMP', N'', N'997480042', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (19, N'jose', N'manue', N'risco', N'', N'1234567', N'P', N'', NULL, N'', N'A')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (20, N'fgdg', N'fgdfg', N'', N'', N'5646', N'P', N'fdgdg ', NULL, N'', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (21, N'rtet', N'ertert', N'retert', N'', N'', N'P', N'fgdgfdgdfg', NULL, N'', N'X')
INSERT [dbo].[Cliente] ([Persona_Id], [Nombres], [apellido_paterno], [apellido_materno], [email], [telefono], [tipo_persona], [direccion], [imagen], [celular], [estado]) VALUES (22, N'Luis', N'Salazar', N'risco', N'luis.salazar@gmail.com', N'123456', N'C', N'Surco', NULL, N'12354566', N'A')
/****** Object:  Table [dbo].[Cita]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cita]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cita](
	[cita_id] [int] NOT NULL,
	[persona_id] [int] NOT NULL,
	[paciente_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
	[tipo_cita] [char](1) NOT NULL,
	[descripcion_cita] [varchar](300) NULL,
	[nombre_vacuna] [varchar](100) NULL,
	[fecha_cita] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[cita_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cita] ([cita_id], [persona_id], [paciente_id], [doctor_id], [tipo_cita], [descripcion_cita], [nombre_vacuna], [fecha_cita]) VALUES (1, 14, 3, 1, N'V', N'dsfdsfdsf', N'alergia', N'02/08/2012')
INSERT [dbo].[Cita] ([cita_id], [persona_id], [paciente_id], [doctor_id], [tipo_cita], [descripcion_cita], [nombre_vacuna], [fecha_cita]) VALUES (2, 14, 3, 1, N'V', N'gfdg', N'alergia', N'08/08/2012')
INSERT [dbo].[Cita] ([cita_id], [persona_id], [paciente_id], [doctor_id], [tipo_cita], [descripcion_cita], [nombre_vacuna], [fecha_cita]) VALUES (3, 14, 3, 1, N'V', N'rfdfgfdgfdg', N'alergia', N'01/08/2012')
INSERT [dbo].[Cita] ([cita_id], [persona_id], [paciente_id], [doctor_id], [tipo_cita], [descripcion_cita], [nombre_vacuna], [fecha_cita]) VALUES (4, 14, 3, 1, N'V', N'Vacunacio', N'Distemper', N'16/08/2012')
/****** Object:  Table [dbo].[Actividad]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Actividad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actividad] ON
INSERT [dbo].[Actividad] ([Id], [Nombre]) VALUES (1, N'Baja')
INSERT [dbo].[Actividad] ([Id], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Actividad] ([Id], [Nombre]) VALUES (3, N'Alta')
SET IDENTITY_INSERT [dbo].[Actividad] OFF
/****** Object:  Table [dbo].[Genero]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON
INSERT [dbo].[Genero] ([Id], [Nombre]) VALUES (1, N'Canino')
INSERT [dbo].[Genero] ([Id], [Nombre]) VALUES (2, N'Felino')
INSERT [dbo].[Genero] ([Id], [Nombre]) VALUES (3, N'Bovino')
SET IDENTITY_INSERT [dbo].[Genero] OFF
/****** Object:  Table [dbo].[FacturaDetWork]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacturaDetWork]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FacturaDetWork](
	[codFactura] [int] NOT NULL,
	[codProducto] [int] NOT NULL,
	[qtCantidad] [decimal](18, 2) NOT NULL,
	[precio] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (1, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (1, 4, CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (2, 2, CAST(12.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (4, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (4, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (5, 3, CAST(4.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (5, 1, CAST(2.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (6, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDetWork] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (3, 2, CAST(2.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[Vacunas]    Script Date: 03/04/2013 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vacunas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vacunas](
	[nombre_vacuna] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Vacunas] PRIMARY KEY CLUSTERED 
(
	[nombre_vacuna] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Vacunas] ([nombre_vacuna]) VALUES (N'alergia')
INSERT [dbo].[Vacunas] ([nombre_vacuna]) VALUES (N'Distemper')
INSERT [dbo].[Vacunas] ([nombre_vacuna]) VALUES (N'Parvovirus')
INSERT [dbo].[Vacunas] ([nombre_vacuna]) VALUES (N'Rabia')
INSERT [dbo].[Vacunas] ([nombre_vacuna]) VALUES (N'sarampiomn')
/****** Object:  StoredProcedure [dbo].[UP_ListarPaciente]    Script Date: 03/04/2013 21:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UP_ListarPaciente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create PROCEDURE [dbo].[UP_ListarPaciente]
AS
BEGIN
	SET NOCOUNT ON;

		select Paciente_Id,
		cl.Nombres + '' ''+ cl.apellido_paterno + '' '' + cl.apellido_materno as Dueno, 
		es.Nombre as Especie, 
		ra.Nombre as Raza, 
		ge.Nombre as Genero,
		ts.Nombre as ''TipoSangre''	
		from   Paciente pa 
	inner join Actividad ac
		on pa.Actividad_Id = ac.Id
	inner join Especie es
		on pa.Especie_Id = es.Id
	inner join Raza ra
		on pa.Raza_Id = ra.Id
	inner join Genero ge
		on pa.Genero_Id = ge.Id
	inner join TipoSangre ts
		on pa.TipoSangre_Id = ts.Id
	inner join Cliente cl
		on pa.Dueno_Id = cl.Persona_Id 

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UP_GetPaciente]    Script Date: 03/04/2013 21:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UP_GetPaciente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Victor Aguayo S.
-- Create date: 10/08/2012
-- Description:	Trae paciente
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetPaciente]
@Paciente_Id int
AS
BEGIN
	SET NOCOUNT ON;


		SELECT Paciente_Id,
		Dueno_Id,
		cl.Nombres + '' ''+ cl.apellido_paterno + '' '' + cl.apellido_materno as Dueno, 
		Especie_Id,
		es.Nombre as Especie, 
		Raza_Id,
		ra.Nombre as Raza, 
		Genero_Id,
		ge.Nombre as Genero,
		TipoSangre_Id,
		ts.Nombre as ''Tipo Sangre'',
		Esterilizado,
		Tamano_Id,
		ta.Nombre as ''Tamaño'',
		Actividad_Id,
		ac.Nombre as Actividad, 
		Peso,
		FechaNacimiento, NotasMedicas, CondicionesEspeciales
		FROM   Paciente pa 
		inner join Actividad ac
			on pa.Actividad_Id = ac.Id
		inner join Especie es
			on pa.Especie_Id = es.Id
		inner join Raza ra
			on pa.Raza_Id = ra.Id
		inner join Genero ge
			on pa.Genero_Id = ge.Id
		inner join TipoSangre ts
			on pa.TipoSangre_Id = ts.Id
		inner join Tamano ta
			on pa.Tamano_Id = ta.Id 
		inner join Cliente cl
			on pa.Dueno_Id = cl.Persona_Id 
		where Paciente_Id = @Paciente_Id
		
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[UP_GetCombo]    Script Date: 03/04/2013 21:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UP_GetCombo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Victor Aguayo S.
-- Create date: 10/08/2012
-- Description:	Trae Datos para combo
-- =============================================
create PROCEDURE [dbo].[UP_GetCombo]
@ENTIDAD VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

IF (@ENTIDAD = ''ESPECIE'')
	SELECT * FROM Especie


IF @ENTIDAD = ''RAZA''
	SELECT * FROM RAZA 


IF @ENTIDAD = ''ACTIVIDAD''
	SELECT * FROM ACTIVIDAD 


IF @ENTIDAD = ''TAMANO''
	SELECT * FROM TAMANO 


IF @ENTIDAD = ''GENERO''
	SELECT * FROM GENERO 


IF @ENTIDAD = ''TIPOSANGRE''
	SELECT * FROM TIPOSANGRE 


		
END
' 
END
GO
/****** Object:  Table [dbo].[FacturaDet]    Script Date: 03/04/2013 21:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacturaDet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FacturaDet](
	[codFactura] [int] NOT NULL,
	[codProducto] [int] NOT NULL,
	[qtCantidad] [decimal](18, 2) NOT NULL,
	[precio] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (1, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (1, 4, CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (2, 2, CAST(12.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (3, 2, CAST(2.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (4, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (4, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (5, 1, CAST(2.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)))
INSERT [dbo].[FacturaDet] ([codFactura], [codProducto], [qtCantidad], [precio]) VALUES (5, 3, CAST(4.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)))
/****** Object:  Table [dbo].[ImagenesMedicas]    Script Date: 03/04/2013 21:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImagenesMedicas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ImagenesMedicas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Paciente_Id] [int] NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
 CONSTRAINT [PK_ImagenesMedicas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ImagenesMedicas] ON
INSERT [dbo].[ImagenesMedicas] ([Id], [Paciente_Id], [Nombre]) VALUES (1, 1, N'Pata')
INSERT [dbo].[ImagenesMedicas] ([Id], [Paciente_Id], [Nombre]) VALUES (2, 1, N'Craneo')
INSERT [dbo].[ImagenesMedicas] ([Id], [Paciente_Id], [Nombre]) VALUES (3, 1, N'Columna')
SET IDENTITY_INSERT [dbo].[ImagenesMedicas] OFF
/****** Object:  ForeignKey [FK__FacturaDe__codFa__1DE57479]    Script Date: 03/04/2013 21:52:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__FacturaDe__codFa__1DE57479]') AND parent_object_id = OBJECT_ID(N'[dbo].[FacturaDet]'))
ALTER TABLE [dbo].[FacturaDet]  WITH CHECK ADD FOREIGN KEY([codFactura])
REFERENCES [dbo].[FacturaCab] ([codFactura])
GO
/****** Object:  ForeignKey [FK_ImagenesMedicas_Paciente]    Script Date: 03/04/2013 21:52:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImagenesMedicas_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImagenesMedicas]'))
ALTER TABLE [dbo].[ImagenesMedicas]  WITH CHECK ADD  CONSTRAINT [FK_ImagenesMedicas_Paciente] FOREIGN KEY([Paciente_Id])
REFERENCES [dbo].[Paciente] ([Paciente_Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ImagenesMedicas_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[ImagenesMedicas]'))
ALTER TABLE [dbo].[ImagenesMedicas] CHECK CONSTRAINT [FK_ImagenesMedicas_Paciente]
GO
