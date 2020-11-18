DROP DATABASE IF EXISTS instantvet;
CREATE DATABASE IF NOT EXISTS instantvet;

ALTER DATABASE instantvet
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
USE instantvet;

CREATE TABLE IF NOT EXISTS estadoTurno(
	 estadoTurnoId  INT(4) NOT NULL,
     nombre  varchar(50) NULL,
	 descripcion  varchar(50) NULL
);

INSERT estadoTurno (estadoTurnoId, nombre, descripcion) VALUES (1, 'Asignado', 'turno generado');
INSERT estadoTurno (estadoTurnoId, nombre, descripcion) VALUES (2, 'Confirmado', 'turno confirmado');
INSERT estadoTurno (estadoTurnoId, nombre, descripcion) VALUES (3, 'Cancelado', 'turno cancelado');
INSERT estadoTurno (estadoTurnoId, nombre, descripcion) VALUES (4, 'Atendido', 'turno atendido');

CREATE TABLE IF NOT EXISTS tipoTurno(
	 tipoTurnoId INT(4) NOT NULL AUTO_INCREMENT,
	 nombre  varchar(50) NULL,
 CONSTRAINT PK_tipoTurno PRIMARY KEY CLUSTERED 
(
	tipoTurnoId ASC
)
); 

INSERT tipoTurno (tipoTurnoId, Nombre) VALUES (1, 'Veterinaria');
INSERT tipoTurno (tipoTurnoId, Nombre) VALUES (2, 'Peluqueria');

CREATE TABLE IF NOT EXISTS Paciente(
	PacienteId INT(4) NOT NULL AUTO_INCREMENT,
    nombre varchar(100) NULL,
	clienteId int NOT NULL,
	EspecieId int NOT NULL,
	Genero char(1) NOT NULL,
	Esterilizado char(1) NOT NULL,
	Peso numeric(5, 2) NOT NULL,
	FechaNacimiento date NOT NULL,
    estado int,
	observaciones varchar(1000) NULL,
 CONSTRAINT PK_Paciente PRIMARY KEY CLUSTERED 
(
	pacienteId ASC
)
);

INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (1, 'Terry',1, 1, 'M', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (2, 'Sam',1,  2, 'H', 'S',  (30.00 ), ('2010-05-19'), 1, 'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (3, 'Tom',2, 3, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (4, 'Coco',3, 4, 'H', 'S', (15.20 ), ('2010-05-16'), 0,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (5, 'Pancha', 3, 1, 'H', 'S',  (30.00 ), ('2010-05-19'),1, 'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (6, 'Niebla',5, 2, 'H', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (7, 'Beethoven',5, 1, 'M', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (8, 'Dama',4,  4, 'H', 'S',  (30.00 ), ('2010-05-19'), 1,'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (9, 'Goofy',6, 1, 'M', 'N',  (80.00 ), ('2010-05-18'),1, 'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (10, 'Laika',7, 2, 'H', 'S', (15.20 ), ('2010-05-16'),1, 'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (11, 'Seymour',8,  3, 'H', 'S',  (30.00 ), ('2010-05-19'), 1,'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (12, 'Frodo',8, 1, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (13, 'Franny',9, 1, 'H', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (14, 'Gala',10,  2, 'H', 'S',  (30.00 ), ('2010-05-19'), 1,'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (15, 'Anubis',14, 3, 'M', 'N',  (80.00 ), ('2010-05-18'),1, 'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (16, 'Hali',11, 2, 'H', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (17, 'Harry',12,  1, 'H', 'S',  (30.00 ), ('2010-05-19'),1, 'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (18, 'Lambert',13, 2, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (19, 'Cora',15, 3, 'H', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (20, 'Aura',16,  4, 'H', 'S',  (30.00 ), ('2010-05-19'), 1,'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (21, 'Hermes',17, 1, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (22, 'Mateo',18, 2, 'M', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (23, 'Surya',18,  1, 'H', 'S',  (30.00 ), ('2010-05-19'), 0,'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (24, 'Ulises',19, 1, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (25, 'Lady',20, 1, 'H', 'S', (15.20 ), ('2010-05-16'), 1,'No hay notas');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (26, 'Venus',20,  2, 'H', 'S',  (30.00 ), ('2010-05-19'),1, 'sin observaciones');
INSERT Paciente (PacienteId, nombre, clienteId, EspecieId, Genero,  Esterilizado, Peso, FechaNacimiento, estado, observaciones) VALUES (27, 'Osiris',21, 1, 'M', 'N',  (80.00 ), ('2010-05-18'), 1,'Nota');



CREATE TABLE IF NOT EXISTS Especie(
	especieId INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Especie PRIMARY KEY CLUSTERED 
(
	EspecieId ASC
));

INSERT Especie (especieId, Nombre) VALUES (1, 'Perro');
INSERT Especie (especieId, Nombre) VALUES (2, 'Gato');
INSERT Especie (especieId, Nombre) VALUES (3, 'Ave');
INSERT Especie (especieId, Nombre) VALUES (4, 'Otro');

CREATE TABLE IF NOT EXISTS Personal(
	PersonalId INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(100) NULL,
	apellido varchar(100) NULL,
	matricula varchar(100) NULL,
	email varchar(50) NULL,
	telefono varchar(50) NULL,    
	tipo_personal char(1) NOT NULL,
	username nchar(100) NULL,
	password varchar(200) NOT NULL,
	grupoID int NOT NULL
);

INSERT Personal (PersonalId, nombre, apellido, matricula, email, telefono, tipo_personal, username, password, grupoID) VALUES (1, 'Samuel', 'Salazar', 'mat123456', 'samuel.salazar@gmail.com', '1234567', 'V', 'szalazar', '123456', 2);
INSERT Personal (PersonalId, nombre, apellido, matricula, email, telefono, tipo_personal, username, password, grupoID) VALUES (7, 'Rocio', 'Miranda', 'mat456789', 'rocio@gmail.com', '', 'R','rmiranda', '123456', 1);

CREATE TABLE IF NOT EXISTS Cliente(
	clienteId int NOT NULL AUTO_INCREMENT,
    num_documento int(50) NULL,
	Nombres varchar(60) NOT NULL,
	apellido varchar(50) NOT NULL,	
	email varchar(60) NULL,
	telefono varchar(15) NULL,
	direccion varchar(200) NULL,
	estado char(1) NOT NULL,
 CONSTRAINT PK_Persona PRIMARY KEY CLUSTERED 
(
	clienteId ASC
));



INSERT Cliente (clienteId, num_documento, Nombres, apellido,  email, telefono,  direccion,  estado) VALUES (1, 123,'Jose', 'Zamudio',  'libra5100@hotmail.com', '5342031',  'SMP', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (2, 1235, 'Jose', 'Ferreyra', 'libra2033@hotmail.com', '5342031',  'SMP',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (3, 12356, 'Marta', 'Amudio',  'libra2033@hotmail.com', '5342031',  'SMP', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (4, 25896, 'Melissa', 'Almora B',  'Melissa@hotmail.com', '45654369',  'Diercc 1588',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (5, 258963, 'Cinthya', 'Ferreyra',  '@hotmail.com', '5468778242',  'Salta 514 ',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (6, 857485,'Angel', 'Ruiz', '@hotmail.com',  '7565345',  'NYFR 1232',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (7, 854714, 'Camila', 'Rios',  'camila@gmail.com', '546543453',  'Lima', 'X');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (8, 456789,'Priscilla ', 'Salome',  '@hotmail.com', '58792453',  'Maste', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (9, 5648791, 'Jhosep', 'laines ',  '@hotmail.com', '5464534568',  'TYU 365','A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (10, 52841, 'Nilda', 'Panduro',  '@hotmail.com', '565435694',  'PG 22',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (11, 2252556,'James', 'Villacorta',  '@hotmail.com', '546543565',  'P', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (12, 123365,'Leonidas', 'Piza',  '@hotmail.com', '12345674',  'Turcuman 111',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (13, 85236,'Lucia', 'Luja',  '@hotmail.com', '1565422',  'La Rioja',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (14, 58485,'Jessica', 'Ferbandez ',  '@hotmail.com', '546453645',  'Montevideo',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (15, 369695,'Rosa ', 'Valderrama',  '@hotmail.com', '45645645',  'Derqui',  'X');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (16, 554448,'Luis', 'Vargas',  '@hotmail.com', '123455555',  'Lima',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (17, 55252255,'Erika', 'Peve',  '@hotmail.com', '77821122',  '',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (18, 626655,'eduardo', 'zamudio',  'libra5100@hotmail.com', '5342031',  'SMP', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (19, 5588962,'jose', 'manue',  '@hotmail.com', '1234567', '', 'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (20, 32562559,'fgdg', 'fgdfg',  '@hotmail.com', '5646',  'fdgdg ',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (21, 528564,'rtet', 'ertert',  '@hotmail.com', '456456456',  'fgdgfdgdfg',  'A');
INSERT Cliente (clienteId, num_documento, Nombres, apellido, email, telefono,  direccion, estado) VALUES (22, 632595,'Luis', 'Salazar',  'luis.salazar@gmail.com', '123456',  'Surco', 'A');


CREATE TABLE IF NOT EXISTS turno(
	turnoId int NOT NULL AUTO_INCREMENT,
    fecha_turno datetime NOT NULL,
	clienteId int NOT NULL,
	pacienteId int NOT NULL,
	tipo_turno char(1) NOT NULL,
    estadoTurnoId int,
	observaciones varchar(300) NULL,
 CONSTRAINT PK_Turno PRIMARY KEY CLUSTERED 
(
	turnoId ASC
));

INSERT turno (turnoId, fecha_turno, clienteId, pacienteId, tipo_turno, estadoTurnoId, observaciones) VALUES (1, '2020-10-10 10:00:00', 1, 3,  'P',  1, 'dsfdsfdsf');
INSERT turno (turnoId, fecha_turno, clienteId, pacienteId, tipo_turno, estadoTurnoId, observaciones) VALUES (2, '2020-09-11 11:30:00', 2, 3,  'V',  1, 'gfdg');
INSERT turno (turnoId, fecha_turno, clienteId, pacienteId, tipo_turno, estadoTurnoId, observaciones) VALUES (3, '2020-03-12 14:00:00', 3, 3,  'P' , 1, 'rfdfgfdgfdg');
INSERT turno (turnoId, fecha_turno, clienteId, pacienteId, tipo_turno, estadoTurnoId, observaciones) VALUES (4, '2020-11-13 15:30:00', 14, 3,  'V', 1, 'Vacunacio');


CREATE TABLE IF NOT EXISTS usuario(
	Id INT(4) NOT NULL AUTO_INCREMENT,
	Nombre varchar(60) NOT NULL,
 CONSTRAINT PK_Genero PRIMARY KEY CLUSTERED 
(
	Id ASC
));

INSERT usuario (Id, Nombre) VALUES (1, 'uno');
INSERT usuario (Id, Nombre) VALUES (2, 'dos');
INSERT usuario (Id, Nombre) VALUES (3, 'tres');

