package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;

import java.util.List;

public interface GestionTurnos {

	//@Override
	public abstract void GrabarModificarTurno(String codigoTurno,
			String codigoPersona, String codigoPaciente, String codigoPersonal,
			String tipoTurno, String descripcionTurno, String nombreVacuna,
			String fechaTurno) throws DAOExcepcion;

	//@Override
	public abstract void GrabarModificarTurno(Turno objTurno) throws DAOExcepcion;

	//@Override
	public abstract Turno ObtenerTurno(String codigoTurno) throws DAOExcepcion;

	//@Override
	public abstract void BorrarTurno(String codigoTurno) throws DAOExcepcion;

	//@Override
	public abstract List<Turno> ListarTurnoVacunas() throws DAOExcepcion;

	//@Override
	public abstract List<Turno> ListarTurnoTareas() throws DAOExcepcion;

	//@Override
	public void InsertarVacuna(String nombreVacuna) throws DAOExcepcion;
}