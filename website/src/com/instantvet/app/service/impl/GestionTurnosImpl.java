package com.instantvet.app.service.impl;

import com.instantvet.app.dao.TurnoDAO;
import com.instantvet.app.excepcion.DAOExcepcion;
import com.instantvet.app.modelo.Turno;
import com.instantvet.app.service.GestionTurnos;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class GestionTurnosImpl implements GestionTurnos {

	private static String TIPO_VETERINARIA = "V";
	private static String TIPO_PELUQUERIA = "P";
	private static String DISPONIBLE = "disponible";
	private static String SOLAPA = "Paciente tiene un turno asignado en el horario seleccionado en ";
	private static String TURNO_NO_DISPONIBLE = "No hay disponibilidad de turnos en el horario seleccionado!";

	@Override
	public void registrarTurno(Turno objTurno) throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		String disponible = validarDisponibilidad(objTurno);

		if (disponible.equals(DISPONIBLE)) {
			objTurnoDAO.registrarTurno(objTurno);
		} else {
			throw new DAOExcepcion(disponible);
		}

	}

	private String validarDisponibilidad(Turno objTurno) throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		Date fechaTurno = objTurno.getFechaTurno();
		String tipoTurno = objTurno.getTipoTurno();
		String mascota = objTurno.getPaciente();
		String disponible = DISPONIBLE;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String fechaDesde = null;
		String fechaHasta = null;
		Integer disponibilidad = null;

		if (tipoTurno.equals(TIPO_VETERINARIA)) {
			if (fechaTurno.getMinutes() < 30) {
				fechaTurno.setMinutes(00);
				fechaDesde = dateFormat.format(fechaTurno);
				fechaTurno.setMinutes(29);
				fechaHasta = dateFormat.format(fechaTurno);

			} else {
				fechaTurno.setMinutes(30);
				fechaDesde = dateFormat.format(fechaTurno);
				fechaTurno.setMinutes(59);
				fechaHasta = dateFormat.format(fechaTurno);

			}

		} else {
			fechaTurno.setMinutes(00);
			fechaDesde = dateFormat.format(fechaTurno);
			fechaTurno.setMinutes(59);
			fechaHasta = dateFormat.format(fechaTurno);
		}
		try {
			disponibilidad = objTurnoDAO.existeTurno(tipoTurno, fechaDesde, fechaHasta);
			if (tipoTurno.equals(TIPO_VETERINARIA)) {
				if (disponibilidad > 1) {
					disponible = TURNO_NO_DISPONIBLE;
				} else {
					if (!objTurnoDAO.solapaTurno(mascota, TIPO_VETERINARIA, fechaDesde, fechaHasta)) {
						disponible = disponible + " Peluqueria";
					}
				}

			} else {
				if (disponibilidad > 2) {
					disponible = TURNO_NO_DISPONIBLE;
				} else {
					if (!objTurnoDAO.solapaTurno(mascota, TIPO_VETERINARIA, fechaDesde, fechaHasta)) {
						disponible = disponible + " Veterinaria";
					}
				}

			}
		} catch (DAOExcepcion e) {
			// TODO: handle exception
		}
		return disponible;

	}

	@Override
	public void modificarTurno(Turno objTurno) throws DAOExcepcion {

		TurnoDAO objTurnoDAO = new TurnoDAO();

		objTurnoDAO.modificarTurno(objTurno);

	}

	@Override
	public void cambiarEstadoTurno(Integer codigoTurno, int estado) throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		objTurnoDAO.cambiarEstadoTurno(codigoTurno, estado);
	}

	@Override
	public List<Turno> listarTurnoxArea(String area) throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		return objTurnoDAO.listarTurnoxArea(area);
	}

	@Override
	public List<Turno> ListarTurnos() throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		return objTurnoDAO.listarTurnos();
	}

	@Override
	public Turno obtenerTurno(Integer codigoTurno) throws DAOExcepcion {
		TurnoDAO objTurnoDAO = new TurnoDAO();
		Turno oModelTurno = objTurnoDAO.obtenerTurno(codigoTurno);
		oModelTurno.convertHoraTurno();

		return oModelTurno;

	}
}
