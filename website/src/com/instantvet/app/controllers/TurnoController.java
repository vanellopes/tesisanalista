package com.instantvet.app.controllers;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.negocio.GestionTurnos;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		oModelTurno.setTipoTurno(request.getParameter("rbTipoTurno"));
		oModelTurno.setCliente(request.getParameter("hiddencliente"));
		oModelTurno.setPaciente(request.getParameter("hiddenpaciente"));
		oModelTurno.setObservaciones(request.getParameter("txtDescripcion"));
		oModelTurno.setEstadoTurnoId(1);
		Date fecha = Date.valueOf(request.getParameter("fecha"));
		oModelTurno.setFechaTurno(fecha);
		
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
		List<Turno> turnos = this.turno.ListarTurnos();	
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);

		return new ModelAndView("listarTurnos", "model", myModel);
	}
	
	@RequestMapping(value="/listarTurnos")
	public ModelAndView handleRequestTareas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DAOExcepcion {
		
		List<Turno> turnos = this.turno.ListarTurnos();		
		System.out.println(turnos.get(1).getFechaHora());
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);
       
        return new ModelAndView("listarTurnos", "model", myModel);
    }
	
	@RequestMapping(value = "/editarTurno", method = RequestMethod.GET)
	public ModelAndView editarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{
		System.out.println("idCita "+request.getParameter("idTurno"));
		
		Turno oModelTurno = new Turno();
		Integer codigo = Integer.parseInt(request.getParameter("idTurno"));
		oModelTurno = turno.obtenerTurno(codigo);
		return new ModelAndView("editarTurno", "model", oModelTurno);
	}

	@RequestMapping(value = "/modificarTurno", method = RequestMethod.POST)
	public ModelAndView modificarTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno( Integer.parseInt(request.getParameter("idTurno")));
		oModelTurno.setTipoTurno("T");
		//oModelTurno.setCodigoCliente(request.getParameter("txtCodigoCliente"));
		//oModelTurno.setCodigoPaciente(request.getParameter("txtCodigoPaciente"));
		oModelTurno.setObservaciones(request.getParameter("txtDescripcion"));
		Date fechaTurno = Date.valueOf(request.getParameter("txtFecha"));
		oModelTurno.setFechaTurno(fechaTurno);
		
		try 
		{
			turno.modificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> turnos = this.turno.ListarTurnos();	
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);

		return new ModelAndView("listarTurnos", "model", myModel);
	}
	

	@RequestMapping(value = "/cancelarTurno", method = RequestMethod.GET)
	public ModelAndView cancelarTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("cancelarTurno");		
	    int estado = 3;		
		Integer codigoTurno = Integer.parseInt(request.getParameter("idTurno"));
		
		try 
		{
			turno.cambiarEstadoTurno(codigoTurno, estado);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> turnos = this.turno.ListarTurnos();	
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);

		return new ModelAndView("listarTurnos", "model", myModel);
	}
	
	@RequestMapping(value = "/confirmarTurno", method = RequestMethod.GET)
	public ModelAndView confirmarTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("confirmarTurno");
		int estado = 2;
		Integer codigoTurno = Integer.parseInt(request.getParameter("idTurno"));
		
		try 
		{
			turno.cambiarEstadoTurno(codigoTurno, estado);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> turnos = this.turno.ListarTurnos();	
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);

		return new ModelAndView("listarTurnos", "model", myModel);
	}
	
	
	@RequestMapping(value = "/finalizarAtencionTurno", method = RequestMethod.GET)
	public ModelAndView finalizarAtencionTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("finalizarAtencionTurno");
		int estado = 4;
		Integer codigoTurno = Integer.parseInt(request.getParameter("idTurno"));
		
		try 
		{
			turno.cambiarEstadoTurno(codigoTurno, estado);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> turnos = this.turno.ListarTurnos();	
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("turnos",turnos);

		return new ModelAndView("listarTurnos", "model", myModel);
	}
	


}
