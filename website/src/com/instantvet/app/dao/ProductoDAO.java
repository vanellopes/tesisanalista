package com.instantvet.app.dao;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Producto;
import com.instantvet.app.util.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO extends BaseDAO {

	
	public List<Producto> DAOlistarproductos() throws DAOExcepcion{
		String query = "select idproducto,nombreproducto,precio from Producto";
		List<Producto> lista = new ArrayList<Producto>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Producto objProducto = new Producto();
				objProducto.setIdproducto(rs.getInt("idproducto"));
				objProducto.setNombreproducto(rs.getString("nombreproducto"));
				objProducto.setPrecio(rs.getDouble("precio"));
				lista.add(objProducto);
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
}
