-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2023 a las 06:45:23
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `usuario_id`, `calificacion`, `fecha`) VALUES
(225, 7, 4, '2023-08-09'),
(226, 7, 4, '2023-09-10'),
(227, 7, 3, '2023-09-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(25, 'unidad1', 'liderazgo y estilos de liderazgo'),
(26, 'unidad2', 'negociacion y manejo de conflictos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos`
--

CREATE TABLE `intentos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `intentos`
--

INSERT INTO `intentos` (`id`, `usuario_id`, `fecha`) VALUES
(1, 7, '2023-08-07'),
(4, 15, '2023-08-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reactivos`
--

CREATE TABLE `reactivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `opcion_1` varchar(200) NOT NULL,
  `opcion_2` varchar(200) NOT NULL,
  `opcion_3` varchar(200) DEFAULT NULL,
  `correcta` varchar(200) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reactivos`
--

INSERT INTO `reactivos` (`id`, `nombre`, `opcion_1`, `opcion_2`, `opcion_3`, `correcta`, `idCategoria`) VALUES
(84, '¿Qué es el liderazgo?', 'a) La capacidad de influir en los demás, guiarlos y motivarlos para alcanzar sus objetivos.', 'b) La habilidad de comunicarse efectivamente con los demás.', 'c) Una posición jerárquica en una estructura organizativa.', 'a) La capacidad de influir en los demás, guiarlos y motivarlos para alcanzar sus objetivos.', 25),
(85, '¿Cuál es una característica clave del liderazgo efectivo?', 'a) Ser autoritario y dictar decisiones sin consultar al equipo.', 'b) Inspirar y motivar a los miembros del equipo.', 'c) Seguir rigurosamente los protocolos establecidos.', 'b) Inspirar y motivar a los miembros del equipo.', 25),
(86, 'La asertividad en el liderazgo se refiere a:', 'a) Comunicarse de manera agresiva y dominante.', 'b) Expresar opiniones y deseos de manera clara y respetuosa.', 'c) Mantener una comunicación abierta con los miembros del equipo.', 'b) Expresar opiniones y deseos de manera clara y respetuosa.', 25),
(87, '¿Qué es la autoridad en el contexto del liderazgo?', 'a) La capacidad de una persona para influir en los demás y guiarlos hacia el fracaso.', 'b) Una posición jerárquica que otorga poder y control en una estructura organizativa.', 'c) La habilidad de comunicarse efectivamente con los demás.', 'b) Una posición jerárquica que otorga poder y control en una estructura organizativa.', 25),
(88, 'El liderazgo efectivo depende únicamente de la autoridad formal.', 'verdadero', 'falso', '', 'falso', 25),
(89, '¿Cuál de los siguientes estilos de liderazgo se caracteriza por una toma de decisiones centralizada y un alto nivel de control por parte del líder?', 'a) Autoritario', 'b) Democrático', 'c) Burocrático', 'a) Autoritario', 25),
(90, 'El estilo de liderazgo democrático fomenta:', 'a) La participación de los miembros del equipo en la toma de decisiones.', 'b) La imposición de decisiones sin consultar al equipo.', 'c) La adhesión estricta a normas y reglas.', 'a) La participación de los miembros del equipo en la toma de decisiones.', 25),
(91, 'El liderazgo burocrático se enfoca en:', 'a) Adaptar el estilo de liderazgo según las necesidades de los miembros del equipo.', 'b) Mantener la estructura y la eficiencia organizativa mediante normas y reglas establecidas.', 'c) Fomentar la comunicación abierta y las opiniones de todos los miembros del equipo.', 'b) Mantener la estructura y la eficiencia organizativa mediante normas y reglas establecidas.', 25),
(92, '¿Cuál de los siguientes estilos de liderazgo permite una mayor colaboración y comunicación abierta?', 'a) Autoritario', 'b) Democrático', 'c) Laissez-faire', 'b) Democrático', 25),
(93, 'El liderazgo laissez-faire se basa en seguir rigurosamente los protocolos establecidos.', 'verdadero', 'falso', '', 'falso', 25),
(94, '¿Cuál de los siguientes estilos de liderazgo se adapta según las necesidades y características de la situación y de los miembros del equipo?', 'a) Autoritario', 'b) Democrático', 'c) Laissez-faire', 'c) Laissez-faire', 25),
(95, '¿Qué es lo que caracteriza al líder autoritario?', 'a) Tomar decisiones en equipo.', 'b) Mantener una comunicación abierta con los miembros del equipo.', 'c) Dictar decisiones sin consultar al equipo.', 'c) Dictar decisiones sin consultar al equipo.', 25),
(96, '¿Cuál de los siguientes estilos de liderazgo se centra en mantener la estructura y eficiencia organizativa?', 'a) Democrático', 'b) Autoritario', 'c) Burocrático', 'c) Burocrático', 25),
(97, ' La asertividad en el liderazgo implica expresar opiniones y deseos de manera clara, directa y respetuosa.', 'verdadero', 'falso', '', 'verdadero', 25),
(98, '¿Cuál de los siguientes estilos de liderazgo fomenta la participación de los miembros del equipo en la toma de decisiones?', 'a) Burocrático', 'b) Autoritario', 'c) Democrático', 'c) Democrático', 25),
(99, '¿Qué es la negociación?', 'a) Un proceso de competencia y conflicto entre las partes involucradas.', 'b) Un proceso de colaboración para llegar a un acuerdo mutuamente beneficioso.', 'c) Un proceso para evitar conflictos en una organización.', 'b) Un proceso de colaboración para llegar a un acuerdo mutuamente beneficioso.', 26),
(100, '¿Cuál es el objetivo principal de la negociación?', 'a) Ganar a toda costa, sin importar los resultados para la otra parte.', 'b) Llegar a un acuerdo que beneficie a ambas partes.', 'c) Impedir que se generen conflictos en la organización.', 'b) Llegar a un acuerdo que beneficie a ambas partes.', 26),
(101, '¿Cuál de los siguientes estilos de negociación busca satisfacer las necesidades de ambas partes y encontrar un terreno común?', 'a) Colaborativo', 'b) Competitivo', 'c) Evitativo', 'a) Colaborativo', 26),
(102, 'La comunicación efectiva no es importante en el proceso de negociación.', 'verdadero', 'falso', '', 'falso', 26),
(103, '¿Qué es el punto de reserva en una negociación?', 'a) El punto en el que ambas partes están satisfechas con el acuerdo.', 'b) El punto máximo que una parte está dispuesta a ceder en una negociación.', 'c) El punto mínimo que una parte está dispuesta a aceptar en una negociación.', 'c) El punto mínimo que una parte está dispuesta a aceptar en una negociación.', 26),
(104, '¿Cuál de los siguientes es un método para resolver conflictos de manera cooperativa?', 'a) Competir y buscar ganar a toda costa.', 'b) Colaborar y buscar soluciones que satisfagan a ambas partes.', 'c) Evitar el conflicto y esperar a que desaparezca.', 'b) Colaborar y buscar soluciones que satisfagan a ambas partes.', 26),
(105, '¿Cuál de los siguientes estilos de manejo de conflictos implica ceder y sacrificar las propias necesidades para satisfacer las necesidades de la otra parte?', 'a) Colaborativo', 'b) Competitivo', 'c) Acomodativo', 'c) Acomodativo', 26),
(106, ' Los conflictos siempre son perjudiciales y deben evitarse. Respuesta correcta: ', 'verdadero', 'falso', '', 'falso', 26),
(107, '¿Qué es la mediación en el manejo de conflictos?', 'a) Un proceso para que una de las partes imponga su decisión sobre la otra.', 'b) Un proceso de colaboración en el que un tercero ayuda a las partes a llegar a un acuerdo.', 'c) Un proceso para evitar la comunicación directa entre las partes en conflicto. Respuesta correcta', 'b) Un proceso de colaboración en el que un tercero ayuda a las partes a llegar a un acuerdo.', 26),
(108, '¿Cuál de los siguientes es un enfoque para resolver conflictos en el que las partes involucradas trabajan juntas para alcanzar una solución mutuamente beneficiosa?', 'a) Negociación integradoraa) Negociación integradora', 'b) Negociación distributiva', 'c) Negociación competitiva', 'a) Negociación integradora', 26),
(109, '¿Cuál de los siguientes es un enfoque para resolver conflictos en el que las partes compiten por obtener la mayor parte del recurso en disputa?', 'a) Negociación colaborativa', 'b) Negociación distributiva', 'c) Negociación integradora', 'b) Negociación distributiva', 26),
(110, 'La negociación colaborativa busca maximizar el valor total creado para ambas partes.', 'verdadero', 'falso', '', 'verdadero', 26),
(111, '¿Qué es la resolución de conflictos?', 'a) El proceso de crear conflictos para resolver problemas en una organización.', 'b) El proceso de identificar y abordar los problemas subyacentes que causan los conflictos.', 'c) El proceso de evitar cualquier tipo de conflicto en una organización. Respuesta correcta: (', 'b) El proceso de identificar y abordar los problemas subyacentes que causan los conflictos.', 26),
(112, '¿Qué es la comunicación asertiva?', 'a) Un estilo de comunicación agresivo y dominante.', 'b) Un estilo de comunicación en el que se expresan opiniones y deseos de manera clara y respetuosa.', 'c) Un estilo de comunicación que evita el conflicto a toda costa.', 'b) Un estilo de comunicación en el que se expresan opiniones y deseos de manera clara y respetuosa', 26),
(113, '¿Cuál de los siguientes estilos de manejo de conflictos implica enfrentar directamente el conflicto y tratar de ganar a toda costa?', 'a) Evitativo', 'b) Colaborativo', 'c) Competitivo', 'c) Competitivo', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `fechaRegisto` date DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `grupo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `username`, `password`, `estatus`, `fechaRegisto`, `apellido`, `grupo`) VALUES
(7, 'ares', 'ares', '123', 1, '0000-00-00', NULL, NULL),
(10, 'admin', 'admin', '231', 1, '0000-00-00', NULL, NULL),
(11, 'usuaeio1', 'usuario1', '123', 1, '0000-00-00', NULL, NULL),
(13, 'jesus', 'jesus', '1234', 1, '0000-00-00', NULL, NULL),
(14, 'dani', 'dani', 'asdf', 1, '0000-00-00', NULL, NULL),
(15, 'ejemplo', 'ejem', 'qwe', 1, '0000-00-00', NULL, NULL),
(16, 'ewe', 'ewe', '345', 1, '0000-00-00', NULL, NULL),
(17, 'santa325', 'santa', 'asd', 1, '0000-00-00', NULL, NULL),
(35, 'Ana Laura', '1529-4236-p', '12345', 1, '0000-00-00', 'j', NULL),
(38, 'Ana Laura', 'ana', 'qazx', 1, '0000-00-00', 'qa', NULL),
(39, 'Ana Laura', 'ama', 'qwer', 1, '0000-00-00', 'aa', NULL),
(40, 'lau', 'lau', '123', 1, '0000-00-00', 'la', NULL),
(42, 'anahi', 'anahi', 'anahi', 1, '0000-00-00', 'vaz', 'ic-31m'),
(43, 'samy', 'samy', 'asd', 1, '0000-00-00', 'miguel', 'ic-31m'),
(44, 'pedro', 'pedro', 'pedro', 1, '0000-00-00', 'sa', 'ic-31m'),
(49, 'am', 'am', 'am', 1, '0000-00-00', 'as', 'IC-31M'),
(50, 'as', 'as', 'as', 1, '0000-00-00', 'as', 'as'),
(51, 'santa', 'san', '1', 1, '0000-00-00', 'Mexica Rivera', 'ic32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `intentos`
--
ALTER TABLE `intentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`fecha`);

--
-- Indices de la tabla `reactivos`
--
ALTER TABLE `reactivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reactivos_categorias1_idx` (`idCategoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `intentos`
--
ALTER TABLE `intentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reactivos`
--
ALTER TABLE `reactivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `intentos`
--
ALTER TABLE `intentos`
  ADD CONSTRAINT `intentos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reactivos`
--
ALTER TABLE `reactivos`
  ADD CONSTRAINT `fk_reactivos_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
