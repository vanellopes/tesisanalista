package com.instantvet.app.negocio.impl;

import com.instantvet.app.dao.PersonalDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Personal;
import com.instantvet.app.negocio.GestionVeterinario;

import java.util.List;

import org.springframework.stereotype.Service;

@Service 
public class GestionVeterinarioImpl implements GestionVeterinario {


	@Override
	public Personal insertar(Personal oPersonal) throws DAOExcepcion {
		PersonalDAO dao = new PersonalDAO();
		Personal objPersonal = new Personal();		
		String errMensaje = validarCamposObligatorios(oPersonal);
		if(errMensaje.equals("")){
			if(dao.validarUsuario(oPersonal) > 0){
				errMensaje = "El usuario ya existe"; 				
			}
		}
		if(errMensaje.equals("")){
			objPersonal = dao.insertar(oPersonal);
		}else{
			objPersonal.setErrMensaje(errMensaje);			
		}
		return objPersonal;
	}


	@Override
	public Personal obtener(int idCategoria) throws DAOExcepcion {
		PersonalDAO dao = new PersonalDAO();
		return dao.obtener(idCategoria);
	}
/**/
	@Override
	public Personal actualizar(Personal oPersonal) throws DAOExcepcion {
		PersonalDAO dao = new PersonalDAO();
		Personal objPersonal = new Personal();
		String errMensaje = validarCamposObligatorios(oPersonal);
		if(errMensaje.equals("")){
			if(dao.validarUsuario(oPersonal) > 0){
				errMensaje = "El usuario ya existe"; 				
			}
		}			
		
		if(errMensaje.equals("")){
			objPersonal = dao.actualizar(oPersonal);
		}else{
			objPersonal.setErrMensaje(errMensaje);			
		}
		return objPersonal;		
	}
	
	
	//@Override
	/* (non-Javadoc)
	 * @see com.instantvet.app.negocio.IPersonal#listPersonales()
	 */
	@Override
	public List<Personal> listPersonales() throws DAOExcepcion{
		PersonalDAO objPersonalDAO=new PersonalDAO();
		return objPersonalDAO.DAOlistPersonales();
	}
	
	@Override
	public Integer eliminar(Personal oPersonal) throws DAOExcepcion {
		PersonalDAO dao = new PersonalDAO();
		return dao.elimnar(oPersonal);
	}
	
	public String validarCamposObligatorios(Personal oPersonal) {
		Integer varCount = 0;
		String errMensaje = "";
		if(oPersonal.getNombre().equals(null) | oPersonal.getNombre().equals("")){				
			varCount += 1;
		}
		if(oPersonal.getApellido().equals(null) | oPersonal.getApellido().equals("")){				
			varCount += 1;
		}
		if(oPersonal.getMatricula().equals(null) | oPersonal.getMatricula().equals("")){				
			varCount += 1;
		}
		if(oPersonal.getEmail().equals(null) | oPersonal.getEmail().equals("")){				
			varCount += 1;
		}
		if(oPersonal.getUsuario().equals(null) | oPersonal.getUsuario().equals("")){				
			varCount += 1;
		}
		if(oPersonal.getPassword().equals(null) | oPersonal.getPassword().equals("")){				
			varCount += 1;
		}		
		if(oPersonal.getGrupoID().equals(null) | oPersonal.getGrupoID().equals(0)){				
			varCount += 1;
		}
		
		if(varCount > 0){
			errMensaje = "Ingresar los campos obligatorios";			
		}
		
		return errMensaje;
		
	}
}
