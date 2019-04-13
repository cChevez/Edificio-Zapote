exec msdb.dbo.sp_delete_database_backuphistory @database_name = N'Proyecto'
go

/* Query to Get Exclusive Access of SQL Server Database before Dropping the Database  */

use [master]
go
alter database [Proyecto] set single_user with rollback immediate
go

/* Query to Drop Database in SQL Server  */

drop database [Proyecto]
go