package com.instantvet.app.modelo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Paciente {

	int codigoPaciente;
	int codigoCliente;
	String nombreCliente;
	String especie;
	Integer especieId;
	String nombre;
	String genero;
	String esterilizado;
	String peso;
	Date fechaNacimiento;
	String observaciones;
	Integer estado;

	public Paciente() {
		super();
	}

	public Paciente(int codigoPaciente, int codigoCliente, String especie, String nombre, String genero,
			String esterilizado, String peso, Date fechaNacimiento, String observaciones) {
		super();
		this.codigoPaciente = codigoPaciente;
		this.codigoCliente = codigoCliente;
		this.especie = especie;
		this.nombre = nombre;
		this.genero = genero;
		this.esterilizado = esterilizado;
		this.peso = peso;
		this.fechaNacimiento = fechaNacimiento;
		this.observaciones = observaciones;
	}

	public void convertFechaTurno(String fechaHora) {
		Date date = null;
		try {
			DateFormat fechaHoraFormat = new SimpleDateFormat("yyyy-MM-dd");
			date = fechaHoraFormat.parse(fechaHora);
			System.out.println(date);

		} catch (ParseException e) {
			System.out.println("Error: " + e.getMessage());
		}

		this.fechaNacimiento = date;
	}

	public int getCodigoPaciente() {
		return codigoPaciente;
	}

	public void setCodigoPaciente(int codigoPaciente) {
		this.codigoPaciente = codigoPaciente;
	}

	public int getCodigoCliente() {
		return codigoCliente;
	}

	public void setCodigoCliente(int codigoCliente) {
		this.codigoCliente = codigoCliente;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public Integer getEspecieId() {
		return especieId;
	}

	public void setEspecieId(Integer especieId) {
		this.especieId = especieId;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getEsterilizado() {
		return esterilizado;
	}

	public void setEsterilizado(String esterilizado) {
		this.esterilizado = esterilizado;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
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

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

}