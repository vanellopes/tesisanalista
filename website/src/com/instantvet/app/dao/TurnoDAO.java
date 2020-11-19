package com.instantvet.app.dao;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class TurnoDAO extends BaseDAO
{
	public int existeTurno(Integer codigoTurno) throws DAOExcepcion 
	{
		String query = "SELECT COUNT(*) AS CONTADOR FROM Turno WHERE turnoId=?";//buscar por fecha y hora
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorTurno=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, codigoTurno);
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

	public void registrarTurno(Turno objTurno) throws DAOExcepcion
	{	
		String query = "INSERT INTO Turno(fecha_turno, clienteId, pacienteId, tipo_turno, estadoTurnoId,  " +
	                   "observaciones) values (?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			java.sql.Timestamp sqlDate =new java.sql.Timestamp(objTurno.getFechaTurno().getTime());
			stmt.setTimestamp(1, sqlDate);
			stmt.setString(2, objTurno.getCliente());
			stmt.setString(3, objTurno.getPaciente());
			stmt.setString(4, objTurno.getTipoTurno());
			stmt.setInt(5, 1);
			stmt.setString(6, objTurno.getObservaciones());
			
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
	
	public void modificarTurno(Turno objTurno) throws DAOExcepcion
	{
		String query = "UPDATE Turno SET pacienteId=?,tipo_Turno=?,observaciones=?, " +
	                   "estadoTurnoId=?,fecha_Turno=? WHERE TurnoId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try 
		{	
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1,Integer.parseInt(objTurno.getPaciente()));
			stmt.setString(2, "V" );///objTurno.getTipoTurno()
			stmt.setString(3, objTurno.getObservaciones());
			stmt.setInt(4, objTurno.getEstadoTurnoId());			
			java.sql.Timestamp sqlDate =new java.sql.Timestamp(objTurno.getFechaTurno().getTime());
			stmt.setTimestamp(5, sqlDate);
			stmt.setInt(6, objTurno.getCodigoTurno());
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

	public void cambiarEstadoTurno(Integer codigoTurno, int estado) throws DAOExcepcion 
	{
		String query = "Update Turno set estadoTurnoId=? WHERE TurnoId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, estado);
			stmt.setInt(2, codigoTurno);
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
	
	public List<Turno>listarTurnoxArea(String area) throws DAOExcepcion////CAMBIAR QUERY
	{
		String query = "SELECT t.turnoId, t.fecha_turno, t.clienteId, t.pacienteId, t.tipo_turno , et.nombre as estadoTurno, t.observaciones, " +		               
			            "CONCAT(cl.nombres ,' ', cl.apellido) as nombreCliente, cl.telefono, p.nombre nombrePaciente " + 
			            "FROM Turno t " +
			            "JOIN Paciente p on (p.pacienteId = t.pacienteId) " +
			            "JOIN Cliente cl on (cl.clienteId = t.clienteId) " +
			            "join estadoturno et on (et.estadoTurnoId = t.estadoTurnoId) " + 
			            "WHERE t.tipo_Turno = ? " +
			            "ORDER BY t.fecha_Turno";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = obtenerListTurno(query, area);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}
	
	public List<Turno> listarTurnos() throws DAOExcepcion ///ESTA OK
	{
		String query = "SELECT t.turnoId, t.fecha_turno, t.clienteId, t.pacienteId, t.tipo_turno , et.nombre as estadoTurno, t.observaciones, " +		               
		               "CONCAT(cl.nombres ,' ', cl.apellido) as nombreCliente, cl.telefono, p.nombre nombrePaciente " + 
		               "FROM Turno t " +
		               "JOIN Paciente p on (p.pacienteId = t.pacienteId) " +
		               "JOIN Cliente cl on (cl.clienteId = t.clienteId) " +
		               "join estadoturno et on (et.estadoTurnoId = t.estadoTurnoId) " + 
		               "WHERE t.tipo_Turno in ('V', 'P') and t.estadoTurnoId in(1,2)" +
		               "ORDER BY t.fecha_Turno";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = obtenerListTurno(query, null);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}
	
	public List<Turno> listarTurnosCanceladosAnulados(Integer estadoTurno) throws DAOExcepcion
	{
		String query = "SELECT t.turnoId, t.fecha_turno, t.clienteId, t.pacienteId, t.tipo_turno , et.nombre as estadoTurno, t.observaciones, " +		               
		               "CONCAT(cl.nombres ,' ', cl.apellido) as nombreCliente, cl.telefono, p.nombre nombrePaciente " + 
		               "FROM Turno t " +
		               "JOIN Paciente p on (p.pacienteId = t.pacienteId) " +
		               "JOIN Cliente cl on (cl.clienteId = t.clienteId) " +
		               "join estadoturno et on (et.estadoTurnoId = t.estadoTurnoId) " + 
		               "WHERE t.tipo_Turno in ('V', 'P') and t.estadoTurnoId = ?" +
		               "ORDER BY t.fecha_Turno";
		List<Turno> lista = new ArrayList<Turno>();
		try 
		{
			lista = obtenerListTurno(query, null);
		} 
		catch(Exception e) 
		{
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} 
		System.out.println(lista.size());
		return lista;
	}

	private List<Turno>obtenerListTurno(String query, String tipoTurno) throws DAOExcepcion
	{
		List<Turno> listaTurnos = new ArrayList<Turno>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			if (tipoTurno != null) {
				stmt.setString(1, tipoTurno);
			}
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				Turno objTurno = new Turno();
				objTurno.setCodigoTurno(rs.getInt("turnoId"));
				objTurno.setCliente(rs.getString("clienteId"));
				objTurno.setPaciente(rs.getString("pacienteId"));
				objTurno.setTipoTurno(rs.getString("tipo_Turno"));
				objTurno.setEstadoTurno(rs.getString("estadoTurno"));
				objTurno.setObservaciones(rs.getString("observaciones"));
				objTurno.setFechaTurno(rs.getTimestamp("fecha_turno"));
				objTurno.setNombreCliente(rs.getString("nombreCliente"));
				objTurno.setNombrePaciente(rs.getString("nombrePaciente"));
				objTurno.setTelefono(rs.getString("telefono"));
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
	
	
	public Turno obtenerTurno(Integer codigoTurno) throws DAOExcepcion 
	{
		String query = "SELECT t.turnoId, t.fecha_turno, t.clienteId, t.pacienteId, t.tipo_turno , et.nombre as estadoTurno, t.observaciones, " +		               
		               "CONCAT(cl.nombres ,' ', cl.apellido) as nombreCliente, cl.telefono, p.nombre nombrePaciente " + 
		               "FROM Turno t " +
		               "JOIN Paciente p on (p.pacienteId = t.pacienteId) " +
		               "JOIN Cliente cl on (cl.clienteId = t.clienteId) " +
		               "join estadoturno et on (et.estadoTurnoId = t.estadoTurnoId) " + 
		               "WHERE t.turnoId =? " +
		               "ORDER BY t.fecha_Turno";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Turno objTurno = new Turno();
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, codigoTurno);
			rs = stmt.executeQuery();
			while (rs.next()) 
			{
				
				objTurno.setCodigoTurno(rs.getInt("turnoId"));
				objTurno.setCliente(rs.getString("clienteId"));
				objTurno.setPaciente(rs.getString("pacienteId"));
				objTurno.setTipoTurno(rs.getString("tipo_Turno"));
				objTurno.setEstadoTurno(rs.getString("estadoTurno"));
				objTurno.setObservaciones(rs.getString("observaciones"));
				objTurno.setFechaTurno(rs.getDate("fecha_turno"));
				objTurno.setNombreCliente(rs.getString("nombreCliente"));
				objTurno.setNombrePaciente(rs.getString("nombrePaciente"));
				objTurno.setTelefono(rs.getString("telefono"));
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

}