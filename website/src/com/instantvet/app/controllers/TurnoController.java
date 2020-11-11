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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TurnoController 
{

	@Autowired
	private GestionTurnos turno;

	@RequestMapping(value = "/menuTurno", method = RequestMethod.GET)
	public ModelAndView ingresarMenuTurno(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("menuTurno");
	}


	
	@RequestMapping(value="/listarVacuna")
	public ModelAndView handleRequestVacunas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DAOExcepcion {
		
		List<Turno> vacunas = this.turno.ListarTurnoVacunas();
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
    }
	
	@RequestMapping(value="/listarTarea")
	public ModelAndView handleRequestTareas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DAOExcepcion {
		
		List<Turno> tareas = this.turno.ListarTurnoTareas();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
    }

	
	@RequestMapping(value = "/verRegistroTarea", method = RequestMethod.GET)
	public ModelAndView ingresarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevaTarea");
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


	@RequestMapping(value = "/registrarTarea", method = RequestMethod.POST)
	public ModelAndView registroTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno("0");
		oModelTurno.setTipoTurno("T");
		oModelTurno.setCodigoPersonal(request.getParameter("txtCodigoPersonal"));
		oModelTurno.setCodigoPersona(request.getParameter("hiddencliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("hiddenpaciente"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.GrabarModificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			//e.printStackTrace();
			//System.out.println(e.getMessage());
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> tareas = this.turno.ListarTurnoTareas();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
	}

	
	@RequestMapping(value = "/registrarVacuna", method = RequestMethod.POST)
	public ModelAndView registroVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarVacuna");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno("0");
		oModelTurno.setTipoTurno("V");
		oModelTurno.setCodigoPersonal(request.getParameter("txtCodigoPersonal"));
		oModelTurno.setCodigoPersona(request.getParameter("hiddencliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("hiddenpaciente"));
		oModelTurno.setNombreVacuna(request.getParameter("txtVacuna"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.GrabarModificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> vacunas = this.turno.ListarTurnoVacunas();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
	}

	@RequestMapping(value = "/registrarNombreVacuna", method = RequestMethod.POST)
	public ModelAndView registroNombreVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarNombreVacuna");
		
		try 
		{
			turno.InsertarVacuna(request.getParameter("txtNombreVacuna"));
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("menuTurno");
	}
	
	@RequestMapping(value = "/editarTarea", method = RequestMethod.GET)
	public ModelAndView editarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{
		System.out.println("idTurno "+request.getParameter("idTurno"));
		
		Turno oModelTurno = new Turno();
		oModelTurno = turno.ObtenerTurno(request.getParameter("idTurno"));
		return new ModelAndView("editarTarea", "model", oModelTurno);
	}

	@RequestMapping(value = "/editarVacuna", method = RequestMethod.GET)
	public ModelAndView editarVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{
		System.out.println("idTurno "+request.getParameter("idTurno"));
		
		Turno oModelTurno = new Turno();
		oModelTurno = turno.ObtenerTurno(request.getParameter("idTurno"));
		return new ModelAndView("editarVacuna", "model", oModelTurno);
	}

	
	@RequestMapping(value = "/guardarTarea", method = RequestMethod.POST)
	public ModelAndView modificarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno(request.getParameter("idTurno"));
		oModelTurno.setTipoTurno("T");
		oModelTurno.setCodigoPersonal(request.getParameter("txtCodigoPersonal"));
		oModelTurno.setCodigoPersona(request.getParameter("txtCodigoCliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("txtCodigoPaciente"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.GrabarModificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> tareas = this.turno.ListarTurnoTareas();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
	}
	
	@RequestMapping(value = "/guardarVacuna", method = RequestMethod.POST)
	public ModelAndView modificarVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("registrarVacuna");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno(request.getParameter("idTurno"));
		oModelTurno.setTipoTurno("V");
		oModelTurno.setCodigoPersonal(request.getParameter("txtCodigoPersonal"));
		oModelTurno.setCodigoPersona(request.getParameter("txtCodigoCliente"));
		oModelTurno.setCodigoPaciente(request.getParameter("txtCodigoPaciente"));
		oModelTurno.setNombreVacuna(request.getParameter("txtVacuna"));
		oModelTurno.setDescripcionTurno(request.getParameter("txtDescripcion"));
		oModelTurno.setFechaTurno(request.getParameter("txtFecha"));
		
		try 
		{
			turno.GrabarModificarTurno(oModelTurno);
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

        List<Turno> vacunas = this.turno.ListarTurnoVacunas();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
	}

	
	@RequestMapping(value = "/eliminarTarea", method = RequestMethod.GET)
	public ModelAndView eliminarTarea(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("eliminarTarea");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno(request.getParameter("idTurno"));
		
		try 
		{
			turno.BorrarTurno(oModelTurno.getCodigoTurno());
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		List<Turno> tareas = this.turno.ListarTurnoTareas();		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tareas",tareas);
       
        return new ModelAndView("listarTareas", "model", myModel);
	}
	
	@RequestMapping(value = "/eliminarVacuna", method = RequestMethod.GET)
	public ModelAndView eliminarVacuna(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("eliminarVacuna");
		
		Turno oModelTurno = new Turno();
		oModelTurno.setCodigoTurno(request.getParameter("idTurno"));
		
		try 
		{
			turno.BorrarTurno(oModelTurno.getCodigoTurno());
		} 
		catch (Exception e) 
		{
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

        List<Turno> vacunas = this.turno.ListarTurnoVacunas();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("vacunas",vacunas);
       
        return new ModelAndView("listarVacunas", "model", myModel);
	}

}
