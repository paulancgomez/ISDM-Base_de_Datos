-- CONSULTAS SOBRE UNA TABLA

-- USA LA BASE DE DATOS Pruebas
USE Pruebas;

-- 6. Mostrar un listado de todos los clientes del negocio
SELECT * FROM clientes;

-- 7. Mostar el nombre, los apellidos y la ciudad en la que vive un vendedor
SELECT nombre, apellidoP, apellidoM, ciudad FROM vendedores;

-- 8. Devolver un listado de todos los pedidos que se hayan realizado ordenados por fecha, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM pedidos ORDER BY fecha DESC; -- Ordena la fecha de mayor a menor (fecha reciente es la mayor)

-- 9. Devolver un listado de pedidos, pero solo mostrar los 2 últimos pedidos realizados
SELECT * FROM pedidos ORDER BY fecha DESC LIMIT 2;

-- 10. Devolver un listado de la identificación de los clientes que hayan realizado algún pedido, evitando que los mismos se repitan
SELECT DISTINCT idCliente FROM clientes; -- Con DISTINCT
SELECT idCliente FROM clientes GROUP BY idCliente; -- Con GROUP BY
                                         
-- 11. Generar un listado con todos los pedidos que se realizaron durante el año 2022, cuyo proveedor sea ALIMENTAR SRL
SELECT * FROM pedidos WHERE YEAR(fecha) = 2022 AND proveedor LIKE 'ALIMENTAR SRL'; -- Con YEAR
SELECT * FROM pedidos WHERE fecha LIKE '%2022%' AND proveedor LIKE 'ALIMENTAR SRL'; -- Con LIKE
																				
-- 12. Generar un listado con el nombre y los apellidos de los vendedores que tienen una comisión entre 10% y 20%
SELECT nombre, apellidoP, apellidoM FROM vendedores WHERE comision BETWEEN 10 AND 20; -- Con BETWEEN
SELECT nombre, apellidoP, apellidoM FROM vendedores WHERE comision IN (10, 20); -- Con IN

-- 13. Determinar la comisión más alta que tiene un vendedor
SELECT MAX(comision) AS MAXIMA_COMISION FROM vendedores;

-- 14. Mostrar el nombre y el primer apellido de los clientes que no tengan segundo apellido. Ordenar la salida por apellidos y nombre
SELECT nombre, apellidoP FROM clientes WHERE apellidoM IS NULL ORDER BY apellidoP, apellidoM, nombre;

-- 15. Mostrar el nombre y el primer apellido de los clientes que tengan segundo apellido. Ordenar la salida por apellidos y nombre
SELECT nombre, apellidoP, apellidoM FROM clientes WHERE apellidoM IS NOT NULL ORDER BY apellidoP, apellidoM, nombre;

-- 16. Devolver un listado de los nombres de los clientes que empiezan con A y terminan en N y también los nombres que empiezan con P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM clientes WHERE (nombre LIKE 'A%' AND nombre LIKE '%N') OR (nombre LIKE 'P%') ORDER BY nombre; 

-- 17. Devolver un listado con todos los pedidos que se realizaron en el año 2020 y el proveedor sea SERVICIOS S.A.
SELECT * FROM pedidos WHERE YEAR(fecha) = 2020 AND proveedor = 'SERVICIOS S.A.';

-- 18. Devolver un listado con los nombres de los vendedores que terminan en EL u O. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM vendedores WHERE nombre LIKE '%EL' OR nombre LIKE '%O'; 

-- NOTA: nombre de los clientes que NO empiezan por A
SELECT nombre, apellidoP, apellidoM FROM clientes WHERE nombre NOT LIKE 'A%' ORDER BY nombre;