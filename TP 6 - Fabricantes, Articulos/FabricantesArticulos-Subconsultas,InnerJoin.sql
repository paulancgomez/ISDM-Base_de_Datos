-- SUBCONSULTAS, INNER JOIN
use fabricantesArticulos;

-- 10.- Mostrar un listado de los artículos con su precio y el nombre de quien lo fabrica (SIN INNER JOIN)
SELECT a.nombre, a.precio, f.nombre FROM articulos a, fabricantes f WHERE a.fabricante = f.codigo; -- CARTESIANO

-- 11.- Mostrar un listado de los artículos con su precio y el nombre de quien lo fabrica (CON INNER JOIN)
SELECT a.nombre, a.precio, f.nombre FROM articulos a INNER JOIN fabricantes f ON a.fabricante = f.codigo;

-- 12.- Mostrar el precio medio de los productos de cada fabricante, mostrando solo el código del fabricante y el precio medio.
SELECT fabricante, AVG(precio) FROM articulos GROUP BY fabricante; 

-- 13.- Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante y el precio medio (SIN INNER JOIN) VARON
SELECT f.nombre, AVG(a.precio) AS PRECIO_MEDIO FROM fabricantes f, articulos a WHERE a.fabricante = f.codigo GROUP BY a.fabricante;

-- 14.- Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante y el precio medio (CON INNER JOIN) MUJER
SELECT f.nombre, AVG(a.precio) AS PRECIO_MEDIO FROM fabricantes f INNER JOIN articulos a ON a.fabricante = f.codigo GROUP BY a.fabricante;

-- 15.- Mostrar los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor a $350 (SIN INNER JOIN)
SELECT nombre FROM fabricantes WHERE codigo IN (SELECT codigo FROM articulos WHERE precio > 350);

-- 16.- Mostrar los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor a $350 (CON INNER JOIN)
SELECT * FROM fabricantes f INNER JOIN articulos a ON a.fabricante = f.codigo GROUP BY a.fabricante HAVING AVG(a.precio) > 350;

-- 17.- Mostrar el nombre y el precio del articulo más barato de la tienda
SELECT nombre, precio FROM articulos WHERE codigo IN (SELECT codigo FROM articulos WHERE precio IN (SELECT MIN(precio) FROM articulos));
SELECT nombre, precio FROM articulos WHERE codigo = (SELECT codigo FROM articulos ORDER BY precio ASC LIMIT 1); -- Porque funciona con = y no con IN??

-- 18.- Mostrar el nombre y el precio del articulo más caro de la tienda
SELECT nombre, precio FROM articulos WHERE codigo IN (SELECT codigo FROM articulos WHERE precio IN (SELECT MAX(precio) FROM articulos));
SELECT nombre, precio FROM articulos WHERE codigo = (SELECT codigo FROM articulos ORDER BY precio DESC LIMIT 1); -- Porque funciona con = y no con IN??