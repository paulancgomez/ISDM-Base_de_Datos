use fabricantesArticulos;

-- 19.- Agregar un nuevo producto para el fabricante cuyo id es 2 y dos productos para el fabricante cuyo id es el 4
INSERT INTO articulos (nombre, precio, fabricante)
VALUES ('G', 6000, 2),
       ('H', 7500, 4),
	   ('I', 7500, 4);

-- 20.- Modifique el nombre del articulo cuyo id es el 8
UPDATE articulos SET nombre = 'OREO' WHERE codigo = 8;

-- 21.- Actualice el precio de los artículos. Debe incrementar su valor en un 15%
UPDATE articulos SET precio = precio * 1.15;

-- 22.- Aplicar un descuento de $50 a todos los artículos cuyo precio sea superior a $800
UPDATE articulos SET precio = precio - 50 WHERE precio > 800;

-- 23.- Agregar un nuevo para el fabricante LENOVO
INSERT INTO articulos (nombre, precio, fabricante)
VALUES ('COMPUTADORA', 23000, (SELECT codigo FROM fabricantes WHERE nombre = 'LENOVO'));