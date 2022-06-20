-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2022 a las 17:40:01
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `itakua_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `idcaja` int(11) NOT NULL,
  `numero_caja` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_ult_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `cedulanro` int(11) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `usuario_registra` int(11) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `id_ultimopago` int(11) DEFAULT NULL,
  `vencimiento_ult_pago` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionados`
--

CREATE TABLE `estacionados` (
  `idvehiculo` int(11) NOT NULL,
  `entrada` timestamp NOT NULL DEFAULT current_timestamp(),
  `idusuario_registro` int(11) NOT NULL,
  `tarifa_seleccionada` int(11) NOT NULL,
  `id_tipovehiculo` int(11) NOT NULL,
  `id_pago_adelantado` int(11) DEFAULT NULL,
  `deja_llave` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `idhistorial` int(11) NOT NULL,
  `entrada` timestamp NULL DEFAULT NULL,
  `salida` timestamp NULL DEFAULT NULL,
  `idpago` int(11) NOT NULL,
  `idusuario_entrada` int(11) NOT NULL,
  `idusuario_salida` int(11) NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `codigo_iso` varchar(3) NOT NULL,
  `nombre_moneda` varchar(15) NOT NULL,
  `pais_moneda` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idpago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `moneda_iso` varchar(3) NOT NULL,
  `idusuario_cobro` int(11) NOT NULL,
  `fecha_cobro` timestamp NOT NULL DEFAULT current_timestamp(),
  `idvehiculo` int(11) NOT NULL,
  `idtarifa` int(11) NOT NULL,
  `pagadohasta` datetime DEFAULT NULL,
  `idcaja` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `idtarifa` int(11) NOT NULL,
  `idtipovehiculo` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`idtarifa`, `idtipovehiculo`, `descripcion`, `precio`) VALUES
(1, 1, 'Por Hora Autos', 8000),
(1, 2, 'Por Hora Motos', 1000),
(2, 1, 'Por Día Autos', 10000),
(2, 2, 'Por Día Motos', 5000),
(3, 1, 'Por Semana Auto', 50000),
(3, 2, 'Por Semana Moto', 15000),
(4, 1, 'Por Mes Autos', 180000),
(4, 2, 'Por Mes Motos', 80000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipousuario`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Funcionario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovehiculo`
--

CREATE TABLE `tipovehiculo` (
  `idtipovehiculo` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipovehiculo`
--

INSERT INTO `tipovehiculo` (`idtipovehiculo`, `descripcion`) VALUES
(1, 'Auto'),
(2, 'Moto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nombre_completo` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `idtipousuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `username`, `nombre_completo`, `password`, `create_time`, `idtipousuario`) VALUES
(10, 'julian2020', 'Julian Veinte Veinte', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-24 18:10:57', 1),
(11, 'allahuakbar', 'Mario Peron', 'ad91460b6eaae0784ffdb396bb4e710d', '2022-04-24 18:17:58', 2),
(12, 'user69', 'Anonymous', '81dc9bdb52d04dc20036dbd8313ed055', '2022-04-24 19:02:45', 2),
(13, 'admin', 'Juan Admin', '21232f297a57a5a743894a0e4a801fc3', '2022-04-24 19:52:45', 1),
(14, 'passtesteando', 'asddaddas', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-24 20:05:55', 1),
(15, 'leidy20', 'Leidy Perez', '711deb3e60ec7478ed369902d9eb0c6b', '2022-04-24 23:00:25', 2),
(18, 'juanamaria', 'Juana Maria de Lara', '01f85fd8ff88b23a662ea27f4e14e868', '2022-04-25 05:38:02', 2),
(19, 'enrique8', 'Enrique Octavo', '7815696ecbf1c96e6894b779456d330e', '2022-04-25 06:01:19', 2),
(20, 'franco', 'Franco El Gorila', 'f0ca7f3cce9a6e8088597e66d692ab4e', '2022-04-25 08:17:01', 2),
(33, 'asdasdssss', 'ssss', '202cb962ac59075b964b07152d234b70', '2022-04-25 09:19:40', 1),
(35, 'ss', 'ss', '3691308f2a4c2f6983f2880d32e29c84', '2022-04-25 09:25:37', 1),
(36, 'enrique10', 'Jose Enrique', '81dc9bdb52d04dc20036dbd8313ed055', '2022-04-25 17:32:11', 2),
(37, 'postman', 'Cartero', '81dc9bdb52d04dc20036dbd8313ed055', '2022-05-09 22:19:31', 1),
(38, 'juanpedro66', 'Juan Pedro Gomez', '81dc9bdb52d04dc20036dbd8313ed055', '2022-05-16 19:33:09', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `idvehiculo` int(11) NOT NULL,
  `nro_chapa` varchar(8) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `idcliente` int(11) NOT NULL,
  `idtipovehiculo` int(11) NOT NULL,
  `idusuario_registro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`idcaja`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cedulanro` (`cedulanro`),
  ADD KEY `fk_usuario_registra_cliente` (`usuario_registra`),
  ADD KEY `fk_id_ultimo_pago` (`id_ultimopago`);

--
-- Indices de la tabla `estacionados`
--
ALTER TABLE `estacionados`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD KEY `fk_usuario_registra_estacionado` (`idusuario_registro`),
  ADD KEY `fk_pago_adelantado` (`id_pago_adelantado`),
  ADD KEY `fk_idtarifa` (`tarifa_seleccionada`),
  ADD KEY `fk_tipovehiculo` (`id_tipovehiculo`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`idhistorial`),
  ADD KEY `fk_cliente` (`idcliente`),
  ADD KEY `fk_pago` (`idpago`),
  ADD KEY `fk_usuario_entrada` (`idusuario_entrada`),
  ADD KEY `fk_usuario_salida` (`idusuario_salida`),
  ADD KEY `fk_vehiculo` (`idvehiculo`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`codigo_iso`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `fk_cajas` (`idcaja`),
  ADD KEY `fk_clientes` (`idcliente`),
  ADD KEY `fk_tarifas` (`idtarifa`),
  ADD KEY `fk_usuario_cobra` (`idusuario_cobro`),
  ADD KEY `fk_vehiculos` (`idvehiculo`),
  ADD KEY `fk_moneda` (`moneda_iso`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`idtarifa`,`idtipovehiculo`),
  ADD KEY `fk_idtipovehiculo` (`idtipovehiculo`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipousuario`);

--
-- Indices de la tabla `tipovehiculo`
--
ALTER TABLE `tipovehiculo`
  ADD PRIMARY KEY (`idtipovehiculo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_tipousuario` (`idtipousuario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD KEY `fk_idcliente` (`idcliente`),
  ADD KEY `fk_vehiculotipo` (`idtipovehiculo`),
  ADD KEY `fk_usuario_registra_vehiculo` (`idusuario_registro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_id_ultimo_pago` FOREIGN KEY (`id_ultimopago`) REFERENCES `pagos` (`idpago`),
  ADD CONSTRAINT `fk_usuario_registra_cliente` FOREIGN KEY (`usuario_registra`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `estacionados`
--
ALTER TABLE `estacionados`
  ADD CONSTRAINT `fk_idtarifa` FOREIGN KEY (`tarifa_seleccionada`) REFERENCES `tarifas` (`idtarifa`),
  ADD CONSTRAINT `fk_idvehiculo` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`idvehiculo`),
  ADD CONSTRAINT `fk_pago_adelantado` FOREIGN KEY (`id_pago_adelantado`) REFERENCES `pagos` (`idpago`),
  ADD CONSTRAINT `fk_tipovehiculo` FOREIGN KEY (`id_tipovehiculo`) REFERENCES `tipovehiculo` (`idtipovehiculo`),
  ADD CONSTRAINT `fk_usuario_registra_estacionado` FOREIGN KEY (`idusuario_registro`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_pago` FOREIGN KEY (`idpago`) REFERENCES `pagos` (`idpago`),
  ADD CONSTRAINT `fk_usuario_entrada` FOREIGN KEY (`idusuario_entrada`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `fk_usuario_salida` FOREIGN KEY (`idusuario_salida`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `fk_vehiculo` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`idvehiculo`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_cajas` FOREIGN KEY (`idcaja`) REFERENCES `cajas` (`idcaja`),
  ADD CONSTRAINT `fk_clientes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_moneda` FOREIGN KEY (`moneda_iso`) REFERENCES `monedas` (`codigo_iso`),
  ADD CONSTRAINT `fk_tarifas` FOREIGN KEY (`idtarifa`) REFERENCES `tarifas` (`idtarifa`),
  ADD CONSTRAINT `fk_usuario_cobra` FOREIGN KEY (`idusuario_cobro`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `fk_vehiculos` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`idvehiculo`);

--
-- Filtros para la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD CONSTRAINT `fk_idtipovehiculo` FOREIGN KEY (`idtipovehiculo`) REFERENCES `tipovehiculo` (`idtipovehiculo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_tipousuario` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_usuario_registra_vehiculo` FOREIGN KEY (`idusuario_registro`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `fk_vehiculotipo` FOREIGN KEY (`idtipovehiculo`) REFERENCES `tipovehiculo` (`idtipovehiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
