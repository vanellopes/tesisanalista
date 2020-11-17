package com.instantvet.app.negocio;


import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Login;

public interface GestionLogin {

	public abstract Login ObtenerCredenciales(Login _login) throws DAOExcepcion;

}
