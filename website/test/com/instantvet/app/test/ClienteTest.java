package com.instantvet.app.test;

import static org.junit.Assert.*;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.*;
import com.instantvet.app.service.impl.GestionClienteImpl;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import junit.framework.Assert;

import java.util.List;

import org.junit.Test;



public class ClienteTest {

	
	
	//@Test
	public void test() {
		fail("Not yet implemented");
	}

	@Test
	public void conexion() {
		Connection cn =null;
		try {
			 cn= ConexionBD.obtenerConexion();
			assertNotNull(cn);
		} catch (SQLException e) {
			Assert.fail("Fall� la coneccion: " + e.getMessage());
		}
	}
	
//	//@Test
//	public void Cliente() {
//		String codigo="0";
//		String nombre="jose";
//		String apellidopaterno="zamudio";
//		String apellidomaterno="risco";
//		String email="libra5100@hotmail.com";
//		String direccion="SMP";
//		String imagen="";
//		String telefono="5342031";
//		String celular="997480042";
//		
//		Cliente objCliente= new Cliente(codigo,nombre,apellidopaterno,apellidomaterno,email,direccion,imagen,telefono,celular);
//		
//		assertTrue(objCliente.getNombre().equals(nombre));
//		assertTrue(objCliente.getEmail().equals(email));
//		assertTrue(objCliente.getDireccion().equals(direccion));
//		assertTrue(objCliente.getImagen().equals(imagen));
//		assertTrue(objCliente.getTelefono().equals(telefono));
//		assertTrue(objCliente.getCelular().equals(celular));
//	}
//	
//	//@Test
//	public void grabarCliente() {
//		String codigo="0";
//		String nombre="eduardo";
//		String apellidopaterno="zamudio";
//		String apellidomaterno="risco";
//		String email="libra5100@hotmail.com";
//		String direccion="SMP";
//		String imagen="";
//		String telefono="5342031";
//		String celular="997480042";
//		
//		
//	    GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//	    try {
//			objAdmCliente.GrabarModificarCliente(codigo,nombre,apellidopaterno,apellidomaterno,email,direccion,imagen,telefono,celular);
//		
//			Cliente objNewCliente=(Cliente)objAdmCliente.ObtenerCliente("1");
//		    assertNotNull(objNewCliente);
//		    
//	    } catch (DAOExcepcion e) {
//
//	    	Assert.fail("Fall� el grabar: " + e.getMessage());
//		}
//	    
//	    
//	}
//	
//	
//	//@Test
//	public void modificarCliente() {
//		String codigo="3";
//		String nombre="jose3";
//		String apellidopaterno="zamudio3";
//		String apellidomaterno="risco3";
//		String email="libra2033@hotmail.com";
//		String direccion="SMP";
//		String imagen="";
//		String telefono="5342031";
//		String celular="997480042";
//		
//		GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//		try {
//			objAdmCliente.GrabarModificarCliente(codigo,nombre,apellidopaterno,apellidomaterno,email,direccion,imagen,telefono,celular);
//		
//			Cliente objNewCliente=(Cliente)objAdmCliente.ObtenerCliente(codigo);
//			assertTrue(objNewCliente.getNombre().equals(nombre));
//			//assertTrue(objNewCliente.getApellidopaterno().equals(apellidopaterno));
//			//assertTrue(objNewCliente.getApellidomaterno().equals(apellidomaterno));
//			assertTrue(objNewCliente.getEmail().equals(email));
//			assertTrue(objNewCliente.getDireccion().equals(direccion));
//			assertTrue(objNewCliente.getImagen().equals(imagen));
//			assertTrue(objNewCliente.getTelefono().equals(telefono));
//			assertTrue(objNewCliente.getCelular().equals(celular));
//		
//		} catch (DAOExcepcion e) {
//			
//			Assert.fail("Fall� el modificar: " + e.getMessage());
//		}
//		
//		
//	}
//	
//	//@Test
//	public void deleteCliente() {
//		String codigo="4";
//				
//		GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//		try {
//			objAdmCliente.deleteCliente(codigo);
//			
//			Cliente objNewCliente=(Cliente)objAdmCliente.ObtenerCliente(codigo);
//			
//			assertNull(objNewCliente);
//		} catch (DAOExcepcion e) {
//			Assert.fail("Fall� el delete: " + e.getMessage());
//		}
//		
//		
//	}
//	
//	
//	//@Test
//	public void listarClientes() {
//				
//		GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//		ArrayList<Cliente> Lista;
//		try {
//			Lista = (ArrayList<Cliente>)objAdmCliente.listarClientes();
//			assertTrue(Lista.size()>0);
//			
//		} catch (DAOExcepcion e) {
//			
//			Assert.fail("Fall� el listado: " + e.getMessage());
//		}
//	}
//	
//	//@Test
//	public void changeClienteToCliente()
//	{
//		String codigo = "5";
//		
//		GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//		try {
//			Boolean answer =  objAdmCliente.changeClienteToCliente(codigo);
//					
//			assertTrue(answer);
//		} catch (DAOExcepcion e) {
//			Assert.fail(e.getMessage());
//		}
//		
//	}
//	
//	
//	//@Test
//	public void listClientes()
//	{
//		GestionClienteImpl objAdmCliente= new GestionClienteImpl();
//		List<Cliente> list;
//		try {
//			list = objAdmCliente.listClientes();
//			assertTrue(list.size()>0);
//			
//		} catch (DAOExcepcion e) {
//			
//			Assert.fail("Fall� el listado: " + e.getMessage());
//		}	
//	}
//	
}
