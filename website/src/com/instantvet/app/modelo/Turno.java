package com.instantvet.app.modelo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class Turno {

	private Integer codigoTurno;
	private Date fechaTurno;
	private Date horaTurno;
	private String cliente;
	private String paciente;
	private String tipoTurno;
	private int estadoTurnoId;
	private String observaciones;
	private String nombreCliente;
	private String nombrePaciente;
	private String estadoTurno;
	private String telefono;
	private String hora;

	public Turno() {
		super();
	}

	public void getFechaHora() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
		String dateInString = "2014-10-05T15:23:01Z";

		try {

			Date date = formatter.parse(dateInString.replaceAll("Z$", "+0000"));
			System.out.println(date);

			System.out.println("time zone : " + TimeZone.getDefault().getID());
			System.out.println(formatter.format(date));

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getHoraTurno() {
		return horaTurno;
	}

	public void setHoraTurno(Date horaTurno) {
		this.horaTurno = horaTurno;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public Integer getCodigoTurno() {
		return codigoTurno;
	}

	public void setCodigoTurno(Integer codigoTurno) {
		this.codigoTurno = codigoTurno;
	}

	public Date getFechaTurno() {
		return fechaTurno;
	}

	public void setFechaTurno(Date fechaTurno) {
		this.fechaTurno = fechaTurno;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getPaciente() {
		return paciente;
	}

	public void setPaciente(String paciente) {
		this.paciente = paciente;
	}

	public String getTipoTurno() {
		return tipoTurno;
	}

	public void setTipoTurno(String tipoTurno) {
		this.tipoTurno = tipoTurno;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getNombrePaciente() {
		return nombrePaciente;
	}

	public void setNombrePaciente(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public int getEstadoTurnoId() {
		return estadoTurnoId;
	}

	public void setEstadoTurnoId(int estadoTurnoId) {
		this.estadoTurnoId = estadoTurnoId;
	}

	public String getEstadoTurno() {
		return estadoTurno;
	}

	public void setEstadoTurno(String estadoTurno) {
		this.estadoTurno = estadoTurno;
	}

	public void convertFechaTurno(String fechaHora) {
		Date date = null;
		try {
			DateFormat fechaHoraFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			date = fechaHoraFormat.parse(fechaHora);
			System.out.println(date);

		} catch (ParseException e) {
			System.out.println("Error: " + e.getMessage());
		}

		this.fechaTurno = date;
	}

	public void convertHoraTurno() {

		SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm");
		String hora = localDateFormat.format(this.horaTurno);
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
//		String hora = time.format(formatter);
		System.out.println(hora);

		this.hora = hora;
	}

}
