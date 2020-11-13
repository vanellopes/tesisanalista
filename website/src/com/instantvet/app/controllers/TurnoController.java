package com.instantvet.app.controllers;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.negocio.GestionTurnos;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TurnoController 
{

	@Autowired
	private GestionTurnos turno;

	
//	///no lo usare VER
//	@RequestMapping(value = "/menuTurno", method = RequestMethod.GET)
//	public ModelAndView ingresarMenuTurno(HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//
//		return new ModelAndView("menuTurno");
//	}

	@RequestMapping(value = "/registroTurno", method = RequestMethod.GET)
	public ModelAndView ingresarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevoTurno");
	}	
	
	@RequestMapping(value = "/registrarTurno", method = RequestMethod.POST)
	public ModelAndView registroTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarTurno");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setTipoTurno("txtTipoTurno");
		oModelTurno.setCodigoPersona(request.getParameter("hiddencliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("hiddenpaciente"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.registrarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

//		List<Turno> tareas = this.turno.ListarTurnos();		
//		Map<String, Object> myModel = new HashMap<String, Object>();
//		myModel.put("tareas",tareas);
//       
       //return new ModelAndView("listarTareas", "model", myModel);
       return new ModelAndView("menuTurno");
	}
	
	@RequestMapping(value="/listarVacuna")
	public ModelAndView handleRequestVacunas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DAOExcepcion {
		
		List<Turno> vacunas = this.turno.ListarTurnos();
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
    }
	
	@RequestMapping(value="/listarTarea")
	public ModelAndView handleRequestTareas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DAOExcepcion {
		
		List<Turno> tareas = this.turno.ListarTurnos();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
    }

	
	

	@RequestMapping(value = "/verRegistroVacuna", method = RequestMethod.GET)
	public ModelAndView ingresarVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevaVacuna");
	}
	
	@RequestMapping(value = "/verRegistroNombreVacuna", method = RequestMethod.GET)
	public ModelAndView ingresarNombreVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevaVacunaNombre");
	}


	@RequestMapping(value = "/editarTurno", method = RequestMethod.GET)
	public ModelAndView editarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{
		System.out.println("idTurno "+request.getParameter("idTurno"));
		
		Turno oModelTurno = new Turno();
		oModelTurno = turno.ObtenerTurno( Integer.parseInt(request.getParameter("idTurno")));
		return new ModelAndView("editarTarea", "model", oModelTurno);
	}


	@RequestMapping(value = "/modificarTurno", method = RequestMethod.POST)
	public ModelAndView modificarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno( Integer.parseInt(request.getParameter("idTurno")));
		oModelTurno.setTipoTurno("T");
		oModelTurno.setCodigoPersona(request.getParameter("txtCodigoCliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("txtCodigoPaciente"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.modificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> tareas = this.turno.ListarTurnoVeterinaria();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
	}
	

	@RequestMapping(value = "/eliminarTarea", method = RequestMethod.GET)
	public ModelAndView eliminarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("eliminarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno( Integer.parseInt(request.getParameter("idTurno")));
		
		try 
		{
			turno.cancelarTurno(oModelTurno.getCodigoTurno());
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> tareas = this.turno.ListarTurnos();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
	}
	
	@RequestMapping(value = "/eliminarVacuna", method = RequestMethod.GET)
	public ModelAndView eliminarVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("eliminarVacuna");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno( Integer.parseInt(request.getParameter("idTurno")));
		
		try 
		{
			turno.cancelarTurno(oModelTurno.getCodigoTurno());
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

        List<Turno> vacunas = this.turno.ListarTurnos();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
	}

}
