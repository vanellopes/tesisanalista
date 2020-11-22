package com.instantvet.app.controllers;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;
import com.instantvet.app.modelo.Paciente;
import com.instantvet.app.service.GestionCliente;
import com.instantvet.app.service.GestionPaciente;

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
public class PacienteController {

	@Autowired
	private GestionPaciente paciente;
	@Autowired
	private GestionCliente clienteservice;

	@RequestMapping(value = "/listarpaciente.jsp")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {

		List<Paciente> pacientes = paciente.listarPacientes();

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("pacientes", pacientes);

		return new ModelAndView("listarpaciente", "model", myModel);

	}

	@RequestMapping(value = "/registroPaciente", method = RequestMethod.GET)
	public ModelAndView ingresar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("nuevoPaciente");
	}

	@RequestMapping(value = "/registrarPaciente", method = RequestMethod.POST)
	public ModelAndView registroPaciente(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("registrarPaciente");

		Paciente oModelPaciente = new Paciente();
		if (request.getParameter("hiddencliente").isEmpty()) {
			return new ModelAndView("/error", "mensaje", "Campo cliente es obligatorio");
		} else {
			oModelPaciente.setCodigoCliente(Integer.parseInt(request.getParameter("hiddencliente")));
		}
		oModelPaciente.setNombre(request.getParameter("txtNombre"));
		String fecha = (request.getParameter("fecha"));
		oModelPaciente.convertFechaTurno(fecha);
		oModelPaciente.setEspecieId(Integer.parseInt(request.getParameter("cboEspecie")));
		oModelPaciente.setGenero(request.getParameter("rbGenero"));
		oModelPaciente.setEsterilizado(request.getParameter("rbEsterilizado"));
		oModelPaciente.setPeso(request.getParameter("nbrPeso"));
		oModelPaciente.setObservaciones(request.getParameter("txtObservaciones"));

		try {
			paciente.insertarPaciente(oModelPaciente);
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("/exito", "mensaje", "Nueva mascota registrada");
	}

	@RequestMapping(value = "/buscapaciente")
	public ModelAndView BuscaPaciente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {

		List<Paciente> pacientes = null;
		try {
			pacientes = this.paciente.listarpacientesxcliente(Integer.parseInt(request.getParameter("idcliente")));
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("pacientes", pacientes);

		return new ModelAndView("buscapaciente", "model", myModel);

	}

	@RequestMapping(value = "/agregarmascota", method = RequestMethod.GET)
	public ModelAndView agregarMascota(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {
		String codigo = request.getParameter("codigo");

		Cliente cliente = null;
		try {
			cliente = clienteservice.ObtenerClientexDni(Integer.parseInt(codigo));
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("pacientes", cliente);

		return new ModelAndView("nvoPacientePop", "model", cliente);
	}

	@RequestMapping(value = "/agregarmascota", method = RequestMethod.POST)
	public ModelAndView agregarPaciente(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("registrarPaciente");

		Paciente oModelPaciente = new Paciente();
		oModelPaciente.setCodigoCliente(Integer.parseInt(request.getParameter("txtClienteid")));

		oModelPaciente.setNombre(request.getParameter("txtNombre"));
		String fecha = (request.getParameter("fecha"));
		oModelPaciente.convertFechaTurno(fecha);
		oModelPaciente.setEspecieId(Integer.parseInt(request.getParameter("cboEspecie")));
		oModelPaciente.setGenero(request.getParameter("rbGenero"));
		oModelPaciente.setEsterilizado(request.getParameter("rbEsterilizado"));
		oModelPaciente.setPeso(request.getParameter("nbrPeso"));
		oModelPaciente.setObservaciones(request.getParameter("txtObservaciones"));

		try {
			paciente.insertarPaciente(oModelPaciente);
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("/exito", "mensaje", "Nuevo cliente y mascota registrados");

	}

	@RequestMapping(value = "/verpaciente")
	public ModelAndView verPaciente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {
		List<Paciente> pacientes = null;
		try {
			pacientes = this.paciente.listarpacientesxcliente(Integer.parseInt(request.getParameter("idcliente")));
		} catch (Exception e) {
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("pacientes", pacientes);

		return new ModelAndView("verpaciente", "model", myModel);

	}

}
