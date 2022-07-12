USE tp5;

-- INSERTAR DATOS EN LA TABLA fabricantes
-- FORMA 1
INSERT INTO fabricantes(codFabricante, nombre) VALUES (1,'ASUS');
-- FORMA 2
INSERT INTO fabricantes VALUES (2,'LENOVO');
-- FORMA 3
INSERT INTO fabricantes
VALUES (3,'HEWLETT-PACKARD'),
	   (4,'SAMSUNG'),
       (5,'SEAGATE'),
       (6,'CRUCIAL'),
       (7,'GIGABYTE'),
       (8,'HUAWEI'),
       (9,'XIAOMI');

-- INSERTAR DATOS EN LA TABLA productos
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