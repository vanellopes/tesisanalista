USE `instantvet`;
DROP procedure IF EXISTS `UP_ListarPaciente`;
DELIMITER $$
USE `instantvet`$$
CREATE PROCEDURE `UP_ListarPaciente` ()
BEGIN
select Paciente_Id,
		concat_ws(', ', cl.Nombres, cl.apellido) as Dueno,
		es.Nombre as Especie, 
		ge.Nombre as Genero
		from   Paciente pa 
	inner join Actividad ac
		on pa.Actividad_Id = ac.Id
	inner join Especie es
		on pa.Especie_Id = es.Id
	inner join Genero ge
		on pa.Genero_Id = ge.Id
	inner join Cliente cl
		on pa.Dueno_Id = cl.Persona_Id ;
END$$

DELIMITER ;

