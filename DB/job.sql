 use master
if not exists(select * from sysdatabases where name = 'Proyecto') 
	create database [Proyecto];--si no existe, la crea
go

use [Proyecto]
go


SELECT * FROM Reservacion
	UPDATE Reservacion SET numeroTelefono='88887777' WHERE  Reservacion.id=3
GO