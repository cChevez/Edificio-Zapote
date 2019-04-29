use master
if not exists(select * from sysdatabases where name = 'Proyecto') 
	create database [Proyecto];--si no existe, la crea
go

use [Proyecto]
go

--/* Create a table type. */  
--CREATE TYPE HorasSolicitudTable AS TABLE(
--	dia date,
--	horaInicio datetime,
--	horaFinal datetime
--);
--go

create or alter procedure insertarReservacion @fechaSolicitud date, @nombreSolicitante nvarchar(50), @empresaSolicitante nvarchar(50), @nombreActividad nvarchar(50), @cedulaJuridica varchar(50), @email nvarchar(50), @numeroTelefono varchar(50),
@descripcion nvarchar(100), @cantidadParticipantes int, 
--@dia date, @horaInicio datetime, @horaFinal datetime, 
@videobin bit, @TipoReservacion int, @administrador int
as begin
	set nocount on
	begin transaction
	begin try
		Declare @idAula int
		Declare @idLaboratorio int
		set @idAula = (Select A.id from Aula A inner join HorasSolicitudTable H on H.numAula = A.numeroAula)
		if @idAula is not null
		begin
			if not exists(select 1 from Aula A where A.id = @idAula)
			begin
				rollback
				select ERROR_MESSAGE()
				return -1
			end
			if exists(select * from HorarioReservado HS
							inner join Reservacion R on R.FKHorarioReservado = HS.id
							inner join Aula A on A.id = R.FKAula
							inner join HorasSolicitudTable T on
								HS.dia = T.dia and HS.dia = T.dia and 
								((HS.horaInicio >= T.horaInicio and HS.horaInicio <= T.horaFinal)
								or (HS.horaFinal >= T.horaFinal and HS.horaFinal <= T.horaFinal)))
			begin
				rollback
				select ERROR_MESSAGE()
				return -1
			end
			insert into HorarioReservado(dia, horaInicio, horaFinal) select T.dia, T.horaInicio, T.horaFinal from HorasSolicitudTable T
			insert into Reservacion(fechaSolicitud, nombreSolicitante, nombreEmpresa, nombreActividad, cedulaJuridica, email, numeroTelefono, descripcion, cantidadParticipantes, videoBin, FKTipoReservacion,FKHorarioReservado, FKAdministrador,FKAula,FKLaboratorio) values (@fechaSolicitud, @nombreSolicitante, @empresaSolicitante,@nombreActividad, @cedulaJuridica, @email, @numeroTelefono, @descripcion,@cantidadParticipantes, @videobin, @TipoReservacion, @@IDENTITY, @administrador, @idAula, @idLaboratorio)
			commit
			return @@identity
		end
		if @idLaboratorio is not null
		begin
			if not exists(select 1 from Aula A where A.id = @idLaboratorio)
			begin
				rollback
				select ERROR_MESSAGE()
				return -1
			end
			if exists(select * from HorarioReservado HS
							inner join Reservacion R on R.FKHorarioReservado = HS.id
							inner join Aula A on A.id = R.FKAula
							inner join HorasSolicitudTable T on 
								HS.dia = T.dia and HS.dia = T.dia and 
								((HS.horaInicio >= T.horaInicio and HS.horaInicio <= T.horaFinal)
								or (HS.horaFinal >= T.horaFinal and HS.horaFinal <= T.horaFinal)))
			begin
				rollback
				select ERROR_MESSAGE()
				return -1
			end
			insert into HorarioReservado(dia, horaInicio, horaFinal) select T.dia, T.horaInicio, T.horaFinal from HorasSolicitudTable T
			insert into Reservacion(fechaSolicitud, nombreSolicitante, nombreEmpresa, nombreActividad, cedulaJuridica, email, numeroTelefono, descripcion, cantidadParticipantes, videoBin, FKTipoReservacion,FKHorarioReservado, FKAdministrador,FKAula,FKLaboratorio) values (@fechaSolicitud, @nombreSolicitante, @empresaSolicitante,@nombreActividad, @cedulaJuridica, @email, @numeroTelefono, @descripcion,@cantidadParticipantes, @videobin, @TipoReservacion, @@IDENTITY, @administrador, @idAula, @idLaboratorio)
			commit
			return @@identity
		end
	end try
	begin catch
		rollback
		select ERROR_MESSAGE()
		return -1
	end catch
end
go



create or alter procedure insertarTotal @fechaReservacion date, @nombre varchar(50), @empresa varchar(50), @cedula varchar(50) , @correo varchar(50), @telefono varchar(50), 
@nombreActividad varchar(50), @fechaInicio date, @fechaFinal date, @observaciones varchar(250), @cantidadParticipantes int
as begin
	set nocount on;
	begin transaction;
	begin try
	Execute insertarReservacion @fechaReservacion, @nombre, @empresa, @nombreActividad,@cedula,@correo,@telefono,@observaciones,@cantidadParticipantes, 1, 1,1
	DELETE FROM HorasSolicitudTable
	commit;
	end try
	begin catch
		rollback
		return -50001;
	end catch
end
go


Create or alter Procedure SaveFile @Name varchar (250), @Path varchar(max), @extension varchar(5)
as begin
	insert into FilesSave (NameOfFile,FilePath,ext) values (@Name,@Path,@extension)
end 
go



Create or alter Procedure TestSP
as begin
	DECLARE @variable varchar(100)
	Select @variable =  M.NameOfFile from FilesSave M;
	PRINT @variable
end 
go






--set nocount on
--declare @tablaConHoras as HorasSolicitudTable
--insert into @tablaConHoras(dia, horaInicio, horaFinal,numAula,numLab) values ('12-13-19','10:00:00','11:00:00')
--insert into @tablaConHoras(dia, horaInicio, horaFinal,numAula,numLab) values ('12-14-19','09:00:00','11:00:00')
--insert into @tablaConHoras(dia, horaInicio, horaFinal,numAula,numLab) values ('12-15-19','09:00:00','11:00:00')
--set nocount off

--Exec insertarReservacion '12-12-2019', 'Andres', 'Test', 'Test actividad', 12345124,'andreguti333@gmail.com',5141414,'Test description',15, @tablaConHoras,1,null,1,1,1
----Exec insertarReservacion '12-13-19', 'Andres', 'Test', 'Test actividad', 12345124,'andreguti333@gmail.com',5141414,'Test description',15, @tablaConHoras,1,null,1,1,1


--set nocount on
--declare @tablaConHoras1 as HorasSolicitudTable
--insert into @tablaConHoras1(dia, horaInicio, horaFinal) values ('12-20-19','09:00:00','11:00:00')
--insert into @tablaConHoras1(dia, horaInicio, horaFinal) values ('12-21-19','10:00:00','11:00:00')
--insert into @tablaConHoras1(dia, horaInicio, horaFinal) values ('12-22-19','09:00:00','11:00:00')
--insert into @tablaConHoras1(dia, horaInicio, horaFinal) values ('12-23-19','09:00:00','11:00:00')
--set nocount off

--Exec insertarReservacion '12-13-19', 'Andres', 'Test', 'Test actividad', 12345124,'andreguti333@gmail.com',5141414,'Test description',15, @tablaConHoras1,1,null,1,1,1



--set nocount on
--declare @tablaConHoras2 as HorasSolicitudTable
--insert into @tablaConHoras2(dia, horaInicio, horaFinal) values ('12-24-19','09:00:00','11:00:00')
--insert into @tablaConHoras2(dia, horaInicio, horaFinal) values ('12-25-19','10:00:00','11:00:00')
--insert into @tablaConHoras2(dia, horaInicio, horaFinal) values ('12-26-19','09:00:00','11:00:00')
--insert into @tablaConHoras2(dia, horaInicio, horaFinal) values ('12-27-19','09:00:00','11:00:00')
--set nocount off

--Exec insertarReservacion '12-14-19', 'Andres', 'Test', 'Test actividad', 12345124,'darklightbeing@gmail.com',5141414,'Test description',15, @tablaConHoras2,1,null,1,1,1


--set nocount on
--declare @tablaConHoras3 as HorasSolicitudTable
--insert into @tablaConHoras3(dia, horaInicio, horaFinal) values ('12-28-19','09:00:00','11:00:00')
--insert into @tablaConHoras3(dia, horaInicio, horaFinal) values ('12-29-19','10:00:00','11:00:00')
--insert into @tablaConHoras3(dia, horaInicio, horaFinal) values ('12-30-19','09:00:00','11:00:00')
--insert into @tablaConHoras3(dia, horaInicio, horaFinal) values ('12-31-19','09:00:00','11:00:00')
--set nocount off

--Exec insertarReservacion '12-14-19', 'Andres', 'Test', 'Test actividad', 12345124,'cjchevezc@gmail.com',5141414,'Test description',15, @tablaConHoras3,1,null,1,1,1


DELETE FROM HorasSolicitudTable
--DELETE FROM Reservacion
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','09:00:00','11:00:00',1,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','13:00:00','15:00:00',2,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','16:00:00','19:00:00',3,null)



Exec insertarTotal '12-14-2019', 'nombreSolic', 'nombreEmpresa', '2-0004-3123', 'test@test.com', '5124-1351','NombreActividad','12-14-19', '12-20-19','observacion', 12

--DELETE FROM FilesSave

--exec SaveFile 'sqlservercentral_logo','C:\test','.jpg'

--exec TestSP

Declare @idAula int
set @idAula = (Select A.id from Aula A inner join HorasSolicitudTable H on H.numAula = A.numeroAula)

PRINT @idAula