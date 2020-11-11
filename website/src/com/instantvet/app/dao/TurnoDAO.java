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
	public int existeTurno(String codigoTurno) throws DAOExcepcion 
	{
		String query = "SELECT COUNT(*) AS CONTADOR FROM Turno WHERE turno_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorTurno=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoTurno);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				contadorTurno=rs.getInt("CONTADOR");
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
		return contadorTurno;
	}

	public String DAOobtenerUltimoCodigo() throws DAOExcepcion
	{
		String query = "SELECT ISNULL((SELECT MAX(Turno_id) FROM Turno),'0') AS CODIGO";
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

	public void DAOgrabarTurno(Turno objTurno) throws DAOExcepcion
	{	
		String query = "INSERT INTO Turno(Turno_id,persona_id,paciente_id,Personal_id,tipo_Turno,descripcion, " +
	                   "nombre_vacuna,fecha_Turno) values (?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			if (objTurno.getTipoTurno() == "V")
			{
			  if (existeRegistro(objTurno.getNombreVacuna(), "", "Vacunas") == 0)
				  throw new SQLException("Nombre de la Vacuna no existe");
			}
			
			if (existeRegistro(objTurno.getCodigoPersona(), "", "Cliente") == 0)
				throw new SQLException("Cliente no existe");
			
			if (existeRegistro(objTurno.getCodigoPersonal(), "", "Personal") == 0)
				throw new SQLException("Personal no existe");

			if (existeRegistro(objTurno.getCodigoPaciente(), objTurno.getCodigoPersona(), "Paciente") == 0)
				throw new SQLException("Paciente no pertenece al cliente o no existe");

			if (existeTurnoRegistrada(objTurno.getTipoTurno(), objTurno.getFechaTurno(), objTurno.getCodigoPersona(),
					objTurno.getCodigoPaciente(), objTurno.getCodigoPersonal(), objTurno.getNombreVacuna()) == 1)
				throw new SQLException("El registro ya existe");
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objTurno.getCodigoTurno());
			stmt.setString(2, objTurno.getCodigoPersona());
			stmt.setString(3, objTurno.getCodigoPaciente());
			stmt.setString(4, objTurno.getCodigoPersonal());
			stmt.setString(5, objTurno.getTipoTurno());
			stmt.setString(6, objTurno.getDescripcionTurno());
			stmt.setString(7, objTurno.getNombreVacuna());
			stmt.setString(8, objTurno.getFechaTurno());
			int i = stmt.executeUpdate();
			if (i != 1) 
		      throw new SQLException("No se pudo ingresar la Turno");
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
	
	public void DAOmodificarTurno(Turno objTurno) throws DAOExcepcion
	{
		String query = "UPDATE Turno SET persona_id=?,paciente_id=?,Personal_id=?,tipo_Turno=?,descripcion=?, " +
	                   "nombre_vacuna=?,fecha_Turno=? WHERE Turno_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try 
		{
			if (objTurno.getTipoTurno() == "V")
			{
			  if (existeRegistro(objTurno.getNombreVacuna(), "", "Vacunas") == 0)
			    throw new SQLException("Nombre de la Vacuna no existe");
			}
			
			if (existeRegistro(objTurno.getCodigoPersona(), "", "Cliente") == 0)
				throw new SQLException("Cliente no existe");
			
			if (existeRegistro(objTurno.getCodigoPersonal(), "", "Personal") == 0)
				throw new SQLException("Personal no existe");

			if (existeRegistro(objTurno.getCodigoPaciente(), objTurno.getCodigoPersona(), "Paciente") == 0)
				throw new SQLException("Paciente no pertenece al cliente o no existe");
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objTurno.getCodigoPersona());
			stmt.setString(2, objTurno.getCodigoPaciente());
			stmt.setString(3, objTurno.getCodigoPersonal());
			stmt.setString(4, objTurno.getTipoTurno());
			stmt.setString(5, objTurno.getDescripcionTurno());
			stmt.setString(6, objTurno.getNombreVacuna());
			stmt.setString(7, objTurno.getFechaTurno());
			stmt.setString(8, objTurno.getCodigoTurno());
			int i = stmt.executeUpdate();
			if (i != 1) 
			  throw new SQLException("No se pudo actualizar la Turno");
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

	public Turno DAOobtenerTurno(String codigoTurno) throws DAOExcepcion
	{
		String query = "SELECT c.Turno_id, c.persona_id, c.paciente_id, c.Personal_id, c.tipo_Turno, " +
	                   "c.descripcion, c.nombre_vacuna, c.fecha_Turno, " +
                       "cl.telefono, cl.direccion, cl.Nombres, cl.num_documento, cl.apellido, " +
                       "'' as especie, '' as nombre_paciente, " +
                       "d.nombre as nombre_Personal, d.apellido as Personal_apellido, d.matricula as Personal_matricula " +
                       "FROM Turno c " +
                       "JOIN Personal d on (d.Personalid = c.Personal_id) " +
                       "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
                       "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
                       "WHERE c.Turno_id =?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Turno objTurno =null;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoTurno);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				objTurno = new Turno();
				objTurno.setCodigoTurno(rs.getString("Turno_id"));
				objTurno.setCodigoPersona(rs.getString("persona_id"));
				objTurno.setCodigoPaciente(rs.getString("paciente_id"));
				objTurno.setCodigoPersonal(rs.getString("Personal_id"));
				objTurno.setTipoTurno(rs.getString("tipo_Turno"));
				objTurno.setDescripcionTurno(rs.getString("descripcion"));
				objTurno.setNombreVacuna(rs.getString("nombre_vacuna"));
				objTurno.setFechaTurno(rs.getString("fecha_Turno"));
				
				objTurno.setTelefono(rs.getString("telefono"));
				objTurno.setDireccion(rs.getString("direccion"));
				objTurno.setNombresPersona(rs.getString("Nombres"));
				objTurno.setApellido(rs.getString("apellido"));
				
				objTurno.setEspecie(rs.getString("especie"));
				objTurno.setNombrePaciente(rs.getString("nombre_paciente"));
				
				objTurno.setNombrePersonal(rs.getString("nombre_Personal"));
				objTurno.setPersonalMatricula(rs.getString("Personal_matricula"));
				objTurno.setPersonalApellido(rs.getString("Personal_apellido"));
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
		
		return objTurno;
	}

	public void borrarTurno(String codigoTurno) throws DAOExcepcion 
	{
		String query = "DELETE Turno WHERE Turno_id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigoTurno);
			int i = stmt.executeUpdate();
			if (i != 1) 
			{
				throw new SQLException("No se pudo eliminar la Turno.");
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

	public List<Turno>DAOlistarTurnoVacunas() throws DAOExcepcion
	{
		String query = "SELECT c.Turno_id, c.persona_id, c.paciente_id, c.Personal_id, c.tipo_Turno, " +
		               "c.descripcion, c.nombre_vacuna, c.fecha_Turno, " +
		               "cl.telefono, cl.direccion, cl.Nombres, cl.apellido, cl.num_documento, " +
		               "'' as especie, '' as nombre_paciente, " +
		               "d.nombre as nombre_Personal, d.apellido as Personal_apellido, d.matricula as Personal_matricula " +
		               "FROM Turno c " +
		               "JOIN Personal d on (d.Personalid = c.Personal_id) " +
		               "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
		               "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
		               "WHERE c.tipo_Turno ='V' " +
		               "ORDER BY c.fecha_Turno";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = DAOobtenerListTurno(query);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}
	
	public List<Turno>DAOlistarTurnoTareas() throws DAOExcepcion
	{
		String query = "SELECT c.Turno_id, c.persona_id, c.paciente_id, c.Personal_id, c.tipo_Turno, " +
		               "c.descripcion, c.nombre_vacuna, c.fecha_Turno, " +
		               "cl.telefono, cl.direccion, cl.Nombres, cl.num_documento, cl.apellido, " +
		               "'' as especie, '' as nombre_paciente, " +
		               "d.nombre as nombre_Personal, d.apellido as Personal_apellido, d.matricula as Personal_matricula " +
		               "FROM Turno c " +
		               "JOIN Personal d on (d.Personalid = c.Personal_id) " +
		               "JOIN Paciente p on (p.Paciente_id = c.paciente_id) " +
		               "JOIN Cliente cl on (cl.persona_id = c.persona_id) " +
		               "WHERE c.tipo_Turno ='T' " +
		               "ORDER BY c.fecha_Turno";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = DAOobtenerListTurno(query);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}

	private List<Turno>DAOobtenerListTurno(String query) throws DAOExcepcion
	{
		List<Turno> listaTurnos = new ArrayList<Turno>();
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
				Turno objTurno = new Turno();
				objTurno.setCodigoTurno(rs.getString("Turno_id"));
				objTurno.setCodigoPersona(rs.getString("persona_id"));
				objTurno.setCodigoPaciente(rs.getString("paciente_id"));
				objTurno.setCodigoPersonal(rs.getString("Personal_id"));
				objTurno.setTipoTurno(rs.getString("tipo_Turno"));
				objTurno.setDescripcionTurno(rs.getString("descripcion"));
				objTurno.setNombreVacuna(rs.getString("nombre_vacuna"));
				objTurno.setFechaTurno(rs.getString("fecha_Turno"));
				
				objTurno.setTelefono(rs.getString("telefono"));
				objTurno.setDireccion(rs.getString("direccion"));
				objTurno.setNombresPersona(rs.getString("Nombres"));
				objTurno.setApellido(rs.getString("apellido"));
				
				objTurno.setEspecie(rs.getString("especie"));
				objTurno.setNombrePaciente(rs.getString("nombre_paciente"));
				
				objTurno.setNombrePersonal(rs.getString("nombre_Personal"));
				objTurno.setPersonalMatricula(rs.getString("matricula"));
				objTurno.setPersonalApellido(rs.getString("Personal_apellido"));
				listaTurnos.add(objTurno);
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
		return listaTurnos;
	}

    private int existeRegistro(String codigo1, String codigo2, String tableName) throws DAOExcepcion
    {
    	String codigoString = "";
    	if (tableName == "Cliente")
    		codigoString = "Persona_Id";
    	if (tableName == "Personal")
    		codigoString = "PersonalId";
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
    
    private int existeTurnoRegistrada(String tipoTurno, String fechaTurno, String personaId, String pacienteId, String PersonalId, String vacuna) throws DAOExcepcion 
	{
    	String query = "SELECT COUNT(*) AS CONTADOR FROM Turno " + 
					   "WHERE fecha_Turno =? " + 
					   "  AND persona_id =? " + 
					   "  AND paciente_id =? " + 
					   "  AND Personal_id =? " + 
					   "  AND tipo_Turno=? ";
    	
    	if (tipoTurno == "V")
    		query = query + "  AND nombre_vacuna =?";
    	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorRegistros=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, fechaTurno);
			stmt.setString(2, personaId);
			stmt.setString(3, pacienteId);
			stmt.setString(4, PersonalId);
			stmt.setString(5, tipoTurno);
			if (tipoTurno == "V")
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