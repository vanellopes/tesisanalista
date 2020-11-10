package com.instantvet.app.test;

import static org.junit.Assert.*;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.negocio.GestionTurnos;
import com.instantvet.app.negocio.impl.GestionTurnosImpl;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import junit.framework.Assert;

import org.junit.Test;

public class GestionTurnoTest {

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
		public void crearTurnoVacuna() 
		{
			String codigoTurno="0";
			String codigoPersona="1"; 
			String codigoPaciente="1";
			String codigoDoctor="1";
			String tipoTurno="V";
			String descripcionTurno="Turno para vacuna";
			String nombreVacuna="Parvovirus";
			String fechaTurno="26/07/2012";
			
		    GestionTurnos objAdmTurno= new GestionTurnosImpl();
		    try 
		    {
				objAdmTurno.GrabarModificarTurno(codigoTurno,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoTurno,
						                       descripcionTurno,
						                       nombreVacuna,
						                       fechaTurno);
				Turno objNewTurno=(Turno)objAdmTurno.ObtenerTurno("1");
			    assertNotNull(objNewTurno);    
		    } 
		    catch (DAOExcepcion e) 
		    {
		    	Assert.fail("Fall� el grabar Turno para Vacuna: " + e.getMessage());
			}
		}
		
		//@Test
		public void crearTurnoTarea() 
		{
			String codigoTurno="0";
			String codigoPersona="1"; 
			String codigoPaciente="1";
			String codigoDoctor="1";
			String tipoTurno="T";
			String descripcionTurno="Nueva Tarea";
			String nombreVacuna="";
			String fechaTurno="26/07/2012";
			
		    GestionTurnos objAdmTurno= new GestionTurnosImpl();
		    try 
		    {
				objAdmTurno.GrabarModificarTurno(codigoTurno,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoTurno,
						                       descripcionTurno,
						                       nombreVacuna,
						                       fechaTurno);
				Turno objNewTurno=(Turno)objAdmTurno.ObtenerTurno("1");
			    assertNotNull(objNewTurno);    
		    } 
		    catch (DAOExcepcion e) 
		    {
		    	Assert.fail("Fall� el grabar Tarea: " + e.getMessage());
			}
		}

		//@Test
		public void modificarTurno() 
		{
			String codigoTurno="1";
			String codigoPersona="2"; 
			String codigoPaciente="2";
			String codigoDoctor="2";
			String tipoTurno="T";
			String descripcionTurno="Nueva Tarea";
			String nombreVacuna="";
			String fechaTurno="26/07/2012";
			
			GestionTurnos objAdmTurno= new GestionTurnosImpl();
			try 
			{
				objAdmTurno.GrabarModificarTurno(codigoTurno,
						                       codigoPersona,
						                       codigoPaciente,
						                       codigoDoctor,
						                       tipoTurno,
						                       descripcionTurno,
						                       nombreVacuna,
						                       fechaTurno);
			
				Turno objNewTurno = (Turno)objAdmTurno.ObtenerTurno(codigoTurno);
				assertTrue(objNewTurno.getCodigoDoctor().equals(codigoPersona));
				assertTrue(objNewTurno.getCodigoPaciente().equals(codigoPaciente));
				assertTrue(objNewTurno.getCodigoPersona().equals(codigoDoctor));
				assertTrue(objNewTurno.getDescripcionTurno().equals(tipoTurno));
				assertTrue(objNewTurno.getFechaTurno().equals(descripcionTurno));
				assertTrue(objNewTurno.getNombreVacuna().equals(nombreVacuna));
				assertTrue(objNewTurno.getTipoTurno().equals(fechaTurno));
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el modificar Turno: " + e.getMessage());
			}
		}
		
		//@Test
		public void borrarTurno() 
		{
			String codigoTurno="1";
					
			GestionTurnos objAdmTurno= new GestionTurnosImpl();
			try {
				objAdmTurno.BorrarTurno(codigoTurno);
				Turno objNewTurno=(Turno)objAdmTurno.ObtenerTurno(codigoTurno);
				assertNull(objNewTurno);
			} 
			catch (DAOExcepcion e) 
			{
				Assert.fail("Fall� el borrar Turno: " + e.getMessage());
			}	
		}

		//@Test
		public void listarTurnoVacunas() 
		{	
			GestionTurnos objAdmTurno= new GestionTurnosImpl();
			ArrayList<Turno> Lista;
			try 
			{
				Lista = (ArrayList<Turno>)objAdmTurno.ListarTurnoVacunas();
				assertTrue(Lista.size()>0);
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el listar Turno de Vacunas: " + e.getMessage());
			}
		}
		
		//@Test
		public void listarTurnoTareas() 
		{	
			GestionTurnos objAdmTurno= new GestionTurnosImpl();
			ArrayList<Turno> Lista;
			try 
			{
				Lista = (ArrayList<Turno>)objAdmTurno.ListarTurnoTareas();
				assertTrue(Lista.size()>0);
			} 
			catch (DAOExcepcion e) 
			{	
				Assert.fail("Fall� el listar Tareas: " + e.getMessage());
			}
		}
}
