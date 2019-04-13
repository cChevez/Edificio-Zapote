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

create table HorarioReservado(
	id int identity primary key,
	dia date not null,
	horaInicio datetime not null,
	horaFinal datetime not null
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
	FKHorarioReservado int constraint FKHorarioReservadoXReservacion foreign key references HorarioReservado(id) not null,
	FKAdministrador int constraint FKAdministradorXReservacion foreign key references Administrador(id),
	FKAula int constraint FKAulaXReservacion foreign key references Aula(id),
	FKLaboratorio int constraint FKLaboratorioXReservacion foreign key references Laboratorio(id),
	videoBin bit not null
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
	horaFinal datetime
);
