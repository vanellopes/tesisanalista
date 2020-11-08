package com.instantvet.app.negocio;

import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Factura;
import com.instantvet.app.modelo.FacturaCliente;
import com.instantvet.app.modelo.FacturaDetalle;
import com.instantvet.app.modelo.Paciente;

import java.util.ArrayList;
import java.util.List;

public interface IFactura {

	public abstract void GrabarFactura(Factura objFactura) throws DAOExcepcion;

	public abstract void ElimnarFactura(int codFactura) throws DAOExcepcion;

	public abstract List<FacturaCliente> ListarFacturas() throws DAOExcepcion;
	public abstract void GrabarFacturaDetalle(FacturaDetalle objFacturaDetalle) throws DAOExcepcion;
	public abstract Factura VerFactura(int codFactura) throws DAOExcepcion;

	public abstract com.instantvet.app.modelo.Factura RecargarFactura(
			com.instantvet.app.modelo.Factura objFactura,
			FacturaDetalle objFacturaDetalle) throws DAOExcepcion;

	public abstract int GetCodigoFactura() throws DAOExcepcion;

	public abstract List<Paciente> listarpacientesxcliente(int codcliente) throws DAOExcepcion;

	public abstract ArrayList<FacturaDetalle> verdetallework(int codfactura) throws DAOExcepcion;

	public abstract Factura iniciarfactura() throws DAOExcepcion;

	public abstract void DeleteFacturaDetalle(FacturaDetalle objFacturaDetalle)
			throws DAOExcepcion;

	public abstract Factura RecargarFactura2(Factura objFactura) throws DAOExcepcion;

}