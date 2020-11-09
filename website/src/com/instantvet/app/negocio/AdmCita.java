package com.instantvet.app.negocio;

import com.instantvet.app.dao.TurnoDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class AdmCita implements ICita  {

	@Override
	public void GrabarModificarCita(String codigoCita,
									String codigoPersona, 
									String codigoPaciente,
									String codigoDoctor,
									String tipoCita,
									String descripcionCita,
									String nombreVacuna,
									String fechaCita) throws DAOExcepcion
	{
		
		Turno objCita=new Turno(codigoCita,
				              codigoPersona,
				              codigoPaciente,
				              codigoDoctor,
				              tipoCita,
				              descripcionCita,
				              nombreVacuna,
				              fechaCita);
		TurnoDAO objCitaDAO=new TurnoDAO();
		if(objCitaDAO.existeTurno(codigoCita) == 0)
		{
			String nuevoCodigoCita=(objCitaDAO.DAOobtenerUltimoCodigo());
			objCita.setCodigoCita(nuevoCodigoCita);
			objCitaDAO.DAOgrabarCita(objCita);
		}
		if(objCitaDAO.existeTurno(codigoCita) == 1)
		{
			objCitaDAO.DAOmodificarCita(objCita);
		}
		
	}
	
	@Override
	public void InsertarVacuna(String nombreVacuna) throws DAOExcepcion
	{	
		TurnoDAO objCitaDAO = new TurnoDAO();
		objCitaDAO.DAOinsertarVacuna(nombreVacuna);	
	}
	
    @Override
	public void GrabarModificarCita(Turno objCita) throws DAOExcepcion
	{	
		TurnoDAO objCitaDAO = new TurnoDAO();
		
		if(objCitaDAO.existeTurno(objCita.getCodigoCita())==0)
		{
			String newcodigo=(objCitaDAO.DAOobtenerUltimoCodigo());
			objCita.setCodigoCita(newcodigo);
			objCitaDAO.DAOgrabarCita(objCita);
		}
		if(objCitaDAO.existeTurno(objCita.getCodigoCita())==1)
		{
			objCitaDAO.DAOmodificarCita(objCita);
		}
		
	}

	@Override
	public Turno ObtenerCita(String codigoCita) throws DAOExcepcion  
	{
		Turno objCita=null;
		TurnoDAO objCitaDAO=new TurnoDAO();
		if(objCitaDAO.existeTurno(codigoCita) == 1)
		{
			objCita=(Turno)objCitaDAO.DAOobtenerCita(codigoCita);
		}
		return objCita;
	}

	@Override
	public void BorrarCita(String codigoCita) throws DAOExcepcion
	{
		TurnoDAO objCitaDAO=new TurnoDAO();
		int contadorCita= objCitaDAO.existeTurno(codigoCita);
		
		if(contadorCita==1)
		{
			objCitaDAO.borrarTurno(codigoCita);
		}
		
	}

	@Override
	public List<Turno> ListarCitaVacunas() throws DAOExcepcion
	{
		TurnoDAO objCitaDAO=new TurnoDAO();
		return objCitaDAO.DAOlistarCitaVacunas();
	}

	@Override
	public List<Turno> ListarCitaTareas() throws DAOExcepcion
	{
		TurnoDAO objCitaDAO=new TurnoDAO();
		return objCitaDAO.DAOlistarCitaTareas();
	}
}
