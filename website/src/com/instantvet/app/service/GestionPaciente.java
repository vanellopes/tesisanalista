package com.instantvet.app.service;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Paciente;

import java.util.List;

public interface GestionPaciente {

	public abstract void insertarPaciente(Paciente pac)
			throws DAOExcepcion;

	public abstract Paciente obtenerPaciente(int codigoPaciente)
			throws DAOExcepcion;

	public abstract void modificarPaciente(Paciente pac)
			throws DAOExcepcion;

	public abstract List<Paciente> listarPacientes() throws DAOExcepcion;
	
	public abstract List<Paciente> listarpacientesxcliente(int codcliente) throws DAOExcepcion;

}