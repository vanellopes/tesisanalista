CREATE PROCEDURE `UP_GetCombo` ()

BEGIN
 DECLARE ENTIDAD VARCHAR(10);
	IF (ENTIDAD = 'ESPECIE') THEN
		SELECT * FROM Especie;

	IF @ENTIDAD = 'RAZA' THEN
		SELECT * FROM RAZA;


	IF @ENTIDAD = 'ACTIVIDAD' THEN
		SELECT * FROM ACTIVIDAD;


	IF @ENTIDAD = 'TAMANO' THEN
		SELECT * FROM TAMANO;


	IF @ENTIDAD = 'GENERO' THEN
		SELECT * FROM GENERO;


	elseif @ENTIDAD = 'TIPOSANGRE' THEN
		SELECT * FROM TIPOSANGRE;
       
        
END