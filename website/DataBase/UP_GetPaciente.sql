CREATE PROCEDURE `UP_GetPaciente` ()
BEGIN
  SELECT Paciente_Id,
		Dueno_Id,
		cl.Nombres + '' ''+ cl.apellido_paterno + '' '' + cl.apellido_materno as Dueno, 
		Especie_Id,
		es.Nombre as Especie, 
		Raza_Id,
		ra.Nombre as Raza, 
		Genero_Id,
		ge.Nombre as Genero,
		TipoSangre_Id,
		ts.Nombre as 'Tipo Sangre',
		Esterilizado,
		Tamano_Id,
		ta.Nombre as 'Tamaño',
		Actividad_Id,
		ac.Nombre as Actividad, 
		Peso,
		FechaNacimiento, NotasMedicas, CondicionesEspeciales
		FROM   Paciente pa 
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
		inner join Tamano ta
			on pa.Tamano_Id = ta.Id 
		inner join Cliente cl
			on pa.Dueno_Id = cl.Persona_Id 
		where Paciente_Id = @Paciente_Id;
END
