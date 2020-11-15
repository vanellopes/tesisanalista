package com.instantvet.app.modelo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Turno {
	
	private Integer codigoTurno;
	private Date fechaTurno;
	private String cliente; 
	private String paciente;
	private String tipoTurno;
	private int estadoTurnoId;
	private String observaciones;
	private String nombreCliente;
	private String nombrePaciente;
	private String estadoTurno;
	private String telefono;
	

	public Turno() {
		super();
	}
	
	public String getFechaHora() { 
         DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");  
         String strDate = dateFormat.format(fechaTurno);  
         System.out.println("Converted String: " + strDate);  
         
         return strDate;
		
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


	public void setFechaTurno(Date fecha) {
		this.fechaTurno = fecha;
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

}
