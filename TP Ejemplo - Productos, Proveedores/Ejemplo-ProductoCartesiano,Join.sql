-- PRODUCTO CARTESIANO Y JOIN

USE ejemplo;

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