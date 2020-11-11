package com.instantvet.app.modelo;

public class Turno {
	
	String codigoTurno;
	String codigoPersona; 
	String codigoPaciente;
	String codigoPersonal;
	String tipoTurno;
	String descripcionTurno;
	String nombreVacuna;
	String fechaTurno;
	
	String telefono;
    String direccion;
    String nombresPersona;
    String apellido;
    
    String especie;
    String nombrePaciente;
    
    String nombrePersonal;
    String PersonalApellido;
    String PersonalMatricula;
    
	public Turno(String codigoTurno, String codigoPersona, String codigoPaciente,
			String codigoPersonal, String tipoTurno, String descripcionTurno,
			String nombreVacuna, String fechaTurno) {
		super();
		this.codigoTurno = codigoTurno;
		this.codigoPersona = codigoPersona;
		this.codigoPaciente = codigoPaciente;
		this.codigoPersonal = codigoPersonal;
		this.tipoTurno = tipoTurno;
		this.descripcionTurno = descripcionTurno;
		this.nombreVacuna = nombreVacuna;
		this.fechaTurno = fechaTurno;
	}

	public Turno() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getCodigoTurno() {
		return codigoTurno;
	}

	public void setCodigoTurno(String codigoTurno) {
		this.codigoTurno = codigoTurno;
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

	public String getCodigoPersonal() {
		return codigoPersonal;
	}

	public void setCodigoPersonal(String codigoPersonal) {
		this.codigoPersonal = codigoPersonal;
	}

	public String getTipoTurno() {
		return tipoTurno;
	}

	public void setTipoTurno(String tipoTurno) {
		this.tipoTurno = tipoTurno;
	}

	public String getDescripcionTurno() {
		return descripcionTurno;
	}

	public void setDescripcionTurno(String descripcionTurno) {
		this.descripcionTurno = descripcionTurno;
	}

	public String getNombreVacuna() {
		return nombreVacuna;
	}

	public void setNombreVacuna(String nombreVacuna) {
		this.nombreVacuna = nombreVacuna;
	}

	public String getFechaTurno() {
		return fechaTurno;
	}

	public void setFechaTurno(String fechaTurno) {
		this.fechaTurno = fechaTurno;
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

	public String getNombrePersonal() {
		return nombrePersonal;
	}

	public void setNombrePersonal(String nombrePersonal) {
		this.nombrePersonal = nombrePersonal;
	}

	public String getPersonalApellido() {
		return PersonalApellido;
	}

	public void setPersonalApellido(String PersonalApellido) {
		this.PersonalApellido = PersonalApellido;
	}

	public String getPersonalMatricula() {
		return PersonalMatricula;
	}

	public void setPersonalMatricula(String PersonalMatricula) {
		this.PersonalMatricula = PersonalMatricula;
	}
    
}
