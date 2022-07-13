-- CONSULTAS SOBRE UNA TABLA

-- 6. Listar los datos de todos los productos que hay en la tienda.
SELECT codProducto, nombre, precio, codFabricante FROM productos; -- FORMA 1
SELECT * FROM productos; -- FORMA 2

-- 7. Listar los nombres y los precios de todos los productos de la tienda.
SELECT nombre, precio FROM productos;

-- 8. Listar el nombre de los productos, el precio en dólares (U$S) y el precio en pesos argentinos. 
SELECT nombre, precio, precio*250 FROM productos;
SELECT nombre, precio AS USD, precio*250 AS PESOS FROM productos; -- Con alias al atributo

-- 9. Listar los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula. (Upper)
SELECT UPPER(nombre), precio AS USD FROM productos;
SELECT UPPER(nombre) AS PRODUCTO, precio AS USD FROM productos; -- Con alias 'PRODUCTO' 

-- 10. Listar los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula. (Lower)
SELECT LOWER(nombre) AS PRODUCTO, precio AS USD FROM productos;

-- 11. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. (round)
SELECT nombre, ROUND(precio) FROM productos;

-- 12. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. (TRUNCATE(X, D) Devuelve el número X, truncado a D decimales.)
SELECT nombre, TRUNCATE(precio, 0) FROM productos;

-- 13. Listar el código de los fabricantes que tienen productos en la tabla producto. 
SELECT codFabricante FROM productos;

-- 14. Listar el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos. 
SELECT DISTINCT codFabricante FROM productos; -- con DISTINC filtra los repetidos

-- 15. Listar los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricantes ORDER BY nombre ASC; -- Ordenados por nombre de manera ascendente (si la primera letra es igual, va por la segunda)
SELECT nombre FROM fabricantes ORDER BY nombre;

-- 16. Listar los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricantes ORDER BY nombre DESC;

-- 17. Listar los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente. 
SELECT nombre, precio FROM productos ORDER BY nombre ASC, precio DESC; -- 1° Ordena por nombre. 2° Ordena por precio (en caso de tener dos nombres iguales entonces pasa a la segunda condicion que me va a ordenar de mayor a menor) 

-- 18. Devolver una lista con las 5 primeras filas de la tabla fabricante. 
SELECT * FROM fabricantes LIMIT 5; -- limitar los resultados a los 5 primeros 

-- 19. Devolver una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. 
SELECT * FROM fabricantes LIMIT 3,2; -- Parto desde la fila 3 (ya que las filas empiezan desde 0) y muestro 2 filas

-- 20. Listar el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM productos ORDER BY precio ASC LIMIT 1;

-- 21. Listar el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;

-- 22. Listar el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2. 
SELECT nombre FROM productos WHERE codFabricante = 2; -- WHERE: donde se cumpla la siguiente condicion

-- 23. Listar el nombre de los productos que tienen un precio menor o igual a 120 U$S. 
SELECT nombre FROM productos WHERE precio <= 120;    -- FROM: de la tabla

-- 24. Listar el nombre de los productos que tienen un precio mayor o igual a 400 U$S.
SELECT nombre FROM productos WHERE precio >= 400;

-- 25. Listar el nombre de los productos que no tienen un precio mayor o igual a 400 U$S.
SELECT nombre FROM productos WHERE NOT precio >= 400;

-- 26. Listar todos los productos que tengan un precio entre 80 U$S y 300 U$S. Sin utilizar el operador BETWEEN.
SELECT nombre, precio FROM productos WHERE precio >= 80 AND precio <=300;

-- 27. Listar todos los productos que tengan un precio entre 60 U$S y 200 U$S. Utilizando el operador BETWEEN.
SELECT nombre, precio FROM productos WHERE precio BETWEEN 60 AND 200; -- BETWEEN: entre

-- 28. Listar todos los productos que tengan un precio mayor que 200 U$S y que el código de fabricante sea igual a 6.
SELECT * FROM productos WHERE precio >= 200 AND codFabricante = 6;

-- 29. Listar todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM productos WHERE codFabricante = 1 OR codFabricante = 3 OR codFabricante = 5;

-- 30. Listar todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM productos WHERE codFabricante IN (1, 3, 5);  -- IN: dentro de

-- 31. Listar el nombre y el precio de los productos en centavos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame centavos.
SELECT nombre, TRUNCATE(precio*100,0) AS centavos FROM productos; 

-- 32. Listar los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT * FROM fabricantes WHERE nombre LIKE 'S%'; -- LIKE: comiece (%S), contenga (%S%), termine (S%)

-- 33. Listar los nombres de los fabricantes cuyo nombre termine por la vocal E.
SELECT * FROM fabricantes WHERE nombre LIKE '%E';

-- 34. Listar los nombres de los fabricantes cuyo nombre contenga el carácter W. 
SELECT * FROM fabricantes WHERE nombre LIKE '%W%';

-- 35. Listar los nombres de los fabricantes cuyo nombre sea de 4 caracteres. 
SELECT nombre FROM fabricantes WHERE nombre LIKE '____';
SELECT nombre FROM fabricantes WHERE LENGTH(nombre) = 4;  -- LENGHT: contar los caracteres de una cadena

-- 36. Devolver una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM productos WHERE nombre LIKE '%Portatil%';

-- 37. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 U$S.
SELECT nombre FROM productos WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 38. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180 U$S. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM productos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;