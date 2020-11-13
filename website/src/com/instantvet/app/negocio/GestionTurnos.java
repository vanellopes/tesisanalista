package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;

import java.util.List;

public interface GestionTurnos {	
	

	void registrarTurno(Turno objTurno) throws DAOExcepcion;
	
	void modificarTurno(Turno objTurno) throws DAOExcepcion;

	Turno ObtenerTurno(Integer codigoTurno) throws DAOExcepcion;

	void cancelarTurno(Integer codigoTurno) throws DAOExcepcion;

	List<Turno> ListarTurnoVeterinaria() throws DAOExcepcion;

	List<Turno> ListarTurnoPeluqueria() throws DAOExcepcion;
	
	List<Turno> ListarTurnos() throws DAOExcepcion;
	
	void confirmarTurno(Turno objTurno) throws DAOExcepcion;
}