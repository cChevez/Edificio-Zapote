use master
if not exists(select * from sysdatabases where name = 'Proyecto') 
	create database [Proyecto];--si no existe, la crea
go

use [Proyecto]
go

create or alter procedure enviarEmail @Id int 
as begin 

 Declare @email varchar(50)
 Select @email =  M.email from Reservacion M where M.id = @Id;

EXEC msdb.dbo.sp_send_dbmail
	@profile_Name = 'ProyectoEmail',
	@recipients = @email,
	--@recipients = 'andreguti333@gmail.com',
	@copy_recipients = 'andreguti333@gmail.com',
	@body = 'Body Text',
	@body_format = 'HTML',
	@subject = 'Hello World'


end

GO 


