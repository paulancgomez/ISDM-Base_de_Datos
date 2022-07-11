-- MUESTRA TODAS LAS BASES DE DATOS
SHOW DATABASES;

-- SI EXISTE LA BD 'tp5' LA BORRA
DROP DATABASE IF EXISTS tp5;

-- CREO LA BASE DE DATOS TP5
CREATE DATABASE tp5;

-- USAR LA BASE DE DATOS
use tp5;

DROP TABLE IF EXISTS fabricantes;

-- Crear la tabla FABRICANTES
CREATE TABLE fabricantes(
	codFabricante INTEGER,      -- TIPO ENTERO
    nombre VARCHAR(100),        --  CADENA DE TEXTO. TIPO VARCHAR (caracteres variables). nombre va a tener hasta una maximo de 100 caracteres
    PRIMARY KEY (codFabricante) -- Clave Primaria
);

-- Crear la tabla PRODUCTOS
CREATE TABLE productos(
	codProducto INT,             -- TIPO ENTERO
    nombre VARCHAR(100),         -- 
    precio DECIMAL(10,2),        -- TIPO DE DATO DECIMAL DE TAMAÑO 10 CON 2 CIFRAS DECIMALES
    codFabricante INT,           -- TIENE QUE SER EL MISMO TIPO QUE ESTA EN LA TABLA FABRICANTES
    PRIMARY KEY (codProducto),   -- CLAVE PRIMARIA
    FOREIGN KEY (codFabricante) REFERENCES fabricantes(codFabricante)  -- codFabricante ES LA CLAVE FORANEA QUE REFERENCIA A LA TABLA fabricantes Y DENTRO DE LA TABLA fabricantes ESTA REFERENCIANDO AL ATRIBUTO CLAVE codFabricante
);

-- Insertar los siguientes datos en la tabla FABRICANTES
-- FORMA 1
INSERT INTO FABRICANTES(codFabricante, nombre) VALUES (1,'ASUS');
-- FORMA 2
INSERT INTO FABRICANTES VALUES (2,'LENOVO');
-- FORMA 3
INSERT INTO FABRICANTES VALUES
(3,'HEWLETT-PACKARD'),
(4,'SAMSUNG'),
(5,'SEAGATE'),
(6,'CRUCIAL'),
(7,'GIGABYTE'),
(8,'HUAWEI'),
(9,'XIAOMI');

-- Insertar los siguientes datos en la tabla PRODUCTOS
INSERT INTO PRODUCTOS (codProducto, nombre, precio, codFabricante) VALUES
(1, 'DISCO DURO SATA3 1TB', 86.99, 5),
(2, 'MEMORIA RAM DDR4 8GB', 120, 6), 
(3, 'DISCO SSD 1 TB', 150.99, 4), 
(4, 'GEFORCE GTX 1050TI', 185, 7), 
(5, 'GEFORCE GTX 1080 XTREME', 755, 6), 
(6, 'MONITOR 24 LED FULL HD', 202, 1), 
(7, 'MONITOR 27 LED FULL HD', 245.99, 1), 
(8, 'PORTATIL YOGA 520', 559, 2), 
(9, 'PORTATIL IDEAPD 320', 444, 2), 
(10, 'IMPRESORA HP DESKJET 3720', 59.99, 3), 
(11, 'IMPRESORA HP LASERJET PRO M26NW', 180, 3); 

