package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;

import java.util.List;

public interface ICombo{
	public abstract List<Control> GetDataCombo(String Entidad) throws DAOExcepcion;
	
}
