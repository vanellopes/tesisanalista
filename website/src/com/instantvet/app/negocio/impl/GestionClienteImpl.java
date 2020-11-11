package com.instantvet.app.negocio.impl;

import com.instantvet.app.dao.*;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;
import com.instantvet.app.negocio.GestionCliente;

import java.util.List;

import org.springframework.stereotype.Service;

@Service 
public class GestionClienteImpl implements GestionCliente {

	
	@Override
	public Cliente ObtenerCliente(String codigo) throws DAOExcepcion  {
		Cliente objCliente=null;
		ClienteDAO objClienteDAO=new ClienteDAO();
		if(objClienteDAO.DAOexisteCliente(codigo)==1){
			objCliente=(Cliente)objClienteDAO.DAOobtenerCliente(codigo);
		}
		return objCliente;
	}

	
	@Override
	public void deleteCliente(String codigo) throws DAOExcepcion{
		ClienteDAO objClienteDAO=new ClienteDAO();
		int countcliente= objClienteDAO.DAOexisteCliente(codigo);
		
		if(countcliente==1){
			objClienteDAO.DAOdeleteCliente(codigo);
		}
		
	}

	@Override
	public List<Cliente> listarClientes() throws DAOExcepcion{
		ClienteDAO objClienteDAO=new ClienteDAO();
		return objClienteDAO.DAOlistarClientes();
	}


	@Override
	public void GrabarModificarCliente(String codigo, String nombre,
			String apellidopaterno, String apellidomaterno, String email,
			String direccion, String imagen, String telefono, String celular) throws DAOExcepcion{
		
		Cliente objCliente=new Cliente(codigo,nombre,apellidopaterno,apellidomaterno,email,direccion,imagen, telefono, celular);
		ClienteDAO objClienteDAO=new ClienteDAO();
		if(objClienteDAO.DAOexisteCliente(codigo)==0){
			String newcodigo=(objClienteDAO.DAOgetlastcodigo());
			objCliente.setCodigo(newcodigo);
			objClienteDAO.DAOgrabarCliente(objCliente);
		}
		if(objClienteDAO.DAOexisteCliente(codigo)==1){
			objClienteDAO.DAOmodificarCliente(objCliente);
		}
		
	}
	
	public void GrabarModificarCliente(Cliente cli) throws DAOExcepcion{
		
		ClienteDAO objClienteDAO=new ClienteDAO();
		if(objClienteDAO.DAOexisteCliente(cli.getCodigo())==0){
			String newcodigo=(objClienteDAO.DAOgetlastcodigo());
			//objCliente.setCodigo(newcodigo);
			//objClienteDAO.DAOgrabarCliente(objCliente);
			cli.setCodigo(newcodigo);
			objClienteDAO.DAOgrabarCliente(cli);
		}
		if(objClienteDAO.DAOexisteCliente(cli.getCodigo())==1){
			//objClienteDAO.DAOmodificarCliente(objCliente);
			objClienteDAO.DAOmodificarCliente(cli);
		}
		
	}

	@Override
	public Boolean changeClienteToCliente(String codigo) throws DAOExcepcion
	{
		Boolean answer = false;
		
		ClienteDAO objClienteDAO =  new ClienteDAO();
		int clienteExists = objClienteDAO.DAOexisteCliente(codigo);
		
		if(clienteExists == 1)
		{
			if(objClienteDAO.DAOchangeClienteToCliente(codigo)) answer = true;
		}
		
		return answer; 
	}
	

	@Override
	public List<Cliente> listClientes() throws DAOExcepcion
	{
		ClienteDAO objClienteDAO = new ClienteDAO();
		return objClienteDAO.DAOlistClientes();
	}


}
