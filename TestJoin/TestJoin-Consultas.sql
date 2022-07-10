use TestJoin;

-- INNER JOIN

-- Listar a los empleados e indicar el nombre del departamento al que pertenecen.
-- FORMA EXPLICITA
SELECT * FROM Empleados INNER JOIN Departamentos ON Empleados.DepartamentoId = Departamentos.Id; -- Sin alias
SELECT * FROM Empleados as E INNER JOIN Departamentos as D ON E.DepartamentoId = D.Id; -- Con alias
-- FORMA IMPLICITA
SELECT * FROM Empleados, Departamentos WHERE Empleados.DepartamentoId = Departamentos.Id;
SELECT * FROM Empleados E, Departamentos D WHERE E.DepartamentoId = D.Id;


-- Muestra solo el nombre del empleado y el nombre del departamento
SELECT E.Nombre, D.Nombre FROM Empleados E JOIN Departamentos D ON E.DepartamentoId = D.Id;
SELECT E.Nombre as 'Empleado', D.Nombre as 'Departamento' FROM Empleados E JOIN Departamentos D ON E.DepartamentoId = D.Id; -- Una vista mejor
