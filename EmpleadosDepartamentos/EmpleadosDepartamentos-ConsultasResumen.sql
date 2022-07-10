-- CONSULTAS RESUMEN

-- 10. Calcular el presupuesto total de la empresa
SELECT SUM(presupuesto) AS TOTAL_PRESUPUESTO FROM departamentos; 

-- 11. Mostrar la cantidad de empleados que hay en cada uno de los departamentos (Solo mostrar el código del departamento y la cantidad de empleados
SELECT departamento, COUNT(*) AS CANTIDAD_EMPLEADOS FROM empleados GROUP BY departamento;

-- 12. Mostrar la cantidad de empleados que hay en cada uno de los departamentos, mostrar el nombre del departamento y la cantidad de empleados
SELECT d.nombre, COUNT(*) AS CANTIDAD_EMPLEADOS FROM empleados e INNER JOIN departamentos d ON e.departamento = d.codigo GROUP BY e.departamento;