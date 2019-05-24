	use master
if exists(select * from sysdatabases where name = 'Proyecto')
begin
	use [Proyecto];
	begin transaction;
	begin try
		--inserción de Aulas

		insert into Aula(numeroAula, cantidadMax) values (1, 20)
		insert into Aula(numeroAula, cantidadMax) values (2, 20)
		insert into Aula(numeroAula, cantidadMax) values (3, 20)
		
		insert into estadoReservacion(nombreEstado, descripcion) values ('En espera', 'Estado Inicial de la reservacion')
		insert into estadoReservacion(nombreEstado, descripcion) values ('Espera con Comprobante', 'Estado de la reservacion con el comprobante agregado')
		insert into estadoReservacion(nombreEstado, descripcion) values ('Aprobada', 'Estado de la reservacion con el comprobante agregado')
		insert into estadoReservacion(nombreEstado, descripcion) values ('Bloqueada', 'Estado de la reservacion que se encuentra bloqueada cuando no se subio el comprobante')
		insert into estadoReservacion(nombreEstado, descripcion) values ('Cancelada', 'Estado de la reservacion para cuando se cancela')
		--insert into estadoReservacion(nombreEstado, descripcion) values ('Todas', 'Estado de la reservacion para cuando se cancela')

		insert into Laboratorio(numeroLab, cantidadMax) values (1, 20)
		insert into Laboratorio(numeroLab, cantidadMax) values (2, 20)

		insert into TipoReservacion(nombre,descripcion) values ('Alquiler','Alquiler de un espacio para gente fuera del TEC')
		insert into TipoReservacion(nombre,descripcion) values ('Prestamo','Prestamo de un espacio para gente del TEC')

		insert into Administrador(nombre,apellido,email,contra) values ('Sarela','Gomez','sarela@test.com','1234')



		commit;
	end try
	begin catch
		rollback;
		select ERROR_MESSAGE();
	end catch
end

