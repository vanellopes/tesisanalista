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

	public int DAOexisteCliente(String codigo) throws DAOExcepcion {
		String query = "select count(*) as contador from Cliente where estado not in('X') and Persona_Id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorCliente=0;
		try {
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigo);
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

	public void DAOdeleteCliente(String codigo) throws DAOExcepcion {
		String query = "UPDATE Cliente SET estado='X' where Persona_Id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, codigo);
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo eliminar");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}

		
	}

	public List<Cliente> DAOlistarClientes() throws DAOExcepcion{
		String query = "select Persona_Id,Nombres,apellido,num_documento,email,telefono,direccion,imagen,celular from Cliente where estado not in('X') and tipo_persona='P'";
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
				objCliente.setCodigo(rs.getString("Persona_Id"));
				objCliente.setNombre(rs.getString("Nombres"));
				objCliente.setApellido(rs.getString("apellido"));
				objCliente.setNumDocumento(rs.getString("num_documento"));
				objCliente.setDireccion(rs.getString("direccion"));
				objCliente.setEmail(rs.getString("email"));
				objCliente.setImagen(rs.getString("imagen"));
				objCliente.setTelefono(rs.getString("telefono"));
				objCliente.setCelular(rs.getString("celular"));
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
		String query = "INSERT INTO Cliente(Persona_Id,Nombres,apellido,num_documento,email,direccion,telefono,celular,tipo_persona,estado) values (?,?,?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCliente.getCodigo());
			stmt.setString(2, objCliente.getNombre());
			stmt.setString(3, objCliente.getApellido());
			stmt.setString(4, objCliente.getNumDocumento());
			stmt.setString(5, objCliente.getEmail());
			stmt.setString(6, objCliente.getDireccion());
			stmt.setString(7, objCliente.getTelefono());
			stmt.setString(8, objCliente.getCelular());
			stmt.setString(9,"P");
			stmt.setString(10,"A");
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
		String query = "update Cliente set Nombres=?,apellido=?,num_documento=?,email=?,direccion=?,telefono=?,celular=? where Persona_Id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objCliente.getNombre());
			stmt.setString(2, objCliente.getApellido());
			stmt.setString(3, objCliente.getNumDocumento());
			stmt.setString(4, objCliente.getEmail());
			stmt.setString(5, objCliente.getDireccion());
			stmt.setString(6, objCliente.getTelefono());
			stmt.setString(7, objCliente.getCelular());
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

	public Cliente DAOobtenerCliente(String codigo) throws DAOExcepcion{
		String query = "select Persona_Id,Nombres,apellido,num_documento,email,telefono,direccion,imagen,celular from Cliente where estado not in('X') and Persona_Id=?";
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
				objCliente.setCodigo(rs.getString("Persona_Id"));
				objCliente.setNombre(rs.getString("Nombres"));
				objCliente.setApellido(rs.getString("apellido"));
				objCliente.setNumDocumento(rs.getString("num_documento"));
				objCliente.setDireccion(rs.getString("direccion"));
				objCliente.setEmail(rs.getString("email"));
				objCliente.setImagen(rs.getString("imagen"));
				objCliente.setTelefono(rs.getString("telefono"));
				objCliente.setCelular(rs.getString("celular"));
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

	public String DAOgetlastcodigo() throws DAOExcepcion{
		String query = "SELECT ISNULL((SELECT MAX(Persona_Id) FROM CLIENTE),'0') AS CODIGO";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String lastcodigo="0";
		try {
			
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				lastcodigo=rs.getString("CODIGO");
			}
			
			lastcodigo=Integer.toString(Integer.parseInt(lastcodigo) +1) ;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return lastcodigo;
	}

	
	public Boolean DAOchangeClienteToCliente(String codigo) throws DAOExcepcion
	{
		Boolean answer = false;
		
		String query = "UPDATE Cliente SET tipo_persona = 'C' WHERE Persona_Id = ?";
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1,Integer.parseInt(codigo));
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo Actualizar");
			}
			else
			{
				answer = true;
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return answer;
	}
	
	public List<Cliente> DAOlistClientes() throws DAOExcepcion
	{
		String query = "SELECT Persona_Id,Nombres,apellido,num_documento,email,telefono,direccion,imagen,celular FROM Cliente WHERE estado <> 'X' AND tipo_persona='C'";
		List<Cliente> list = new ArrayList<Cliente>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Cliente objCliente = new Cliente();
				objCliente.setCodigo(rs.getString("Persona_Id"));
				objCliente.setNombre(rs.getString("Nombres"));
				objCliente.setApellido(rs.getString("apellido"));
				objCliente.setNumDocumento(rs.getString("num_documento"));
				objCliente.setDireccion(rs.getString("direccion"));
				objCliente.setEmail(rs.getString("email"));
				objCliente.setImagen(rs.getString("imagen"));
				objCliente.setTelefono(rs.getString("telefono"));
				objCliente.setCelular(rs.getString("celular"));
				list.add(objCliente);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		System.out.println(list.size());
		return list;

	}
	
	public void UpdateFoto(String codigo,String foto) throws DAOExcepcion{
		String query = "update Cliente set imagen=? where Persona_Id=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1,foto);
			stmt.setString(2,codigo);
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
	
}
