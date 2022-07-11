-- CONSULTAS CON SUBCONSULTAS, INNER JOIN, PRODUCTO CARTESIANO
use empleadosDepartamentos;

-- 13. Obtener un listado de los empleados que trabajan en el departamento de ventas, depósito o limpieza (SIN INNER JOIN)
SELECT * FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE nombre = 'VENTAS' OR nombre = 'DEPOSITO' OR nombre = 'LIMPIEZA'); 

-- 14. Obtener un listado de los empleados indicando el departamento en el que trabajan (SIN INNER JOIN)
SELECT e.dni, e.nombre, e.apellidos, d.nombre AS DEPARTAMENTO FROM empleados e, departamentos d WHERE e.departamento = d.codigo; -- CARTESIANO

-- 15. Obtener un listado de los empleados indicando el departamento en el que trabajan (CON INNER JOIN)
SELECT e.dni, e.nombre, e.apellidos, d.nombre AS DEPARTAMENTO FROM empleados e INNER JOIN departamentos d ON e.departamento = d.codigo;

-- 16. Obtener un listado completo de los empleados incluyendo nombre y apellidos del empleado junto con el nombre y presupuesto de su departamento (SIN INNER JOIN)
SELECT e.*, d.nombre, d.presupuesto FROM empleados e, departamentos d WHERE e.departamento = d.codigo;

-- 17. Obtener un listado completo de los empleados incluyendo nombre y apellidos del empleado junto con el nombre y presupuesto de su departamento (CON INNER JOIN)
SELECT e.*, d.nombre, d.presupuesto FROM empleados e INNER JOIN departamentos d ON e.departamento = d.codigo;

-- 18. Mostrar los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor a $500000 (CON SUBCONSULTA)
SELECT nombre, apellidos FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto > 500000);

-- 19. Mostrar los nombres y apellidos de los empleados que trabajan en departamentos cuyo presupuesto sea mayor a $500000 (SIN SUBCONSULTA)
SELECT e.nombre, e.apellidos FROM empleados e INNER JOIN departamentos d ON e.departamento = d.codigo AND d.presupuesto > 500000;

-- 20. Listar el nombre de los departamentos cuyo presupuesto sea mayor que el presupuesto medio de todos los departamentos
SELECT nombre FROM departamentos WHERE codigo IN (SELECT codigo FROM departamentos WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos));

-- 21. Obtener solo el nombre de los departamentos que tienen mas de 3 empleados (CON SUBCONSULTA)
SELECT nombre FROM departamentos WHERE codigo IN (SELECT departamento FROM empleados GROUP BY departamento HAVING COUNT(*) > 3);

-- 22. Obtener solo el nombre de los departamentos que tienen más de 3 empleados (CON PRODUCTO CARTESIANO)
SELECT d.nombre FROM departamentos d, empleados e WHERE  d.codigo = e.departamento GROUP BY d.nombre HAVING COUNT(*) > 3;

-- 23. Obtener solo el nombre de los departamentos que tienen más de 3 empleados (CON INNER JOIN)
SELECT d.nombre FROM departamentos d INNER JOIN empleados e ON  d.codigo = e.departamento GROUP BY d.nombre HAVING COUNT(*) > 3;