package com.instantvet.app.service;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Personal;

import java.util.List;

public interface GestionVeterinario {

	
	public abstract Personal insertar(Personal oPersonal) throws DAOExcepcion;
/**/
	public abstract Personal obtener(int PersonalID) throws DAOExcepcion;
	
	public abstract Personal actualizar(Personal oPersonal) throws DAOExcepcion;
			
	public abstract List<Personal> listPersonales() throws DAOExcepcion;
	
	public abstract Integer eliminar(Personal oPersonal) throws DAOExcepcion;	

}