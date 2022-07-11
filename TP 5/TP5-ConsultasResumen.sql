-- CONSULTAS DE RESUMEN (FUNCIONES DE AGREGACION): Conteo, Maximo, Minimo, Suma, Promedio

-- 39. Contar el número total de productos que hay en la tabla productos.
SELECT COUNT(*) FROM productos; -- IMPORTANTE: La idea es contar sobre un atributo clave (porque el atributo clave no va a tener valores nulos). Valores nulos no cuenta.
SELECT COUNT(*) AS CANTIDAD FROM productos; -- con alias

-- 40. Contar el número total de fabricantes que hay en la tabla fabricante. 
SELECT COUNT(*) AS CANTIDAD FROM fabricantes;

-- 41. Contar el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codFabricante) AS CANTIDAD FROM productos; -- DISTINTCT: los distintos codFabricante 

-- 42. Calcular el precio medio (precio promedio) de todos los productos.
SELECT AVG(precio) AS PROMEDIO FROM productos; -- AVG: promedio. Se aplica sobre campos numericos. No puedo aplicarlos sobre cadenas de caracteres

-- 43. Mostrar el precio más barato de todos los productos.
SELECT MIN(precio) FROM productos;   -- MIN: funcion para calcular el minimo

-- 44. Mostrar el precio más caro de todos los productos.
SELECT MAX(precio) FROM productos;   -- MAX: funcion para calcular el maximo

-- 45. Calcular la suma de los precios de todos los productos.
SELECT SUM(precio) FROM productos;   -- (SUMA TOTAL) SUM: funcion para sumar. Tambien puedo aplicar sobre cadenas de texto: nombre minimo (Cerca de la A) Maximo(cerca de la Z))

-- 46. Mostrar el número de productos que tiene el fabricante 1. 
SELECT COUNT(*) FROM productos WHERE codFabricante = 1;

-- 47. Calcular la media del precio de todos los productos del fabricante 1. 
SELECT AVG(precio) FROM productos WHERE codFabricante = 1;

-- 48. Calcular el precio más barato de todos los productos del fabricante 1. 
SELECT MIN(precio) FROM productos WHERE codFabricante = 1;

-- 49. Mostrar el precio más caro de todos los productos del fabricante 1. 
SELECT MAX(precio) FROM productos WHERE codFabricante = 1;

-- 50. Calcula la suma de todos los productos del fabricante 1. 
SELECT SUM(precio) FROM productos WHERE codFabricante = 1;

-- 51. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante 6. 
SELECT MAX(precio) AS PRECIO_MAX, MIN(precio) AS PRECIO_MIN, AVG(precio) AS PRECIO_MEDIO, COUNT(*) AS TOTAL_PROD FROM productos WHERE codFabricante = 6;
