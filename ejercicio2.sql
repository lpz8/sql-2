-- Relación tipo 1:1
## PASO 1- Crea una tabla usuarios con:
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

## Añade estos valores a usuarios
INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);

## PASO 2 - Crea una tabla de roles
CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

## Añade estos valores a roles
INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

## PASO 3 - Crea la columna id_rol u la clave foránea
ALTER TABLE usuarios ADD COLUMN id_rol INT;
UPDATE usuarios SET id_rol = 1 WHERE id_usuario IN (1, 2, 3, 4);
UPDATE usuarios SET id_rol = 2 WHERE id_usuario IN (5, 6, 7, 8);
UPDATE usuarios SET id_rol = 3 WHERE id_usuario IN (9, 10, 11, 12);
UPDATE usuarios SET id_rol = 4 WHERE id_usuario IN (13, 14, 15, 16, 17, 18, 19, 20);
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

## PASO 4 JOIN
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol;

-- Relación tipo 1:N (Uno a varios)
## PASO 1- Crea una tabla categorias con:
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

## Añade estos datos a categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

## PASO 2- Añade a la tabla usuarios la columna id_categoria La columna debe ser tipo número
ALTER TABLE usuarios ADD COLUMN id_categoria INT;

## PASO 3- Añade categorías a varios usuarios
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);

## PASO 4 Realiza cuna consulta para ver la unión de usuarios, roles y categorías
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;

-- Relación tipo N:M (muchos a muchos)
## PASO 1 - Crea una tabla intermedia llamada usuarios_categorias con:
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

## PASO 2 - Asocia usuarios a categorías
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

## PASO 3 - Consulta para ver la unión de usuarios, roles, categorías
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN usuarios_categorias ON usuarios.id_usuario = usuarios_categorias.id_usuario
JOIN categorias ON usuarios_categorias.id_categoria = categorias.id_categoria;