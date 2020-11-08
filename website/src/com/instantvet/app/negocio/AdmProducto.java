package com.instantvet.app.negocio;

import com.instantvet.app.dao.ProductoDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Producto;

import java.util.List;

import org.springframework.stereotype.Service;;

@Service 
public class AdmProducto implements IProducto {
	
	/* (non-Javadoc)
	 * @see com.instantvet.app.negocio.IProducto#listarproductos()
	 */
	@Override
	public List<Producto> listarproductos() throws DAOExcepcion{
		ProductoDAO objProdcutoDAO=new ProductoDAO();
		return objProdcutoDAO.DAOlistarproductos();
	}

}
