package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;

import java.util.List;

public interface ICita {

	//@Override
	public abstract void GrabarModificarCita(String codigoCita,
			String codigoPersona, String codigoPaciente, String codigoDoctor,
			String tipoCita, String descripcionCita, String nombreVacuna,
			String fechaCita) throws DAOExcepcion;

	//@Override
	public abstract void GrabarModificarCita(Turno objCita) throws DAOExcepcion;

	//@Override
	public abstract Turno ObtenerCita(String codigoCita) throws DAOExcepcion;

	//@Override
	public abstract void BorrarCita(String codigoCita) throws DAOExcepcion;

	//@Override
	public abstract List<Turno> ListarCitaVacunas() throws DAOExcepcion;

	//@Override
	public abstract List<Turno> ListarCitaTareas() throws DAOExcepcion;

	//@Override
	public void InsertarVacuna(String nombreVacuna) throws DAOExcepcion;
}