-- MUESTRA TODAS LAS BASES DE DATOS QUE TENGO
SHOW DATABASES;

-- Si existe la BD 'clase20' la borra
DROP DATABASE IF EXISTS Pruebas;

-- SE CREA LA BASE DE DATOS
CREATE DATABASE Pruebas;

-- USA LA BASE DE DATOS Pruebas
USE Pruebas;

-- SI LA TABLA vendedores EXISTE, LA BORRA
DROP TABLE IF EXISTS vendedores;

-- CREA LA TABLA vendedores
CREATE TABLE vendedores(
	idVendedor INT(11) AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellidoP VARCHAR(60),
    apellidoM VARCHAR(60),
    ciudad VARCHAR(50),
    comision DECIMAL(10,2),
    PRIMARY KEY (idVendedor)
);

-- SI LA TABLA clientes EXISTE, LA BORRA
DROP TABLE IF EXISTS clientes;

-- CREA LA TABLA clientes
CREATE TABLE clientes(
	idCliente INT(11) AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellidoP VARCHAR(60),
    apellidoM VARCHAR(60),
    ciudad VARCHAR(50),
    PRIMARY KEY (idCliente)
);

-- SI LA TABLA pedidos EXISTE, LA BORRA
DROP TABLE IF EXISTS pedidos;

-- CREA LA TABLA clientes
CREATE TABLE pedidos(
	idPedido INT(11) AUTO_INCREMENT,
    idCliente INT(11),
    idVendedor INT(11),
    fecha DATE,
    proveedor VARCHAR(50),
    importe DECIMAL(10,2),
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idVendedor) REFERENCES vendedores(idVendedor)
);

-- MUESTRA LAS TABLAS QUE TENGO
SHOW TABLES;