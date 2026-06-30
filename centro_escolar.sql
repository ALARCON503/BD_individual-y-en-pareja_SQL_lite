PRAGMA foreign_keys = ON;




CREATE TABLE carreras (
    id_carrera INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_carrera VARCHAR(80) NOT NULL,
    descripcion_carrera VARCHAR(100)
);

CREATE TABLE docentes (
    id_docente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombres VARCHAR(60) NOT NULL,
    grado_tutor VARCHAR(50),
    especialidad_tutor VARCHAR(40)
);

CREATE TABLE periodos (
    id_periodo INTEGER PRIMARY KEY AUTOINCREMENT,
    periodo VARCHAR(20) NOT NULL,
    año_lectivo INTEGER(4) NOT NULL
);

CREATE TABLE estudiantes (
    id_estudiante INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_carrera INTEGER,
    promedio FLOAT,
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera) ON DELETE SET NULL
);

CREATE TABLE materias (
    id_materia INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_materia VARCHAR(80) NOT NULL, -- Añadido para que la tabla tenga sentido funcional
    id_carrera INTEGER,
    id_docente INTEGER,                  -- Añadido para relacionar docentes con materias
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera) ON DELETE CASCADE,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente) ON DELETE SET NULL
);

CREATE TABLE notas (
    id_nota INTEGER PRIMARY KEY AUTOINCREMENT,
    id_estudiante INTEGER,               -- Añadido porque las notas deben pertenecer a un estudiante
    id_materia INTEGER,
    id_periodo INTEGER,
    nota FLOAT CHECK(nota >= 0.0 AND nota <= 10.0), -- Validación estándar de notas
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia) ON DELETE CASCADE,
    FOREIGN KEY (id_periodo) REFERENCES periodos(id_periodo) ON DELETE CASCADE
);


INSERT INTO carreras (nombre_carrera, descripcion_carrera) VALUES 
('Ingeniería de Software', 'Desarrollo y diseño de sistemas lógicos'),
('Licenciatura en Administración', 'Gestión estratégica de organizaciones'),
('Medicina General', 'Cuidado de la salud y anatomía humana'),
('Diseño Gráfico', 'Comunicación visual y creatividad digital'),
('Psicología Clínica', 'Estudio del comportamiento humano y salud mental');


INSERT INTO docentes (nombres, grado_tutor, especialidad_tutor) VALUES 
('Dr. Carlos Mendoza', 'Doctorado', 'Inteligencia Artificial'),
('Mtra. Elena Rostova', 'Maestría', 'Finanzas Corporativas'),
('Dr. Luis Alfonso', 'Doctorado', 'Neurocirugía'),
('Lic. Sofía Vergara', 'Licenciatura', 'Ilustración Digital'),
('Mtra. Laura Pausini', 'Maestría', 'Terapia Cognitivo-Conductual');


INSERT INTO periodos (periodo, año_lectivo) VALUES 
('Primer Semestre', 2026),
('Segundo Semestre', 2026),
('Verano Intesivo', 2026);

INSERT INTO estudiantes (nombre, id_carrera, promedio) VALUES 
('Juan Pérez', 1, 8.5),
('María López', 2, 9.2),
('Pedro Gómez', 3, 7.8),
('Ana Martínez', 4, 9.5);

INSERT INTO materias (nombre_materia, id_carrera, id_docente) VALUES 
('Programación Orientada a Objetos', 1, 1),
('Contabilidad Costos', 2, 2),
('Anatomía I', 3, 3),
('Teoría del Color', 4, 4);


INSERT INTO notas (id_estudiante, id_materia, id_periodo, nota) VALUES 
(1, 1, 1, 9.0),  
(2, 2, 1, 8.8),  
(3, 3, 1, 7.5),  
(4, 4, 1, 10.0); 