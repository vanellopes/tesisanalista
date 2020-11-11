package com.instantvet.app.dao;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Personal;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonalDAO extends BaseDAO {


	public Personal insertar(Personal vo) throws DAOExcepcion {
		String query = "insert into Personal(nombre,apellido,matricula,email,telefono,username,password,grupoID) values (?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, vo.getNombre().trim());
			stmt.setString(2, vo.getApellido().trim());
			stmt.setString(3, vo.getMatricula().trim());
			stmt.setString(4, vo.getEmail().trim());
			stmt.setString(5, vo.getTelefono().trim());
			stmt.setString(6, vo.getUsuario().trim());
			stmt.setString(7, vo.getPassword().trim());
			stmt.setInt(8, vo.getGrupoID());			
			
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}
			// Obtener el ultimo id
			int id = 0;
			query = "select @@Identity";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {
				id = rs.getInt(1);
			}
			vo.setPersonalID(id);

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}

	public Personal obtener(int PersonalID) throws DAOExcepcion {
		Personal vo = new Personal();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "select PersonalID,rtrim(ltrim(nombre)) nombre,rtrim(ltrim(apellido)) apellido, rtrim(ltrim(matricula)) matricula,rtrim(ltrim(email)) email,rtrim(ltrim(telefono)) telefono, rtrim(ltrim(username)) username,rtrim(ltrim(password)) password,grupoID from Personal where PersonalID=?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, PersonalID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				vo.setPersonalID(rs.getInt(1));
				vo.setNombre(rs.getString(2).trim());
				vo.setApellido(rs.getString(3).trim());
				vo.setMatricula(rs.getString(4).trim());
				vo.setEmail(rs.getString(5).trim());
				vo.setTelefono(rs.getString(6).trim());
				vo.setUsuario(rs.getString(7).trim());
				vo.setPassword(rs.getString(8).trim());
				vo.setGrupoID(rs.getInt(9));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}
	
	public Integer validarUsuario(Personal objPersonal) throws DAOExcepcion {
		Integer contador = 0;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String query = "select count(*) contador from Personal where username=? and PersonalID<>?";
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, objPersonal.getUsuario().trim());
			stmt.setInt(2, objPersonal.getPersonalID());
			rs = stmt.executeQuery();
			if (rs.next()) {				
				contador = rs.getInt("contador");				
			}			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return contador;
	}

	public Personal actualizar(Personal vo) throws DAOExcepcion {
		String query = "update Personal set nombre=?,apellido=?,matricula=?,email=?,telefono=?,username=?,password=?,grupoID=? where PersonalID=?";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, vo.getNombre().trim());
			stmt.setString(2, vo.getApellido().trim());
			stmt.setString(3, vo.getMatricula().trim());
			stmt.setString(4, vo.getEmail().trim());
			stmt.setString(5, vo.getTelefono().trim());
			stmt.setString(6, vo.getUsuario().trim());			
			stmt.setString(7, vo.getPassword().trim());
			stmt.setInt(8, vo.getGrupoID());
			stmt.setInt(9, vo.getPersonalID());
			
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
		return vo;
	}
	
	public List<Personal> DAOlistPersonales() throws DAOExcepcion{
		String query = "select PersonalID,nombre,apellido,matricula,email,telefono,username,(case when grupoID = 1 then 'Usuario' else 'Administrador' end) grupo from Personal";
		List<Personal> lista = new ArrayList<Personal>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				
				Personal objPersonal = new Personal();
				objPersonal.setPersonalID(rs.getInt("PersonalID"));
				objPersonal.setNombre(rs.getString("nombre").trim());
				objPersonal.setApellido(rs.getString("apellido").trim());
				objPersonal.setMatricula(rs.getString("matricula").trim());
				objPersonal.setEmail(rs.getString("email").trim());
				objPersonal.setTelefono(rs.getString("telefono").trim());
				objPersonal.setUsuario(rs.getString("username").trim());
				objPersonal.setGrupo(rs.getString("grupo"));
				lista.add(objPersonal);
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

	public Integer elimnar(Personal vo) throws DAOExcepcion {
		String query = "delete from Personal where PersonalID=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int i = 0;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, vo.getPersonalID());
			
			i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo elimnar");
			}
			// Obtener el ultimo id
		/*	int id = 0;
			query = "select @@Identity";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {
				id = rs.getInt(1);
			}
			vo.setPersonalID(id);
			*/

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return i;
	}
	
}
