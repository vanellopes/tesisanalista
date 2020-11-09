package com.instantvet.app.modelo;

public class Turno {
	
	String codigoCita;
	String codigoPersona; 
	String codigoPaciente;
	String codigoDoctor;
	String tipoCita;
	String descripcionCita;
	String nombreVacuna;
	String fechaCita;
	
	String telefono;
    String direccion;
    String nombresPersona;
    String apellido;
    
    String especie;
    String nombrePaciente;
    
    String nombreDoctor;
    String doctorApellido;
    String doctorMatricula;
    
	public Turno(String codigoCita, String codigoPersona, String codigoPaciente,
			String codigoDoctor, String tipoCita, String descripcionCita,
			String nombreVacuna, String fechaCita) {
		super();
		this.codigoCita = codigoCita;
		this.codigoPersona = codigoPersona;
		this.codigoPaciente = codigoPaciente;
		this.codigoDoctor = codigoDoctor;
		this.tipoCita = tipoCita;
		this.descripcionCita = descripcionCita;
		this.nombreVacuna = nombreVacuna;
		this.fechaCita = fechaCita;
	}

	public Turno() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getCodigoCita() {
		return codigoCita;
	}

	public void setCodigoCita(String codigoCita) {
		this.codigoCita = codigoCita;
	}

	public String getCodigoPersona() {
		return codigoPersona;
	}

	public void setCodigoPersona(String codigoPersona) {
		this.codigoPersona = codigoPersona;
	}

	public String getCodigoPaciente() {
		return codigoPaciente;
	}

	public void setCodigoPaciente(String codigoPaciente) {
		this.codigoPaciente = codigoPaciente;
	}

	public String getCodigoDoctor() {
		return codigoDoctor;
	}

	public void setCodigoDoctor(String codigoDoctor) {
		this.codigoDoctor = codigoDoctor;
	}

	public String getTipoCita() {
		return tipoCita;
	}

	public void setTipoCita(String tipoCita) {
		this.tipoCita = tipoCita;
	}

	public String getDescripcionCita() {
		return descripcionCita;
	}

	public void setDescripcionCita(String descripcionCita) {
		this.descripcionCita = descripcionCita;
	}

	public String getNombreVacuna() {
		return nombreVacuna;
	}

	public void setNombreVacuna(String nombreVacuna) {
		this.nombreVacuna = nombreVacuna;
	}

	public String getFechaCita() {
		return fechaCita;
	}

	public void setFechaCita(String fechaCita) {
		this.fechaCita = fechaCita;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNombresPersona() {
		return nombresPersona;
	}

	public void setNombresPersona(String nombresPersona) {
		this.nombresPersona = nombresPersona;
	}


	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public String getNombrePaciente() {
		return nombrePaciente;
	}

	public void setNombrePaciente(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
	}

	public String getNombreDoctor() {
		return nombreDoctor;
	}

	public void setNombreDoctor(String nombreDoctor) {
		this.nombreDoctor = nombreDoctor;
	}

	public String getDoctorApellido() {
		return doctorApellido;
	}

	public void setDoctorApellido(String doctorApellido) {
		this.doctorApellido = doctorApellido;
	}

	public String getDoctorMatricula() {
		return doctorMatricula;
	}

	public void setDoctorMatricula(String doctorMatricula) {
		this.doctorMatricula = doctorMatricula;
	}
    
}
