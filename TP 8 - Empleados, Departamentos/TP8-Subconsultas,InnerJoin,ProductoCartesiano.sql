-- CONSULTAS CON SUBCONSULTAS, INNER JOIN, PRODUCTO CARTESIANO

USE empleadosDepartamentos;

-- 12. Mostrar la cantidad de empleados que hay en cada uno de los departamentos, mostrar el nombre del departamento y la cantidad de empleados
SELECT departamentos.nombre, COUNT(*) AS CANTIDAD_EMPLEADOS FROM empleados INNER JOIN departamentos ON departamento = codigo GROUP BY departamento; -- Sin alias
SELECT d.nombre, COUNT(*) AS CANTIDAD_EMPLEADOS FROM empleados e INNER JOIN departamentos d ON e.departamento = d.codigo GROUP BY e.departamento; -- Con alias

-- 13. Obtener un listado de los empleados que trabajan en el departamento de ventas, depósito o limpieza (SIN INNER JOIN)
SELECT * FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE nombre = 'VENTAS' OR nombre = 'DEPOSITO' OR nombre = 'LIMPIEZA'); -- SUBCONSULTA

-- 14. Obtener un listado de los empleados indicando el departamento en el que trabajan (SIN INNER JOIN)
SELECT dni, empleados.nombre, apellidos, departamentos.nombre AS DEPARTAMENTO FROM empleados, departamentos WHERE departamento = codigo; -- PRODUCTO CARTESIANO (Sin alias)
SELECT dni, e.nombre, apellidos, d.nombre AS DEPARTAMENTO FROM empleados e, departamentos d WHERE departamento = codigo; -- PRODUCTO CARTESIANO (Con alias)

-- 15. Obtener un listado de los empleados indicando el departamento en el que trabajan (CON INNER JOIN)
SELECT dni, empleados.nombre, apellidos, departamentos.nombre AS DEPARTAMENTO FROM empleados INNER JOIN departamentos ON departamento = codigo; -- Sin alias
SELECT dni, e.nombre, apellidos, d.nombre AS DEPARTAMENTO FROM empleados e INNER JOIN departamentos d ON departamento = codigo; -- Con alias

-- 16. Obtener un listado completo de los empleados incluyendo nombre y apellidos del empleado junto con el nombre y presupuesto de su departamento (SIN INNER JOIN)
SELECT e.*, d.nombre, d.presupuesto FROM empleados e, departamentos d WHERE e.departamento = d.codigo;

-- 17. Obtener un listado completo de los empleados incluyendo nombre y apellidos del empleado junto con el nombre y presupuesto de su departamento (CON INNER JOIN)
SELECT dni, empleados.nombre, apellidos, departamentos.nombre AS departamento, presupuesto FROM empleados INNER JOIN departamentos ON departamento = codigo; -- Sin alias
SELECT dni, e.nombre, apellidos, d.nombre AS departamento, presupuesto FROM empleados e INNER JOIN departamentos d ON departamento = codigo; -- Con alias

-- 18. Mostrar los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor a $500000 (CON SUBCONSULTA)
SELECT nombre, apellidos FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto > 500000);

-- 19. Mostrar los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor a $500000 (SIN SUBCONSULTA)
SELECT empleados.nombre, apellidos, presupuesto FROM empleados INNER JOIN departamentos ON departamento = codigo AND presupuesto > 500000; -- INNER JOIN
SELECT empleados.nombre, apellidos, presupuesto FROM empleados, departamentos WHERE departamento = codigo AND presupuesto > 500000; -- PRODUCTO CARTESIANO

-- 20. Listar el nombre de los departamentos cuyo presupuesto sea mayor que el presupuesto medio de todos los departamentos
SELECT nombre AS DEPARTAMENTOS_MAYOR_PRECIO_MEDIO FROM departamentos WHERE codigo IN (SELECT codigo FROM departamentos WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos));

-- 21. Obtener solo el nombre de los departamentos que tienen mas de 3 empleados (CON SUBCONSULTA)
SELECT nombre FROM departamentos WHERE codigo IN (SELECT departamento FROM empleados GROUP BY departamento HAVING COUNT(*) > 3);

-- 22. Obtener solo el nombre de los departamentos que tienen más de 3 empleados (CON PRODUCTO CARTESIANO)
SELECT departamentos.nombre FROM departamentos, empleados WHERE codigo = departamento GROUP BY empleados.departamento HAVING COUNT(*) > 3; -- Sin alias
SELECT d.nombre FROM departamentos d, empleados WHERE codigo = departamento GROUP BY departamento HAVING COUNT(*) > 3; -- Con alias

-- 23. Obtener solo el nombre de los departamentos que tienen más de 3 empleados (CON INNER JOIN)
SELECT departamentos.nombre FROM departamentos INNER JOIN empleados ON  codigo = departamento GROUP BY empleados.departamento HAVING COUNT(*) > 3; -- Sin alias
SELECT d.nombre FROM departamentos d INNER JOIN empleados ON codigo = departamento GROUP BY departamento HAVING COUNT(*) > 3; -- Con alias