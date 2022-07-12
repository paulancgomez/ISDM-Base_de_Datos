-- CONSULTAS AGREGAR, ELIMINAR, MODIFICAR

USE empleadosdepartamentos;

-- 24. Agregar un nuevo departamento llamado CALIDAD que cuenta con un presupuesto de $700000 y agregar dos nuevos empleados vinculados al departamento recién creado
INSERT INTO departamentos(nombre, presupuesto)
VALUES ('CALIDAD', 700000);

INSERT INTO empleados(dni, nombre, apellidos, departamento)
VALUES (31000111, 'MARTIN', 'PEREZ', (SELECT codigo FROM departamentos WHERE nombre = 'CALIDAD')),
	   (32000111, 'MARTIN', 'PEREZ', (SELECT codigo FROM departamentos WHERE nombre = 'CALIDAD'));

-- VERIFICAMOS
SELECT * FROM departamentos;
SELECT * FROM empleados;

-- 25. Debido a la crisis económica se ha decidido aplicar un recorte presupuestario del 15% a todos los departamentos
UPDATE departamentos SET presupuesto = presupuesto * 0.85; -- (100% - 15%) / 100 = 85 / 100 = 0.85 

-- 26. Se deben reasignar a todos los empleados del departamento de CALIDAD al departamento de INFORMATICA
UPDATE empleados SET departamento = (SELECT codigo FROM departamentos WHERE nombre = 'INFORMATICA') WHERE departamento IN (SELECT codigo FROM departamentos WHERE nombre = 'CALIDAD');

-- 27. Despedir a todos los empleados del departamento de INFORMATICA
DELETE FROM empleados WHERE departamento = (SELECT codigo FROM departamentos WHERE nombre = 'INFORMATICA');

-- 28. Despedir a todos los empleados que trabajen en departamentos cuyo presupuesto sea mayor a $ 650000
DELETE FROM empleados WHERE departamento IN (SELECT codigo FROM departamentos WHERE presupuesto > 650000);

-- 29. Despedir a todos los empleados de la empresa
DELETE FROM empleados;