-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2022 a las 22:31:26
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
-- Base de datos: `daniestacionamiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `idcaja` int(11) NOT NULL,
  `numeroCaja` int(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_alta` timestamp NULL DEFAULT NULL,
  `fecha_ult_mod` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `cedulanro` int(11) NOT NULL,
  `nombreCliente` varchar(45) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `usuarioRegistra` int(11) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  `id_ultimopago` int(11) DEFAULT NULL,
  `vencimiento_ult_pago` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionados`
--

CREATE TABLE `estacionados` (
  `idvehiculo` int(11) NOT NULL,
  `entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuario_registro` int(11) NOT NULL,
  `tarifa_seleccionada` int(11) NOT NULL,
  `tipoVehiculoid` int(11) NOT NULL,
  `pagoadelant_idpago` int(11) DEFAULT NULL,
  `deja_llave` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `idhistorial` int(11) NOT NULL,
  `entrada` timestamp NULL DEFAULT NULL,
  `salida` timestamp NULL DEFAULT NULL,
  `pagos_idPago` int(11) NOT NULL,
  `usuario_entrada` int(11) DEFAULT NULL,
  `usuario_salida` int(11) NOT NULL,
  `vehiculos_id` int(11) NOT NULL,
  `vehiculos_clientes_idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `codigo_iso` varchar(3) NOT NULL,
  `nombre_moneda` varchar(15) DEFAULT NULL,
  `pais_moneda` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `monto` float NOT NULL,
  `moneda_iso` varchar(3) NOT NULL,
  `idUsuarioCobro` int(11) NOT NULL,
  `fechaCobro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idVehiculo` int(11) NOT NULL,
  `tarifas_idtarifa` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `pagadoHasta` datetime DEFAULT NULL,
  `idcaja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `idtarifa` int(11) NOT NULL,
  `idtipoVehiculo` int(11) NOT NULL,
  `descripcion` varchar(15) DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`idtarifa`, `idtipoVehiculo`, `descripcion`, `precio`) VALUES
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
  `idtipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipoUsuario`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Funcionario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovehiculo`
--

CREATE TABLE `tipovehiculo` (
  `idtipoVehiculo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipovehiculo`
--

INSERT INTO `tipovehiculo` (`idtipoVehiculo`, `descripcion`) VALUES
(1, 'Auto'),
(2, 'Moto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `username` varchar(16) NOT NULL,
  `nombreCompleto` varchar(45) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `idUsuario` int(11) NOT NULL,
  `idtipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`username`, `nombreCompleto`, `password`, `create_time`, `idUsuario`, `idtipoUsuario`) VALUES
('julian2020', 'Julian Veinte Veinte', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-24 14:10:57', 10, 1),
('allahuakbar', 'Mario Peron', 'ad91460b6eaae0784ffdb396bb4e710d', '2022-04-24 14:17:58', 11, 2),
('user69', 'Anonymous', '81dc9bdb52d04dc20036dbd8313ed055', '2022-04-24 15:02:45', 12, 2),
('admin', 'Juan Admin', '21232f297a57a5a743894a0e4a801fc3', '2022-04-24 15:52:45', 13, 1),
('passtesteando', 'asddaddas', 'e10adc3949ba59abbe56e057f20f883e', '2022-04-24 16:05:55', 14, 1),
('leidy20', 'Leidy Perez', '711deb3e60ec7478ed369902d9eb0c6b', '2022-04-24 19:00:25', 15, 2),
('juanamaria', 'Juana Maria de Lara', '01f85fd8ff88b23a662ea27f4e14e868', '2022-04-25 01:38:02', 18, 2),
('enrique8', 'Enrique Octavo', '7815696ecbf1c96e6894b779456d330e', '2022-04-25 02:01:19', 19, 2),
('franco', 'Franco El Gorila', 'f0ca7f3cce9a6e8088597e66d692ab4e', '2022-04-25 04:17:01', 20, 2),
('asdasdssss', 'ssss', '202cb962ac59075b964b07152d234b70', '2022-04-25 05:19:40', 33, 1),
('ss', 'ss', '3691308f2a4c2f6983f2880d32e29c84', '2022-04-25 05:25:37', 35, 1),
('enrique10', 'Jose Enrique', '81dc9bdb52d04dc20036dbd8313ed055', '2022-04-25 13:32:11', 36, 2),
('postman', 'Cartero', '81dc9bdb52d04dc20036dbd8313ed055', '2022-05-09 18:19:31', 37, 1),
('juanpedro66', 'Juan Pedro Gomez', '81dc9bdb52d04dc20036dbd8313ed055', '2022-05-16 15:33:09', 38, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `nroChapa` varchar(8) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `clientes_idcliente` int(11) NOT NULL,
  `tipoVehiculo_id` int(11) NOT NULL,
  `usuario_registro_veh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD UNIQUE KEY `cedulanro_UNIQUE` (`cedulanro`),
  ADD KEY `fk_usuario_registra_cliente` (`usuarioRegistra`),
  ADD KEY `fk_id_ultimo_pago` (`id_ultimopago`);

--
-- Indices de la tabla `estacionados`
--
ALTER TABLE `estacionados`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD KEY `fk_estacionados_usuarios1_idx` (`idusuario_registro`),
  ADD KEY `fk_tarifa_seleccionada_idx` (`tarifa_seleccionada`),
  ADD KEY `fk_idpago_adelantado_idx` (`pagoadelant_idpago`),
  ADD KEY `fk_tipoVehiculo_idx` (`tipoVehiculoid`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`idhistorial`),
  ADD KEY `fk_historial_pagos1_idx` (`pagos_idPago`),
  ADD KEY `fk_historial_vehiculos1_idx` (`vehiculos_id`,`vehiculos_clientes_idcliente`),
  ADD KEY `fk_usuario_salida` (`usuario_salida`),
  ADD KEY `fk_idcliente` (`vehiculos_clientes_idcliente`),
  ADD KEY `fk_usuario_entrada` (`usuario_entrada`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`codigo_iso`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `fk_pagos_tarifas1_idx` (`tarifas_idtarifa`),
  ADD KEY `fk_moneda_iso_idx` (`moneda_iso`),
  ADD KEY `fk_usuario_cobro_idx` (`idUsuarioCobro`),
  ADD KEY `fk_cliente_id_idx` (`idcliente`),
  ADD KEY `fk_idvehiculo_idx` (`idVehiculo`),
  ADD KEY `fk_cajaId_idx` (`idcaja`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`idtarifa`,`idtipoVehiculo`),
  ADD KEY `fk_tarifas_tipoVehiculo1_idx` (`idtipoVehiculo`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipoUsuario`);

--
-- Indices de la tabla `tipovehiculo`
--
ALTER TABLE `tipovehiculo`
  ADD PRIMARY KEY (`idtipoVehiculo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_usuarios_tipoUsuario1_idx` (`idtipoUsuario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `nroChapa_UNIQUE` (`nroChapa`),
  ADD KEY `fk_vehiculos_clientes1_idx` (`clientes_idcliente`),
  ADD KEY `fk_vehiculos_tipoVehiculo1_idx` (`tipoVehiculo_id`),
  ADD KEY `fk_usuario_reg_vehiculo_idx` (`usuario_registro_veh`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `idtarifa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idtipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipovehiculo`
--
ALTER TABLE `tipovehiculo`
  MODIFY `idtipoVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_id_ultimo_pago` FOREIGN KEY (`id_ultimopago`) REFERENCES `pagos` (`idPago`),
  ADD CONSTRAINT `fk_usuario_registra_cliente` FOREIGN KEY (`usuarioRegistra`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `estacionados`
--
ALTER TABLE `estacionados`
  ADD CONSTRAINT `fk_id_vehiculo` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `fk_idusuario_registro` FOREIGN KEY (`idusuario_registro`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `fk_pagoadelantado` FOREIGN KEY (`pagoadelant_idpago`) REFERENCES `pagos` (`idPago`),
  ADD CONSTRAINT `fk_tarifaseleccionada` FOREIGN KEY (`tarifa_seleccionada`) REFERENCES `tarifas` (`idtarifa`),
  ADD CONSTRAINT `fk_tipoVehiculoId` FOREIGN KEY (`tipoVehiculoid`) REFERENCES `vehiculos` (`tipoVehiculo_id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_idcliente` FOREIGN KEY (`vehiculos_clientes_idcliente`) REFERENCES `clientes` (`idcliente`),
  ADD CONSTRAINT `fk_idpagos` FOREIGN KEY (`pagos_idPago`) REFERENCES `pagos` (`idPago`),
  ADD CONSTRAINT `fk_idvehiculo` FOREIGN KEY (`vehiculos_id`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `fk_usuario_entrada` FOREIGN KEY (`usuario_entrada`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `fk_usuario_salida` FOREIGN KEY (`usuario_salida`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD CONSTRAINT `fk_tarifa_tipovehiculo` FOREIGN KEY (`idtipoVehiculo`) REFERENCES `tipovehiculo` (`idtipoVehiculo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
