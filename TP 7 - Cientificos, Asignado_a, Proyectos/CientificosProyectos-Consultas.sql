-- CONSULTAS

USE cientificosproyectos;

-- 1.- Listar todos los proyectos ordenados descendentemente por nombre
SELECT nombre FROM proyecto ORDER BY nombre DESC;

-- 2.- Listar todos los científicos que en su nombre contengan la frase ‘ANA’
SELECT nomApels FROM cientificos WHERE nomApels LIKE'%ANA%';

-- 3.- Mostrar todos los científicos que trabajan en el proyecto REDES INFORMATICAS. Realice la consulta con subconsultas, producto cartesiano e inner join
SELECT nomApels FROM cientificos WHERE dni IN (SELECT cientifico FROM asignado_a WHERE proyecto IN (SELECT id FROM proyecto WHERE nombre = 'REDES INFORMATICAS')); -- SUBCONSULTAS
SELECT nomApels, nombre FROM cientificos, asignado_a, proyecto WHERE cientifico = dni AND proyecto = id AND nombre = 'REDES INFORMATICAS'; -- PRODUCTO CARTESIANO
SELECT nomApels, nombre FROM cientificos INNER JOIN asignado_a ON cientifico = dni INNER JOIN proyecto ON proyecto = id AND nombre = 'REDES INFORMATICAS'; -- INNER JOIN

-- 4.- Mostrar todos los proyectos en los que trabajan el científico ‘CRISTIAN RUEDA’. Realice la consulta con subconsultas, producto cartesiano e inner join
SELECT nombre FROM proyecto WHERE id IN (SELECT proyecto FROM asignado_a WHERE cientifico IN (SELECT dni FROM cientificos WHERE nomApels = 'CRISTIAN RUEDAS')); -- SUBCONSULTAS
SELECT nomApels, nombre FROM proyecto, asignado_a, cientificos WHERE id = proyecto AND dni = cientifico AND nomApels = 'CRISTIAN RUEDAS'; -- PRODUCTO CARTESIANO
SELECT nomApels, nombre FROM proyecto INNER JOIN asignado_a ON id = proyecto INNER JOIN cientificos ON dni = cientifico AND nomApels = 'CRISTIAN RUEDAS';

-- 5.- Mostrar en cuantos proyectos trabaja ‘CRISTIAN RUEDA’.
SELECT COUNT(proyecto) AS CANT_PROYECTOS FROM asignado_a WHERE cientifico IN (SELECT dni FROM cientificos WHERE nomApels = 'CRISTIAN RUEDAS'); -- SUBCONSULTAS
SELECT nomApels, COUNT(proyecto) AS CANT_PROYECTOS FROM cientificos, asignado_a WHERE dni = cientifico AND nomApels = 'CRISTIAN RUEDAS'; -- PRODUCTO CARTESIANO
SELECT nomApels, COUNT(proyecto) AS CANT_PROYECTOS FROM cientificos INNER JOIN asignado_a ON dni = cientifico WHERE nomApels = 'CRISTIAN RUEDAS'; -- INNER JOIN

-- 6.- Obtener un listado de los científicos conjuntamente con los datos del proyecto en el cual trabaja. Realice la consulta con producto cartesiano e inner join
SELECT dni, nomApels, nombre AS proyecto, horas FROM cientificos, proyecto, asignado_a WHERE dni = cientifico AND proyecto = id; -- PRODUCTO CARTESIANO
SELECT dni, nomApels, nombre AS proyecto, horas FROM cientificos INNER JOIN asignado_a ON dni = cientifico INNER JOIN proyecto ON proyecto = id; -- INNER JOIN

-- 7.-Obtener el numero de proyectos al que está asignado cada científico.
SELECT nomApels AS CIENTIFICO, COUNT(proyecto) AS CANT_PROYECTOS FROM cientificos, asignado_a WHERE dni = cientifico GROUP BY cientifico; -- PRODUCTO CARTESIANO
SELECT nomApels AS CIENTIFICO, COUNT(proyecto) AS CANT_PROYECTOS FROM cientificos INNER JOIN asignado_a ON dni = cientifico GROUP BY cientifico; -- INNER JOIN

-- 8.- Obtener el número de científicos al que está asignado cada proyecto.
SELECT nombre AS PROYECTO, COUNT(cientifico) AS CANT_CIENTIFICOS FROM asignado_a, proyecto WHERE proyecto = id GROUP BY proyecto; -- PRODUCTO CARTESIANO 
SELECT nombre AS PROYECTO, COUNT(cientifico) AS CANT_CIENTIFICOS FROM asignado_a INNER JOIN proyecto ON proyecto = id GROUP BY proyecto; -- INNER JOIN 

-- 9.- Obtener el numero de horas de dedicación de cada científico.
SELECT nomApels AS CIENTIFICO, SUM(horas) AS TOTAL_HORAS FROM cientificos, asignado_a, proyecto WHERE dni = cientifico AND proyecto = id GROUP BY cientifico; -- PRODUCTO CARTESIANO
SELECT nomApels AS CIENTIFICO, SUM(horas) AS TOTAL_HORAS FROM cientificos INNER JOIN asignado_a ON dni = cientifico INNER JOIN proyecto ON proyecto = id GROUP BY cientifico; -- INNER JOIN

-- 10.- Obtener el DNI y el nombre de los científicos que se dedican a mas de un proyecto y cuya dedicación media (promedio) a cada proyecto sea superior a las 80 horas.
SELECT dni, nomApels FROM cientificos, asignado_a, proyecto WHERE dni = cientifico AND proyecto = id GROUP BY dni HAVING COUNT(cientifico) > 1 AND AVG(horas) > 80; -- PRODUCTO CARTESIANO
SELECT dni, nomApels FROM cientificos INNER JOIN asignado_a ON dni = cientifico INNER JOIN proyecto ON proyecto = id GROUP BY dni HAVING COUNT(cientifico) > 1 AND AVG(horas) > 80; -- INNER JOIN

-- 11.- Mostrar todos los proyectos que tengan mas horas que el promedio de horas de todos los proyectos
SELECT nombre AS PROYECTO FROM proyecto WHERE horas > (SELECT AVG(horas) FROM proyecto);
