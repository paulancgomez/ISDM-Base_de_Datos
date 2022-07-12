-- MUESTRA TODAS LAS BASES DE DATOS QUE TENGO
SHOW DATABASES;

-- Si existe la BD 'CientificosProyectos' la borra
DROP DATABASE IF EXISTS CientificosProyectos;

-- SE CREA LA BASE DE DATOS
CREATE DATABASE CientificosProyectos;

-- USA LA BASE DE DATOS CientificosProyectos
USE CientificosProyectos;

-- SI LA TABLA cientificos EXISTE, LA BORRA
DROP TABLE IF EXISTS cientificos;

-- CREA LA TABLA cientificos
CREATE TABLE cientificos(
	dni VARCHAR(8),
    nomApels NVARCHAR(255),
    PRIMARY KEY (dni)
);

-- SI LA TABLA proyecto EXISTE, LA BORRA
DROP TABLE IF EXISTS proyecto;

-- CREA LA TABLA proyecto
CREATE TABLE proyecto(
	id CHAR(4),
    nombre NVARCHAR(255),
    horas INT,
    PRIMARY KEY (id)
);

-- SI LA TABLA asignado_a EXISTE, LA BORRA
DROP TABLE IF EXISTS asignado_a;

-- CREA LA TABLA asignado_a
CREATE TABLE asignado_a(
	cientifico VARCHAR(8),
    proyecto CHAR(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos(dni),
    FOREIGN KEY (proyecto) REFERENCES proyecto(id)
);

-- MUESTRA LAS TABLAS QUE TENGO
SHOW TABLES;

-- INSERTAMOS LOS VALORES A LA TABLA cientificos
INSERT INTO cientificos(dni, nomApels)
VALUES(21000111, "ANA PEREZ"),
	  (22000111, "EMA WATSON"),
      (23000111, "PEDRO PICAPIEDRAS"),
      (24000111, "CRISTIAN RUEDAS");

-- BORRAR LA TABLA proyecto
DROP TABLE proyecto;      

-- INSERTAMOS LOS VALORES A LA TABLA proyecto
INSERT INTO proyecto(id, nombre, horas)
VALUES(1, "REDES INFORMATICAS", 50),
	  (2, "A", 60),
      (3, "B", 70),
      (4, "C", 80),
      (5, "D", 90),
      (6, "E", 100);

-- BORRAR LA TABLA asignado_a
DROP TABLE asignado_a;

-- INSERTAMOS LOS VALORES A LA TABLA asignado_a
INSERT INTO asignado_a(cientifico, proyecto)
VALUES(21000111, 1),
	  (22000111, 2),
      (23000111, 3),
      (24000111, 4),
      (21000111, 5),
      (22000111, 6),
      (23000111, 1),
      (24000111, 2);

-- BORRAR LA TABLA asignado_a
DROP TABLE asignado_a;