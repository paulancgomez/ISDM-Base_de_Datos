-- SUBCONSULTAS: Uso las subconsultas cuando tenga que mostrar algo de una tabla que tenga que cumplir alguna condicion en otra tabla. 

USE tp5;

-- 52. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'LENOVO');

-- 53. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN). ????
SELECT * FROM productos WHERE precio IN (SELECT MAX(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'LENOVO'));

-- 54. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM productos WHERE precio IN (SELECT MAX(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'LENOVO'));

-- 55. Lista el nombre del producto más barato del fabricante Hewlett-Packard.  
SELECT nombre FROM productos WHERE precio IN (SELECT MIN(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'HEWLETT-PACKARD'));

-- 56. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo. 
SELECT * FROM productos WHERE precio >= (SELECT MAX(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM  fabricantes WHERE nombre = 'LENOVO'));

-- 57. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS') AND precio > (SELECT AVG(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS'));

-- 58. Listar el nombre y el precio del producto más barato. 
SELECT nombre, precio AS PRODUCTOS_MAS_BARATO FROM productos WHERE precio IN (SELECT MIN(precio) FROM productos); 

-- 59. Listar el nombre y el precio del producto más caro. 
SELECT nombre, precio AS PRODUCTOS_MAS_CARO FROM productos WHERE precio IN (SELECT MAX(precio) FROM productos); 

-- 60. Mostrar el número de productos que tiene el fabricante ASUS.
SELECT COUNT(*) AS CANTIDAD_PRODUCTOS FROM productos WHERE codFabricante IN (SELECT codFabricante FROM  fabricantes WHERE nombre = 'ASUS');

-- 61. Calcula la media del precio de todos los productos del fabricante ASUS. 
SELECT AVG(precio) AS PRECIO_PROMEDIO FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS');

-- 62. Calcula el precio más barato de todos los productos del fabricante ASUS. 
SELECT MIN(precio) AS PRECIO_MINIMO FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS');

-- 63. Calcula el precio más caro de todos los productos del fabricante ASUS. 
SELECT MAX(precio) AS PRECIO_MAXIMO FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS');

-- 64. Calcula la suma de todos los productos del fabricante ASUS. 
SELECT SUM(precio) FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'ASUS');

-- 65. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante CRUCIAL. 
SELECT MAX(precio) AS PRECIO_MAXIMO, MIN(precio) AS PRECIO_MINIMO, AVG(precio) AS PRECIO_MEDIO, COUNT(*) AS CANT_PRODUCTOS FROM productos WHERE codFabricante IN (SELECT codFabricante FROM fabricantes WHERE nombre = 'CRUCIAL');


