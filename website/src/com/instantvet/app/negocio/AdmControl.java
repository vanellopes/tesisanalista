package com.instantvet.app.negocio;

import com.instantvet.app.dao.PacienteDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Control;

import java.util.List;

import org.springframework.stereotype.Service;


@Service
public class AdmControl implements ICombo {
	
	@Override
	public List<Control> GetDataCombo(String Entidad) throws DAOExcepcion{
		PacienteDAO daoPaciente = new PacienteDAO();
		return daoPaciente.GetDataCombo(Entidad);
	}

	
}
