USE [master]
GO
/****** Object:  Database [ClinicaGrupo15]    Script Date: 14/06/2025 17:59:04 ******/
CREATE DATABASE [ClinicaGrupo15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicaGrupo15', FILENAME = N'C:\Users\RTECH\Desktop\Study\Visual Studio\TPI_BaseDeDatos\ClinicaGrupo15.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicaGrupo15_log', FILENAME = N'C:\Users\RTECH\Desktop\Study\Visual Studio\TPI_BaseDeDatos\ClinicaGrupo15_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClinicaGrupo15] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicaGrupo15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicaGrupo15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClinicaGrupo15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaGrupo15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicaGrupo15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicaGrupo15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicaGrupo15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicaGrupo15] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicaGrupo15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicaGrupo15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicaGrupo15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicaGrupo15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicaGrupo15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicaGrupo15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClinicaGrupo15] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClinicaGrupo15] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClinicaGrupo15]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[Legajo_Admin] [char](8) NOT NULL,
	[Contraseña_Admin] [varchar](30) NOT NULL,
	[Nombre_Admin] [varchar](20) NOT NULL,
	[Apellido_Admin] [varchar](20) NOT NULL,
	[Correo_Admin] [varchar](50) NOT NULL,
	[Telefono_Admin] [varchar](20) NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[Legajo_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[CodPostal_Ciudad] [char](4) NOT NULL,
	[CodProvincia] [char](4) NOT NULL,
	[Desc_Ciudad] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[CodPostal_Ciudad] ASC,
	[CodProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultas](
	[CodConsultas] [char](8) NOT NULL,
	[LegajoMedico_Cons] [char](8) NOT NULL,
	[DNIPaciente_Cons] [char](8) NOT NULL,
	[PresenciaPaciente] [bit] NOT NULL,
	[Observacion_Cons] [varchar](150) NULL,
 CONSTRAINT [PK_Consultas] PRIMARY KEY CLUSTERED 
(
	[CodConsultas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[Cod_Especialidad] [char](6) NOT NULL,
	[Especialidad] [varchar](30) NOT NULL,
	[Desc_Espec] [varchar](100) NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[Cod_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Legajo_Medico] [char](8) NOT NULL,
	[DNI_Medico] [char](8) NOT NULL,
	[Nombre_Medico] [varchar](50) NOT NULL,
	[Apellido_Medico] [varchar](50) NOT NULL,
	[Sexo_Medico] [varchar](10) NOT NULL,
	[CodEspecialidad_Medico] [char](6) NOT NULL,
	[Nacionalidad_Medico] [varchar](50) NOT NULL,
	[FechaNacimiento_Medico] [date] NOT NULL,
	[Direccion_Medico] [varchar](50) NOT NULL,
	[Ciudad_Medico] [varchar](40) NOT NULL,
	[Provincia_Medico] [varchar](40) NOT NULL,
	[Correo_Medico] [varchar](50) NOT NULL,
	[Telefono_Medico] [varchar](20) NOT NULL,
	[DiasAtencion_Medico] [varchar](100) NOT NULL,
	[HorarioInicio_Medico] [time](7) NOT NULL,
	[HorarioFin_Medico] [time](7) NOT NULL,
	[Contraseña_Medico] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Legajo_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[DNI_Paciente] [char](8) NOT NULL,
	[Nombre_Paciente] [varchar](20) NOT NULL,
	[Apellido_Paciente] [varchar](20) NOT NULL,
	[Sexo_Paciente] [varchar](10) NOT NULL,
	[FechaNacimiento_Paciente] [date] NOT NULL,
	[Correo_Paciente] [varchar](50) NULL,
	[Telefono_Paciente] [varchar](20) NOT NULL,
	[Direccion_Paciente] [varchar](50) NOT NULL,
	[CodCiudad_Paciente] [char](4) NOT NULL,
	[CodProvincia_Paciente] [char](4) NOT NULL,
	[Estado_Paciente] [bit] NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[DNI_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[CodProvincia] [char](4) NOT NULL,
	[Desc_Provincia] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[CodProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 14/06/2025 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[Cod_Turno] [char](8) NOT NULL,
	[LegajoMedico_Turnos] [char](8) NOT NULL,
	[DNIPaciente_Turnos] [char](8) NOT NULL,
	[LegajoAdmin_Turnos] [char](8) NOT NULL,
	[Dia_Turnos] [datetime] NOT NULL,
	[Horarios_Turnos] [time](7) NOT NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[Cod_Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Estado_Paciente]
GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Provincia] FOREIGN KEY([CodProvincia])
REFERENCES [dbo].[Provincias] ([CodProvincia])
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudad_Provincia]
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_Medicos] FOREIGN KEY([LegajoMedico_Cons])
REFERENCES [dbo].[Medicos] ([Legajo_Medico])
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_Medicos]
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_Pacientes] FOREIGN KEY([DNIPaciente_Cons])
REFERENCES [dbo].[Pacientes] ([DNI_Paciente])
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_Pacientes]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Especialidades] FOREIGN KEY([CodEspecialidad_Medico])
REFERENCES [dbo].[Especialidades] ([Cod_Especialidad])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_Medicos_Especialidades]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Ciudades] FOREIGN KEY([CodCiudad_Paciente], [CodProvincia_Paciente])
REFERENCES [dbo].[Ciudades] ([CodPostal_Ciudad], [CodProvincia])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Ciudades]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Administradores] FOREIGN KEY([LegajoAdmin_Turnos])
REFERENCES [dbo].[Administradores] ([Legajo_Admin])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Administradores]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Medicos] FOREIGN KEY([LegajoMedico_Turnos])
REFERENCES [dbo].[Medicos] ([Legajo_Medico])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Medicos]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Pacientes] FOREIGN KEY([DNIPaciente_Turnos])
REFERENCES [dbo].[Pacientes] ([DNI_Paciente])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [FK_Turnos_Pacientes]
GO
USE [master]
GO
ALTER DATABASE [ClinicaGrupo15] SET  READ_WRITE 
GO
