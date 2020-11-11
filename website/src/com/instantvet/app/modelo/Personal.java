package com.instantvet.app.modelo;

public class Personal {
	
	public Personal() {
		super();
	}
	
	public Personal(Integer PersonalID, String nombre, String apellido,
			String materno, String email, String telefono, String usuario, Integer grupoID, String password) {
		super();
		this.PersonalID = PersonalID;
		this.nombre = nombre;
		this.apellido = apellido;
		this.matricula = materno;
		this.email = email;
		this.telefono = telefono;
		this.usuario = usuario;
		this.grupoID = grupoID;
		this.password = password;
	}



	private Integer PersonalID;
	private String nombre;
	private String apellido;
	private String matricula;
	private String email;
	private String telefono;
	private String usuario;
	private Integer grupoID;
	private String password;
	private String grupo;
	private String errMensaje;
	
	public String getErrMensaje() {
		return errMensaje;
	}

	public void setErrMensaje(String errMensaje) {
		this.errMensaje = errMensaje;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getPersonalID() {
		return PersonalID;
	}

	public void setPersonalID(Integer PersonalID) {
		this.PersonalID = PersonalID;
	}

	public Integer getGrupoID() {
		return grupoID;
	}

	public void setGrupoID(Integer grupoID) {
		this.grupoID = grupoID;
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

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	

}
