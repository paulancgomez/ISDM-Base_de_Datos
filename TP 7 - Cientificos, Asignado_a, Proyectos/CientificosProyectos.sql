-- MUESTRA TODAS LAS BASES DE DATOS QUE TENGO
SHOW DATABASES;

-- Si existe la BD 'clase20' la borra
DROP DATABASE IF EXISTS CientificosProyectos;

-- SE CREA LA BASE DE DATOS
CREATE DATABASE CientificosProyectos;

-- USA LA BASE DE DATOS Pruebas
USE CientificosProyectos;

-- SI LA TABLA vendedores EXISTE, LA BORRA
DROP TABLE IF EXISTS cientificos;

-- CREA LA TABLA vendedores
CREATE TABLE cientificos(
	dni VARCHAR(8),
    nomApels NVARCHAR(255),
    PRIMARY KEY (dni)
);

-- SI LA TABLA clientes EXISTE, LA BORRA
DROP TABLE IF EXISTS proyecto;

-- CREA LA TABLA clientes
CREATE TABLE proyecto(
	id INT AUTO_INCREMENT,
    nombre NVARCHAR(255),
    horas INT,
    PRIMARY KEY (id)
);

-- SI LA TABLA pedidos EXISTE, LA BORRA
DROP TABLE IF EXISTS pedidos;

-- CREA LA TABLA clientes
CREATE TABLE asignado_a(
	cientifico VARCHAR(8),
    proyecto INT,
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos(dni),
    FOREIGN KEY (proyecto) REFERENCES proyecto(id)
);

-- MUESTRA LAS TABLAS QUE TENGO
SHOW TABLES;

-- INSERTAMOS LOS VALORES A LA TABLA vendedores
INSERT INTO cientificos(dni, nomApels)
VALUES(21000111, "ANA PEREZ"),
	  (22000111, "EMA WATSON"),
      (23000111, "PEDRO PICAPIEDRAS"),
      (24000111, "CRISTIAN RUEDAS");

-- BORRAR LA TABLA vendedores
DROP TABLE proyecto;      

-- INSERTAMOS LOS VALORES A LA TABLA clientes
INSERT INTO proyecto(nombre, horas)
VALUES("REDES INFORMATICAS", 50),
	  ("A", 60),
      ("B", 70),
      ("C", 80),
      ("D", 90),
      ("E", 100);

-- BORRAR LA TABLA clientes
DROP TABLE asignado_a;

-- INSERTAMOS LOS VALORES A LA TABLA pedidos
INSERT INTO asignado_a(cientifico, proyecto)
VALUES(21000111, 1),
	  (22000111, 2),
      (23000111, 3),
      (24000111, 4),
      (21000111, 5),
      (22000111, 6),
      (23000111, 1),
      (24000111, 2);

-- BORRAR LA TABLA pedidos
DROP TABLE pedidos;