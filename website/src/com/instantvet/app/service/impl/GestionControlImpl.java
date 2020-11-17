package com.instantvet.app.negocio.impl;

import com.instantvet.app.dao.PacienteDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Control;
import com.instantvet.app.negocio.GestionCombo;

import java.util.List;

import org.springframework.stereotype.Service;


@Service
public class GestionControlImpl implements GestionCombo {
	
	@Override
	public List<Control> GetDataCombo(String Entidad) throws DAOExcepcion{
		PacienteDAO daoPaciente = new PacienteDAO();
		return daoPaciente.GetDataCombo(Entidad);
	}

	
}
