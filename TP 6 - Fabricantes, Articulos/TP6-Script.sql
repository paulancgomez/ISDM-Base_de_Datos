-- MUESTRA TODAS LAS BASES DE DATOS
SHOW DATABASES;

-- Si existe la BD 'fabricantesArticulos' la borra
DROP DATABASE IF EXISTS fabricantesArticulos;

-- CREO LA BASE DE DATOS fabricantesArticulos
CREATE DATABASE fabricantesArticulos;

-- USAR LA BASE DE DATOS
USE fabricantesArticulos;

DROP TABLE IF EXISTS fabricantes;

-- CREAR LA TABLA fabricantes
CREATE TABLE fabricantes(
	codigo INT AUTO_INCREMENT,
    nombre NVARCHAR(100),
    PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS articulos;

-- CREO LA TABLA articulos
CREATE TABLE articulos(
	codigo INT AUTO_INCREMENT,
    nombre NVARCHAR(100),
    precio INT,
    fabricante INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (fabricante) REFERENCES fabricantes(codigo)
);

-- INSERTAR DATOS EN LA TABLA fabricantes
INSERT INTO fabricantes(nombre)
VALUES ('WISKAS'),
       ('DOGUI'),
       ('LENOVO'),
       ('TODO MODA'),
       ('CANON');

-- INSERTAR DATOS EN LA TABLA articulos
INSERT INTO articulos (nombre, precio, fabricante)
VALUES ('A', 200, 1),
       ('B', 300, 2),
       ('C', 500, 4), 
       ('D', 500, 2), 
       ('E', 1000, 3),
       ('LLLMENLLL', 23000, 5);