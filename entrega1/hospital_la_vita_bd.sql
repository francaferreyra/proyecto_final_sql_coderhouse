CREATE DATABASE hospital_la_vita;
USE hospital_la_vita;

CREATE TABLE hospital (
id_hospital INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
direccion VARCHAR(150) NOT NULL
);

CREATE TABLE especialidad (
id_especialidad INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
descripcion VARCHAR(150)
);

CREATE TABLE paciente (
id_paciente INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
apellido VARCHAR(100) NOT NULL, 
dni INT NOT NULL UNIQUE, 
telefono VARCHAR(20) NOT NULL, 
mail VARCHAR(100) NOT NULL
);

CREATE TABLE medico (
id_medico INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
apellido VARCHAR(100) NOT NULL, 
dni INT NOT NULL UNIQUE, 
id_especialidad INT NOT NULL, 
id_hospital INT NOT NULL, 
FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad), 
FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

CREATE TABLE tipo_turno (
id_tipo_turno INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(50) NOT NULL, 
descripcion VARCHAR(150)
);

CREATE TABLE turno (
id_turno INT PRIMARY KEY AUTO_INCREMENT, 
fecha DATE NOT NULL, 
hora TIME NOT NULL, 
id_paciente INT NOT NULL, 
id_medico INT NOT NULL, 
id_tipo_turno INT NOT NULL, 
FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente), 
FOREIGN KEY (id_medico) REFERENCES medico(id_medico), 
FOREIGN KEY (id_tipo_turno) REFERENCES tipo_turno(id_tipo_turno)
);




