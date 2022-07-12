-- INSERCCION DE DATOS

-- USA LA BASE DE DATOS Pruebas
USE Pruebas;

-- INSERTAMOS LOS VALORES A LA TABLA vendedores
INSERT INTO vendedores(nombre, apellidoP, apellidoM, ciudad, comision)
VALUES("MARIA", "PEREZ", "PALACIOS", "SALTA CAPITAL", 5),
	  ("PEDRO", "LOPEZ", "RAMIREZ", "GUEMES", 10),
      ("DANIEL", "SAEZ", "VEGA", "SALTA CAPITAL", 15),
      ("MARCOS", "PAZ", "CESPEDES", "METAN", 20),
      ("ANA", "NERER", NULL, "ANTA", 25),
      ("MIA", "BARRIONUEVO", "PEREZ", "ORAN", 30),
      ("NOEL", "CESPEDES", "LOPEZ", "CERRILLOS", 35),
      ("BELEN", "GUZMAN", NULL, "CACHI", 40),
      ("LOLA", "GOMEZ", "GUZMAN", "LEDESMA", 45),
      ("PEDRO", "PALACIOS", "PAZ", "PERICO", 50);

-- BORRAR LA TABLA vendedores
DROP TABLE vendedores;      

-- INSERTAMOS LOS VALORES A LA TABLA clientes
INSERT INTO clientes(nombre, apellidoP, apellidoM, ciudad)
VALUES("LOLA", "GOMEZ", "GUZMAN", "SALTA CAPITAL"),
      ("ADELA", "SALAS", "DIAZ", "LEDESMA"),
      ("MORENA", "SAEZ", "VEGA", "CERRILLOS"),
      ("ADRIAN", "PAZ", "PEREZ", "METAN"),
      ("ANA", "NERER", NULL, "ANTA"),
      ("HERNAN", "PALACIOS", NULL, "PERICO"),
      ("PEPE", "RUIZ", "SANTANA", "ORAN"),
      ("BELEN", "GUZMAN", NULL, "CACHI"),
      ("PEDRO", "LOPEZ", "RAMIREZ", "GUEMES"),
      ("MARIA", "PEREZ", "PALACIOS", "SALTA CAPITAL");

-- BORRAR LA TABLA clientes
DROP TABLE clientes;

-- INSERTAMOS LOS VALORES A LA TABLA pedidos
INSERT INTO pedidos(idCliente, idVendedor, fecha, proveedor, importe)
VALUES(1, 1, "2019-01-01", "SERVICIOS S.A.", 10),
      (2, 4, "2019-02-01", "ALIMENTAR SRL", 20),
      (5, 2, "2019-03-01", "SERVICIOS S.A.", 30),
      (7, 5, "2020-01-01", "ALIMENTAR SRL", 40),
      (3, 5, "2020-02-01", "SERVICIOS S.A.", 50),
      (7, 3, "2020-03-01", "ALIMENTAR SRL", 60),
      (4, 3, "2021-01-01", "SERVICIOS S.A.", 70),
      (3, 8, "2021-02-01", "SERVICIOS S.A.", 80),
      (1, 1, "2022-01-01", "ALIMENTAR SRL", 100),
      (1, 10, "2022-02-01", "SERVICIOS S.A.", 100);

-- BORRAR LA TABLA pedidos
DROP TABLE pedidos;