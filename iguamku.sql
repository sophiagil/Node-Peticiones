-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-08-2022 a las 01:15:28
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iguamku`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

DROP TABLE IF EXISTS `actividades`;
CREATE TABLE IF NOT EXISTS `actividades` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`id_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id_actividad`, `Tipo`, `Descripcion`) VALUES
(1, 'Talleres', 'Modelado Nivel Inicial'),
(2, 'Talleres', 'Modelado Avanzado'),
(3, 'Talleres', 'Escultura'),
(4, 'Seminarios', 'Pastas Ceramicas'),
(5, 'Seminarios', 'Engobes Artesanales'),
(6, 'Seminarios', 'Esmaltes Artesanales'),
(7, 'Seminarios', 'Métodos de Cocción Ansestrales'),
(8, 'Cursos', 'Hornos Ceramicos'),
(9, 'Cursos', 'Piezas Utilitarias'),
(10, 'Cursos', 'Ceramica Sonora'),
(11, 'Cursos', 'Azulejos-Cuerda Seca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

DROP TABLE IF EXISTS `administradores`;
CREATE TABLE IF NOT EXISTS `administradores` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Edad` int(2) NOT NULL,
  `Puesto` varchar(50) NOT NULL,
  `Rol` varchar(50) NOT NULL,
  `Mail` varchar(40) NOT NULL,
  `Celular` varchar(20) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `CP` int(6) NOT NULL,
  `Pais Residencia` varchar(20) NOT NULL,
  `Estado Activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `Nombres`, `Apellidos`, `Edad`, `Puesto`, `Rol`, `Mail`, `Celular`, `Dirección`, `CP`, `Pais Residencia`, `Estado Activo`) VALUES
(1, 'Lorenzo Gabriel', 'Luzziani', 43, 'Web Master Senior', 'Administrador Web', 'luzziani.loren77@gmail.com', '1123418048', 'Las Flores 2147', 1875, 'Argentina', 1),
(2, 'Antonella Leticia', 'Maldonado Farias', 27, 'Diseñador Grafico', 'Editor Frontend', 'antobellacorta@gmail.com', '254821731247', 'Miraflores 4566 T2 P7 D1A', 1007, 'Guatemala', 1),
(3, 'Lucas', 'Sabino Diaz', 31, 'Supervisor de Seguridad Informática', 'Supervisor Sistema', 'lucas.sabino7@live.com', '1177549878', 'Suipacha 234', 1209, 'Argentina', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

DROP TABLE IF EXISTS `contacto`;
CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Mail` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Mensaje` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Edad` int(2) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Profesion` varchar(50) NOT NULL,
  `Mail` varchar(20) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Actividad` varchar(50) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_actividad` (`id_actividad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(40) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Nacionalidad` varchar(40) NOT NULL,
  `Mail` varchar(40) NOT NULL,
  `Celular` varchar(16) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Contrasena` varchar(10) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `Nombres`, `Apellidos`, `Sexo`, `Fecha_nac`, `Nacionalidad`, `Mail`, `Celular`, `Username`, `Contrasena`) VALUES
(1, 'Alejandra ', 'Becerra', 'f', '1979-10-21', 'Argentina', 'alebe16@gmail.com', '1145789855', 'alejandra.becerra', 'laale2367'),
(2, 'Marcos Alberto', 'Redrado', 'm', '1986-03-05', 'Uruguaya', 'redre1121@hotmail.com', '1133410954', 'elcolomarco23', 'bicente73'),
(3, 'Paolo ', 'Di Maria', 'm', '1990-11-30', 'Argentina', 'di.marialang@gmail.com', '22123458877', 'marco.dimaria3', 'elchave8');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id_actividad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
