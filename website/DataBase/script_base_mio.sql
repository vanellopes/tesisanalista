DROP DATABASE IF EXISTS veterinaria;
CREATE DATABASE IF NOT EXISTS veterinaria;

ALTER DATABASE veterinaria
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
USE Veterinaria;

CREATE TABLE IF NOT EXISTS Ubicacion(
	 Ubicacion_Id  INT(4) NOT NULL,
	 Descripcion  varchar(50) NULL
);

INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (1, 'página principal');
INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (2, 'páginas del cliente');
INSERT Ubicacion (Ubicacion_Id, Descripcion) VALUES (3, 'páginas del dueño');

CREATE TABLE IF NOT EXISTS TipoSangre(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_TipoSangre PRIMARY KEY CLUSTERED 
(
	Id ASC
));

INSERT TipoSangre (Id, Nombre) VALUES (1, 'ORH+');
INSERT TipoSangre (Id, Nombre) VALUES (2, 'ORH-');
INSERT TipoSangre (Id, Nombre) VALUES (3, 'AB+');
INSERT TipoSangre (Id, Nombre) VALUES (4, 'AB-');


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


CREATE TABLE IF NOT EXISTS Raza(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Raza PRIMARY KEY CLUSTERED 
(
	Id ASC
)
);

INSERT Raza (Id, Nombre) VALUES (1, 'Perro Peruano');
INSERT Raza (Id, Nombre) VALUES (2, 'Bulldog');
INSERT Raza (Id, Nombre) VALUES (3, 'Cocker Spaniel');
INSERT Raza (Id, Nombre) VALUES (4, 'Pastor Alema');

CREATE TABLE IF NOT EXISTS Publicacidad(
	Publicidad_Id INT(4) NOT NULL,
	Titulo varchar(50) NULL,
	Contenido varchar(100) NULL,
	FechaInicio datetime NULL,
	FechaFin datetime NULL,
	Tarifa double NULL,
	NumeroClicks int NULL,
	Ubicacion_Id int NULL
);


INSERT Publicacidad (Publicidad_Id, Titulo, Contenido, FechaInicio, FechaFin, Tarifa, NumeroClicks, Ubicacion_Id) VALUES (1, 'Basquet Olimpiadas', 'Se esta realizando las olimpiadas', ('2015-11-05 14:29:36'),('2015-11-05 14:29:36'), 10.5000, 1000, 1);
INSERT Publicacidad (Publicidad_Id, Titulo, Contenido, FechaInicio, FechaFin, Tarifa, NumeroClicks, Ubicacion_Id) VALUES (2, 'Basquet Olimpiadas', 'Se esta realizando las olimpiadas', ('2015-11-05 14:29:36'),('2015-11-05 14:29:36'), 10.5000, 1000, 1);

CREATE TABLE IF NOT EXISTS Producto(
	idproducto int NULL,
	nombreproducto varchar(200) NULL,
	precio decimal(18, 2) NULL
);

INSERT Producto (idproducto, nombreproducto, precio) VALUES (1, 'Champu', CAST(10.50 AS Decimal(18, 2)));
INSERT Producto (idproducto, nombreproducto, precio) VALUES (2, 'Locion Antipulgas', CAST(40.00 AS Decimal(18, 2)));
INSERT Producto (idproducto, nombreproducto, precio) VALUES (3, 'Rico Ca', CAST(45.00 AS Decimal(18, 2)));
INSERT Producto (idproducto, nombreproducto, precio) VALUES (4, 'Correa', CAST(8.00 AS Decimal(18, 2)));


CREATE TABLE IF NOT EXISTS Paciente(
	Paciente_Id INT(4) NOT NULL AUTO_INCREMENT,
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

INSERT Paciente (Paciente_Id, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (1, 5, 2, 1, 2, 1, '1', 1, 2, (15.20 ), ('2010-05-17 22:52:21'), 'No hay notas', 'No hay condicones especiales');
INSERT Paciente (Paciente_Id, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (3, 14, 4, 4, 3, 1, '0', 1, 1, (30.00 ), ('2010-05-17 22:52:21'), 'eeeeeeeeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeeee');
INSERT Paciente (Paciente_Id, Dueno_Id, Especie_Id, Raza_Id, Genero_Id, TipoSangre_Id, Esterilizado, Tamano_Id, Actividad_Id, Peso, FechaNacimiento, NotasMedicas, CondicionesEspeciales) VALUES (5, 14, 1, 2, 1, 1, '0', 2, 1, (80.00 ), ('2010-05-17 22:52:21'), 'Nota', 'condiciones');

CREATE TABLE IF NOT EXISTS FacturaCab(
	codFactura int NOT NULL,
	idCliente int NOT NULL,
	idPaciente int NOT NULL,
	feRegistro varchar(10) NULL,
	status char(1) NULL,
	RUC varchar(20) NULL,
PRIMARY KEY CLUSTERED 
(
	codFactura ASC
)
);

INSERT FacturaCab (codFactura, idCliente, idPaciente, feRegistro, status, RUC) VALUES (1, 5, 1, '2012-08-10', 'X', '45842412121');
INSERT FacturaCab (codFactura, idCliente, idPaciente, feRegistro, status, RUC) VALUES (2, 14, 3, '2012-08-11', 'A', '56546546546');
INSERT FacturaCab (codFactura, idCliente, idPaciente, feRegistro, status, RUC) VALUES (3, 5, 1, '2012-08-11', 'A', '13213123213');
INSERT FacturaCab (codFactura, idCliente, idPaciente, feRegistro, status, RUC) VALUES (4, 14, 3, '2012-08-11', 'X', '56576676576');
INSERT FacturaCab (codFactura, idCliente, idPaciente, feRegistro, status, RUC) VALUES (5, 14, 3, '2012-08-11', 'A', '56576676576');

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
	paterno varchar(100) NULL,
	materno varchar(100) NULL,
	email varchar(50) NULL,
	telefono varchar(50) NULL,
	username nchar(100) NULL,
	password varchar(200) NOT NULL,
	grupoID int NOT NULL
);

INSERT Doctor (doctorID, nombre, paterno, materno, email, telefono, username, password, grupoID) VALUES (1, 'Samuel', 'Salazar', 'Rodriguez', 'samuel.salazar@gmail.com', '1234567', 'sam', '123456', 2);
INSERT Doctor (doctorID, nombre, paterno, materno, email, telefono, username, password, grupoID) VALUES (7, 'Rocio', 'Miranda', 'Mendez', 'rocio@gmail.com', '', 'rociom', '123456', 1);

CREATE TABLE IF NOT EXISTS Cliente(
	Persona_Id int NOT NULL,
	Nombres varchar(60) NOT NULL,
	apellido_paterno varchar(50) NOT NULL,
	apellido_materno varchar(50) NULL,
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



INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (1, 'jose', 'zamudio', 'risco', 'libra5100@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (2, 'jose3', 'zamudio3', 'risco3', 'libra2033@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (3, 'jose3', 'zamudio3', 'risco3', 'libra2033@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (4, 'Melissa', 'Almora B', '', '', '', 'C', '', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (5, 'Cinthya', 'Ferreyra', 'Bardales', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (6, 'Angel', 'Ruiz', 'm', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (7, 'Camila', 'Rios', 'Salazar', 'camila@gmail.com', '', 'C', 'Lima', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (8, 'Priscilla ', 'Salome', '', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (9, 'Jhosep', 'laines ', '', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (10, 'Nilda', 'Panduro', '', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (11, 'James', 'Villacorta', '', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (12, 'Leonidas', 'Piza', '', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (13, 'Lucia', 'Luja', 'apagueño ', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (14, 'Jessica', 'Ferbandez ', 'Bardales ', '', '', 'C', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (15, 'Rosa ', 'Valderrama', 'Lopez', '', '', 'C', '', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (16, 'Luis', 'Vargas', '', '', '123455555', 'C', 'Lima', NULL, '123456789', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (17, 'Erika', 'Peve', 'Peña', '', '77821122', 'C', '', NULL, '12354566', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (18, 'eduardo', 'zamudio', 'risco', 'libra5100@hotmail.com', '5342031', 'C', 'SMP', '', '997480042', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (19, 'jose', 'manue', 'risco', '', '1234567', 'P', '', NULL, '', 'A');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (20, 'fgdg', 'fgdfg', '', '', '5646', 'P', 'fdgdg ', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (21, 'rtet', 'ertert', 'retert', '', '', 'P', 'fgdgfdgdfg', NULL, '', 'X');
INSERT Cliente (Persona_Id, Nombres, apellido_paterno, apellido_materno, email, telefono, tipo_persona, direccion, imagen, celular, estado) VALUES (22, 'Luis', 'Salazar', 'risco', 'luis.salazar@gmail.com', '123456', 'C', 'Surco', NULL, '12354566', 'A');


CREATE TABLE IF NOT EXISTS Cita(
	cita_id int NOT NULL,
	persona_id int NOT NULL,
	paciente_id int NOT NULL,
	doctor_id int NOT NULL,
	tipo_cita char(1) NOT NULL,
	descripcion_cita varchar(300) NULL,
	nombre_vacuna varchar(100) NULL,
	fecha_cita varchar(10) NOT NULL,
 CONSTRAINT PK_Cita PRIMARY KEY CLUSTERED 
(
	cita_id ASC
));

INSERT Cita (cita_id, persona_id, paciente_id, doctor_id, tipo_cita, descripcion_cita, nombre_vacuna, fecha_cita) VALUES (1, 14, 3, 1, 'V', 'dsfdsfdsf', 'alergia', '02/08/2012');
INSERT Cita (cita_id, persona_id, paciente_id, doctor_id, tipo_cita, descripcion_cita, nombre_vacuna, fecha_cita) VALUES (2, 14, 3, 1, 'V', 'gfdg', 'alergia', '08/08/2012');
INSERT Cita (cita_id, persona_id, paciente_id, doctor_id, tipo_cita, descripcion_cita, nombre_vacuna, fecha_cita) VALUES (3, 14, 3, 1, 'V', 'rfdfgfdgfdg', 'alergia', '01/08/2012');
INSERT Cita (cita_id, persona_id, paciente_id, doctor_id, tipo_cita, descripcion_cita, nombre_vacuna, fecha_cita) VALUES (4, 14, 3, 1, 'V', 'Vacunacio', 'Distemper', '16/08/2012');


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


CREATE TABLE IF NOT EXISTS FacturaDetWork(
	codFactura int NOT NULL,
	codProducto int NOT NULL,
	qtCantidad decimal(18, 2) NOT NULL,
	precio decimal(18, 2) NOT NULL
);

INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (1, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (1, 4, CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (2, 2, CAST(12.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (4, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (4, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (5, 3, CAST(4.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (5, 1, CAST(2.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (6, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDetWork (codFactura, codProducto, qtCantidad, precio) VALUES (3, 2, CAST(2.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)));

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


CREATE TABLE IF NOT EXISTS FacturaDet(
	codFactura int NOT NULL,
	codProducto int NOT NULL,
	qtCantidad decimal(18, 2) NOT NULL,
	precio decimal(18, 2) NOT NULL
);

INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (1, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (1, 4, CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (2, 2, CAST(12.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (3, 2, CAST(2.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (4, 1, CAST(12.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (4, 1, CAST(4.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (5, 1, CAST(2.00 AS Decimal(18, 2)), CAST(10.50 AS Decimal(18, 2)));
INSERT FacturaDet (codFactura, codProducto, qtCantidad, precio) VALUES (5, 3, CAST(4.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)));

CREATE TABLE IF NOT EXISTS ImagenesMedicas(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Paciente_Id int NOT NULL,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_ImagenesMedicas PRIMARY KEY CLUSTERED 
(
	Id ASC
));

INSERT ImagenesMedicas (Id, Paciente_Id, Nombre) VALUES (1, 1, 'Pata');
INSERT ImagenesMedicas (Id, Paciente_Id, Nombre) VALUES (2, 1, 'Craneo');
INSERT ImagenesMedicas (Id, Paciente_Id, Nombre) VALUES (3, 1, 'Columna');

