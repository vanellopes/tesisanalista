package com.instantvet.app.service;

import com.instantvet.app.domain.Persona;

	public interface CustomerManager {

	    public void addCustomer(Persona persona);
	    public void removeCustomer(Long personaId);
	    public Persona[] listPersonas();


	}


