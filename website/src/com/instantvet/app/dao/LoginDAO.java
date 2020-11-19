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
		String query = "select * from Personal where username=? and password=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int cont = existeTurno( _login.getUsuario(),  _login.getPassword());
		
		if(cont>0) {
			try {
				con = ConexionBD.obtenerConexion();
				stmt = con.prepareStatement(query);
				stmt.setString(1, _login.getUsuario());
				stmt.setString(2, _login.getPassword());
				rs = stmt.executeQuery();
				while (rs.next()) {
					_login.setUsuarioID(rs.getShort("PersonalID"));
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
			
		}else {
			throw new DAOExcepcion();
		}
		
		return _login;

	}
	
	
	public int existeTurno(String user, String pass) throws DAOExcepcion 
	{
		String query = "SELECT COUNT(*) AS CONTADOR FROM Personal where username=? and password=?";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int contadorTurno=0;
		try 
		{
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, user);
			stmt.setString(2, pass);
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


}
