use master
if exists(select * from sysdatabases where name = 'Proyecto')--si existe, la borra y luego la crea de nuevo
begin
	drop database [Proyecto];
end
create database [Proyecto]
go

use [Proyecto]

go

create table Administrador(

	id int identity primary key,
	nombre nvarchar(50) not null,
	apellido nvarchar(50) not null,
	email nvarchar(50) unique not null,
	contra nvarchar(25) not null
);

create table Operador(
	id int identity primary key,
	nombre nvarchar(50) not null,
	apellido nvarchar(50) not null,
	email nvarchar(50) unique not null,
);

create table TipoReservacion(
	id int identity primary key,
	nombre nvarchar(50) not null,
	descripcion nvarchar(200) not null
);

create table Aula(
	id int identity primary key,
	numeroAula int not null,
	cantidadMax int not null
);

create table Laboratorio(
	id int identity primary key,
	numeroLab int not null,
	cantidadMax int not null
);
	/*
	FKAula int constraint FKAulaXRHorarioReservado foreign key references Aula(id),
	FKLaboratorio int constraint FKLaboratorioXHorarioReservado foreign key references Laboratorio(id)
	*/

create table estadoReservacion(
	id int identity primary key,
	nombreEstado varchar(50),
	descripcion varchar(250)
);


create table Estudiante(

	id int identity primary key,
	nombre nvarchar(50) not null,
	apellido nvarchar(50) not null,
	email nvarchar(50) unique not null,
	--contra nvarchar(25) not null
);

create table Reservacion(
	id int identity primary key,
	fechaSolicitud date not null,
	nombreSolicitante nvarchar(50) not null,	
	nombreEmpresa nvarchar(50) not null,	
	nombreActividad nvarchar(50) not null,	
	cedulaJuridica varchar(50) not null,
	email nvarchar(50) not null,
	numeroTelefono varchar(50) not null,
	descripcion nvarchar(100) not null,	
	cantidadParticipantes int not null,
	FKTipoReservacion int constraint FKTipoReservacionXReservacion foreign key references TipoReservacion(id) not null,
	FKAdministrador int constraint FKAdministradorXReservacion foreign key references Administrador(id),
	videoBin bit not null,
	FKEstadoReservacion int constraint FKEstadoReservacionXReservacion foreign key references estadoReservacion(id) not null,
	fechaInicioActividad date not null,
	fechaFinalActividad date not null,
	monto int,
);

create table HorarioReservado(
	id int identity primary key,
	dia date not null,
	horaInicio datetime not null,
	horaFinal datetime not null,
	FKAula int,
	FKLaboratorio int,
	FKReservacion int constraint FKHorarioReservadoXReservacion foreign key references Reservacion(id) not null,
);

create table HorarioEstudiante(
	id int identity primary key,
	dia varchar(15) not null,
	horaInicio datetime not null,
	horaFinal datetime not null,
	FKHorarioEstudiante int constraint FKHorarioReservadoXEstudiante foreign key references Estudiante(id) not null,
);


create table Comprobante(
	id int identity primary key,
	imgComprobante image not null,
	FKReservacion int constraint FKComprobanteXReservacion foreign key references Reservacion(id) not null,

);

CREATE Table HorasSolicitudTable(
	id int identity primary key,
	dia date,
	horaInicio datetime,
	horaFinal datetime,
	numAula int CONSTRAINT CHK_NumAula CHECK (numAula>=1 AND numAula <=3), 
	numLab int CONSTRAINT CHK_NumLab CHECK (numLab>=1 AND numLab <=2),
	CONSTRAINT CHK_HorasReserva CHECK (horaInicio < horaFinal),
	CONSTRAINT CHK_DiaReserva CHECK (horaInicio < horaFinal),
);

CREATE Table HorasHorariosTable(
	id int identity primary key,
	dia varchar(15),
	horaInicio datetime,
	horaFinal datetime,
	CONSTRAINT CHK_HorasHorarios CHECK (horaInicio < horaFinal),
	CONSTRAINT CHK_DiaHoraHorarios CHECK (horaInicio < horaFinal),
);

CREATE Table FilesSave(
	id int identity primary key,
	NameOfFile varchar(250),
	FilePath varchar(MAX),
	ext varchar(5)
);

CREATE Table Archivos(
	id int identity primary key,
	nombre varchar(250) not null,
	archivo	image(MAX) not null,
	size int not null,	
);