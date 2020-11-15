package com.instantvet.app.modelo;

public class Cliente {

	String codigo;
	String nombre; 
	String apellido;
    Integer numDocumento;
	String email; 
	String direccion;
	String telefono;
	String estado;
	
	public Cliente() {
		super();
	}
	
	public Cliente(String codigo, String nombre, String apellido, Integer numDocumento, String email, String direccion,
			String telefono, String estado) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.apellido = apellido;
		this.numDocumento = numDocumento;
		this.email = email;
		this.direccion = direccion;
		this.telefono = telefono;
		this.estado = estado;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public Integer getNumDocumento() {
		return numDocumento;
	}


	public void setNumDocumento(Integer numDocumento) {
		this.numDocumento = numDocumento;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}
	
}
