-- FUNCIONES DE AGREAGACION

USE ejemplo;

-- 17. Indiciar cuantos productos hay disponibles
SELECT COUNT(*) AS CANT_PRODUCTOS FROM productos;

-- 18. Mostrar la suma de todos los precios
SELECT SUM(precio) AS SUMA_PRECIOS FROM productos;

-- 19. Indicar la cantidad de productos que disponemos en la categoria LIMPIEZA
SELECT categoria, COUNT(*) AS CANT_PRODUCTOS FROM productos WHERE categoria = 'LIMPIEZA';

-- 20. Indicar el precio mas alto en la tabla productos
SELECT MAX(precio) AS PRECIO_MAXIMO FROM productos; 

-- 21. Indicar el precio mas bajo en la tabla productos
SELECT MIN(precio) AS PRECIO_MAXIMO FROM productos;

-- 22. Indicar el precio medio de los productos
SELECT AVG(precio) AS PRECIO_MEDIO FROM productos;

-- 23. Indicar la cantidad de proveedores que no tienen telefono
SELECT COUNT(*) AS PROV_NO_TELEFONO FROM proveedores WHERE telefono IS NULL;
SELECT COUNT(*) AS PROV_NO_TELEFONO FROM proveedores WHERE telefono IS NOT NULL; -- Con NOT: Si tienen telefono