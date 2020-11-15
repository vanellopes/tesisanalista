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
			
			objTurnoDAO.registrarTurno(objTurno);
		//}
			
	}
	
	@Override
	public void modificarTurno(Turno objTurno) throws DAOExcepcion
	{
			
		TurnoDAO objTurnoDAO=new TurnoDAO();
		
			objTurnoDAO.modificarTurno(objTurno);
		
	}
	
	@Override
	public void cambiarEstadoTurno(Integer codigoTurno, int estado) throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		int contadorTurno= objTurnoDAO.existeTurno(codigoTurno);
		
		if(contadorTurno==1)
		{
			objTurnoDAO.cambiarEstadoTurno(codigoTurno, estado);
		}
		
	}

	@Override
	public List<Turno> ListarTurnoVeterinaria() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.listarTurnoVeterinaria();
	}

	@Override
	public List<Turno> ListarTurnoPeluqueria() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.listarTurnos();
	}
	
	@Override
	public List<Turno> ListarTurnos() throws DAOExcepcion
	{
		TurnoDAO objTurnoDAO=new TurnoDAO();
		return objTurnoDAO.listarTurnos();
	}

	@Override
	public Turno obtenerTurno(Integer codigoTurno) throws DAOExcepcion {
		TurnoDAO objTurnoDAO=new TurnoDAO();
		
		
		return objTurnoDAO.obtenerTurno(codigoTurno);
		
	}
}
