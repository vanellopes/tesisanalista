CREATE PROCEDURE `UP_ListarPaciente` ()
BEGIN
	select Paciente_Id,
		cl.Nombres + '' ''+ cl.apellido_paterno + '' '' + cl.apellido_materno as Dueno, 
		es.Nombre as Especie, 
		ra.Nombre as Raza, 
		ge.Nombre as Genero,
		ts.Nombre as 'TipoSangre'	
		from   Paciente pa 
	inner join Actividad ac
		on pa.Actividad_Id = ac.Id
	inner join Especie es
		on pa.Especie_Id = es.Id
	inner join Raza ra
		on pa.Raza_Id = ra.Id
	inner join Genero ge
		on pa.Genero_Id = ge.Id
	inner join TipoSangre ts
		on pa.TipoSangre_Id = ts.Id
	inner join Cliente cl
		on pa.Dueno_Id = cl.Persona_Id ;
END
