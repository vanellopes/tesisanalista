package com.instantvet.app.negocio.impl;

import com.instantvet.app.dao.*;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;
import com.instantvet.app.negocio.GestionLogin;

import org.springframework.stereotype.Service;


@Service
public class GestionLoginImpl implements GestionLogin{

	@Override
	public Login ObtenerCredenciales(Login _login) throws DAOExcepcion {
		Login objLogin = null;
		LoginDAO objLoginDAO = new LoginDAO();
		
		objLogin = objLoginDAO.DAOobtenercredenciales(_login);
		
		return objLogin;
	}


}
