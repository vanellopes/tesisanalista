package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Paciente;

import java.util.List;

public interface IPaciente {

	public abstract void insertarPaciente(Paciente pac)
			throws DAOExcepcion;

	public abstract Paciente obtenerPaciente(int codigoPaciente)
			throws DAOExcepcion;

	public abstract void deletepaciente(int codigoDueno) throws DAOExcepcion;

	public abstract void GrabarModificarPaciente(Paciente pac)
			throws DAOExcepcion;

	public abstract List<Paciente> listarPacientes() throws DAOExcepcion;

}