package com.instantvet.app.negocio.impl;

import com.instantvet.app.dao.TurnoDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.negocio.GestionTurnos;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class GestionTurnosImpl implements GestionTurnos  {

	@Override
	public void GrabarModificarTurno(String codigoTurno,
									String codigoPersona, 
									String codigoPaciente,
									String codigoPersonal,
									String tipoTurno,
									String descripcionTurno,
									String nombreVacuna,
									String fechaTurno) throws DAOExcepcion
	{
		
		Turno objTurno=new Turno(codigoTurno,
				              codigoPersona,
				              codigoPaciente,
				              codigoPersonal,
				              tipoTurno,
				              descripcionTurno,
				              nombreVacuna,
				              fechaTurno);
		TurnoDAO objTurnoDAO=new TurnoDAO();
		if(objTurnoDAO.existeTurno(codigoTurno) == 0)
		{
			String nuevoCodigoTurno=(objTurnoDAO.DAOobtenerUltimoCodigo());
			objTurno.setCodigoTurno(nuevoCodigoTurno);
			objTurnoDAO.DAOgrabarTurno(objTurno);
		}
		if(objTurnoDAO.existeTurno(codigoTurno) == 1)
		{
			objTurnoDAO.DAOmodificarTurno(objTurno);
		}
		
	}
	
	@Override
	public void InsertarVacuna(String nombreVacuna) throws DAOExcepcion
	{	
		TurnoDAO objTurnoDAO = new TurnoDAO();
		objTurnoDAO.DAOinsertarVacuna(nombreVacuna);	
	}
	
    @Override
	public void GrabarModificarTurno(Turno objTurno) throws DAOExcepcion
	{	
		TurnoDAO objTurnoDAO = new TurnoDAO();
		
		if(objTurnoDAO.existeTurno(objTurno.getCodigoTurno())==0)
		{
			String newcodigo=(objTurnoDAO.DAOobtenerUltimoCodigo());
			objTurno.setCodigoTurno(newcodigo);
			objTurnoDAO.DAOgrabarTurno(objTurno);
		}
		if(objTurnoDAO.existeTurno(objTurno.getCodigoTurno())==1)
		{
			objTurnoDAO.DAOmodificarTurno(objTurno);
		}
		
	}

	@Override
	public Turno ObtenerTurno(String codigoTurno) throws DAOExcepcion  
	{
		Turno objTurno=null;
		TurnoDAO objTurnoDAO=new TurnoDAO();
		if(objTurnoDAO.existeTurno(codigoTurno) == 1)
		{
			objTurno=(Turno)objTurnoDAO.DAOobtenerTurno(codigoTurno);
		}
		return objTurno;
	}

	@Override
	public void BorrarTurno(String codigoTurno) throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		int contadorTurno= objTurnoDAO.existeTurno(codigoTurno);
		
		if(contadorTurno==1)
		{
			objTurnoDAO.borrarTurno(codigoTurno);
		}
		
	}

	@Override
	public List<Turno> ListarTurnoVacunas() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.DAOlistarTurnoVacunas();
	}

	@Override
	public List<Turno> ListarTurnoTareas() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.DAOlistarTurnoTareas();
	}
}
