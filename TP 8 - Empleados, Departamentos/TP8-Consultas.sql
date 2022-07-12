-- CONSULTAS

USE empleadosDepartamentos;

-- 1. Mostrar el apellido de todos los empleados
SELECT apellidos FROM empleados;

-- 2. Mostrar los apellidos de los empleados sin repeticiones
SELECT DISTINCT apellidos FROM empleados; -- Con DISTINCT
SELECT apellidos FROM empleados GROUP BY apellidos; -- Con GROUP BY

-- 3. Mostrar los datos de los empleados de apellido DIAZ
SELECT * FROM empleados WHERE apellidos = 'DIAZ';

-- 4. Mostrar los datos de los empleados de apellido CORTES y los de apellido PEREZ
SELECT * FROM empleados WHERE apellidos = 'CORTES' OR apellidos = 'PEREZ'; -- Con OR
SELECT * FROM empleados WHERE apellidos IN ('CORTES', 'PEREZ'); -- Con IN

-- 5. Obtener los datos de los empleados que trabajan en el departamento 12
SELECT * FROM empleados WHERE departamento = 12;

-- 6. Obtener los datos de los empleados que trabajan en el departamento 7 y en el departamento 11
SELECT * FROM empleados WHERE departamento = 7 OR departamento = 11; -- Con OR
SELECT * FROM empleados WHERE departamento IN (7, 11); -- Con IN

-- 7. Obtener los datos de los empleados cuyo apellido comience con P
SELECT * FROM empleados WHERE apellidos LIKE 'P%';

-- 8. Obtener los datos de los empleados cuyo apellido contenga EZ y cuyo nombre termine en A
SELECT * FROM empleados WHERE apellidos LIKE '%EZ%' AND nombre LIKE '%A';

-- 9. Obtener los datos de los empleados cuyo nombre comience con J y termina con A y el apellido comience con P y solo tenga 3 caracteres
SELECT * FROM empleados WHERE nombre LIKE 'J%A' AND apellidos LIKE 'P__';