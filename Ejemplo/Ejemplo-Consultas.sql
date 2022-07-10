SELECT * FROM productos;
SELECT * FROM proveedores;

SELECT categoria, COUNT(*) FROM productos GROUP BY categoria;

SELECT categoria, AVG(precio) FROM productos GROUP BY categoria;

SELECT idproveedor, COUNT(*) FROM productos GROUP BY idproveedor;

SELECT categoria, COUNT(*) FROM productos GROUP BY categoria HAVING COUNT(*)>4;

SELECT idproveedor FROM productos GROUP BY idproveedor HAVING COUNT(*)>5;

-- PRODUCTO CARTESIANO
SELECT productos.nombre, proveedores.nombre FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor;
SELECT prod.nombre, prov.nombre FROM productos AS prod, proveedores AS prov WHERE prod.idproveedor = prov.idproveedor;

-- INNER JOIN
SELECT productos.nombre, proveedores.nombre FROM productos INNER JOIN proveedores ON productos.idproveedor = proveedores.idproveedor;

-- 36
SELECT productos.nombre, proveedores.nombre FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND categoria = 'CARNES';

-- 37
SELECT productos.nombre, precio, proveedores.nombre AS proveedor FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor AND precio < 500;

SELECT productos.nombre AS producto, categoria, proveedores.nombre AS proveedor FROM productos, proveedores WHERE productos.idproveedor = proveedores.idproveedor GROUP BY categoria HAVING COUNT(*) > 5;