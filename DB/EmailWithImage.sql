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

 DECLARE @fileName VARCHAR(250)
 DECLARE @filePath VARCHAR(MAX)
 DECLARE @extension	VARCHAR(5)

 DECLARE @file VARCHAR(MAX)

 Select @fileName = F.NameOfFile from FilesSave F where F.id = @Id

 Select @filePath = A.FilePath from FilesSave A where A.id = @Id

 Select @extension = E.ext from FilesSave E where E.id = @Id

 PRINT @filePath

 SET @file =  @filePath + '\' + @FileName + @extension
 PRINT @file

EXEC msdb.dbo.sp_send_dbmail
	@profile_Name = 'ProyectoEmail',
	--@recipients = @email,
	@recipients = 'andreguti333@gmail.com',
	--@copy_recipients = 'andreguti333@gmail.com',
	@body = 'Text Body',
	@body_format = 'HTML',
	@subject = 'Hello World',
	@file_attachments = @file

end

GO 

insert into FilesSave(NameOfFile,FilePath,ext) values ('sqlservercentral_logo','C:\test','.jpg')

Exec enviarEmail 6;