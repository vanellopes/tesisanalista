package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Doctor;

import java.util.List;

public interface IDoctor {

	
	public abstract Doctor insertar(Doctor oDoctor) throws DAOExcepcion;
/**/
	public abstract Doctor obtener(int doctorID) throws DAOExcepcion;
	
	public abstract Doctor actualizar(Doctor oDoctor) throws DAOExcepcion;
			
	public abstract List<Doctor> listDoctores() throws DAOExcepcion;
	
	public abstract Integer eliminar(Doctor oDoctor) throws DAOExcepcion;	

}