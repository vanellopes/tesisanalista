package com.instantvet.app.service;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;

import java.util.List;

public interface GestionTurnos {

	void registrarTurno(Turno objTurno) throws DAOExcepcion;

	void modificarTurno(Turno objTurno) throws DAOExcepcion;

	List<Turno> listarTurnoxArea(String area) throws DAOExcepcion;

	List<Turno> ListarTurnos() throws DAOExcepcion;

	void cambiarEstadoTurno(Integer codigoTurno, int estado) throws DAOExcepcion;

	Turno obtenerTurno(Integer parameter) throws DAOExcepcion;

}