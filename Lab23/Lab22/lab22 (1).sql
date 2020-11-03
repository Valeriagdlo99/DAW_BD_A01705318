-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2020 a las 07:38:17
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lab22`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE  PROCEDURE `actualizarLugar` (IN `uid` INT(11), IN `unombre` VARCHAR(100))  BEGIN
	  UPDATE `lugar` SET `lugar` = unombre WHERE `id_lugar` = uid;
END$$

CREATE  PROCEDURE `eliminarIncidente` (IN `ufecha` TIMESTAMP)  BEGIN
	DELETE FROM `incidentes` WHERE `fecha` = ufecha;
END$$

CREATE  PROCEDURE `getFecha` ()  BEGIN
	Select fecha FROM `incidentes`;
END$$

CREATE  PROCEDURE `getIncidente` ()  BEGIN
	  SELECT I.fecha, L.lugar, T.tipo 
   	  FROM incidentes I, lugar L, tipo T
  	  WHERE I.lugar = L.id_lugar AND T.id_tipo = I.tipo
  	  ORDER BY fecha DESC;
END$$

CREATE  PROCEDURE `getLugar` (IN `ulugar` INT(11))  BEGIN
	SELECT * FROM `incidentes` WHERE lugar=ulugar;
END$$

CREATE  PROCEDURE `insertarIncidente` (IN `ulugar` INT(11), IN `utipo` INT(11))  BEGIN 
    INSERT INTO `incidentes` (`fecha`, `lugar`, `tipo`) VALUES (current_timestamp(), ulugar, utipo);
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidente`
--

CREATE TABLE `incidente` (
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `lugar` int(11) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidentes`
--

CREATE TABLE `incidentes` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `lugar` int(11) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `incidentes`
--

INSERT INTO `incidentes` (`fecha`, `lugar`, `tipo`) VALUES
('2020-10-28 01:57:07', 2, 5),
('2020-10-28 01:57:40', 5, 5),
('2020-10-28 02:45:06', 2, 6),
('2020-10-28 02:45:15', 4, 1),
('2020-10-28 02:45:44', 4, 6),
('2020-10-28 02:46:15', 2, 2),
('2020-10-28 02:46:36', 5, 5),
('2020-10-28 02:46:50', 5, 6),
('2020-10-28 02:49:42', 4, 5),
('2020-10-28 02:49:56', 1, 6),
('2020-10-28 02:50:52', 2, 5),
('2020-10-28 04:57:52', 2, 1),
('2020-10-28 05:50:04', 2, 6),
('2020-10-28 05:50:19', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `id_lugar` int(11) NOT NULL,
  `lugar` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`id_lugar`, `lugar`) VALUES
(1, 'Centro turístico'),
(2, ' Laboratorios'),
(3, 'Restaurante'),
(4, 'Centro operativo'),
(5, ' Triceratops'),
(6, 'Dilofosaurios'),
(7, 'Velociraptors'),
(8, 'TRex'),
(9, 'Planicie de los herbívoros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'Falla eléctrica'),
(2, 'Fuga de herbívoro'),
(3, 'Fuga de Velociraptors'),
(4, 'Fuga de TRex'),
(5, ' Robo de ADN'),
(6, 'Auto descompuesto'),
(7, 'Visitantes en zona no autorizad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `lugar` (`lugar`);

--
-- Indices de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD PRIMARY KEY (`fecha`),
  ADD KEY `lugar` (`lugar`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`id_lugar`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
  MODIFY `id_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD CONSTRAINT `lugar` FOREIGN KEY (`lugar`) REFERENCES `lugar` (`id_lugar`),
  ADD CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
