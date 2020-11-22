package com.instantvet.app.service.impl;

import com.instantvet.app.dao.ClienteDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;
import com.instantvet.app.service.GestionCliente;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class GestionClienteImpl implements GestionCliente {

	@Override
	public Cliente ObtenerCliente(String codigo) throws DAOExcepcion {/// este es para ver el cliente por id
		Cliente objCliente = null;
		ClienteDAO objClienteDAO = new ClienteDAO();
		objCliente = objClienteDAO.DAOobtenerCliente(codigo);

		return objCliente;
	}

	@Override
	public void registrarCliente(Cliente cliente) throws DAOExcepcion {

		ClienteDAO objClienteDAO = new ClienteDAO();
		if (objClienteDAO.DAOexisteCliente(cliente.getNumDocumento()) == 0) {
			objClienteDAO.DAOgrabarCliente(cliente);
		} else {
			// ya existe el cliente
		}

	}

	@Override
	public Cliente ObtenerClientexDni(Integer numDocumento) throws DAOExcepcion {/// este es para ver el cliente por id
		Cliente objCliente = null;
		ClienteDAO objClienteDAO = new ClienteDAO();
		objCliente = objClienteDAO.DAOobtenerClientexDni(numDocumento);

		return objCliente;
	}

	@Override
	public List<Cliente> listClientes() throws DAOExcepcion {
		ClienteDAO objClienteDAO = new ClienteDAO();
		return objClienteDAO.DAOlistClientes();
	}

	@Override
	public void modificarCliente(Cliente cli) throws DAOExcepcion {
		// TODO Auto-generated method stub

	}

}
