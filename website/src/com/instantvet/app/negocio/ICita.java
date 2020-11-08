package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cita;

import java.util.List;

public interface ICita {

	//@Override
	public abstract void GrabarModificarCita(String codigoCita,
			String codigoPersona, String codigoPaciente, String codigoDoctor,
			String tipoCita, String descripcionCita, String nombreVacuna,
			String fechaCita) throws DAOExcepcion;

	//@Override
	public abstract void GrabarModificarCita(Cita objCita) throws DAOExcepcion;

	//@Override
	public abstract Cita ObtenerCita(String codigoCita) throws DAOExcepcion;

	//@Override
	public abstract void BorrarCita(String codigoCita) throws DAOExcepcion;

	//@Override
	public abstract List<Cita> ListarCitaVacunas() throws DAOExcepcion;

	//@Override
	public abstract List<Cita> ListarCitaTareas() throws DAOExcepcion;

	//@Override
	public void InsertarVacuna(String nombreVacuna) throws DAOExcepcion;
}