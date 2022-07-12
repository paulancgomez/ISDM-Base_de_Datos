-- MUESTRA TODAS LAS BASES DE DATOS QUE TENGO
SHOW DATABASES;

-- Si existe la BD 'EmpleadosDepartamentos' la borra
DROP DATABASE IF EXISTS EmpleadosDepartamentos;

-- SE CREA LA BASE DE DATOS
CREATE DATABASE EmpleadosDepartamentos;

-- USA LA BASE DE DATOS EmpleadosDepartamentos
USE EmpleadosDepartamentos;

-- SI LA TABLA departamentos EXISTE, LA BORRA
DROP TABLE IF EXISTS departamentos;

-- CREA LA TABLA departamentos
CREATE TABLE departamentos(
	codigo INT AUTO_INCREMENT,
    nombre NVARCHAR(100),
    presupuesto INT,
    PRIMARY KEY (codigo)
);

-- SI LA TABLA empleados EXISTE, LA BORRA
DROP TABLE IF EXISTS empleados;

-- CREA LA TABLA empleados
CREATE TABLE empleados(
	dni VARCHAR(8) ,
    nombre NVARCHAR(100),
    apellidos NVARCHAR(255),
    departamento INT,
    PRIMARY KEY (dni),
    FOREIGN KEY (departamento) REFERENCES departamentos(codigo)
);

-- MUESTRA LAS TABLAS QUE TENGO
SHOW TABLES;

-- INSERTAMOS LOS VALORES A LA TABLA departamentos
INSERT INTO departamentos(nombre, presupuesto)
VALUES("VENTAS", 100000),
	  ("INFORMATICA", 600000),
      ("DEPOSITO", 300000),
      ("LIMPIEZA", 200000),
      ("A", 400000),
      ("B", 800000),
      ("C", 900000),
      ("D", 700000),
      ("E", 10000000),
      ("F", 250000),
      ("G", 450000),
      ("H", 500000);    

-- INSERTAMOS LOS VALORES A LA TABLA empleados
INSERT INTO empleados(dni, nombre, apellidos, departamento)
VALUES(21000000, "ANA", "PEREZ", 3),
      (22000000, "NOEL", "DIAZ", 1),
      (23000000, "MARTA", "CORTES", 7),
      (24000000, "EMA", "PEREZ", 7),
      (25000000, "CARLOS", "PAZ", 12),
      (26000000, "PABLO", "PEREZ", 1),
      (27000000, "MORENA", "LEON", 1),
      (28000000, "JIMENA", "FLORES", 1),
      (29000000, "JIMENA", "PAZ", 11);

DROP TABLE empleados;
SELECT * FROM empleados;
SELECT * FROM departamentos;
DELETE FROM empleados;
DELETE FROM departamentos;