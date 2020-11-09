package com.instantvet.app.dao;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Login;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDAO  extends BaseDAO{
	
	public Login DAOobtenercredenciales(Login _login) throws DAOExcepcion{
		String query = "select doctorID,nombre + ' ' + apellido as Nombre,grupoID from Doctor where username=? and password=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, _login.getUsuario());
			stmt.setString(2, _login.getPassword());
			rs = stmt.executeQuery();
			while (rs.next()) {

				_login.setUsuarioID(rs.getShort("doctorID"));
				_login.setNombre(rs.getString("Nombre"));
				_login.setAdministrador(rs.getString("grupoID"));
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return _login;

	}

}
