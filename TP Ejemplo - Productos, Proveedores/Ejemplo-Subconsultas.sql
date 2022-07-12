-- SUBCONSULTAS

USE ejemplo;

-- 24. Mostrar todos los productos suministrados por el proveedor FULANO
SELECT * FROM productos WHERE idproveedor IN (SELECT idproveedor FROM proveedores WHERE nombre = 'FULANO');

-- 25. Mostrar los datos del producto mas caro
SELECT * FROM productos WHERE precio IN (SELECT MAX(precio) FROM productos); 

-- 26. Mostrar los datos del producto mas barato
SELECT * FROM productos WHERE precio IN (SELECT MIN(precio) FROM productos); 

-- 27. Mostrar los datos de los proveedores que no proveen ningun producto
SELECT * FROM proveedores WHERE idproveedor NOT IN (SELECT DISTINCT idproveedor FROM productos);