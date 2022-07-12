-- GROUP BY

USE ejemplo;

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