-- MUESTRA TODAS LAS BASES DE DATOS
SHOW DATABASES;

-- SI EXISTE LA BD 'tp5' LA BORRA
DROP DATABASE IF EXISTS tp5;

-- CREO LA BASE DE DATOS TP5
CREATE DATABASE tp5;

-- USAR LA BASE DE DATOS
use tp5;

-- SI EXISTE LA TABLA 'fabricantes' LA BORRA
DROP TABLE IF EXISTS fabricantes;

-- CREAR LA TABLA fabricantes
CREATE TABLE fabricantes(
	codFabricante INTEGER,
    nombre VARCHAR(100),
    PRIMARY KEY (codFabricante)
);

-- SI EXISTE LA TABLA 'productos' LA BORRA
DROP TABLE IF EXISTS productos;

-- CREAR LA TABLA productos
CREATE TABLE productos(
	codProducto INT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    codFabricante INT,
    PRIMARY KEY (codProducto),
    FOREIGN KEY (codFabricante) REFERENCES fabricantes(codFabricante)
);