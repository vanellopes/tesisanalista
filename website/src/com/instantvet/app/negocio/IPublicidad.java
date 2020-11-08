package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Publicidad;

import java.util.Date;
import java.util.List;

public interface IPublicidad {
	
	public abstract List<Publicidad> listarpublicidad() throws DAOExcepcion;
	
	public abstract void GrabarModificarPublicidad(Publicidad publi)
			throws DAOExcepcion;

}
