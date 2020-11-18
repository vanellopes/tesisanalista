package com.instantvet.app.controllers;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Personal;
import com.instantvet.app.service.GestionVeterinario;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

@Controller
public class PersonalController {

	@Autowired
	private GestionVeterinario Personal;
	
	@RequestMapping(value="/listarPersonal.jsp") 
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, DAOExcepcion {
					
		try {
			
			List<Personal> personas = this.Personal.listPersonales();
			Map<String, Object> myModel = new HashMap<String, Object>();
			myModel.put("Personales",personas);
			return new ModelAndView("listarPersonal", "model", myModel);
			//Persona.insertarPersona(oModelPersona);
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}				            

    }
	
	@RequestMapping(value = "/verRegistroPersonal", method = RequestMethod.GET) 
	public ModelAndView ingresar(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevoPersonal");
	}
	
	@RequestMapping(value = "/registrarPersonal", method = RequestMethod.GET)
	public ModelAndView registroPersonal(HttpServletRequest request, HttpServletResponse response){
		System.out.println("registrarPersonal");
		
		Personal oModelPersona = new Personal();
		oModelPersona.setPersonalID(0);
		oModelPersona.setNombre(request.getParameter("txtnombre"));
		oModelPersona.setApellido(request.getParameter("txtApellido"));
		oModelPersona.setMatricula(request.getParameter("txtMatricula"));
		oModelPersona.setEmail(request.getParameter("txtEmail"));
		oModelPersona.setTelefono(request.getParameter("txtTelefono"));
		oModelPersona.setUsuario(request.getParameter("txtUsuario"));
		oModelPersona.setPassword(request.getParameter("txtPassword"));
		oModelPersona.setGrupoID(Integer.parseInt(request.getParameter("cboGrupo")));
		oModelPersona.setErrMensaje("");
		
		Personal oPersonal = new Personal();
		try {
			oPersonal = Personal.insertar(oModelPersona);			
			if(!oPersonal.getErrMensaje().equals("")){				
				return new ModelAndView("/error", "mensaje", oPersonal.getErrMensaje());
			}
			
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("redirect:listarPersonal.jsp");
	}
	/*
*/
	@RequestMapping(value = "/editarPersonal", method = RequestMethod.GET)
	public ModelAndView editar(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Personal oModelPersona = new Personal();
		oModelPersona = Personal.obtener(Integer.parseInt(request.getParameter("PersonalID")));
		
		System.out.println("idPersona " + request.getParameter("PersonalID"));
		return new ModelAndView("editarPersonal", "model", oModelPersona);
	}
	
	@RequestMapping(value = "/guardarModificacionPersonal", method = RequestMethod.GET)
	public ModelAndView modificarPersonal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registarPersonal");
		
		Personal oModelPersona = new Personal();
		oModelPersona.setPersonalID(Integer.parseInt(request.getParameter("id")));
		oModelPersona.setNombre(request.getParameter("txtNombre"));
		oModelPersona.setApellido(request.getParameter("txtApellido"));
		oModelPersona.setMatricula(request.getParameter("txtMatricula"));
		oModelPersona.setEmail(request.getParameter("txtEmail"));
		oModelPersona.setTelefono(request.getParameter("txtTelefono"));
		oModelPersona.setUsuario(request.getParameter("txtUsuario"));
		oModelPersona.setPassword(request.getParameter("txtPassword"));
		oModelPersona.setGrupoID(Integer.parseInt(request.getParameter("cboGrupo")));
		oModelPersona.setErrMensaje("");
		
		Personal oPersonal = new Personal();
		try {
			oPersonal = Personal.actualizar(oModelPersona);
			System.out.println("Mensaje = " + oPersonal.getErrMensaje());
			if(!oPersonal.getErrMensaje().equals("")){				
				return new ModelAndView("/error", "mensaje", oPersonal.getErrMensaje());
			}
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("redirect:listarPersonal.jsp");
	}
	
	
	@RequestMapping(value = "/eliminarPersonal", method = RequestMethod.GET)
	public ModelAndView eliminarPersonal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("eliminarPersonal");
		
		Personal oModelPersona = new Personal();
		oModelPersona.setPersonalID(Integer.parseInt(request.getParameter("PersonalID")));
		
		try {
			Personal.eliminar(oModelPersona);
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("redirect:listarPersonal.jsp");
	}
/*
*/
	
}
