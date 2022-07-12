-- SUBCONSULTAS, INNER JOIN

use fabricantesArticulos;

-- 10.- Mostrar un listado de los artículos con su precio y el nombre de quien lo fabrica (SIN INNER JOIN)
SELECT articulos.nombre, precio, fabricantes.nombre FROM articulos, fabricantes WHERE articulos.fabricante = fabricantes.codigo; -- PRODUCTO CARTESIANO (Sin alias)
SELECT a.nombre, precio, f.nombre FROM articulos a, fabricantes f WHERE a.fabricante = f.codigo; -- PRODUCTO CARTESIANO (Con alias)

-- 11.- Mostrar un listado de los artículos con su precio y el nombre de quien lo fabrica (CON INNER JOIN)
SELECT articulos.nombre, precio, fabricantes.nombre FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo; -- Sin alias
SELECT a.nombre, precio, f.nombre FROM articulos a INNER JOIN fabricantes f ON a.fabricante = f.codigo; -- Con alias

-- 12.- Mostrar el precio medio de los productos de cada fabricante, mostrando solo el código del fabricante y el precio medio.
SELECT fabricante, AVG(precio) AS PRECIO_MEDIO FROM articulos GROUP BY fabricante; 

-- 13.- Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante y el precio medio (SIN INNER JOIN)
SELECT f.nombre, AVG(precio) AS PRECIO_MEDIO FROM fabricantes f, articulos WHERE fabricante = f.codigo GROUP BY fabricante;

-- 14.- Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante y el precio medio (CON INNER JOIN)
SELECT fabricantes.nombre, AVG(precio) AS PRECIO_MEDIO FROM fabricantes INNER JOIN articulos ON fabricante = fabricantes.codigo GROUP BY fabricante; -- Sin alias
SELECT f.nombre, AVG(precio) AS PRECIO_MEDIO FROM fabricantes f INNER JOIN articulos ON fabricante = f.codigo GROUP BY fabricante; -- Con alias

-- 15.- Mostrar los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor a $350 (SIN INNER JOIN)
SELECT nombre AS fabricante FROM fabricantes WHERE codigo IN (SELECT codigo FROM articulos GROUP BY fabricante HAVING AVG(precio) > 350); -- SUBCONSULTAS

-- 16.- Mostrar los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor a $350 (CON INNER JOIN)
SELECT fabricantes.nombre AS FABRICANTE, AVG(precio) AS PRECIO_MEDIO FROM fabricantes INNER JOIN articulos ON fabricantes.codigo = fabricante GROUP BY fabricante HAVING AVG(precio) > 350; -- Sin alias
SELECT f.nombre AS FABRICANTE, AVG(precio) AS PRECIO_MEDIO FROM fabricantes f INNER JOIN articulos ON f.codigo = fabricante GROUP BY fabricante HAVING AVG(precio) > 350; -- Con alias

-- 17.- Mostrar el nombre y el precio del articulo más barato de la tienda
SELECT nombre, precio FROM articulos WHERE codigo IN (SELECT codigo FROM articulos WHERE precio IN (SELECT MIN(precio) FROM articulos));

-- 18.- Mostrar el nombre y el precio del articulo más caro de la tienda
SELECT nombre, precio FROM articulos WHERE codigo IN (SELECT codigo FROM articulos WHERE precio IN (SELECT MAX(precio) FROM articulos));
