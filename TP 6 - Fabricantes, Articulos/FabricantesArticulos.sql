-- MUESTRA TODAS LAS BASES DE DATOS
SHOW DATABASES;

-- Si existe la BD 'fabricantesArticulos' la borra
DROP DATABASE IF EXISTS fabricantesArticulos;

-- CREO LA BASE DE DATOS TP5
CREATE DATABASE fabricantesArticulos;

-- USAR LA BASE DE DATOS
use fabricantesArticulos;

DROP TABLE IF EXISTS fabricantes;

-- Crear la tabla FABRICANTES
CREATE TABLE fabricantes(
	codigo INT auto_increment,
    nombre NVARCHAR(100),
    PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS articulos;

-- CREO LA TABLA articulos
CREATE TABLE articulos(
	codigo INT auto_increment,
    nombre NVARCHAR(100),
    precio INT,
    fabricante INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (fabricante) REFERENCES fabricantes(codigo)
);

-- Insertar los siguientes datos en la tabla FABRICANTES
INSERT INTO fabricantes(nombre)
VALUES ('WISKAS'),
       ('DOGUI'),
       ('LENOVO'),
       ('TODO MODA'),
       ('CANON');

-- Insertar los siguientes datos en la tabla articulos
INSERT INTO articulos (nombre, precio, fabricante) VALUES
('A', 200, 1),
('B', 300, 2),
('C', 500, 4), 
('D', 500, 2), 
('E', 1000, 3),
('LLLMENLLL', 2000, 5);