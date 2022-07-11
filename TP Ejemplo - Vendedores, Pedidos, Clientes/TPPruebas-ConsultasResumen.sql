-- CONSULTAS RESUMEN

-- 19. Calcular la suma de los totales de los pedidos que aparecen en la tabla pedido.
SELECT SUM(importe) AS SUMA_PEDIDOS FROM pedidos;

-- 20. Calcular la el total medio (promedio) de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(importe) AS PROMEDIO_PEDIDOS FROM pedidos;

-- 21. Calcular el número total de vendedores que aparecen en la tabla pedido. Omitir las repeticiones
SELECT COUNT(DISTINCT idVendedor) AS CANT_VENDEDORES FROM pedidos; 

-- 22. Contar el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) AS CANT_CLIENTES FROM clientes; 

-- 23. Mostrar cuál es el total más elevado registrado en la tabla de pedidos.
SELECT MAX(importe) AS IMPORTE_MAXIMO FROM pedidos;

-- 24. Mostrar cuál es el total más bajo registrado en la tabla de pedidos.
SELECT DISTINCT MIN(importe) AS IMPORTE_MINIMO FROM pedidos; -- Si hay dos valores iguales maximos no hace falta el DISTINCT?
