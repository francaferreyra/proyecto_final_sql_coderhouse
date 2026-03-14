# Creacion de registros

INSERT INTO hospital (nombre, direccion) VALUES 
('Sede San Martin', 'Av. San Martin 1234, Cordoba'),
('Sede Centro', 'Av. Colon 850, Cordoba'),
('Sede Nueva Cordoba', 'Bv. Chacabuco 1200, Cordoba'),
('Sede Cerro', 'Av. Rafael Nuñez 3500, Cordoba'),
('Sede Norte', 'Av. Juan B Justo 4200, Cordoba'),
('Sede Sur', 'Av. Velez Sarsfield 5000, Cordoba'),
('Sede General Paz', 'Av. 24 de Septiembre 1000, Cordoba'),
('Sede Villa Belgrano', 'Av. Recta Martinolli 6600, Cordoba'),
('Sede Alta Cordoba', 'Jeronimo Luis de Cabrera 900, Cordoba'),
('Sede Barrio Jardin', 'Av. Ohiggins 4100, Cordoba');

INSERT INTO especialidad (nombre, descripcion) VALUES
('Cardiologia', 'Especialidad que trata enfermedades del corazon'),
('Pediatria', 'Especialidad medica orientada a la salud infantil'),
('Dermatologia', 'Diagnostico y tratamiento de enfermedades de la piel'),
('Neurologia', 'Tratamiento de enfermedades del sistema nervioso'),
('Traumatologia', 'Especialidad dedicada a lesiones del sistema oseo'),
('Oftalmologia', 'Atencion a enfermedades en los ojos'),
('Ginecologia', 'Salud del sistema reproductor femenino'),
('Psiquiatria', 'Tratamiento de trastornos mentales'),
('Endocrinologia', 'Estudio de hormonas y glandulas endocrinas'),
('Oncologia', 'Diagnostico y tratamiento del cancer');

INSERT INTO tipo_turno (nombre, descripcion) VALUES
('Presencial', 'Consulta medica realizada de manera presencial en la sede del hospital'),
('Telemedicina', 'Consulta medica realizada por videollamada');

INSERT INTO paciente (nombre, apellido, dni, telefono, mail) VALUES
('Franca', 'Ferreyra Lammertyn', 43524114, '+5493513644463', 'francaferreyralammertyn@gmail.com'),
('Lara', 'Gonzalez', 28372844, '+5493519273846', 'laragonzalez1@gmail.com'),
('Juan Cruz', 'Carretero', 39284736, '+5493517726398', 'juancarretero@hotmail.com'),
('Tomas', 'Diaz', 42878632, '+5493516783455', 'tomidiaz10@gmail.com'),
('Maria Florencia', 'Martinez', 32743223, '+5493513488756', 'mflormartinez@gmail.com'),
('Lucia', 'Gomez', 32145678, '+5493514567890', 'lucia.gomez@gmail.com'),
('Martin', 'Perez', 29874561, '+5493512345678', 'martin.perez@gmail.com'),
('Juan', 'Fernandez', 27654321, '+5493519933384', 'juanfer2@gmail.com'),
('Tomas', 'Andrada', 22621623, '+5493516303343', 'tomi.andrada@gmail.com'),
('Candelaria', 'Ramirez Lopez', 43726352, '+5493513744857', 'canderamirezl@gmail.com');

INSERT INTO medico (nombre, apellido, dni, id_especialidad, id_hospital) VALUES
('Carlos', 'Martinez', 25478123, 1, 1),
('Laura', 'Sanchez', 28765483, 2, 2), 
('Diego', 'Torres', 30124569, 3, 3),
('Ana', 'Morales', 29567891, 4, 4),
('Pablo', 'Castro', 34837548, 5, 5),
('Marina', 'Vega', 31999653, 6, 6),
('Paula', 'Navarro', 33948322, 7, 7),
('Ricardo', 'Silva', 26837461, 8, 8),
('Fernando', 'Rojas', 28655433, 9, 9),
('Gabriela', 'Herrera', 31987319, 10, 10);

INSERT INTO turno (fecha, hora, id_paciente, id_medico, id_tipo_turno) VALUES
('2026-06-10', '09:00:00', 1, 7, 1),
('2026-06-10', '10:00:00', 2, 2, 1),
('2026-06-10', '11:00:00', 3, 3, 2),
('2026-07-11', '09:00:00', 4, 4, 1),
('2026-07-12', '15:30:00', 5, 5, 2),
('2026-08-04', '18:00:00', 6, 6, 2),
('2026-08-05', '12:00:00', 7, 1, 1),
('2026-08-14', '10:30:00', 8, 8, 1),
('2026-08-14', '13:00:00', 9, 9, 1),
('2026-08-22', '16:00:00', 10, 10, 2);





