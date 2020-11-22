package com.instantvet.app.controllers;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;
import com.instantvet.app.service.GestionCliente;

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
public class ClienteController {

	@Autowired
	private GestionCliente Cliente;

	@RequestMapping(value = "/registroCliente", method = RequestMethod.GET)
	public ModelAndView ingresar(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return new ModelAndView("nuevoCliente");
	}

	@RequestMapping(value = "/registrarCliente", method = RequestMethod.POST)
	public ModelAndView registroCliente(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("registrarCliente");
		String agregar = null;
		Cliente nvoCliente = null;

		Cliente oModelCliente = new Cliente();
		oModelCliente.setNombre(request.getParameter("txtNombre"));
		oModelCliente.setNumDocumento(Integer.parseInt(request.getParameter("txtDNI")));
		oModelCliente.setApellido(request.getParameter("txtApellido"));
		oModelCliente.setTelefono(request.getParameter("txtTelefono"));
		oModelCliente.setDireccion(request.getParameter("txtDireccion"));
		oModelCliente.setEmail(request.getParameter("txtEmail"));
		agregar = request.getParameter("rbAgregarMascota");

		try {
			Cliente.registrarCliente(oModelCliente);
			if (agregar.equals("S")) {
				nvoCliente = Cliente.ObtenerClientexDni(oModelCliente.getNumDocumento());
				String codigo = nvoCliente.getCodigo();
				return new ModelAndView("redirect:agregarmascota?codigo=" + oModelCliente.getNumDocumento());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("/error", "mensaje", e.getMessage());
		}

		return new ModelAndView("/exito", "mensaje", "Nuevo cliente registrado");
	}

	@RequestMapping(value = "/listarcliente")
	public ModelAndView ListarClientes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {

		List<Cliente> clientes = this.Cliente.listClientes();
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("clientes", clientes);

		String mensaje = "";
		if (request.getParameter("mensaje") != null) {
			mensaje = request.getParameter("mensaje");
		}

		ModelAndView mav = new ModelAndView("listarclienteC");
		mav.addObject("model", myModel);
		mav.addObject("mensaje", mensaje);
		return mav;

	}

	@RequestMapping(value = "/buscacliente")
	public ModelAndView BuscaCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DAOExcepcion {

		List<Cliente> clientes = this.Cliente.listClientes();

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("clientes", clientes);

		return new ModelAndView("buscacliente", "model", myModel);

	}

//	@RequestMapping(value="/vercliente")
//	public ModelAndView vercliente(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException, DAOExcepcion {
//		Cliente cliente = null;
//       
//		String codigo= (request.getParameter("idCliente"));
//		try 
//		{
//			this.Cliente.ObtenerCliente(codigo);
//		} 
//		catch (Exception e) 
//		{
//			return new ModelAndView("/error", "mensaje", e.getMessage());
//		}
//		
//		Map<String, Object> myModel = new HashMap<String, Object>();
//		myModel.put("clientes",cliente);
//		
//        return new ModelAndView("vercliente","model", myModel);
//
//    }
}
