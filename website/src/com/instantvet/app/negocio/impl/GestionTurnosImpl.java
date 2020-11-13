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
	public void registrarTurno(Turno objTurno) throws DAOExcepcion
	{	
		TurnoDAO objTurnoDAO = new TurnoDAO();
		
		//if(objTurnoDAO.existeTurno(objTurno.getCodigoTurno())==0) if (objTurno.getTipoTurno() == "V")
		//{
			
			objTurnoDAO.DAOgrabarTurno(objTurno);
		//}
			
	}
	
	@Override
	public void modificarTurno(Turno objTurno) throws DAOExcepcion
	{
			
		TurnoDAO objTurnoDAO=new TurnoDAO();
		
			objTurnoDAO.DAOmodificarTurno(objTurno);
		
	}

	@Override
	public Turno ObtenerTurno(Integer codigoTurno) throws DAOExcepcion  
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
	public void cancelarTurno(Integer codigoTurno) throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		int contadorTurno= objTurnoDAO.existeTurno(codigoTurno);
		
		if(contadorTurno==1)
		{
			objTurnoDAO.cancelarTurno(codigoTurno);
		}
		
	}

	@Override
	public List<Turno> ListarTurnoVeterinaria() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.DAOlistarTurnoVacunas();
	}

	@Override
	public List<Turno> ListarTurnoPeluqueria() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.DAOlistarTurnoTareas();
	}
	
	@Override
	public List<Turno> ListarTurnos() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.DAOlistarTurnoTareas();
	}

	@Override
	public void confirmarTurno(Turno objTurno) throws DAOExcepcion {
		// TODO Auto-generated method stub
		
	}
}
