-- 1.- Mostrar un listado de los artículos que se venden en la tienda
SELECT * FROM articulos;

-- 2.- Mostrar un listado de los artículos con sus respectivos precios
SELECT nombre, precio FROM articulos;

-- 3.- Mostrar los productos cuyo precio sea menor a $250
SELECT nombre FROM articulos WHERE precio < 250;

-- 4.- Mostrar los productos cuyo precio oscile entre los $250 y $1000
SELECT nombre FROM articulos WHERE precio BETWEEN 250 AND 1000;

-- 5.- Calcular el precio medio de los productos de la tienda
SELECT AVG(precio) AS PRECIO_MEDIO FROM articulos;

-- 6.- Obtener el precio promedio de los artículos provistos por cada uno de los proveedores
SELECT AVG(precio) FROM articulos GROUP BY fabricante;

-- 7.- Obtener la cantidad de artículos cuyo precio sea menor a $750
SELECT COUNT(*) FROM articulos WHERE precio < 750;

-- 8.- Obtener el precio promedio de los artículos provistos por el fabricante 5
SELECT AVG(precio) FROM articulos WHERE fabricante = 5;

-- 9.- Obtener el nombre y el precio de los artículos cuyo precio sea mayor a $450 y mostrarlos ordenado por precio descendentemente y por nombre ascendentemente
SELECT nombre, precio FROM articulos WHERE precio > 450 ORDER BY precio DESC, nombre ASC;