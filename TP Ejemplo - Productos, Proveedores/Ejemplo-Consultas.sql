USE ejemplo;

-- 1.

-- 2.

-- 3.

-- 4.

-- 5.

-- 6.

-- 7.

-- 8.

-- 9.

-- 10. 

-- 11.

-- 12.

-- 13.

-- 14. Mostrar los productos ordenados por nombre ascendientemente

-- 15. Mostrar los productos ordenados alfabeticamente por categoria y por precio descendientemente

-- 16. Mostrar los proveedores que no tienen telefono

-- 17. Mostrar los proveedores que tienen numero de telefono

-- FUNCIONES DE AGREAGACION

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

-- SUBCONSULTAS

-- 24. Mostrar todos los productos suministrados por el proveedor FULANO
SELECT * FROM productos WHERE idproveedor IN (SELECT idproveedor FROM proveedores WHERE nombre = 'FULANO');

-- 25. Mostrar los datos del producto mas caro
SELECT * FROM productos WHERE precio IN (SELECT MAX(precio) FROM productos); 

-- 26. Mostrar los datos del producto mas barato
SELECT * FROM productos WHERE precio IN (SELECT MIN(precio) FROM productos); 

-- 27. Mostrar los datos de los proveedores que no proveen ningun producto
SELECT * FROM proveedores WHERE idproveedor NOT IN (SELECT DISTINCT idproveedor FROM productos);

-- GROUP BY

-- 28. Listar todas las categorias que existen en la base de datos (sin repeticiones)
SELECT DISTINCT categoria FROM productos; -- Con DISTINCT
SELECT categoria FROM productos GROUP BY categoria; -- Con GROUP BY

-- 29. Mostrar la cantidad de productos que tenemos para cada categoria
SELECT categoria, COUNT(*) AS CANT_PRODUCTOS FROM productos GROUP BY categoria;

-- 30. Mostrar el precio medio de los productos por categoria
SELECT categoria, AVG(precio) AS PRECIO_MEDIO FROM productos GROUP BY categoria;

-- 31. Mostrar la cantidad de productos suministradas por cada proveedor. Mostrar solo el idproveedor
SELECT idproveedor, COUNT(*) AS CANT_PRODUCTOS FROM productos GROUP BY idproveedor;

-- GROUP BY - HAVING

-- 32. Mostrar las categorias que tengan mas de 4 productos
SELECT categoria, COUNT(*) AS CANT_PRODUCTOS FROM productos GROUP BY categoria HAVING COUNT(*) > 4;

-- 33. Mostrar el idproveedor de los proveedores que provean mas de 5 productos
SELECT idproveedor, COUNT(*) AS CANT_PRODUCTOS FROM productos GROUP BY idproveedor HAVING COUNT(*) > 5; 

-- 34. Mostrar las categorias donde el precio medio sea inferior a $250
SELECT categoria, AVG(precio) AS PRECIO_MEDIO FROM productos GROUP BY categoria HAVING AVG(precio) < 250;

-- PRODUCTO CARTESIANO Y JOIN

-- 35. Mostrar el nombre del producto y el nombre del proveedor que lo suministra
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor; -- PRODUCTO CARTESIANO
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor; -- INNER JOIN

-- 36. Mostrar el nombre del producto y el nombre del proveedor que lo suministra siempre que el producto perenezca a la categoria de CARNES
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR, categoria FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND categoria = 'CARNES'; -- INNER JOIN
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR, categoria FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor AND categoria = 'CARNES'; -- INNER JOIN

-- 37. Mostrar el nombre, precio del producto y nombre de proveedor siempre que el precio sea menor a $500
SELECT productos.nombre AS PRODUCTO, precio, proveedores.nombre AS PROVEEDOR FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND precio < 500; -- PRODUCTO CARTESIANO
SELECT productos.nombre AS PRODUCTO, precio, proveedores.nombre AS PROVEEDOR FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor WHERE precio < 500; -- INNER JOIN

-- 38. Mostrar el nombre del producto, el nombre del proveedor, pero solo aquellos productos que pertenezcan a categorias en las que hay mas de 5 productos
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND categoria IN (SELECT categoria FROM productos GROUP BY categoria HAVING COUNT(*) > 5); -- PRODUCTO CARTESIANO
SELECT productos.nombre AS PRODUCTO, proveedores.nombre AS PROVEEDOR FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor WHERE categoria IN (SELECT categoria FROM productos GROUP BY categoria HAVING COUNT(*) > 5); -- INNER JOIN

-- 39. Mostrar el nombre, precio, categoria del producto y nombre del proveedor siempre que el precio sea inferior al precio medio de todos los productos
SELECT productos.nombre AS PRODUCTO, precio, categoria, proveedores.nombre AS PROVEEDOR FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND precio < (SELECT AVG(precio) FROM productos);
SELECT productos.nombre AS PRODUCTO, precio, categoria, proveedores.nombre AS PROVEEDOR FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor WHERE precio < (SELECT AVG(precio) FROM productos);

-- 40. Mostrar nombre del proveedor y las categorias de productos que suministran
SELECT DISTINCT proveedores.nombre AS PROVEEDOR, categoria FROM proveedores, productos WHERE productos.idproveedor = proveedores.idproveedor; -- Con DISTINCT
SELECT proveedores.nombre AS PROVEEDOR, categoria FROM proveedores, productos WHERE productos.idproveedor = proveedores.idproveedor GROUP BY proveedores.idproveedor, categoria; -- Con GROUP BY