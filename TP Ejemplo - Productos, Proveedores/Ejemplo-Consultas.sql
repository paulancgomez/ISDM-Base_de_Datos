-- CONSULTAS

USE ejemplo;

-- 1. Listar todos los datos de los proveedores
SELECT * FROM proveedores;

-- 2. Listar el nombre, la categoria y el precio de los productos
SELECT nombre, categoria, precio FROM productos;

-- 3. Mostrar todas las categorias de productos que existen
SELECT categoria FROM productos;

-- 4. Mostrar todas las categorias de productos que existen, pero sin repeticiones
SELECT DISTINCT categoria FROM productos; -- Con DISTINCT 
SELECT categoria FROM productos GROUP BY categoria; -- Con DISTINCT 

-- 5. Mostrar todos los productos suministrados por el proveedor cuyo id es el 5
SELECT * FROM productos WHERE idproveedor = 5;

-- 5.1. Mostrar todos los productos sumnistradors por el proveedor LUNGANO
SELECT * FROM productos WHERE idproveedor IN (SELECT idproveedor FROM proveedores WHERE nombre LIKE 'LUNGANO');

-- 6. Mostrar todos los productos de la categoria CARNES
SELECT * FROM productos WHERE categoria LIKE 'CARNES';

-- 7. Mostrar todos los productos cuyo precio sea superior a los $500
SELECT * FROM productos WHERE precio > 500;

-- 8. Mostrar todos los productos que tengan un precio inferior a los 150 
SELECT * FROM productos WHERE precio > 150;

-- 9. Mostrar los productos que tengan un precio mayor o igual a $200 y menor o igual a $350
SELECT * FROM productos WHERE precio BETWEEN 200 AND 350; -- Con BETWEEN
SELECT * FROM productos WHERE precio >= 200 AND precio <= 350; -- Con AND

-- 10. Mostrar los productos que contengan la cadena 'TE'
SELECT * FROM productos WHERE nombre LIKE '%TE%';

-- 11. Mostrar los proveedores cuyo nombre termine en 'GANO'
SELECT * FROM proveedores WHERE nombre LIKE '%GANO';

-- 12. Mostrar los proveedores cuyo nombre comience con 'M'
SELECT * FROM proveedores WHERE nombre LIKE 'M%';

-- 13. Mostrar los productos que pertenezcan a la categoria LACTEOS, CARNE O LIMPIEZA (IN)
SELECT * FROM productos WHERE categoria IN ('LACTEOS', 'CARNE', 'LIMPIEZA'); -- Con IN
SELECT * FROM productos WHERE categoria = 'LACTEOS' OR categoria = 'CARNE' OR categoria = 'LIMPIEZA'; -- Con IN

-- 14. Mostrar los productos ordenados por nombre ascendientemente
SELECT * FROM productos ORDER BY nombre ASC;
SELECT * FROM productos ORDER BY nombre; -- Por defecto es ASC

-- 15. Mostrar los productos ordenados alfabeticamente por categoria y por precio descendientemente
SELECT * FROM productos ORDER BY categoria ASC, precio DESC;

-- 16. Mostrar los proveedores que no tienen telefono
SELECT * FROM proveedores WHERE telefono IS NULL;

-- 17. Mostrar los proveedores que tienen numero de telefono
SELECT * FROM proveedores WHERE telefono IS NOT NULL;