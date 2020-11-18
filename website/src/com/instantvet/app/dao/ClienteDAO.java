package com.instantvet.app.dao;

import java.util.List;
import java.util.ArrayList;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Cliente;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClienteDAO extends BaseDAO {

	public int DAOexisteCliente(Integer numDoc) throws DAOExcepcion {  /// ok 
		String query = "select count(*) as contador from Cliente where estado='A' and num_documento=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorCliente=0;
		try {
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, numDoc);
			rs = stmt.executeQuery();
			while (rs.next()) {
				contadorCliente=rs.getInt("contador");
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return contadorCliente;
	}

	public List<Cliente> DAOlistClientes() throws DAOExcepcion{
		String query = "select clienteId,Nombres,apellido,num_documento,email,telefono,direccion,estado from Cliente where estado not in('X')";
		List<Cliente> lista = new ArrayList<Cliente>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Cliente objCliente = new Cliente();
				objCliente.setCodigo(rs.getString("clienteId"));
				objCliente.setNombre(rs.getString("Nombres"));
				objCliente.setApellido(rs.getString("apellido"));
				objCliente.setNumDocumento(rs.getInt("num_documento"));
				objCliente.setDireccion(rs.getString("direccion"));
				objCliente.setEmail(rs.getString("email"));
				objCliente.setTelefono(rs.getString("telefono"));
				objCliente.setEstado("estado");
				lista.add(objCliente);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		System.out.println(lista.size());
		return lista;
	}

	public void DAOgrabarCliente(Cliente objCliente) throws DAOExcepcion{
		String query = "INSERT INTO Cliente(Nombres,apellido,num_documento,email,direccion,telefono,estado) values (?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCliente.getNombre());
			stmt.setString(2, objCliente.getApellido());
			stmt.setInt(3, objCliente.getNumDocumento());
			stmt.setString(4, objCliente.getEmail());
			stmt.setString(5, objCliente.getDireccion());
			stmt.setString(6, objCliente.getTelefono());
			stmt.setString(7,"A");
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}
		
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
				
	}

	public void DAOmodificarCliente(Cliente objCliente) throws DAOExcepcion{
		String query = "update Cliente set Nombres=?,apellido=?,num_documento=?,email=?,direccion=?,telefono=?,celular=? where clienteId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCliente.getNombre());
			stmt.setString(2, objCliente.getApellido());
			//stmt.setString(3, objCliente.getNumDocumento());
			stmt.setString(4, objCliente.getEmail());
			stmt.setString(5, objCliente.getDireccion());
			stmt.setString(6, objCliente.getTelefono());
			stmt.setString(8, objCliente.getCodigo());
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo actualizar");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
				
	}

	public Cliente DAOobtenerCliente(String codigo) throws DAOExcepcion{  //este es por id
		String query = "select clienteId,Nombres,apellido,num_documento,email,telefono,direccion,estado from Cliente where clienteId=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Cliente objCliente =null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigo);
			rs = stmt.executeQuery();
			while (rs.next()) {
				objCliente = new Cliente();
				objCliente.setCodigo(rs.getString("clienteId"));
				objCliente.setNombre(rs.getString("Nombres"));
				objCliente.setApellido(rs.getString("apellido"));
				objCliente.setNumDocumento(rs.getInt("num_documento"));
				objCliente.setDireccion(rs.getString("direccion"));
				objCliente.setEmail(rs.getString("email"));
				objCliente.setTelefono(rs.getString("telefono"));
				objCliente.setEstado("estado");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return objCliente;

	}
	
//	public List<Cliente> DAOlistClientes() throws DAOExcepcion
//	{
//		String query = "SELECT * FROM Cliente WHERE estado <> 'X'";
//		List<Cliente> list = new ArrayList<Cliente>();
//		Connection con = null;
//		PreparedStatement stmt = null;
//		ResultSet rs = null;
//		try {
//			con = ConexionBD.obtenerConexion();
//			stmt = con.prepareStatement(query);
//			rs = stmt.executeQuery();
//			while (rs.next()) {
//				Cliente objCliente = new Cliente();
//				objCliente.setCodigo(rs.getString("clienteId"));
//				objCliente.setNombre(rs.getString("Nombres"));
//				objCliente.setApellido(rs.getString("apellido"));
//				int numDoc= Integer.parseInt(rs.getString("num_documento"));
//				objCliente.setNumDocumento(numDoc);
//				objCliente.setDireccion(rs.getString("direccion"));
//				objCliente.setEmail(rs.getString("email"));
//				objCliente.setTelefono(rs.getString("telefono"));
//				list.add(objCliente);
//			}
//		} catch (SQLException e) {
//			System.err.println(e.getMessage());
//			throw new DAOExcepcion(e.getMessage());
//		} finally {
//			this.cerrarResultSet(rs);
//			this.cerrarStatement(stmt);
//			this.cerrarConexion(con);
//		}
//		System.out.println(list.size());
//		return list;
//
//	}
	
}
