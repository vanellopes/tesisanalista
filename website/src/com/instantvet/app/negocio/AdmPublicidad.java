package com.instantvet.app.negocio;

import com.instantvet.app.dao.*;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;


@Service
public class AdmPublicidad implements IPublicidad
{
	
	@Override
	public List<Publicidad> listarpublicidad() throws DAOExcepcion{
		PublicidadDAO objPublicidadDAO=new PublicidadDAO();
		return objPublicidadDAO.DAOlistarPublicidad();
	}
	
	@Override
	public void GrabarModificarPublicidad(Publicidad publi) throws DAOExcepcion{
		
		
		PublicidadDAO objPublicidadDAO=new PublicidadDAO();
		
		objPublicidadDAO.DAOgrabarPublicidad(publi);
		
		
	}

}
