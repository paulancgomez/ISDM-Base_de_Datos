-- CONSULTAS
use cientificosproyectos;

-- 1.- Listar todos los proyectos ordenados descendentemente por nombre
SELECT nombre FROM proyecto ORDER BY nombre DESC;

-- 2.- Listar todos los científicos que en su nombre contengan la frase ‘ANA’
SELECT nomApels FROM cientificos WHERE nomApels LIKE '%ANA%';

-- 3.- Mostrar todos los científicos que trabajan en el proyecto REDES INFORMATICAS. Realice la consulta con subconsultas, producto cartesiano e inner join
SELECT nomApels FROM cientificos WHERE dni IN (SELECT cientifico FROM asignado_a WHERE proyecto IN (SELECT id FROM proyecto WHERE nombre = 'REDES INFORMATICAS')); -- SUBCONSULTAS
SELECT nomApels FROM cientificos INNER JOIN asignado_a ON cientifico = dni INNER JOIN proyecto ON proyecto = id AND nombre = 'REDES INFORMATICAS'; -- INNER JOIN

-- 4.- Mostrar todos los proyectos en los que trabajan el científico ‘CRISTIAN RUEDA’. Realice la consulta con subconsultas, producto cartesiano e inner join
SELECT nombre FROM proyecto WHERE id IN (SELECT proyecto FROM asignado_a WHERE cientifico IN (SELECT dni FROM cientificos WHERE nomApels = 'CRISTIAN RUEDAS')); -- SUBCONSULTAS
SELECT nombre FROM proyecto, asignado_a, cientificos WHERE id = proyecto AND dni = cientifico AND nomApels = 'CRISTIAN RUEDAS'; -- PRODUCTO CARTESIANO
SELECT nombre FROM proyecto INNER JOIN asignado_a ON id = proyecto INNER JOIN cientificos ON dni = cientifico AND nomApels = 'CRISTIAN RUEDAS';

-- 5.- Mostrar en cuantos proyectos trabaja ‘CRISTIAN RUEDA’.
SELECT COUNT(proyecto) FROM asignado_a WHERE cientifico IN (SELECT dni FROM cientificos WHERE nomApels = 'CRISTIAN RUEDAS'); 

-- 6.- Obtener un listado de los científicos conjuntamente con los datos del proyecto en el cual trabaja. Realice la consulta con producto cartesiano e inner join
SELECT * FROM cientificos, proyecto, asignado_a WHERE dni=cientifico AND proyecto=id; -- PRODUCTO CARTESIANO
SELECT * FROM cientificos INNER JOIN asignado_a ON dni=cientifico INNER JOIN proyecto ON proyecto=id;

-- 7.-Obtener el numero de proyectos al que está asignado cada científico.
SELECT cientifico, COUNT(proyecto) FROM asignado_a GROUP BY cientifico; -- SUBCONSULTAS
SELECT nomApels AS NOMBRE_CIENTIFICO, COUNT(proyecto) AS CANT_PROYECTOS FROM cientificos INNER JOIN asignado_a ON dni=cientifico GROUP BY cientifico; -- INNER JOIN

-- 8.- Obtener el número de científicos al que está asignado cada proyecto.
SELECT COUNT(cientifico) FROM asignado_a GROUP BY proyecto; -- SUBCONSULTAS
SELECT nombre AS NOMBRE_PROYECTO, COUNT(cientifico) AS CANT_CIENTIFICOS FROM asignado_a INNER JOIN proyecto ON proyecto=id GROUP BY proyecto; -- INNER JOIN 

-- 9.- Obtener el numero de horas de dedicación de cada científico.
SELECT cientifico, SUM(horas) FROM proyecto INNER JOIN asignado_A ON id=proyecto GROUP BY cientifico;

-- 10.- Obtener el DNI y el nombre de los científicos que se dedican a mas de un proyecto y cuya dedicación media (promedio) a cada proyecto sea superior a las 80 horas.
SELECT dni, nomApels FROM cientificos INNER JOIN asignado_a ON cientifico = dni INNER JOIN proyecto ON proyecto=id GROUP BY dni HAVING COUNT(cientifico) > 1 AND AVG(horas) > 80;

-- 11.- Mostrar todos los proyectos que tengan mas horas que el promedio de horas de todos los proyectos
SELECT nombre FROM proyecto WHERE horas > (SELECT AVG(horas) FROM proyecto);