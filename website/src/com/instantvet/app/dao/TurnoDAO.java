package com.instantvet.app.dao;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TurnoDAO extends BaseDAO
{
	public int existeTurno(String codigoCita) throws DAOExcepcion 
	{
		String query = "SELECT COUNT(*) AS CONTADOR FROM CITA WHERE cita_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorCita=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoCita);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				contadorCita=rs.getInt("CONTADOR");
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return contadorCita;
	}

	public String DAOobtenerUltimoCodigo() throws DAOExcepcion
	{
		String query = "SELECT ISNULL((SELECT MAX(cita_id) FROM CITA),'0') AS CODIGO";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String ultimoCodigo="0";
		try 
		{	
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				ultimoCodigo = rs.getString("CODIGO");
			}
			ultimoCodigo = Integer.toString(Integer.parseInt(ultimoCodigo) +1) ;
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return ultimoCodigo;
	}

	public void DAOgrabarCita(Turno objCita) throws DAOExcepcion
	{	
		String query = "INSERT INTO Cita(cita_id,persona_id,paciente_id,doctor_id,tipo_cita,descripcion_cita, " +
	                   "nombre_vacuna,fecha_cita) values (?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			if (objCita.getTipoCita() == "V")
			{
			  if (existeRegistro(objCita.getNombreVacuna(), "", "Vacunas") == 0)
				  throw new SQLException("Nombre de la Vacuna no existe");
			}
			
			if (existeRegistro(objCita.getCodigoPersona(), "", "Cliente") == 0)
				throw new SQLException("Cliente no existe");
			
			if (existeRegistro(objCita.getCodigoDoctor(), "", "Doctor") == 0)
				throw new SQLException("Doctor no existe");

			if (existeRegistro(objCita.getCodigoPaciente(), objCita.getCodigoPersona(), "Paciente") == 0)
				throw new SQLException("Paciente no pertenece al cliente o no existe");

			if (existeTurnoRegistrada(objCita.getTipoCita(), objCita.getFechaCita(), objCita.getCodigoPersona(),
					objCita.getCodigoPaciente(), objCita.getCodigoDoctor(), objCita.getNombreVacuna()) == 1)
				throw new SQLException("El registro ya existe");
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCita.getCodigoCita());
			stmt.setString(2, objCita.getCodigoPersona());
			stmt.setString(3, objCita.getCodigoPaciente());
			stmt.setString(4, objCita.getCodigoDoctor());
			stmt.setString(5, objCita.getTipoCita());
			stmt.setString(6, objCita.getDescripcionCita());
			stmt.setString(7, objCita.getNombreVacuna());
			stmt.setString(8, objCita.getFechaCita());
			int i = stmt.executeUpdate();
			if (i != 1) 
		      throw new SQLException("No se pudo ingresar la Cita");
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}

	public void DAOinsertarVacuna(String nombreVacuna) throws DAOExcepcion
	{	
		String query = "INSERT INTO Vacunas(nombre_vacuna) values (?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			if (existeRegistro(nombreVacuna, "", "Vacunas") == 1)
				throw new SQLException("El nombre de la vacuna ya existe");
						
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, nombreVacuna);
			int i = stmt.executeUpdate();
			if (i != 1) 
		      throw new SQLException("No se pudo ingresar el nombre de la vacuna");
		} 
		catch (SQLException e) 
		{
			throw new DAOExcepcion(e.getMessage());
		}
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}
	
	public void DAOmodificarCita(Turno objCita) throws DAOExcepcion
	{
		String query = "UPDATE Cita SET persona_id=?,paciente_id=?,doctor_id=?,tipo_cita=?,descripcion_cita=?, " +
	                   "nombre_vacuna=?,fecha_cita=? WHERE cita_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try 
		{
			if (objCita.getTipoCita() == "V")
			{
			  if (existeRegistro(objCita.getNombreVacuna(), "", "Vacunas") == 0)
			    throw new SQLException("Nombre de la Vacuna no existe");
			}
			
			if (existeRegistro(objCita.getCodigoPersona(), "", "Cliente") == 0)
				throw new SQLException("Cliente no existe");
			
			if (existeRegistro(objCita.getCodigoDoctor(), "", "Doctor") == 0)
				throw new SQLException("Doctor no existe");

			if (existeRegistro(objCita.getCodigoPaciente(), objCita.getCodigoPersona(), "Paciente") == 0)
				throw new SQLException("Paciente no pertenece al cliente o no existe");
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCita.getCodigoPersona());
			stmt.setString(2, objCita.getCodigoPaciente());
			stmt.setString(3, objCita.getCodigoDoctor());
			stmt.setString(4, objCita.getTipoCita());
			stmt.setString(5, objCita.getDescripcionCita());
			stmt.setString(6, objCita.getNombreVacuna());
			stmt.setString(7, objCita.getFechaCita());
			stmt.setString(8, objCita.getCodigoCita());
			int i = stmt.executeUpdate();
			if (i != 1) 
			  throw new SQLException("No se pudo actualizar la cita");
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}	
	}

	public Turno DAOobtenerCita(String codigoCita) throws DAOExcepcion
	{
		String query = "SELECT c.cita_id, c.persona_id, c.paciente_id, c.doctor_id, c.tipo_cita, " +
	                   "c.descripcion_cita, c.nombre_vacuna, c.fecha_cita, " +
                       "cl.telefono, cl.direccion, cl.Nombres, cl.num_documento, cl.apellido, " +
                       "'' as especie, '' as nombre_paciente, " +
                       "d.nombre as nombre_doctor, d.apellido as doctor_apellido, d.matricula as doctor_matricula " +
                       "FROM Cita c " +
                       "JOIN Doctor d on (d.doctorid = c.doctor_id) " +
                       "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
                       "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
                       "WHERE c.cita_id =?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Turno objCita =null;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoCita);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				objCita = new Turno();
				objCita.setCodigoCita(rs.getString("cita_id"));
				objCita.setCodigoPersona(rs.getString("persona_id"));
				objCita.setCodigoPaciente(rs.getString("paciente_id"));
				objCita.setCodigoDoctor(rs.getString("doctor_id"));
				objCita.setTipoCita(rs.getString("tipo_cita"));
				objCita.setDescripcionCita(rs.getString("descripcion_cita"));
				objCita.setNombreVacuna(rs.getString("nombre_vacuna"));
				objCita.setFechaCita(rs.getString("fecha_cita"));
				
				objCita.setTelefono(rs.getString("telefono"));
				objCita.setDireccion(rs.getString("direccion"));
				objCita.setNombresPersona(rs.getString("Nombres"));
				objCita.setApellido(rs.getString("apellido"));
				
				objCita.setEspecie(rs.getString("especie"));
				objCita.setNombrePaciente(rs.getString("nombre_paciente"));
				
				objCita.setNombreDoctor(rs.getString("nombre_doctor"));
				objCita.setDoctorMatricula(rs.getString("doctor_matricula"));
				objCita.setDoctorApellido(rs.getString("doctor_apellido"));
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return objCita;
	}

	public void borrarTurno(String codigoCita) throws DAOExcepcion 
	{
		String query = "DELETE Cita WHERE cita_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoCita);
			int i = stmt.executeUpdate();
			if (i != 1) 
			{
				throw new SQLException("No se pudo eliminar la Cita.");
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}

	public List<Turno>DAOlistarCitaVacunas() throws DAOExcepcion
	{
		String query = "SELECT c.cita_id, c.persona_id, c.paciente_id, c.doctor_id, c.tipo_cita, " +
		               "c.descripcion_cita, c.nombre_vacuna, c.fecha_cita, " +
		               "cl.telefono, cl.direccion, cl.Nombres, cl.apellido, cl.num_documento, " +
		               "'' as especie, '' as nombre_paciente, " +
		               "d.nombre as nombre_doctor, d.apellido as doctor_apellido, d.matricula as doctor_matricula " +
		               "FROM Cita c " +
		               "JOIN Doctor d on (d.doctorid = c.doctor_id) " +
		               "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
		               "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
		               "WHERE c.tipo_cita ='V' " +
		               "ORDER BY c.fecha_cita";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = DAOobtenerListCita(query);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}
	
	public List<Turno>DAOlistarCitaTareas() throws DAOExcepcion
	{
		String query = "SELECT c.cita_id, c.persona_id, c.paciente_id, c.doctor_id, c.tipo_cita, " +
		               "c.descripcion_cita, c.nombre_vacuna, c.fecha_cita, " +
		               "cl.telefono, cl.direccion, cl.Nombres, cl.num_documento, cl.apellido, " +
		               "'' as especie, '' as nombre_paciente, " +
		               "d.nombre as nombre_doctor, d.apellido as doctor_apellido, d.matricula as doctor_matricula " +
		               "FROM Cita c " +
		               "JOIN Doctor d on (d.doctorid = c.doctor_id) " +
		               "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
		               "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
		               "WHERE c.tipo_cita ='T' " +
		               "ORDER BY c.fecha_cita";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = DAOobtenerListCita(query);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}

	private List<Turno>DAOobtenerListCita(String query) throws DAOExcepcion
	{
		List<Turno> listaCitas = new ArrayList<Turno>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				Turno objCita = new Turno();
				objCita.setCodigoCita(rs.getString("cita_id"));
				objCita.setCodigoPersona(rs.getString("persona_id"));
				objCita.setCodigoPaciente(rs.getString("paciente_id"));
				objCita.setCodigoDoctor(rs.getString("doctor_id"));
				objCita.setTipoCita(rs.getString("tipo_cita"));
				objCita.setDescripcionCita(rs.getString("descripcion_cita"));
				objCita.setNombreVacuna(rs.getString("nombre_vacuna"));
				objCita.setFechaCita(rs.getString("fecha_cita"));
				
				objCita.setTelefono(rs.getString("telefono"));
				objCita.setDireccion(rs.getString("direccion"));
				objCita.setNombresPersona(rs.getString("Nombres"));
				objCita.setApellido(rs.getString("apellido"));
				
				objCita.setEspecie(rs.getString("especie"));
				objCita.setNombrePaciente(rs.getString("nombre_paciente"));
				
				objCita.setNombreDoctor(rs.getString("nombre_doctor"));
				objCita.setDoctorMatricula(rs.getString("matricula"));
				objCita.setDoctorApellido(rs.getString("doctor_apellido"));
				listaCitas.add(objCita);
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return listaCitas;
	}

    private int existeRegistro(String codigo1, String codigo2, String tableName) throws DAOExcepcion
    {
    	String codigoString = "";
    	if (tableName == "Cliente")
    		codigoString = "Persona_Id";
    	if (tableName == "Doctor")
    		codigoString = "DoctorId";
    	if (tableName == "Vacunas")
    		codigoString = "nombre_vacuna";
    	
    	String query = "SELECT COUNT(*) AS CONTADOR FROM "+ tableName +" WHERE "+ codigoString +"=?";
    	
    	if (tableName == "Paciente")
    	  query = "SELECT COUNT(*) AS CONTADOR FROM Paciente p " + 
				  "JOIN Cliente c on c.Persona_Id = p.Dueno_Id " + 
				  "WHERE p.Paciente_id =? " + 
				  "  AND p.Dueno_Id =?";
    	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorRegistros=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigo1);
			if (tableName == "Paciente")
				stmt.setString(2, codigo2);	
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				contadorRegistros=rs.getInt("CONTADOR");
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return contadorRegistros;
    }
    
    private int existeTurnoRegistrada(String tipoCita, String fechaCita, String personaId, String pacienteId, String doctorId, String vacuna) throws DAOExcepcion 
	{
    	String query = "SELECT COUNT(*) AS CONTADOR FROM Cita " + 
					   "WHERE fecha_cita =? " + 
					   "  AND persona_id =? " + 
					   "  AND paciente_id =? " + 
					   "  AND doctor_id =? " + 
					   "  AND tipo_cita=? ";
    	
    	if (tipoCita == "V")
    		query = query + "  AND nombre_vacuna =?";
    	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorRegistros=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, fechaCita);
			stmt.setString(2, personaId);
			stmt.setString(3, pacienteId);
			stmt.setString(4, doctorId);
			stmt.setString(5, tipoCita);
			if (tipoCita == "V")
				stmt.setString(6, vacuna);	
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				contadorRegistros=rs.getInt("CONTADOR");
			}
		} 
		catch (SQLException e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		finally 
		{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return contadorRegistros;
	}
}