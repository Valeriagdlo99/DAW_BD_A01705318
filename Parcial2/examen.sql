-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2020 a las 19:43:44
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
-- Base de datos: `examen`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE  PROCEDURE `CantZombies` ()  BEGIN
	  SELECT COUNT(*) as cant FROM `zombie`;
END$$

CREATE  PROCEDURE `ConsultarEnfermedadZombie` (IN `uestado` INT(11))  BEGIN
	  SELECT Z.fecha, N.nombre, E.estado 
   	  FROM nombre N, estado E, zombie Z
  	  WHERE Z.nombre = N.id_nombre AND E.id_estado = Z.estado AND Z.estado= uestado
  	  ORDER BY fecha ASC;
END$$

CREATE  PROCEDURE `ConsultarEstado` ()  BEGIN
	  SELECT * FROM `estado`;
END$$

CREATE PROCEDURE `ConsultarNombre` ()  BEGIN
	SELECT * FROM `nombre`;
END$$

CREATE  PROCEDURE `ConsultarZombie` ()  BEGIN
	  SELECT Z.fecha, N.nombre, E.estado 
   	  FROM nombre N, estado E, zombie Z
  	  WHERE Z.nombre = N.id_nombre AND E.id_estado = Z.estado
  	  ORDER BY fecha DESC;
END$$

CREATE  PROCEDURE `InsertarNombre` (IN `unombre` VARCHAR(100))  BEGIN
	INSERT INTO `nombre` (`nombre`) VALUES ( unombre);
END$$

CREATE  PROCEDURE `Insertarzombie` (IN `unombre` INT(11), IN `utipo` INT(11))  BEGIN
	INSERT INTO `zombie` (`nombre`, `estado`, `fecha`) VALUES ( unombre, utipo, current_date());
END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE CantEstdos(
    IN uestado INT(11)
)
BEGIN
	  SELECT estado,COUNT(*) as cant FROM zombie where estado=uestado;
END$$


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(50) COLLATE ucs2_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish2_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'infección'),
(2, 'desorientación'),
(3, 'violencia'),
(4, 'desmayo'),
(5, ' transformación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish2_ci;

--
-- Volcado de datos para la tabla `fecha`
--

INSERT INTO `fecha` (`fecha`) VALUES
('0000-00-00'),
('0000-00-00'),
('2020-10-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre`
--

CREATE TABLE `nombre` (
  `id_nombre` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE ucs2_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish2_ci;

--
-- Volcado de datos para la tabla `nombre`
--

INSERT INTO `nombre` (`id_nombre`, `nombre`) VALUES
(1, 'Valeria Guerra de la O'),
(2, 'Guillermo Carlos Espino Mateos'),
(3, 'Rafa Guerra'),
(5, 'Juanita Lopez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie`
--

CREATE TABLE `zombie` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_spanish2_ci;

--
-- Volcado de datos para la tabla `zombie`
--

INSERT INTO `zombie` (`id`, `nombre`, `estado`, `fecha`) VALUES
(1, 1, 4, '2020-10-28'),
(20201031, 1, 2, '2020-10-28'),
(20201032, 1, 2, '2020-10-28'),
(20201033, 2, 4, '2020-10-28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `nombre`
--
ALTER TABLE `nombre`
  ADD PRIMARY KEY (`id_nombre`);

--
-- Indices de la tabla `zombie`
--
ALTER TABLE `zombie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre_estado` (`nombre`,`estado`),
  ADD KEY `estado` (`estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `nombre`
--
ALTER TABLE `nombre`
  MODIFY `id_nombre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `zombie`
--
ALTER TABLE `zombie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20201034;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `zombie`
--
ALTER TABLE `zombie`
  ADD CONSTRAINT `zombie_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zombie_ibfk_2` FOREIGN KEY (`nombre`) REFERENCES `nombre` (`id_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
