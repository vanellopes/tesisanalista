USE `instantvet`;
DROP procedure IF EXISTS `UP_GetPaciente`;

DELIMITER $$
USE `instantvet`$$
CREATE PROCEDURE `UP_GetPaciente` ()
BEGIN
SELECT Paciente_Id,
		Dueno_Id,
		concat_ws(', ', cl.Nombres, cl.apellido) as Dueno,
		Especie_Id,
		es.Nombre as Especie, 		
		Genero_Id,
		ge.Nombre as Genero,
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
		inner join Genero ge
			on pa.Genero_Id = ge.Id
		inner join Tamano ta
			on pa.Tamano_Id = ta.Id 
		inner join Cliente cl
			on pa.Dueno_Id = cl.Persona_Id 
		where Paciente_Id = Paciente_Id;
END$$

DELIMITER ;

