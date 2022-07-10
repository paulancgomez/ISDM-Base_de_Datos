CREATE DATABASE TestJoin;
 
CREATE TABLE Departamentos
(
    Id int,
    Nombre varchar(20)
);
 
CREATE TABLE Empleados
(
    Nombre varchar(20),
    DepartamentoId int
);
 
INSERT INTO Departamentos VALUES(31, 'Ventas');
INSERT INTO Departamentos VALUES(33, 'Ingenieria');
INSERT INTO Departamentos VALUES(34, 'Compras');
INSERT INTO Departamentos VALUES(35, 'Marketing');
 
INSERT INTO Empleados VALUES('Rafael', 31);
INSERT INTO Empleados VALUES('Juan', 33);
INSERT INTO Empleados VALUES('Hernan', 33);
INSERT INTO Empleados VALUES('Roberto', 34);
INSERT INTO Empleados VALUES('Silvio', 34);
INSERT INTO Empleados VALUES('Guillermo', NULL);

SELECT * FROM Empleados;
SELECT * FROM Departamentos;


