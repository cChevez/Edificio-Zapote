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
@videobin bit, @TipoReservacion int, @administrador int, @fechaInicioActividad date, @FechaFinalActividad date
as begin
	set nocount on
	begin transaction
	begin try
		if exists(select * from HorarioReservado HS
					inner join HorasSolicitudTable T on
					HS.dia = T.dia and HS.dia = T.dia and 
					((HS.horaInicio >= T.horaInicio and HS.horaInicio < T.horaFinal)
					or (HS.horaFinal > T.horaInicio and HS.horaFinal <= T.horaFinal))
					inner join Aula A on A.numeroAula = T.numAula
					where HS.FKAula is not null and HS.FKLaboratorio is null and T.numAula is not null and T.numLab is null
					and A.id = HS.FKAula)
		begin
			rollback
			select ERROR_MESSAGE()
			return -1
		end
		if exists(select * from HorarioReservado HS
					inner join HorasSolicitudTable T on
					HS.dia = T.dia and HS.dia = T.dia and 
					((HS.horaInicio >= T.horaInicio and HS.horaInicio < T.horaFinal)
					or (HS.horaFinal > T.horaInicio and HS.horaFinal <= T.horaFinal))
					inner join Laboratorio L on L.numeroLab = T.numLab
					where HS.FKAula is null and HS.FKLaboratorio is not null and T.numAula is null and T.numLab is not null
					and L.id = HS.FKLaboratorio)
		begin
			rollback
			select ERROR_MESSAGE()
			return -1
		end
		insert into HorarioReservado(dia, horaInicio, horaFinal, FKAula, FKLaboratorio) 
			select T.dia, T.horaInicio, T.horaFinal, A.id, null
			from HorasSolicitudTable T
			inner join Aula A on A.numeroAula = T.numAula
			where T.numLab is null
		insert into HorarioReservado(dia, horaInicio, horaFinal, FKAula, FKLaboratorio) 
			select T.dia, T.horaInicio, T.horaFinal, null, L.id
			from HorasSolicitudTable T
			inner join Laboratorio L on L.numeroLab = T.numLab
			where T.numAula is null
		select * from HorarioReservado
		insert into Reservacion(fechaSolicitud, nombreSolicitante, nombreEmpresa, nombreActividad, cedulaJuridica, email, numeroTelefono, descripcion, cantidadParticipantes, videoBin, FKTipoReservacion, FKHorarioReservado, FKAdministrador, FKEstadoReservacion,fechaInicioActividad,fechaFinalActividad) values (@fechaSolicitud, @nombreSolicitante, @empresaSolicitante,@nombreActividad, @cedulaJuridica, @email, @numeroTelefono, @descripcion,@cantidadParticipantes, @videobin, @TipoReservacion, @@IDENTITY, @administrador, 1,@fechaInicioActividad,@FechaFinalActividad)
		
	commit
	return @@identity
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
	Execute insertarReservacion @fechaReservacion, @nombre, @empresa, @nombreActividad,@cedula,@correo,@telefono,@observaciones,@cantidadParticipantes, 1, 1,1, @fechaInicio, @fechaFinal
	DELETE FROM HorasSolicitudTable
	commit;
	end try
	begin catch
		--rollback
		return -50001;
	end catch
end
go


Create or alter Procedure SaveFile @Name varchar (250), @Path varchar(max), @extension varchar(5)
as begin
	insert into FilesSave (NameOfFile,FilePath,ext) values (@Name,@Path,@extension)
end 
go


Create or alter Procedure SaveHoraSolicitudTable @dia date, @HoraInicio datetime, @HoraFinal datetime, @numAula int, @numLab int
as begin
	if exists(SELECT * FROM HorasSolicitudTable WHERE dia=@dia and horaInicio=@HoraInicio and @HoraFinal=@HoraFinal and numAula=@numAula and numLab is NULL)
		begin
			rollback
		end
	else if exists(SELECT * FROM HorasSolicitudTable WHERE dia=@dia and horaInicio=@HoraInicio and @HoraFinal=@HoraFinal and numLab=@numLab and numAula is NULL)
	begin 
		rollback
	end
	else
	begin 
		insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values (@dia,@HoraInicio,@HoraFinal,@numAula,@numLab)
	end
end 
go

Create or alter Procedure CorreoAvisoComprobante
as begin
	
	DECLARE @nombre VARCHAR(MAX)
	DECLARE @nombreActividad VARCHAR(MAX)
	DECLARE @id INT
	DECLARE @contador INT
	DECLARE @Mensaje VARCHAR(MAX)
	DECLARE @Email VARCHAR(MAX)
	DECLARE @titulo VARCHAR(MAX)
	SET @contador=1

	IF OBJECT_ID('tempdb..#temp') IS NOT NULL
		DROP TABLE #temp

	SELECT R.email, R.nombreSolicitante, R.nombreActividad, R.id, IDENTITY(INT,1,1) AS rn INTO #temp 	
	FROM Reservacion R	
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	WHERE (DATEDIFF(DAY,getDate(), HR.dia) = 2 AND R.FKEstadoReservacion = 1)
	/*
	SELECT R.email, R.nombreSolicitante, R.id, IDENTITY(INT,1,1) AS rn INTO #temp 	
	FROM Reservacion R	
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	WHERE (DATEDIFF(DAY,'04-30-19', HR.dia) = 2 AND R.FKEstadoReservacion = 1)
	*/
	Select * from #temp

	while @contador <= (SELECT COUNT(*) FROM #temp)
	BEGIN
	SELECT @nombre=nombreSolicitante,@id=id, @Email=email, @nombreActividad=nombreActividad FROM #temp WHERE rn=@contador
	SELECT @Mensaje = 'Se�or(a) ' + @nombre + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Se le recuerda que tiene una reservaci�n pendiente para la actividad '+@nombreActividad+', para la cu�l quedan dos d�as y a�n no se ha enviado el comprobante de pago.' +CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'En caso de haber realizado el pago, se le solicita enviar el comprobante de pago a trav�s de la plataforma.'+ CHAR(10) + CHAR(13) + 
	'Su numero de reservacion es: ' +CAST(@id as varchar(10)) + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Si no ha realizado el pago, recuerde que puede utilizar los siguientes n�meros de cuenta:'+ CHAR(10) + CHAR(13) + 
	'>>> Banco Nacional       # 75-003959-4'+ CHAR(10) + CHAR(13) + 
	'>>> Banco de Costa Rica  # 275-004039-8'+ CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Si no sube el comprobante el d�a de hoy antes de las 4 de la tarde, se proceder� a realizar el bloqueo y cancelaci�n de su reservaci�n. Si tiene alg�n problema o desea cancelar su reservaci�n comun�quese al 2250-9160 con Sarela G�mez.'+ CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Correo generado de manera autom�tica, por favor no responda este correo ya que no recibir� ninguna respueta.'
	
	Select @titulo = 'Aviso Comprobante: '+@nombre
	
	EXEC msdb.dbo.sp_send_dbmail
		@profile_Name = 'ProyectoEmail',
		--@recipients = @copy_to,
		@recipients = @Email,
		--@copy_recipients = 'andreguti333@gmail.com',
		@subject = @titulo,
		@body = @Mensaje
		--@body_format = 'HTML'
		
	SET @contador=@contador+1
	/*
	select DATEDIFF(DAY,'03-02-19', HR.dia) from Reservacion R
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	*/
	end
end
go


Create or alter Procedure CorreoBloqueoReserva
as begin
	
	DECLARE @nombre VARCHAR(MAX)
	DECLARE @nombreActividad VARCHAR(MAX)
	DECLARE @nombreEmpresa VARCHAR(MAX)
	DECLARE @id INT
	DECLARE @contador INT
	DECLARE @Mensaje VARCHAR(MAX)
	DECLARE @MensajeAdmin VARCHAR(MAX)
	DECLARE @Email VARCHAR(MAX)
	DECLARE @titulo VARCHAR(MAX)
	DECLARE @Fecha varchar(10)
	SET @contador=1

	IF OBJECT_ID('tempdb..#temp') IS NOT NULL
		DROP TABLE #temp

	SELECT R.email, R.nombreSolicitante, R.nombreActividad, R.id, R.nombreEmpresa, R.fechaInicioActividad ,IDENTITY(INT,1,1) AS rn INTO #temp 	
	FROM Reservacion R	
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	WHERE (DATEDIFF(DAY,getDate(), HR.dia) = 2 AND R.FKEstadoReservacion = 1)
	--DECLARE @Fecha date

	--Select @Fecha= HR.dia from HorarioReservado HR 
	--inner join Reservacion R on R.FKHorarioReservado = HR.id

	--PRINT @fecha

	/*
	SELECT R.email, R.nombreSolicitante, R.id, IDENTITY(INT,1,1) AS rn INTO #temp 	
	FROM Reservacion R	
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	WHERE (DATEDIFF(DAY,'04-30-19', HR.dia) = 2 AND R.FKEstadoReservacion = 1)
	*/
	Select * from #temp

	while @contador <= (SELECT COUNT(*) FROM #temp)
	BEGIN
	SELECT @nombre=nombreSolicitante,@id=id, @Email=email, @nombreActividad=nombreActividad, @nombreEmpresa=nombreEmpresa, @Fecha=convert(varchar, fechaInicioActividad, 105) FROM #temp WHERE rn=@contador
	SELECT @Mensaje = 'Se�or(a) ' + @nombre + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Se le comunica que la reservaci�n n�mero '+CAST(@id as varchar(10)) +' para la actividadad '+@nombreActividad+' ha sido bloqueada debido a que no se ha enviado el comprobante de pago respectivo.' +CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Adem�s, se le informa que cualquier tramite que desee realizar, ya sea para cancelar la reservaci�n o si desea mantener la reservaci�n, deber� realizarse con Sarela G�mez, puede comunicarse al n�mero 2250-9160 o al correo sagomez@itcr.ac.cr'+ CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Correo generado de manera autom�tica, por favor no responda este correo ya que no recibir� ninguna respueta.'
	
	Select @MensajeAdmin = 'El presente correo se ha generado de forma autom�tica para informar que se ha bloqueado la reservaci�n n�mero ' +CAST(@id as varchar(10)) +
	' de la empresa '+@nombreEmpresa+' para la actividad '+@nombreActividad+', programada para empezar en el d�a '+CAST(@Fecha as varchar(10))+', debido a que no se ha enviado el comprobante de pago.' + CHAR(10) + CHAR(13) + CHAR(10) + CHAR(13) + 
	'Correo generado de manera autom�tica, por favor no responda este correo ya que no recibir� ninguna respueta.'

	Select @titulo = 'Notificacion Reserva Bloqueada'
	
	EXEC msdb.dbo.sp_send_dbmail
		@profile_Name = 'ProyectoEmail',
		--@recipients = @copy_to,
		@recipients = @Email,
		--@copy_recipients = 'andreguti333@gmail.com',
		@subject = @titulo,
		@body = @Mensaje
		--@body_format = 'HTML'
		
	EXEC msdb.dbo.sp_send_dbmail
	@profile_Name = 'ProyectoEmail',
	--@recipients = @copy_to,
	@recipients = 'andreduard333@gmail.com',
	--@copy_recipients = 'andreguti333@gmail.com',
	@subject = 'Notificacion Reserva Bloqueada',
	@body = @MensajeAdmin
	

	UPDATE Reservacion
	SET FKEstadoReservacion = 3
	WHERE id=@id

	SET @contador=@contador+1
	/*
	select DATEDIFF(DAY,'03-02-19', HR.dia) from Reservacion R
	inner join HorarioReservado HR on R.FKHorarioReservado =  HR.id
	*/
	end
end
go

Exec CorreoBloqueoReserva

select * from Reservacion

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

DELETE FROM Reservacion
DELETE FROM HorasSolicitudTable
DELETE FROM HorarioReservado
--insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','09:00:00','11:00:00',1,null)
--insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','13:00:00','15:00:00',2,null)
--insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','16:00:00','19:00:00',3,null)
--insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','12:00:00','16:00:00',null,1)
--insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('12-12-19','16:00:00','19:00:00',null,2)


insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','09:00:00','11:00:00',1,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','13:00:00','15:00:00',2,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','16:00:00','19:00:00',3,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','12:00:00','16:00:00',null,1)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','16:00:00','19:00:00',null,2)

Exec insertarTotal '05-03-2019', 'Andres Gutierrez', 'nombreEmpresa', '2-0004-3123', 'andreguti333@gmail.com', '5124-1351','NombreActividad','12-14-19', '12-20-19','observacion', 12


insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','09:00:00','11:00:00',3,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','13:00:00','15:00:00',1,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','16:00:00','19:00:00',2,null)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','12:00:00','16:00:00',null,2)
insert into HorasSolicitudTable(dia, horaInicio, horaFinal,numAula,numLab) values ('05-07-19','16:00:00','19:00:00',null,1)

Exec insertarTotal '05-03-2019', 'Carlos Chevez', 'nombreEmpresa', '2-0004-3123', 'cjchevezc@gmail.com', '5124-1351','NombreActividad','12-14-19', '12-20-19','observacion', 12

--DELETE FROM FilesSave

--exec SaveFile 'sqlservercentral_logo','C:\test','.jpg'

--exec TestSP

--Declare @idAula int
--set @idAula = (Select A.id from Aula A inner join HorasSolicitudTable H on H.numAula = A.numeroAula)

--PRINT @idAula