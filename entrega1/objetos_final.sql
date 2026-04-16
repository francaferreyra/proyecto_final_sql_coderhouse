CREATE VIEW vista_turnos_completos AS
SELECT 
t.id_turno,
t.fecha,
t.hora,
p.nombre AS nombre_paciente,
p.apellido AS apellido_paciente,
m.nombre AS nombre_medico,
m.apellido AS apellido_medico,
e.nombre AS especialidad,
h.nombre AS hospital,
tt.nombre AS tipo_turno
FROM turno t
JOIN paciente p ON t.id_paciente = p.id_paciente
JOIN medico m ON t.id_medico = m.id_medico
JOIN especialidad e ON m.id_especialidad = e.id_especialidad
JOIN hospital h ON m.id_hospital = h.id_hospital
JOIN tipo_turno tt ON t.id_tipo_turno = tt.id_tipo_turno;

CREATE VIEW vista_medicos_especialidad AS
SELECT
m.id_medico,
m.nombre,
m.apellido,
e.nombre AS especialidad,
h.nombre AS hospital
FROM medico m
JOIN especialidad e ON m.id_especialidad = e.id_especialidad
JOIN hospital h ON m.id_hospital = h.id_hospital;

CREATE VIEW vista_turnos_pacientes AS
SELECT
p.nombre,
p.apellido,
t.fecha,
t.hora
FROM turno t
JOIN paciente p ON t.id_paciente = p.id_paciente;

#FUNCIONES

DELIMITER $$

CREATE FUNCTION cantidad_turnos_paciente(idPaciente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM turno
    WHERE id_paciente = idPaciente;

    RETURN total;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION cantidad_medicos_especialidad(idEspecialidad INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM medico
    WHERE id_especialidad = idEspecialidad;

    RETURN total;
END $$

DELIMITER ;

#PROCEDIMIENTOS

DELIMITER $$

CREATE PROCEDURE registrar_turno (
    IN p_fecha DATE,
    IN p_hora TIME,
    IN p_id_paciente INT,
    IN p_id_medico INT,
    IN p_id_tipo_turno INT
)
BEGIN
    INSERT INTO turno (fecha, hora, id_paciente, id_medico, id_tipo_turno)
    VALUES (p_fecha, p_hora, p_id_paciente, p_id_medico, p_id_tipo_turno);
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ver_turnos_paciente (
    IN p_id_paciente INT
)
BEGIN
    SELECT *
    FROM turno
    WHERE id_paciente = p_id_paciente;
END $$

DELIMITER ;

#TRIGGERS

DELIMITER $$

CREATE TRIGGER validar_fecha_turno
BEFORE INSERT ON turno
FOR EACH ROW
BEGIN
    IF NEW.fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pueden registrar turnos en fechas pasadas';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER validar_turno_medico
BEFORE INSERT ON turno
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM turno
        WHERE id_medico = NEW.id_medico
        AND fecha = NEW.fecha
        AND hora = NEW.hora
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El medico ya tiene un turno asignado en ese horario';
    END IF;
END $$

DELIMITER ;

CREATE VIEW vista_turnos_por_medico AS
SELECT 
m.nombre,
m.apellido,
COUNT(t.id_turno) AS cantidad_turnos
FROM medico m
LEFT JOIN turno t ON m.id_medico = t.id_medico
GROUP BY m.id_medico;

CREATE VIEW vista_turnos_por_tipo AS
SELECT 
tt.nombre AS tipo_turno,
COUNT(t.id_turno) AS cantidad
FROM tipo_turno tt
LEFT JOIN turno t ON tt.id_tipo_turno = t.id_tipo_turno
GROUP BY tt.id_tipo_turno;

