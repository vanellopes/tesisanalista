USE `instantvet`;
DROP procedure IF EXISTS `UP_ListarPaciente`;
DELIMITER $$
USE `instantvet`$$
CREATE PROCEDURE `UP_ListarPaciente` ()
BEGIN
select pa.PacienteId,
		pa.nombre,
		concat_ws(', ', cl.Nombres, cl.apellido) as nombreCliente,
		es.Nombre as Especie, 
		pa.genero,
        pa.Esterilizado,
        pa.peso,
        pa.fechaNacimiento,
        pa.observaciones
		from   Paciente pa 
	inner join Especie es
		on pa.EspecieId = es.especieId
	inner join Cliente cl
		on pa.clienteId = cl.clienteId 
        where pa.estado =1;
END$$

DELIMITER ;