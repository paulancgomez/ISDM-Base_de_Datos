-- SUBCONSULTAS

-- USA LA BASE DE DATOS Pruebas
USE Pruebas;

-- 25. Devolver un listado con todos los pedidos que ha realizado ADELA SALAS DIAZ.
SELECT * FROM pedidos WHERE idCliente IN (SELECT idCliente FROM clientes WHERE nombre = 'ADELA' AND  apellidoP = 'SALAS' AND apellidoM = 'DIAZ');

-- 26. Devolver el número de pedidos en los que ha participado el comercial DANIEL SAÉZ VEGA.
SELECT COUNT(*) FROM pedidos WHERE idVendedor = (SELECT idVendedor FROM vendedores WHERE nombre = 'DANIEL' AND apellidoP = 'SAEZ' AND apellidoM = 'VEGA');

-- 27. Devolver los datos del cliente que realizó el pedido más caro en el año 2019.
SELECT * FROM clientes WHERE idCliente IN (SELECT idCliente FROM pedidos WHERE importe = (SELECT MAX(importe) FROM pedidos WHERE YEAR(fecha) = 2019));

-- 28. Devolver la fecha y la cantidad del pedido de menor valor realizado por el cliente PEPE RUIZ SANTANA.
SELECT fecha, importe FROM pedidos WHERE importe IN (SELECT MIN(importe) FROM pedidos WHERE idCliente IN (SELECT idCliente FROM clientes WHERE nombre = 'PEPE' AND  apellidoP = 'RUIZ' AND apellidoM = 'SANTANA'));

-- 29. Devuelve el pedido más caro que existe en la tabla PEDIDO 
SELECT * FROM pedidos WHERE importe = (SELECT MAX(importe) FROM pedidos); -- SUBCONSULTA
SELECT nombre, apellidoP, fecha, importe FROM pedidos, clientes WHERE pedidos.idCliente = clientes.idCliente AND importe = (SELECT MAX(importe) FROM pedidos); -- PRODUCTO CARTESIANO
SELECT CONCAT (clientes.nombre, " ", clientes.apellidoP) AS CLIENTE, fecha, importe, CONCAT(vendedores.nombre, " ", vendedores.apellidoP) AS PREVENTISTA FROM pedidos, clientes, vendedores WHERE pedidos.idCliente = clientes.idCliente AND pedidos.idVendedor = vendedores.idVendedor AND importe = (SELECT MAX(importe) FROM pedidos); -- EXTRA 

-- 30. Devolver un listado de los clientes que no han realizado ningún pedido.
SELECT * FROM clientes WHERE idCliente NOT IN (SELECT DISTINCT idCliente FROM pedidos);

-- 31. Devolver un listado de los comerciales que no han realizado ningún pedido.
SELECT * FROM vendedores WHERE idVendedor NOT IN (SELECT DISTINCT idVendedor FROM pedidos);

-- 32. Devolver un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT idCliente, nombre, apellidoP, apellidoM FROM clientes WHERE idCliente IN (SELECT DISTINCT idCliente FROM pedidos) ORDER BY apellidoP, apellidoM, nombre;