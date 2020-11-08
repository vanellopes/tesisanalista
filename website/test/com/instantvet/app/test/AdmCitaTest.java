package com.instantvet.app.test;

import static org.junit.Assert.*;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cita;
import com.instantvet.app.negocio.AdmCita;
import com.instantvet.app.negocio.ICita;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import junit.framework.Assert;

import org.junit.Test;

public class AdmCitaTest {

	    //@Test
		public void test() 
		{
			fail("No esta implementado");
		}
		@Test
		public void conexion() 
		{
			Connection cn =null;
			try 
			{
			    cn= ConexionBD.obtenerConexion();
				assertNotNull(cn);
			} 
			catch (SQLException e) 
			{
				Assert.fail("Fall� la coneccion: " + e.getMessage());
			}
		}
		
		//@Test
		public void crearCitaVacuna() 
		{
			String codigoCita="0";
			String codigoPersona="1"; 
			String codigoPaciente="1";
			String codigoDoctor="1";
			String tipoCita="V";
			String descripcionCita="Cita para vacuna";
			String nombreVacuna="Parvovirus";
			String fechaCita="26/07/2012";
			
		    ICita objAdmCita= new AdmCita();
		    try 
		    {
				objAdmCita.GrabarModificarCita(codigoCita,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoCita,
						                       descripcionCita,
						                       nombreVacuna,
						                       fechaCita);
				Cita objNewCita=(Cita)objAdmCita.ObtenerCita("1");
			    assertNotNull(objNewCita);    
		    } 
		    catch (DAOExcepcion e) 
		    {
		    	Assert.fail("Fall� el grabar Cita para Vacuna: " + e.getMessage());
			}
		}
		
		//@Test
		public void crearCitaTarea() 
		{
			String codigoCita="0";
			String codigoPersona="1"; 
			String codigoPaciente="1";
			String codigoDoctor="1";
			String tipoCita="T";
			String descripcionCita="Nueva Tarea";
			String nombreVacuna="";
			String fechaCita="26/07/2012";
			
		    ICita objAdmCita= new AdmCita();
		    try 
		    {
				objAdmCita.GrabarModificarCita(codigoCita,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoCita,
						                       descripcionCita,
						                       nombreVacuna,
						                       fechaCita);
				Cita objNewCita=(Cita)objAdmCita.ObtenerCita("1");
			    assertNotNull(objNewCita);    
		    } 
		    catch (DAOExcepcion e) 
		    {
		    	Assert.fail("Fall� el grabar Tarea: " + e.getMessage());
			}
		}

		//@Test
		public void modificarCita() 
		{
			String codigoCita="1";
			String codigoPersona="2"; 
			String codigoPaciente="2";
			String codigoDoctor="2";
			String tipoCita="T";
			String descripcionCita="Nueva Tarea";
			String nombreVacuna="";
			String fechaCita="26/07/2012";
			
			ICita objAdmCita= new AdmCita();
			try 
			{
				objAdmCita.GrabarModificarCita(codigoCita,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoCita,
						                       descripcionCita,
						                       nombreVacuna,
						                       fechaCita);
			
				Cita objNewCita = (Cita)objAdmCita.ObtenerCita(codigoCita);
				assertTrue(objNewCita.getCodigoDoctor().equals(codigoPersona));
				assertTrue(objNewCita.getCodigoPaciente().equals(codigoPaciente));
				assertTrue(objNewCita.getCodigoPersona().equals(codigoDoctor));
				assertTrue(objNewCita.getDescripcionCita().equals(tipoCita));
				assertTrue(objNewCita.getFechaCita().equals(descripcionCita));
				assertTrue(objNewCita.getNombreVacuna().equals(nombreVacuna));
				assertTrue(objNewCita.getTipoCita().equals(fechaCita));
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el modificar Cita: " + e.getMessage());
			}
		}
		
		//@Test
		public void borrarCita() 
		{
			String codigoCita="1";
					
			ICita objAdmCita= new AdmCita();
			try {
				objAdmCita.BorrarCita(codigoCita);
				Cita objNewCita=(Cita)objAdmCita.ObtenerCita(codigoCita);
				assertNull(objNewCita);
			} 
			catch (DAOExcepcion e) 
			{
				Assert.fail("Fall� el borrar Cita: " + e.getMessage());
			}	
		}

		//@Test
		public void listarCitaVacunas() 
		{	
			ICita objAdmCita= new AdmCita();
			ArrayList<Cita> Lista;
			try 
			{
				Lista = (ArrayList<Cita>)objAdmCita.ListarCitaVacunas();
				assertTrue(Lista.size()>0);
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el listar Cita de Vacunas: " + e.getMessage());
			}
		}
		
		//@Test
		public void listarCitaTareas() 
		{	
			ICita objAdmCita= new AdmCita();
			ArrayList<Cita> Lista;
			try 
			{
				Lista = (ArrayList<Cita>)objAdmCita.ListarCitaTareas();
				assertTrue(Lista.size()>0);
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el listar Tareas: " + e.getMessage());
			}
		}
}
