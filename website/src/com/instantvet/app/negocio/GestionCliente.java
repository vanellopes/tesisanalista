package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;

import java.util.List;

public interface GestionCliente {

	public abstract Cliente ObtenerCliente(String codigo) throws DAOExcepcion;
	public abstract void deleteCliente(String codigo) throws DAOExcepcion;
	public abstract List<Cliente> listarClientes() throws DAOExcepcion;
	public abstract void GrabarModificarCliente(String codigo, String nombre,
			String apellidopaterno, String apellidomaterno, String email,
			String direccion, String imagen, String telefono, String celular)
			throws DAOExcepcion;
	public abstract void GrabarModificarCliente(Cliente cli)
			throws DAOExcepcion;
	public abstract Boolean changeClienteToCliente(String codigo)
			throws DAOExcepcion;
	public abstract List<Cliente> listClientes() throws DAOExcepcion;

}