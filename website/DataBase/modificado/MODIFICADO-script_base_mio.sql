DROP DATABASE IF EXISTS instantvet;
CREATE DATABASE IF NOT EXISTS instantvet;

ALTER DATABASE instantvet
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
USE instantvet;

CREATE TABLE IF NOT EXISTS Ubicacion(
	 Ubicacion_Id  INT(4) NOT NULL,
	 Descripcion  varchar(50) NULL
);

INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (1, 'página principal');
INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (2, 'páginas del cliente');
INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (3, 'páginas del dueño');

CREATE TABLE IF NOT EXISTS Tamano(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Tamano PRIMARY KEY CLUSTERED 
(
	Id ASC
)
); 

INSERT Tamano (Id, Nombre) VALUES (1, 'Pequeño');
INSERT Tamano (Id, Nombre) VALUES (2, 'Mediano');
INSERT Tamano (Id, Nombre) VALUES (3, 'Grande');

CREATE TABLE IF NOT EXISTS Paciente(
	Paciente_Id INT(4) NOT NULL AUTO_INCREMENT,
    nombre varchar(100) NULL,
	Dueno_Id int NOT NULL,
	Especie_Id int NOT NULL,
	Raza_Id int NOT NULL,
	Genero_Id int NOT NULL,
	TipoSangre_Id int NOT NULL,
	Esterilizado char(1) NOT NULL,
	Tamano_Id int NOT NULL,
	Actividad_Id int NOT NULL,
	Peso numeric(5, 2) NOT NULL,
	FechaNacimiento date NOT NULL,
	NotasMedicas varchar(1000) NULL,
	CondicionesEspeciales varchar(1000) NULL,
 CONSTRAINT PK_Paciente PRIMARY KEY CLUSTERED 
(
	Paciente_Id ASC
)
);

INSERT Paciente (Paciente_Id, nombre, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (1, 'terry',5, 2, 1, 2, 1, '1', 1, 2, (15.20 ), ('2010-05-17 22:52:21'), 'No hay notas', 'No hay condicones especiales');
INSERT Paciente (Paciente_Id, nombre, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (3, 'sam',14, 4, 4, 3, 1, '0', 1, 1, (30.00 ), ('2010-05-17 22:52:21'), 'eeeeeeeeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeeee');
INSERT Paciente (Paciente_Id, nombre, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (5, 'tom',14, 1, 2, 1, 1, '0', 2, 1, (80.00 ), ('2010-05-17 22:52:21'), 'Nota', 'condiciones');


CREATE TABLE IF NOT EXISTS Especie(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Especie PRIMARY KEY CLUSTERED 
(
	Id ASC
));

INSERT Especie (Id, Nombre) VALUES (1, 'Mamifero');
INSERT Especie (Id, Nombre) VALUES (2, 'Ave');
INSERT Especie (Id, Nombre) VALUES (3, 'Batracio');
INSERT Especie (Id, Nombre) VALUES (4, 'Reptil');

CREATE TABLE IF NOT EXISTS Doctor(
	doctorID INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(100) NULL,
	apellido varchar(100) NULL,
	matricula varchar(100) NULL,
	email varchar(50) NULL,
	telefono varchar(50) NULL,
	username nchar(100) NULL,
	password varchar(200) NOT NULL,
	grupoID int NOT NULL
);

INSERT Doctor (doctorID, nombre, apellido, matricula, email, telefono, username, password, grupoID) VALUES (1, 'Samuel', 'Salazar', 'mat123456', 'samuel.salazar@gmail.com', '1234567', 'sam', '123456', 2);
INSERT Doctor (doctorID, nombre, apellido, matricula, email, telefono, username, password, grupoID) VALUES (7, 'Rocio', 'Miranda', 'mat456789', 'rocio@gmail.com', '', 'rociom', '123456', 1);

CREATE TABLE IF NOT EXISTS Cliente(
	Persona_Id int NOT NULL,
	Nombres varchar(60) NOT NULL,
	apellido varchar(50) NOT NULL,
	num_documento varchar(50) NULL,
	email varchar(60) NULL,
	telefono varchar(15) NULL,
	tipo_persona char(1) NOT NULL,
	direccion varchar(200) NULL,
	imagen varchar(200) NULL,
	celular varchar(15) NULL,
	estado char(1) NOT NULL,
 CONSTRAINT PK_Persona PRIMARY KEY CLUSTERED 
(
	Persona_Id ASC
));



INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (1, 'jose', 'zamudio', '123', 'libra5100@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (2, 'jose3', 'zamudio3', '1235', 'libra2033@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (3, 'jose3', 'zamudio3', '12356', 'libra2033@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (4, 'Melissa', 'Almora B', '25896', '', '', 'C', '', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (5, 'Cinthya', 'Ferreyra', '258963', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (6, 'Angel', 'Ruiz', 'm', '857485', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (7, 'Camila', 'Rios', '854714', 'camila@gmail.com', '', 'C', 'Lima', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (8, 'Priscilla ', 'Salome', '456789', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (9, 'Jhosep', 'laines ', '5648791', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (10, 'Nilda', 'Panduro', '52841', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (11, 'James', 'Villacorta', '2252556', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (12, 'Leonidas', 'Piza', '123365', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (13, 'Lucia', 'Luja', '85236 ', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (14, 'Jessica', 'Ferbandez ', '58485 ', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (15, 'Rosa ', 'Valderrama', '369695', '', '', 'C', '', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (16, 'Luis', 'Vargas', '5554448', '', '123455555', 'C', 'Lima', NULL, '123456789', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (17, 'Erika', 'Peve', '55252255', '', '77821122', 'C', '', NULL, '12354566', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (18, 'eduardo', 'zamudio', '626655', 'libra5100@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (19, 'jose', 'manue', '5588962', '', '1234567', 'P', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (20, 'fgdg', 'fgdfg', '32562559', '', '5646', 'P', 'fdgdg ', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (21, 'rtet', 'ertert', '528564', '', '', 'P', 'fgdgfdgdfg', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido, num_documento, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (22, 'Luis', 'Salazar', '632595', 'luis.salazar@gmail.com', '123456', 'C', 'Surco', NULL, '12354566', 'A');


CREATE TABLE IF NOT EXISTS turno(
	turno_id int NOT NULL,
	persona_id int NOT NULL,
	paciente_id int NOT NULL,
	doctor_id int NOT NULL,
	tipo_turno char(1) NOT NULL,
	descripcion_cita varchar(300) NULL,
	nombre_vacuna varchar(100) NULL,
	fecha_turno varchar(10) NOT NULL,
 CONSTRAINT PK_Turno PRIMARY KEY CLUSTERED 
(
	turno_id ASC
));

INSERT turno (turno_id, persona_id, paciente_id, doctor_id, tipo_turno, descripcion_cita, nombre_vacuna, fecha_turno) VALUES (1, 14, 3, 1, 'P', 'dsfdsfdsf', 'alergia', '02/08/2012');
INSERT turno (turno_id, persona_id, paciente_id, doctor_id, tipo_turno, descripcion_cita, nombre_vacuna, fecha_turno) VALUES (2, 14, 3, 1, 'V', 'gfdg', 'alergia', '08/08/2012');
INSERT turno (turno_id, persona_id, paciente_id, doctor_id, tipo_turno, descripcion_cita, nombre_vacuna, fecha_turno) VALUES (3, 14, 3, 1, 'P', 'rfdfgfdgfdg', 'alergia', '01/08/2012');
INSERT turno (turno_id, persona_id, paciente_id, doctor_id, tipo_turno, descripcion_cita, nombre_vacuna, fecha_turno) VALUES (4, 14, 3, 1, 'V', 'Vacunacio', 'Distemper', '16/08/2012');


CREATE TABLE IF NOT EXISTS Actividad(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Actividad PRIMARY KEY CLUSTERED 
(
	Id ASC
));

INSERT Actividad (Id, Nombre) VALUES (1, 'Baja');
INSERT Actividad (Id, Nombre) VALUES (2, 'Media');
INSERT Actividad (Id, Nombre) VALUES (3, 'Alta');

CREATE TABLE IF NOT EXISTS Genero(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Genero PRIMARY KEY CLUSTERED 
(
	Id ASC
));


INSERT Genero (Id, Nombre) VALUES (1, 'Canino');
INSERT Genero (Id, Nombre) VALUES (2, 'Felino');
INSERT Genero (Id, Nombre) VALUES (3, 'Bovino');


CREATE TABLE IF NOT EXISTS Vacunas(
	nombre_vacuna varchar(100) NOT NULL,
 CONSTRAINT PK_Vacunas PRIMARY KEY CLUSTERED 
(
	nombre_vacuna ASC
));

INSERT Vacunas (nombre_vacuna) VALUES ('alergia');
INSERT Vacunas (nombre_vacuna) VALUES ('Distemper');
INSERT Vacunas (nombre_vacuna) VALUES ('Parvovirus');
INSERT Vacunas (nombre_vacuna) VALUES ('Rabia');
INSERT Vacunas (nombre_vacuna) VALUES ('sarampiom');

