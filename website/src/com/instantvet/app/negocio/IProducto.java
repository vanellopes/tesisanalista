package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Producto;

import java.util.List;

public interface IProducto {

	public abstract List<Producto> listarproductos() throws DAOExcepcion;

}