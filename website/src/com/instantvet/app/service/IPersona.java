package com.instantvet.app.service;

import com.instantvet.app.domain.Persona;

import java.util.List;

public interface IPersona {

	public List<Persona> getListPersona();
	public Persona insertarPersona(Persona per);
	public Persona obtenerPorIdPersona(int idPersona);
	public Persona modificarPersona(Persona per) ;
	public void eliminarPersona(Persona per) ;
}
