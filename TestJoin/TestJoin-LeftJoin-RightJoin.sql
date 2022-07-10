-- LEFT JOIN y RIGHT JOIN

-- LEFT JOIN: damos prioridad a la tabla de la izquierda, y buscamos en la tabla derecha. si no existe ninguna coincidencia para alguna de las filas de la tabla de la izquierda, de igual forma todos los resultados de la primera tabla se muestran.
SELECT E.Nombre as 'Empleado', D.Nombre as 'Departamento' FROM Empleados E LEFT JOIN Departamentos D ON E.DepartamentoId = D.Id;

-- RIGHT JOIN: aquí se da prioridad a la tabla de la derecha. Estamos mostrando todas las filas de la tabla de la derecha
SELECT E.Nombre as 'Empleado', D.Nombre as 'Departamento' FROM Empleados E RIGHT JOIN Departamentos D ON E.DepartamentoId = D.Id;

-- FULL OUTER JOIN (o simplemente FULL JOIN) se encarga de mostrar todas las filas de ambas tablas, sin importar que no existan coincidencias (usará NULL como un valor por defecto para dichos casos).
