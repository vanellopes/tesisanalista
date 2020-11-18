package com.instantvet.app.service;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;

import java.util.List;

public interface GestionCliente {

	public abstract Cliente ObtenerCliente(String codigo) throws DAOExcepcion;
	public abstract void registrarCliente(Cliente cli) throws DAOExcepcion;
	public abstract void modificarCliente(Cliente cli) throws DAOExcepcion;
	public abstract List<Cliente> listClientes() throws DAOExcepcion;

}