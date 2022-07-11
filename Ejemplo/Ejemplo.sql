-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-07-2022 a las 12:14:37
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemplo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL DEFAULT 'SIN NOMBRE',
  `categoria` varchar(20) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `nombre`, `categoria`, `precio`, `idproveedor`) VALUES
(1, 'CAFE LA MORENITA', 'MERCADERIA', '390.75', 4),
(2, 'TE ROSAMONTE', 'MERCADERIA', '145.00', 5),
(3, 'GASEOSA COCA COLA', 'BEBIDAS', '345.00', 1),
(4, 'GASEOSA FANTA', 'BEBIDAS', '350.45', 2),
(5, 'CERVEZA SALTA', 'BEBIDAS', '250.00', 3),
(6, 'AZUCAR DON JULIAN', 'MERCADERIA', '150.00', 6),
(7, 'JABON LIQUIDO ALA', 'LIMPIEZA', '850.99', 4),
(8, 'DESODORANTE AXE', 'LIMPIEZA', '375.00', 5),
(9, 'ALGODON SOLCITO', 'LIMPIEZA', '123.00', 3),
(10, 'CEREAL 3 ARROYOS', 'CEREALES', '111.99', 4),
(11, 'CEREAL CHOCOLATE', 'CEREALES', '125.75', 2),
(12, 'ASADO SURTIDO', 'CARNES', '1145.00', 6),
(13, 'POLLO', 'CARNES', '245.99', 6),
(14, 'ASADO AMERICANO', 'CARNES', '975.75', 5),
(15, 'CERVEZA CORONA', 'BEBIDAS', '390.50', 3),
(16, 'MANTECA', 'LACTEOS', '270.99', 4),
(17, 'YOGUR ENTERO', 'LACTEOS', '199.99', 4),
(18, 'LECHE ENTERA', 'LACTEOS', '150.00', 5),
(19, 'FOSFOROS 3 PATITOS', 'ALMACEN', '75.00', 3),
(20, 'TRAPO DE PISO', 'LIMPIEZA', '211.99', 4),
(21, 'GALLETAS SALADAS X 3', 'ALMACEN', '225.75', 2),
(22, 'GALLETAS OREO', 'ALMACEN', '195.99', 6),
(23, 'CHORIZO CRIOLLO', 'CARNES', '445.99', 6),
(24, 'MORCILLA', 'CARNES', '375.75', 5),
(25, 'OSOBUCO', 'CARNES', '445.99', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL DEFAULT 'SIN NOMBRE',
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `nombre`, `telefono`) VALUES
(1, 'TARUNGANO', NULL),
(2, 'SUTANO', '154333123'),
(3, 'MENGANO', NULL),
(4, 'PERENGANO', NULL),
(5, 'LUNGANO', '4324566'),
(6, 'FULANO', '155666789'),
(7, 'MAGNO', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
