PRAGMA foreign_keys = ON;


CREATE TABLE categorias (
  id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
  estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVA' CHECK (estado IN ('ACTIVA','INACTIVA'))
);
CREATE TABLE libros (
  id_libro INTEGER PRIMARY KEY AUTOINCREMENT,
  nombre_libro VARCHAR(150) NOT NULL,
  id_categoria INTEGER NOT NULL,
  isbn VARCHAR(30) NOT NULL UNIQUE,
  cantidad_disponible INTEGER NOT NULL DEFAULT 0 CHECK (cantidad_disponible >= 0),
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE personas (
  id_persona INTEGER PRIMARY KEY AUTOINCREMENT,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  fecha_inscripcion DATE NOT NULL DEFAULT CURRENT_DATE,
  UNIQUE (nombres, apellidos)
);
CREATE TABLE usuarios (
  id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  usuario VARCHAR(30) NOT NULL UNIQUE,
  clave_hash VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE prestamos (
  id_prestamo INTEGER PRIMARY KEY AUTOINCREMENT,
  id_libro INTEGER NOT NULL,
  id_persona INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
  fecha_devolucion DATE,
  cantidad INTEGER NOT NULL DEFAULT 1 CHECK (cantidad > 0),
  multa DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (multa >= 0),
  FOREIGN KEY (id_libro) REFERENCES libros(id_libro) ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (id_persona) REFERENCES personas(id_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
  CHECK (fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo)
);
CREATE INDEX idx_libros_categoria ON libros(id_categoria);
CREATE INDEX idx_prestamos_libro ON prestamos(id_libro);
CREATE INDEX idx_prestamos_persona ON prestamos(id_persona);
CREATE INDEX idx_personas_apellidos ON personas(apellidos);

-- CATEGORIAS
INSERT INTO categorias (nombre_categoria) VALUES ('Terror');
INSERT INTO categorias (nombre_categoria) VALUES ('Comedia');
INSERT INTO categorias (nombre_categoria) VALUES ('Ciencia ficcion');
INSERT INTO categorias (nombre_categoria) VALUES ('Fantasia');
INSERT INTO categorias (nombre_categoria) VALUES ('Misterio');
INSERT INTO categorias (nombre_categoria) VALUES ('Aventura');
INSERT INTO categorias (nombre_categoria) VALUES ('Poesia');
INSERT INTO categorias (nombre_categoria) VALUES ('Drama');

-- 100 PERSONAS
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hermenegildo', 'Trastornado', '2018-11-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilfredo', 'Bigotudo', '2023-02-18');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Adelfa', 'Trujabo', '2018-04-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Cachivache', '2021-02-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Pelizarro', '2019-01-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Aniceto', 'Sopalanco', '2018-10-21');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Filomena', 'Chumbipe', '2021-01-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Ataulfo', 'Pelizarro', '2022-03-28');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilhelmina', 'Trastornado', '2022-02-18');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Romualda', 'Bigotudo', '2019-03-22');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Adelfa', 'Chumbipe', '2023-04-21');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severino', 'Pelizarro', '2018-02-23');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severina', 'Berenjeno', '2026-11-16');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Esperanza', 'Carcamal', '2025-08-11');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Casimira', 'Garabato', '2021-03-08');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Chumbipe', '2025-09-10');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eduvigis', 'Patanegra', '2019-05-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eustaquio', 'Cataplines', '2023-03-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Bululu', '2019-01-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Romualda', 'Chumbipe', '2023-06-26');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Genoveva', 'Garrampa', '2025-10-16');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Tarambana', '2019-12-16');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hermelindo', 'Patanegra', '2025-05-23');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Teodulo', 'Mostachudo', '2023-11-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Maximino', 'Espantajo', '2019-03-12');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Crisanta', 'Trujabo', '2020-05-07');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hilarion', 'Zarrapastra', '2019-08-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Zenobio', 'Espantajo', '2022-09-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Crisanto', 'Bigotudo', '2022-09-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilhelmina', 'Mequetrefe', '2021-07-22');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Mondongo', '2021-03-06');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Aniceto', 'Galarga', '2020-10-16');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Cresencio', 'Garabato', '2024-03-01');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Encarnacion', 'Mequetrefe', '2023-10-20');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Crisanto', 'Mostachudo', '2018-09-28');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Remedios', 'Bocafloja', '2026-11-28');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Bibiana', 'Zarrapastra', '2019-07-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Sopalanco', '2021-01-13');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilfredo', 'Berenjeno', '2019-03-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eduvigis', 'Garrampa', '2018-02-02');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Filomena', 'Trastornado', '2023-02-18');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severina', 'Galarga', '2024-04-03');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Sopalanco', '2023-06-09');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Pelandrunga', '2025-08-04');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Bululu', '2020-02-10');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severino', 'Patanegra', '2022-12-11');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Bigotudo', '2026-03-23');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Maximino', 'Berenjeno', '2020-06-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Encarnacion', 'Galarga', '2022-09-25');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Mostachudo', '2026-05-28');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Casimira', 'Cucufato', '2026-04-12');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Encarnacion', 'Carcamal', '2021-06-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severina', 'Refunfu', '2021-04-26');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Bibiana', 'Patanegra', '2021-04-26');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Visitacion', 'Bululu', '2018-12-12');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Maximino', 'Refunfu', '2022-08-09');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Filiberto', 'Mostachudo', '2025-06-20');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Genoveva', 'Mequetrefe', '2019-04-03');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Aniceto', 'Bululu', '2021-06-07');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Garrampa', '2025-01-20');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Genoveva', 'Refunfu', '2019-02-21');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Petronila', 'Refunfu', '2025-04-23');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Romualdo', 'Cachivache', '2023-11-26');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Refunfu', '2025-07-24');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Anacleto', 'Patanegra', '2020-03-06');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Maximino', 'Trastornado', '2020-08-19');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severina', 'Bigotudo', '2023-08-20');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Pelizarro', '2018-03-18');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Elver', 'Refunfu', '2019-11-24');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Visitacion', 'Patanegra', '2021-07-05');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Saturnino', 'Galarga', '2022-04-09');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Florentina', 'Pichirilo', '2023-10-25');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Cresencio', 'Pelizarro', '2018-03-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Genoveva', 'Bocafloja', '2026-11-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilhelmina', 'Bigotudo', '2026-03-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Cataplines', '2025-01-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Romualdo', 'Garrampa', '2020-03-01');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severina', 'Patanegra', '2018-09-04');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hermenegildo', 'Trapichero', '2026-09-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Engracia', 'Refunfu', '2026-02-25');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hermelindo', 'Pichirilo', '2018-05-07');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severino', 'Cataplines', '2018-09-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Wilfredo', 'Espantajo', '2026-10-11');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Atanasia', 'Cataplines', '2022-12-07');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Asuncion', 'Cataplines', '2026-08-18');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hilarion', 'Mostachudo', '2026-05-17');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Filiberto', 'Bigotudo', '2024-03-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eustaquio', 'Zarrapastra', '2019-06-15');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Hilarion', 'Cachivache', '2022-04-03');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eustaquio', 'Bocafloja', '2023-03-25');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Belarmino', 'Tarambana', '2021-08-05');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Severino', 'Zarrapastra', '2021-03-16');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Zenobio', 'Mostachudo', '2024-09-14');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eduvigis', 'Cachivache', '2023-06-07');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Casimira', 'Galarga', '2025-09-11');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Asuncion', 'Mostachudo', '2023-07-01');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Visitacion', 'Garrampa', '2019-09-10');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Eustaquio', 'Refunfu', '2019-02-08');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Cresencio', 'Tarambana', '2022-03-02');
INSERT INTO personas (nombres, apellidos, fecha_inscripcion) VALUES ('Esperanza', 'Mojigato', '2024-05-22');

-- 100 LIBROS
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Las aventuras de el dragon tartamudo', 8, '978-717-91-058-2', 13);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de don pepino', 5, '978-960-649-820-1', 7);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de el pirata sordo', 2, '978-464-347-427-9', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de el mago jubilado', 4, '978-960-992-268-2', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de la momia vegana', 5, '978-543-296-512-2', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de la luna rota', 5, '978-37-018-517-3', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo el fantasma despistado', 2, '978-674-442-506-6', 9);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El diario de el profesor chiflado', 4, '978-350-852-746-2', 12);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de el gato cuantico', 3, '978-14-640-900-6', 5);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de don pepino', 7, '978-891-686-613-4', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de la tetera maldita', 3, '978-275-03-372-8', 10);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo el gato cuantico', 5, '978-223-187-343-1', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de el mago jubilado', 4, '978-254-794-93-1', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la momia influencer', 1, '978-403-306-644-1', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Confesiones de el detective dormilon', 7, '978-782-737-153-9', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Confesiones de la jirafa filosofa', 3, '978-931-770-582-9', 7);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de la luna rota', 1, '978-136-369-385-8', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Confesiones de la luna rota', 4, '978-501-03-816-8', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Confesiones de el mago jubilado', 2, '978-763-485-828-4', 7);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de el vampiro vegetariano', 2, '978-490-294-631-3', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de el calcetin perdido', 6, '978-260-761-311-9', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de la araña contadora', 1, '978-497-995-101-3', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de el fantasma despistado', 8, '978-477-915-204-1', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de la momia vegana', 8, '978-078-991-275-3', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de la momia influencer', 2, '978-145-536-975-2', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de la abuela zombie', 6, '978-236-919-403-2', 0);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de el fantasma despistado', 7, '978-309-144-352-5', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El reino de el robot melancolico', 1, '978-332-859-122-0', 9);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la sirena alergica', 2, '978-402-890-78-6', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El reino de el gato cuantico', 5, '978-104-854-292-2', 7);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la jirafa filosofa', 6, '978-194-803-905-6', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El diario de don pepino', 1, '978-955-420-629-4', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de el dragon tartamudo', 3, '978-174-424-288-4', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la bruja del microondas', 5, '978-494-684-122-2', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo el mago jubilado', 8, '978-563-463-777-6', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La leyenda de el profesor chiflado', 4, '978-92-350-93-3', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la momia influencer', 4, '978-908-767-392-8', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de el pirata sordo', 6, '978-770-510-588-2', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de la bruja del microondas', 7, '978-409-456-976-0', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de la jirafa filosofa', 8, '978-991-501-74-8', 14);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de la bruja del microondas', 2, '978-229-155-995-1', 14);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de el dragon tartamudo', 1, '978-1-238-941-4', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Confesiones de el pirata sordo', 7, '978-715-101-307-9', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo el detective dormilon', 1, '978-010-308-285-3', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La leyenda de la bruja del microondas', 4, '978-29-721-314-0', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de la jirafa filosofa', 2, '978-263-683-947-3', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de el robot melancolico', 7, '978-371-405-06-8', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo la araña contadora', 4, '978-319-236-226-4', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de la araña contadora', 3, '978-917-496-932-0', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de el vampiro vegetariano', 1, '978-218-997-145-0', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Las aventuras de el vampiro vegetariano', 8, '978-919-904-750-1', 5);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de el profesor chiflado', 3, '978-668-764-32-6', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de el fantasma despistado', 3, '978-111-80-82-6', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la sirena alergica', 5, '978-841-89-722-3', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La leyenda de el fantasma despistado', 4, '978-331-755-031-6', 7);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La venganza de el vampiro vegetariano', 1, '978-384-475-822-4', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de el detective dormilon', 6, '978-371-343-44-5', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la luna rota', 2, '978-24-109-732-6', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de la jirafa filosofa', 8, '978-135-187-821-4', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de la bruja del microondas', 6, '978-881-471-802-1', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la tetera maldita', 4, '978-417-665-493-8', 10);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Las aventuras de la jirafa filosofa', 2, '978-73-639-213-6', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El diario de el fantasma despistado', 3, '978-239-426-635-3', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La venganza de la momia vegana', 5, '978-286-274-260-4', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Las aventuras de la bruja del microondas', 4, '978-157-905-192-1', 12);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la bruja del microondas', 4, '978-665-669-37-0', 15);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El reino de el fantasma despistado', 6, '978-41-238-51-9', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de el mago jubilado', 3, '978-459-266-968-1', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de el robot melancolico', 3, '978-45-261-613-3', 0);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Las aventuras de el detective dormilon', 5, '978-79-32-561-1', 13);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de el vampiro vegetariano', 3, '978-654-093-167-4', 13);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de la momia vegana', 7, '978-976-319-580-6', 13);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de la sirena alergica', 4, '978-400-414-964-6', 5);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la abuela zombie', 2, '978-415-904-471-2', 0);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de la sirena alergica', 3, '978-149-290-533-1', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Cronicas de la araña contadora', 4, '978-308-857-998-5', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de el vampiro vegetariano', 2, '978-925-635-844-3', 12);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de el profesor chiflado', 8, '978-187-223-409-2', 12);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de la abuela zombie', 3, '978-252-835-042-0', 10);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de el fantasma despistado', 5, '978-664-315-255-6', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El regreso de el mago jubilado', 8, '978-183-003-501-3', 14);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La venganza de el detective dormilon', 8, '978-856-829-409-1', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de la jirafa filosofa', 6, '978-93-516-672-0', 4);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de el robot melancolico', 2, '978-055-916-668-0', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de la abuela zombie', 4, '978-134-294-702-3', 2);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El reino de la sirena alergica', 5, '978-162-918-281-2', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La leyenda de la araña contadora', 4, '978-606-630-243-5', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo la tetera maldita', 7, '978-165-958-695-6', 5);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La venganza de el pirata sordo', 2, '978-786-049-878-7', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La sombra de el dragon tartamudo', 7, '978-755-271-377-2', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El enigma de don pepino', 8, '978-235-630-980-4', 8);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de el robot melancolico', 1, '978-765-226-297-6', 13);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La leyenda de la sirena alergica', 1, '978-135-232-668-0', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de la momia influencer', 6, '978-311-535-546-6', 9);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El ultimo la sirena alergica', 8, '978-162-14-724-7', 3);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('La maldicion de el calcetin perdido', 5, '978-411-990-057-8', 11);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de la momia influencer', 8, '978-616-751-254-0', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El secreto de el vampiro vegetariano', 3, '978-243-59-012-8', 6);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('El misterio de el mago jubilado', 7, '978-832-178-316-4', 1);
INSERT INTO libros (nombre_libro, id_categoria, isbn, cantidad_disponible) VALUES ('Historias de la araña contadora', 1, '978-384-763-082-7', 5);

-- 20 USUARIOS
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Aniceto', 'Pelandrunga', 'anipela0', 'HASH_PLACEHOLDER_0');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Cresencio', 'Pichirilo', 'crepich1', 'HASH_PLACEHOLDER_1');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Ataulfo', 'Pelandrunga', 'atapela2', 'HASH_PLACEHOLDER_2');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Eduvigis', 'Bocafloja', 'eduboca3', 'HASH_PLACEHOLDER_3');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Cresencio', 'Mostachudo', 'cremost4', 'HASH_PLACEHOLDER_4');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Hermelindo', 'Tarambana', 'hertara5', 'HASH_PLACEHOLDER_5');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Romualda', 'Trapichero', 'romtrap6', 'HASH_PLACEHOLDER_6');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Esperanza', 'Trapichero', 'esptrap7', 'HASH_PLACEHOLDER_7');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Visitacion', 'Tarambana', 'vistara8', 'HASH_PLACEHOLDER_8');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Teodulo', 'Sopalanco', 'teosopa9', 'HASH_PLACEHOLDER_9');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Saturnino', 'Mondongo', 'satmond10', 'HASH_PLACEHOLDER_10');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Florentina', 'Galarga', 'flogala11', 'HASH_PLACEHOLDER_11');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Zenobio', 'Tarambana', 'zentara12', 'HASH_PLACEHOLDER_12');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Hilarion', 'Bigotudo', 'hilbigo13', 'HASH_PLACEHOLDER_13');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Filiberto', 'Cucufato', 'filcucu14', 'HASH_PLACEHOLDER_14');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Hermenegildo', 'Berenjeno', 'herbere15', 'HASH_PLACEHOLDER_15');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Petronila', 'Chimichurri', 'petchim16', 'HASH_PLACEHOLDER_16');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Atanasia', 'Pichirilo', 'atapich17', 'HASH_PLACEHOLDER_17');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Petronila', 'Mojigato', 'petmoji18', 'HASH_PLACEHOLDER_18');
INSERT INTO usuarios (nombres, apellidos, usuario, clave_hash) VALUES ('Encarnacion', 'Bululu', 'encbulu19', 'HASH_PLACEHOLDER_19');

-- 50 PRESTAMOS
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (61, 68, '2024-01-23', '2024-01-28', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (40, 28, '2026-10-13', '2026-10-16', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (4, 15, '2024-10-04', '2024-10-07', 1, 7.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (4, 6, '2026-12-05', '2026-12-17', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (6, 9, '2025-10-28', '2025-10-28', 3, 5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (9, 97, '2024-07-23', '2024-07-27', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (5, 97, '2026-02-21', '2026-02-28', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (13, 97, '2025-04-21', '2025-04-28', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (45, 33, '2026-01-10', NULL, 2, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (99, 78, '2025-08-17', '2025-08-18', 2, 10);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (4, 56, '2025-02-17', '2025-02-18', 3, 5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (28, 92, '2026-02-28', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (56, 1, '2025-04-17', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (1, 45, '2025-02-16', '2025-02-28', 2, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (76, 45, '2025-09-27', '2025-09-28', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (90, 30, '2024-03-16', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (63, 90, '2026-02-18', '2026-02-20', 2, 2.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (96, 12, '2024-11-14', '2024-11-19', 2, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (70, 65, '2026-07-06', '2026-07-14', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (77, 97, '2026-10-23', '2026-10-28', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (20, 58, '2026-09-22', '2026-09-28', 3, 2.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (99, 33, '2024-04-19', '2024-04-28', 1, 7.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (65, 25, '2026-05-09', NULL, 3, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (20, 93, '2026-04-05', '2026-04-14', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (31, 42, '2026-05-07', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (85, 14, '2024-07-07', NULL, 2, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (94, 39, '2024-05-14', '2024-05-16', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (50, 60, '2025-01-02', NULL, 2, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (89, 29, '2025-11-17', '2025-11-20', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (95, 52, '2024-12-01', NULL, 2, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (90, 74, '2026-12-19', '2026-12-23', 3, 7.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (84, 100, '2026-12-21', NULL, 3, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (24, 83, '2025-08-04', '2025-08-15', 1, 7.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (54, 32, '2026-07-26', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (33, 55, '2024-08-16', '2024-08-23', 3, 5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (85, 24, '2024-06-21', '2024-06-28', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (33, 70, '2026-03-07', NULL, 1, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (67, 45, '2025-10-04', '2025-10-16', 3, 2.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (3, 82, '2026-06-26', '2026-06-28', 1, 2.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (88, 24, '2024-09-13', NULL, 3, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (46, 82, '2025-05-02', '2025-05-03', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (54, 54, '2026-12-21', '2026-12-26', 1, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (39, 95, '2024-09-13', NULL, 2, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (60, 28, '2024-03-06', NULL, 3, 0.0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (25, 61, '2026-09-21', '2026-09-24', 3, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (82, 53, '2026-05-15', '2026-05-28', 2, 10);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (46, 30, '2025-12-09', '2025-12-16', 1, 7.5);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (62, 1, '2025-12-26', '2025-12-28', 2, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (62, 63, '2026-10-14', '2026-10-20', 2, 0);
INSERT INTO prestamos (id_libro, id_persona, fecha_prestamo, fecha_devolucion, cantidad, multa) VALUES (50, 8, '2025-10-03', NULL, 1, 0.0);