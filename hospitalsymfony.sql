-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2023 a las 20:38:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospitalsymfony`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `id` int(11) NOT NULL,
  `nombre_encuesta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `nombre_encuesta`) VALUES
(1, 'Patata'),
(2, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `especialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `especialidad`) VALUES
(1, 'Cardiologia'),
(2, 'Ginecologia'),
(3, 'Urologia'),
(4, 'Neurologia'),
(5, 'Psoaquitria'),
(6, 'Podologia'),
(7, 'Anestesista'),
(8, 'Fisioterapeuta'),
(9, 'Psicologia'),
(10, 'Endocrinologia'),
(11, 'Nutricion y dietetica'),
(12, 'Cirugia infantil'),
(13, 'Cirugia plastica'),
(14, 'Pediatria'),
(15, 'Medico de familia'),
(16, 'Dermatologia'),
(17, 'Neumologia'),
(18, 'Oftalmologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id`, `nombre`, `apellidos`) VALUES
(1, 'Sara', 'Pividal Portillo'),
(2, 'Miguel Angel', 'Aviles Martinez'),
(3, 'Pedro', 'Pastor Molina'),
(4, 'Pablo', 'Gonzalez Hipolito'),
(5, 'Ana', 'Lopez Lopez'),
(6, 'Jia Jie', 'Wo Xia'),
(7, 'Javier', 'Balibrea Pardo'),
(8, 'Ana', 'Alcantara Alcantara'),
(9, 'Pepe', 'Granados Lopez'),
(10, 'Mario', 'Collados Martinez'),
(11, 'Cristina', 'Espinosa Perez'),
(12, 'Pablo', 'M Dolores Martinez'),
(13, 'Guillermo', 'Cuervas Cuevas'),
(14, 'Javier', 'Garcia Garcia'),
(15, 'Irene', 'Soler Soler'),
(16, 'Pablo', 'Navarro Navarro'),
(17, 'Martin', 'Giner Giner'),
(18, 'Pepito', 'Perez Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico_especialidad`
--

CREATE TABLE `medico_especialidad` (
  `medico_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medico_especialidad`
--

INSERT INTO `medico_especialidad` (`medico_id`, `especialidad_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enlace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `item`, `titulo`, `enlace`, `orden`) VALUES
(1, '', 'Encuestas', 'linkEncuestas', 2),
(2, '', 'Citas', 'linkPedirCita', 2),
(3, '', 'Personal', 'app_paginator_medicos', 3),
(4, '', 'Usuario', 'app_login', 4),
(5, '', 'Salir', 'app_logout', 5),
(6, '', 'Inicio', 'app_encuestas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `encuesta_id` int(11) DEFAULT NULL,
  `nombre_pregunta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `encuesta_id`, `nombre_pregunta`, `orden`) VALUES
(1, 1, 'Metodo de preparacion de la patata', 1),
(2, 1, 'Tamano de la patata', 2),
(3, 1, 'Extras para acompanar a la patata', 3),
(4, 2, 'Estado de limpieza de los banos', 1),
(5, 2, 'Como catalogaria el olor de nuestro ambientador?', 2),
(6, 2, 'Que color prefiere que tengan las fregonas?', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `nombre_respuesta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `pregunta_id`, `nombre_respuesta`, `orden`) VALUES
(1, 1, 'Cocida', 1),
(2, 1, 'Frita (Poco)', 2),
(3, 1, 'Asada', 3),
(4, 2, 'Grande', 1),
(5, 2, 'Pequeno', 2),
(6, 2, 'Mediano', 3),
(7, 3, 'Ketchup', 1),
(8, 3, 'Allioli', 2),
(9, 3, 'Mayonesa', 3),
(10, 4, 'Buenos', 1),
(11, 4, 'Ni fu ni fa', 2),
(12, 4, 'Llamen a la policia', 3),
(13, 5, 'Huele a rosas', 1),
(14, 5, 'No se nota', 2),
(15, 5, 'Prefiero la lejia', 3),
(16, 6, 'Rojo', 1),
(17, 6, 'Verde neon', 2),
(18, 6, 'Amarillo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `respuesta_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resultado`
--

INSERT INTO `resultado` (`id`, `pregunta_id`, `respuesta_id`, `usuario_id`, `fecha`, `hora`) VALUES
(1, 1, 1, 5, '2023-02-05', '23:21:24'),
(2, 2, 4, 5, '2023-02-05', '23:21:24'),
(3, 3, 7, 5, '2023-02-05', '23:21:24'),
(4, 1, 2, 5, '2023-02-05', '23:21:30'),
(5, 2, 5, 5, '2023-02-05', '23:21:30'),
(6, 3, 8, 5, '2023-02-05', '23:21:30'),
(7, 1, 1, 5, '2023-02-05', '23:27:52'),
(8, 4, 12, 5, '2023-02-05', '23:36:20'),
(9, 1, 1, 5, '2023-02-06', '19:39:37'),
(10, 2, 5, 5, '2023-02-06', '19:39:37'),
(11, 3, 8, 5, '2023-02-06', '19:39:37'),
(12, 1, 1, 5, '2023-02-08', '19:13:57'),
(13, 2, 4, 5, '2023-02-08', '19:13:57'),
(14, 3, 7, 5, '2023-02-08', '19:13:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(2, 'moflo@gmail.com', '[]', '$2y$13$anlNx0cS4rT1Wrk5wjpeS.2mlk8688eq7wB7XnYeV6Jt3D7zg0U2C'),
(3, 'mofloo@gmail.com', '[]', '$2y$13$nPXeDrAxI3U5IoQnEoGjDOCNAl5HLhgwBr3VJCC2v782ygik/krbW'),
(4, 'moflooo@gmail.com', '[]', '$2y$13$hzT6MXBrdfHda/Mw8Zn4wulv6/eDrcSIL1WLwq0ZnSAK9Xp2CPlZa'),
(5, 'gonzalo@gmail.com', '[]', '$2y$13$4KMdvzeEqL8LWCt1cbRhEOTkgjg/sEzdkukSP9If2opYcboI5P0uu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  ADD PRIMARY KEY (`medico_id`,`especialidad_id`),
  ADD KEY `IDX_11DCCDD4A7FB1C0C` (`medico_id`),
  ADD KEY `IDX_11DCCDD416A490EC` (`especialidad_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AEE0E1F746844BA6` (`encuesta_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6C6EC5EE31A5801E` (`pregunta_id`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B2ED91C31A5801E` (`pregunta_id`),
  ADD KEY `IDX_B2ED91CD9BA57A2` (`respuesta_id`),
  ADD KEY `IDX_B2ED91CDB38439E` (`usuario_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medico_especialidad`
--
ALTER TABLE `medico_especialidad`
  ADD CONSTRAINT `FK_11DCCDD416A490EC` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_11DCCDD4A7FB1C0C` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_AEE0E1F746844BA6` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `FK_6C6EC5EE31A5801E` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `FK_B2ED91C31A5801E` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  ADD CONSTRAINT `FK_B2ED91CD9BA57A2` FOREIGN KEY (`respuesta_id`) REFERENCES `respuesta` (`id`),
  ADD CONSTRAINT `FK_B2ED91CDB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
