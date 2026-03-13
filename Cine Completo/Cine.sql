-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 12:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cine`
--

-- --------------------------------------------------------

--
-- Table structure for table `butacas`
--

CREATE TABLE `butacas` (
  `idbutaca` int(11) NOT NULL,
  `idsala` int(11) NOT NULL,
  `tipobutaca` varchar(50) NOT NULL,
  `fila` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  `importe` float NOT NULL,
  `idusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `butacas`
--

INSERT INTO `butacas` (`idbutaca`, `idsala`, `tipobutaca`, `fila`, `asiento`, `importe`, `idusuario`) VALUES
(1, 1, 'Normal', 1, 1, 5, NULL),
(2, 1, 'Normal', 1, 2, 5, 21),
(5, 1, 'Normal', 1, 5, 5, NULL),
(6, 1, 'Normal', 1, 6, 5, NULL),
(7, 1, 'Normal', 1, 7, 5, NULL),
(8, 1, 'Normal', 1, 8, 5, NULL),
(9, 1, 'Normal', 1, 9, 5, NULL),
(10, 1, 'Normal', 1, 10, 5, NULL),
(11, 1, 'Normal', 1, 11, 5, NULL),
(12, 1, 'Normal', 1, 12, 5, NULL),
(13, 1, 'Normal', 2, 1, 5, NULL),
(14, 1, 'Normal', 2, 2, 5, NULL),
(15, 1, 'Normal', 2, 3, 5, NULL),
(16, 1, 'Normal', 2, 4, 5, NULL),
(17, 1, 'Normal', 2, 5, 5, NULL),
(18, 1, 'Normal', 2, 6, 5, NULL),
(19, 1, 'Normal', 2, 7, 5, NULL),
(20, 1, 'Normal', 2, 8, 5, NULL),
(21, 1, 'Normal', 2, 9, 5, NULL),
(22, 1, 'Normal', 2, 10, 5, NULL),
(23, 1, 'Normal', 2, 11, 5, NULL),
(24, 1, 'Normal', 2, 12, 5, NULL),
(25, 1, 'Normal', 3, 1, 5, NULL),
(26, 1, 'Normal', 3, 2, 5, NULL),
(27, 1, 'Normal', 3, 3, 5, NULL),
(28, 1, 'Normal', 3, 4, 5, NULL),
(29, 1, 'Normal', 3, 5, 5, NULL),
(30, 1, 'Normal', 3, 6, 5, NULL),
(31, 1, 'Normal', 3, 7, 5, NULL),
(32, 1, 'Normal', 3, 8, 5, NULL),
(33, 1, 'Normal', 3, 9, 5, NULL),
(34, 1, 'Normal', 3, 10, 5, NULL),
(35, 1, 'Normal', 3, 11, 5, NULL),
(36, 1, 'Normal', 3, 12, 5, NULL),
(37, 1, 'Normal', 4, 1, 5, NULL),
(38, 1, 'Normal', 4, 2, 5, NULL),
(39, 1, 'Normal', 4, 3, 5, NULL),
(40, 1, 'Normal', 4, 4, 5, NULL),
(41, 1, 'Normal', 4, 5, 5, NULL),
(42, 1, 'Normal', 4, 6, 5, NULL),
(43, 1, 'Normal', 4, 7, 5, NULL),
(44, 1, 'Normal', 4, 8, 5, NULL),
(45, 1, 'Normal', 4, 9, 5, NULL),
(46, 1, 'Normal', 4, 10, 5, NULL),
(47, 1, 'Normal', 4, 11, 5, NULL),
(48, 1, 'Normal', 4, 12, 5, NULL),
(49, 1, 'Normal', 5, 1, 5, NULL),
(50, 1, 'Normal', 5, 2, 5, NULL),
(51, 1, 'Normal', 5, 3, 5, NULL),
(52, 1, 'Normal', 5, 4, 5, NULL),
(53, 1, 'VIP', 5, 5, 10, NULL),
(54, 1, 'VIP', 5, 6, 10, NULL),
(55, 1, 'VIP', 5, 7, 10, NULL),
(56, 1, 'VIP', 5, 8, 10, NULL),
(57, 1, 'Normal', 5, 9, 5, NULL),
(58, 1, 'Normal', 5, 10, 5, NULL),
(59, 1, 'Normal', 5, 11, 5, NULL),
(60, 1, 'Normal', 5, 12, 5, NULL),
(61, 1, 'Normal', 6, 1, 5, NULL),
(62, 1, 'Normal', 6, 2, 5, NULL),
(63, 1, 'Normal', 6, 3, 5, NULL),
(64, 1, 'Normal', 6, 4, 5, NULL),
(65, 1, 'VIP', 6, 5, 10, NULL),
(66, 1, 'VIP', 6, 6, 10, NULL),
(67, 1, 'VIP', 6, 7, 10, NULL),
(68, 1, 'VIP', 6, 8, 10, NULL),
(69, 1, 'Normal', 6, 9, 5, NULL),
(70, 1, 'Normal', 6, 10, 5, NULL),
(71, 1, 'Normal', 6, 11, 5, NULL),
(72, 1, 'Normal', 6, 12, 5, NULL),
(73, 1, 'Normal', 7, 1, 5, NULL),
(74, 1, 'Normal', 7, 2, 5, NULL),
(75, 1, 'Normal', 7, 3, 5, NULL),
(76, 1, 'Normal', 7, 4, 5, NULL),
(77, 1, 'Normal', 7, 5, 5, NULL),
(78, 1, 'Normal', 7, 6, 5, NULL),
(79, 1, 'Normal', 7, 7, 5, NULL),
(80, 1, 'Normal', 7, 8, 5, NULL),
(81, 1, 'Normal', 7, 9, 5, NULL),
(82, 1, 'Normal', 7, 10, 5, NULL),
(83, 1, 'Normal', 7, 11, 5, NULL),
(84, 1, 'Normal', 7, 12, 5, NULL),
(85, 1, 'Normal', 8, 1, 5, NULL),
(86, 1, 'Normal', 8, 2, 5, NULL),
(87, 1, 'Normal', 8, 3, 5, NULL),
(88, 1, 'Normal', 8, 4, 5, NULL),
(89, 1, 'Normal', 8, 5, 5, 34),
(90, 1, 'Normal', 8, 6, 5, NULL),
(91, 1, 'Normal', 8, 7, 5, NULL),
(92, 1, 'Normal', 8, 8, 5, NULL),
(93, 1, 'Normal', 8, 9, 5, NULL),
(94, 1, 'Normal', 8, 10, 5, NULL),
(95, 1, 'Normal', 8, 11, 5, NULL),
(96, 1, 'Normal', 8, 12, 5, NULL),
(97, 1, 'Normal', 9, 1, 5, NULL),
(98, 1, 'Normal', 9, 2, 5, NULL),
(99, 1, 'Normal', 9, 3, 5, NULL),
(100, 1, 'Normal', 9, 4, 5, NULL),
(101, 1, 'Normal', 9, 5, 5, NULL),
(102, 1, 'Normal', 9, 6, 5, NULL),
(103, 1, 'Normal', 9, 7, 5, NULL),
(104, 1, 'Normal', 9, 8, 5, NULL),
(105, 1, 'Normal', 9, 9, 5, NULL),
(106, 1, 'Normal', 9, 10, 5, NULL),
(107, 1, 'Normal', 9, 11, 5, NULL),
(108, 1, 'Normal', 9, 12, 5, NULL),
(109, 1, 'Normal', 10, 1, 5, NULL),
(110, 1, 'Normal', 10, 2, 5, NULL),
(111, 1, 'Normal', 10, 3, 5, NULL),
(112, 1, 'Normal', 10, 4, 5, NULL),
(113, 1, 'Normal', 10, 5, 5, NULL),
(114, 1, 'Normal', 10, 6, 5, NULL),
(115, 1, 'Normal', 10, 7, 5, 21),
(116, 1, 'Normal', 10, 8, 5, NULL),
(117, 1, 'Normal', 10, 9, 5, NULL),
(118, 1, 'Normal', 10, 10, 5, NULL),
(119, 1, 'Normal', 10, 11, 5, NULL),
(120, 1, 'Normal', 10, 12, 5, NULL),
(121, 1, 'Normal', 1, 3, 5, NULL),
(122, 1, 'Normal', 1, 4, 5, NULL),
(123, 2, '3D', 1, 1, 50, NULL),
(124, 2, '3D', 1, 2, 50, NULL),
(125, 2, '3D', 1, 3, 50, NULL),
(126, 2, '3D', 1, 4, 50, NULL),
(127, 2, '3D', 1, 5, 50, NULL),
(128, 2, '3D', 1, 6, 50, NULL),
(129, 2, '3D', 1, 7, 50, NULL),
(130, 2, '3D', 1, 8, 50, NULL),
(131, 2, '3D', 1, 9, 50, NULL),
(132, 2, '3D', 1, 10, 50, NULL),
(133, 2, '3D', 2, 1, 50, NULL),
(134, 2, '3D', 2, 2, 50, NULL),
(135, 2, '3D', 2, 3, 50, NULL),
(136, 2, '3D', 2, 4, 50, NULL),
(137, 2, '3D', 2, 5, 50, NULL),
(138, 2, '3D', 2, 6, 50, NULL),
(139, 2, '3D', 2, 7, 50, NULL),
(140, 2, '3D', 2, 8, 50, NULL),
(141, 2, '3D', 2, 9, 50, NULL),
(142, 2, '3D', 2, 10, 50, NULL),
(143, 2, '3D', 3, 1, 50, NULL),
(144, 2, '3D', 3, 2, 50, NULL),
(145, 2, '3D', 3, 3, 50, NULL),
(146, 2, '3D', 3, 4, 50, NULL),
(147, 2, '3D', 3, 5, 50, NULL),
(148, 2, '3D', 3, 6, 50, NULL),
(149, 2, '3D', 3, 7, 50, NULL),
(150, 2, '3D', 3, 8, 50, NULL),
(151, 2, '3D', 3, 9, 50, NULL),
(152, 2, '3D', 3, 10, 50, NULL),
(153, 2, '3D', 4, 1, 50, NULL),
(154, 2, '3D', 4, 2, 50, NULL),
(155, 2, '3D', 4, 3, 50, NULL),
(156, 2, '3D', 4, 4, 50, NULL),
(157, 2, '3D', 4, 5, 50, NULL),
(158, 2, '3D', 4, 6, 50, NULL),
(159, 2, '3D', 4, 7, 50, 21),
(160, 2, '3D', 4, 8, 50, 21),
(161, 2, '3D', 4, 9, 50, NULL),
(162, 2, '3D', 4, 10, 50, NULL),
(163, 2, '3D', 5, 1, 50, NULL),
(164, 2, '3D', 5, 2, 50, NULL),
(165, 2, '3D', 5, 3, 50, NULL),
(166, 2, '3D', 5, 4, 50, NULL),
(167, 2, '3D', 5, 5, 50, NULL),
(168, 2, '3D', 5, 6, 50, NULL),
(169, 2, '3D', 5, 7, 50, NULL),
(170, 2, '3D', 5, 8, 50, NULL),
(171, 2, '3D', 5, 9, 50, NULL),
(172, 2, '3D', 5, 10, 50, NULL),
(173, 3, 'VIP', 1, 1, 100, 33),
(174, 3, 'VIP', 1, 2, 100, 33),
(175, 3, 'VIP', 1, 3, 100, NULL),
(176, 3, 'VIP', 1, 4, 100, NULL),
(177, 3, 'VIP', 1, 5, 100, NULL),
(178, 3, 'VIP', 1, 6, 100, NULL),
(179, 3, 'VIP', 1, 7, 100, NULL),
(180, 3, 'VIP', 1, 8, 100, NULL),
(181, 3, 'VIP', 1, 9, 100, NULL),
(182, 3, 'VIP', 1, 10, 100, NULL),
(183, 3, 'VIP', 2, 1, 100, NULL),
(184, 3, 'VIP', 2, 2, 100, NULL),
(185, 3, 'VIP', 2, 3, 100, NULL),
(186, 3, 'VIP', 2, 4, 100, NULL),
(187, 3, 'VIP', 2, 5, 100, NULL),
(188, 3, 'VIP', 2, 6, 100, NULL),
(189, 3, 'VIP', 2, 7, 100, NULL),
(190, 3, 'VIP', 2, 8, 100, NULL),
(191, 3, 'VIP', 2, 9, 100, NULL),
(192, 3, 'VIP', 2, 10, 100, NULL),
(193, 3, 'VIP', 3, 1, 100, NULL),
(194, 3, 'VIP', 3, 2, 100, NULL),
(195, 3, 'VIP', 3, 3, 100, NULL),
(196, 3, 'VIP', 3, 4, 100, NULL),
(197, 3, 'VIP', 3, 5, 100, NULL),
(198, 3, 'VIP', 3, 6, 100, NULL),
(199, 3, 'VIP', 3, 7, 100, NULL),
(200, 3, 'VIP', 3, 8, 100, NULL),
(201, 3, 'VIP', 3, 9, 100, NULL),
(202, 3, 'VIP', 3, 10, 100, NULL),
(203, 3, 'VIP', 4, 1, 100, NULL),
(204, 3, 'VIP', 4, 2, 100, NULL),
(205, 3, 'VIP', 4, 3, 100, NULL),
(206, 3, 'VIP', 4, 4, 100, NULL),
(207, 3, 'VIP', 4, 5, 100, NULL),
(208, 3, 'VIP', 4, 6, 100, NULL),
(209, 3, 'VIP', 4, 7, 100, NULL),
(210, 3, 'VIP', 4, 8, 100, NULL),
(211, 3, 'VIP', 4, 9, 100, NULL),
(212, 3, 'VIP', 4, 10, 100, NULL),
(213, 3, 'VIP', 5, 1, 100, NULL),
(214, 3, 'VIP', 5, 2, 100, NULL),
(215, 3, 'VIP', 5, 3, 100, NULL),
(216, 3, 'VIP', 5, 4, 100, NULL),
(217, 3, 'VIP', 5, 5, 100, NULL),
(218, 3, 'VIP', 5, 6, 100, NULL),
(219, 3, 'VIP', 5, 7, 100, NULL),
(220, 3, 'VIP', 5, 8, 100, NULL),
(221, 3, 'VIP', 5, 9, 100, NULL),
(222, 3, 'VIP', 5, 10, 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL,
  `fechacompra` date NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cines`
--

CREATE TABLE `cines` (
  `idcine` int(11) NOT NULL,
  `cine` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cines`
--

INSERT INTO `cines` (`idcine`, `cine`, `ciudad`, `calle`) VALUES
(1, 'Cinepolis Centro', 'Madrid', 'Gran Vía 45'),
(2, 'Multicines Plaza', 'Barcelona', 'Calle de Aragón 123'),
(3, 'Cinemark Norte', 'Valencia', 'Avenida del Puerto 78'),
(4, 'Yelmo Cines', 'Sevilla', 'Calle Tetuán 12');

-- --------------------------------------------------------

--
-- Table structure for table `detallecarrito`
--

CREATE TABLE `detallecarrito` (
  `iddetallecarrito` int(11) NOT NULL,
  `idcarrito` int(11) NOT NULL,
  `idsalabutaca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE `genero` (
  `idgenero` int(11) NOT NULL,
  `genero` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`idgenero`, `genero`) VALUES
(1, 'Terror'),
(4, 'Accion'),
(5, 'Sci-FI'),
(6, 'Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `horas`
--

CREATE TABLE `horas` (
  `idfuncion` int(11) NOT NULL,
  `idpelicula` int(11) NOT NULL,
  `idsala` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT curdate(),
  `hora` time NOT NULL,
  `precio` decimal(6,2) NOT NULL DEFAULT 0.00,
  `tiempo_trailer` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horas`
--

INSERT INTO `horas` (`idfuncion`, `idpelicula`, `idsala`, `fecha`, `hora`, `precio`, `tiempo_trailer`) VALUES
(1, 2, 1, '2026-02-05', '15:00:00', 100.00, 0),
(2, 2, 2, '2026-02-05', '18:00:00', 120.00, 0),
(3, 2, 3, '2026-02-05', '21:00:00', 150.00, 0),
(4, 3, 1, '2026-02-05', '15:00:00', 100.00, 0),
(5, 3, 2, '2026-02-05', '18:00:00', 120.00, 0),
(6, 3, 3, '2026-02-05', '21:00:00', 150.00, 0),
(7, 4, 1, '2026-02-05', '15:00:00', 100.00, 0),
(8, 4, 2, '2026-02-05', '18:00:00', 120.00, 0),
(9, 4, 3, '2026-02-05', '21:00:00', 150.00, 0),
(10, 5, 1, '2026-02-05', '15:00:00', 100.00, 0),
(11, 5, 2, '2026-02-05', '18:00:00', 120.00, 0),
(12, 5, 3, '2026-02-05', '21:00:00', 150.00, 0),
(13, 6, 1, '2026-02-05', '15:00:00', 100.00, 0),
(14, 6, 2, '2026-02-05', '18:00:00', 120.00, 0),
(15, 6, 3, '2026-02-05', '21:00:00', 150.00, 0),
(16, 7, 1, '2026-02-05', '15:00:00', 100.00, 0),
(17, 7, 2, '2026-02-05', '18:00:00', 120.00, 0),
(18, 7, 3, '2026-02-05', '21:00:00', 150.00, 0),
(19, 8, 1, '2026-02-05', '15:00:00', 100.00, 0),
(20, 8, 2, '2026-02-05', '18:00:00', 120.00, 0),
(21, 8, 3, '2026-02-05', '21:00:00', 150.00, 0),
(22, 9, 1, '2026-02-05', '15:00:00', 100.00, 0),
(23, 9, 2, '2026-02-05', '18:00:00', 120.00, 0),
(24, 9, 3, '2026-02-05', '21:00:00', 150.00, 0),
(25, 10, 1, '2026-02-05', '15:00:00', 100.00, 0),
(26, 10, 2, '2026-02-05', '18:00:00', 120.00, 0),
(27, 10, 3, '2026-02-05', '21:00:00', 150.00, 0),
(28, 11, 1, '2026-02-05', '15:00:00', 100.00, 0),
(29, 11, 2, '2026-02-05', '18:00:00', 120.00, 0),
(30, 11, 3, '2026-02-05', '21:00:00', 150.00, 0),
(31, 17, 1, '2026-02-05', '15:00:00', 100.00, 0),
(32, 17, 2, '2026-02-05', '18:00:00', 120.00, 0),
(33, 17, 3, '2026-02-05', '21:00:00', 150.00, 0),
(34, 18, 1, '2026-02-05', '15:00:00', 100.00, 0),
(35, 18, 2, '2026-02-05', '18:00:00', 120.00, 0),
(36, 18, 3, '2026-02-05', '21:00:00', 150.00, 0),
(37, 19, 1, '2026-02-05', '15:00:00', 100.00, 0),
(38, 19, 2, '2026-02-05', '18:00:00', 120.00, 0),
(39, 19, 3, '2026-02-05', '21:00:00', 150.00, 0),
(40, 20, 1, '2026-02-05', '15:00:00', 100.00, 0),
(41, 20, 2, '2026-02-05', '18:00:00', 120.00, 0),
(42, 20, 3, '2026-02-05', '21:00:00', 150.00, 0),
(43, 21, 1, '2026-02-05', '15:00:00', 100.00, 0),
(44, 21, 2, '2026-02-05', '18:00:00', 120.00, 0),
(45, 21, 3, '2026-02-05', '21:00:00', 150.00, 0),
(46, 22, 1, '2026-02-05', '15:00:00', 100.00, 0),
(47, 22, 2, '2026-02-05', '18:00:00', 120.00, 0),
(48, 22, 3, '2026-02-05', '21:00:00', 150.00, 0),
(49, 23, 1, '2026-02-05', '15:00:00', 100.00, 0),
(50, 23, 2, '2026-02-05', '18:00:00', 120.00, 0),
(51, 23, 3, '2026-02-05', '21:00:00', 150.00, 0),
(52, 24, 1, '2026-02-05', '15:00:00', 100.00, 0),
(53, 24, 2, '2026-02-05', '18:00:00', 120.00, 0),
(54, 24, 3, '2026-02-05', '21:00:00', 150.00, 0),
(55, 25, 1, '2026-02-05', '15:00:00', 100.00, 0),
(56, 25, 2, '2026-02-05', '18:00:00', 120.00, 0),
(57, 25, 3, '2026-02-05', '21:00:00', 150.00, 0),
(58, 26, 1, '2026-02-05', '15:00:00', 100.00, 0),
(59, 26, 2, '2026-02-05', '18:00:00', 120.00, 0),
(60, 26, 3, '2026-02-05', '21:00:00', 150.00, 0),
(61, 27, 1, '2026-02-05', '15:00:00', 100.00, 0),
(62, 27, 2, '2026-02-05', '18:00:00', 120.00, 0),
(63, 27, 3, '2026-02-05', '21:00:00', 150.00, 0),
(64, 28, 1, '2026-02-05', '15:00:00', 100.00, 0),
(65, 28, 2, '2026-02-05', '18:00:00', 120.00, 0),
(66, 28, 3, '2026-02-05', '21:00:00', 150.00, 0),
(67, 29, 1, '2026-02-05', '15:00:00', 100.00, 0),
(68, 29, 2, '2026-02-05', '18:00:00', 120.00, 0),
(69, 29, 3, '2026-02-05', '21:00:00', 150.00, 0),
(70, 30, 1, '2026-02-05', '15:00:00', 100.00, 0),
(71, 30, 2, '2026-02-05', '18:00:00', 120.00, 0),
(72, 30, 3, '2026-02-05', '21:00:00', 150.00, 0),
(73, 31, 1, '2026-02-05', '15:00:00', 100.00, 0),
(74, 31, 2, '2026-02-05', '18:00:00', 120.00, 0),
(75, 31, 3, '2026-02-05', '21:00:00', 150.00, 0),
(76, 32, 1, '2026-02-05', '15:00:00', 100.00, 0),
(77, 32, 2, '2026-02-05', '18:00:00', 120.00, 0),
(78, 32, 3, '2026-02-05', '21:00:00', 150.00, 0),
(79, 33, 1, '2026-02-05', '15:00:00', 100.00, 0),
(80, 33, 2, '2026-02-05', '18:00:00', 120.00, 0),
(81, 33, 3, '2026-02-05', '21:00:00', 150.00, 0),
(82, 34, 1, '2026-02-05', '15:00:00', 100.00, 0),
(83, 34, 2, '2026-02-05', '18:00:00', 120.00, 0),
(84, 34, 3, '2026-02-05', '21:00:00', 150.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `peliculas`
--

CREATE TABLE `peliculas` (
  `idpelicula` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `duracion` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `version` varchar(50) NOT NULL,
  `edad` varchar(50) NOT NULL,
  `fechaestreno` date NOT NULL,
  `actor` varchar(50) NOT NULL,
  `director` varchar(50) NOT NULL,
  `estudio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`idpelicula`, `titulo`, `genero`, `descripcion`, `duracion`, `foto`, `trailer`, `version`, `edad`, `fechaestreno`, `actor`, `director`, `estudio`) VALUES
(2, 'El Conjuro', 'Terror', 'Based on real events, The Conjuring follows paranormal investigators Ed and Lorraine Warren as they assist a family terrorized by a dark presence in their secluded farmhouse. What begins as strange noises and unsettling occurrences quickly escalates into violent supernatural attacks. As the Warrens uncover the property’s disturbing past, they realize they are facing a powerful demonic entity determined to destroy the family completely. This terrifying case becomes one of the most dangerous and emotionally draining investigations of their careers.', 112, 'ElConjuro.jpg', 'https://www.youtube.com/embed/ejMMn0t58Lc', '', '', '0000-00-00', '', 'Michael Chaves, James Wan', ''),
(3, 'It', 'Terror', 'In the quiet town of Derry, children begin disappearing under mysterious circumstances. A group of outcast friends known as the Losers Club discovers that an ancient evil awakens every 27 years to feed on fear, taking the shape of a terrifying clown named Pennywise. As they confront their deepest personal fears and traumatic experiences, they must stand together to defeat a creature that has haunted their town for centuries.', 135, 'It.jpg', 'https://www.youtube.com/embed/FnCdOQsX5kc', '', '', '0000-00-00', '', '', ''),
(4, 'Hereditary', 'Terror', 'After the death of her secretive mother, Annie Graham and her family begin to experience disturbing and unexplainable events inside their home. As hidden family secrets come to light, they uncover a terrifying legacy tied to dark rituals and demonic forces. Grief, trauma, and psychological horror blend together in a chilling story about inherited evil and unavoidable fate.', 127, 'Hereditary.jpg', 'https://www.youtube.com/embed/V6wWKNij_1M', '', '', '0000-00-00', '', '', ''),
(5, 'A Quiet Place', 'Terror', 'In a post-apocalyptic world invaded by creatures that hunt using sound, a family must live in total silence to survive. Every step, whisper, or accidental noise could mean instant death. As they struggle to protect their children and prepare for a new baby, they discover that love and sacrifice are their greatest weapons against an invisible and relentless threat.', 90, 'AQuietPlace.jpg', 'https://www.youtube.com/embed/WR7cc5t7tv8', '', '', '0000-00-00', '', '', ''),
(6, 'Midsommar', 'Terror', 'Dani travels to Sweden with her boyfriend and friends to attend a rare midsummer festival held once every ninety years. What starts as a peaceful cultural retreat slowly transforms into a disturbing and violent pagan ritual. Surrounded by isolation, manipulation, and emotional breakdown, Dani finds herself trapped in a nightmare that blurs the line between tradition and horror.', 147, 'Midsommar.jpg', 'https://www.youtube.com/embed/1Vnghdsjmd0', '', '', '0000-00-00', '', '', ''),
(7, 'Interstellar', 'Sci-Fi', 'As Earth becomes increasingly uninhabitable, a group of astronauts travels through a wormhole in search of a new home for humanity. Facing impossible choices, time distortion, and emotional sacrifice, the mission tests the limits of science, survival, and the enduring power of love across space and time.', 169, 'Interstellar.jpg', 'https://www.youtube.com/embed/zSWdZVtXT7E', '', '', '0000-00-00', '', '', ''),
(8, 'Blade Runner 2049', 'Sci-Fi', 'Officer K, a blade runner tasked with retiring rogue replicants, uncovers a long-buried secret that could change the balance between humans and artificial beings forever. His investigation leads him to Rick Deckard, missing for decades, in a dystopian future where identity, memory, and humanity are constantly questioned.', 164, 'BladeRunner.jpg', 'https://www.youtube.com/embed/gCcx85zbxz4', '', '', '0000-00-00', '', '', ''),
(9, 'The Matrix', 'Sci-Fi', 'Neo, a computer hacker, discovers that reality as he knows it is a simulated illusion created by intelligent machines to enslave humanity. Guided by Morpheus and Trinity, he embraces his role as The One and joins the rebellion in a battle to free mankind from digital control.', 136, 'TheMatrix.jpg', 'https://www.youtube.com/embed/vKQi3bBA1y8', '', '', '0000-00-00', '', '', ''),
(10, 'Arrival', 'Sci-Fi', 'When mysterious alien spacecraft land around the world, linguist Louise Banks is recruited to communicate with the visitors. As she deciphers their complex language, she begins to experience time in a new and unexpected way, forcing her to confront profound decisions about life, memory, and destiny.', 116, 'Arrival.jpg', 'https://www.youtube.com/embed/tFMo3UJ4B4g', '', '', '0000-00-00', '', '', ''),
(11, 'Ex Machina', 'Sci-Fi', 'A young programmer is selected to participate in a groundbreaking experiment involving an advanced humanoid artificial intelligence. As he interacts with the AI, he begins to question consciousness, manipulation, and the ethical boundaries between human and machine intelligence.', 108, 'ExMachina.jpg', 'https://www.youtube.com/embed/EoQuVnKhxaM', '', '', '0000-00-00', '', '', ''),
(17, 'Mad Max: Fury Road', 'Acción', 'In a post-apocalyptic wasteland ruled by tyranny and scarcity, Max teams up with the rebellious Furiosa to escape a ruthless warlord. Pursued across the desert in a high-speed chase, they fight for survival and freedom in a relentless explosion of action and rebellion.', 120, 'MadMaxFuryRoad.jpg', 'https://www.youtube.com/embed/hEJnMQG9ev8', '', '', '0000-00-00', '', '', ''),
(18, 'John Wick', 'Acción', 'John Wick, a retired assassin, returns to the criminal underworld after a brutal act of violence robs him of the last connection to his past. Driven by grief and vengeance, he unleashes a precise and unstoppable campaign against powerful crime syndicates.', 101, 'JohnWick.jpg', 'https://www.youtube.com/embed/C0BMx-qxsP4', '', '', '0000-00-00', '', '', ''),
(19, 'Gladiator', 'Acción', 'After being betrayed by the corrupt Emperor Commodus and losing his family, Roman general Maximus is forced into slavery and becomes a gladiator. Determined to seek justice, he rises through the arena ranks while inspiring hope among the oppressed citizens of Rome.', 155, 'Gladiator.jpg', 'https://www.youtube.com/embed/P5ieIbInFpg', '', '', '0000-00-00', '', '', ''),
(20, 'The Dark Knight', 'Acción', 'Batman faces his most chaotic and dangerous enemy yet: the Joker. As Gotham descends into anarchy, the Dark Knight must confront moral dilemmas and psychological warfare that challenge his beliefs and push him to his limits.', 152, 'TheDarkKnight.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY', '', '', '0000-00-00', '', '', ''),
(21, 'Avengers: Endgame', 'Acción', 'After Thanos wipes out half of all life in the universe, the remaining Avengers assemble for one final mission to undo the devastation. Through sacrifice, courage, and unity, they attempt to restore hope in an epic and emotional conclusion.', 181, 'AvengersEndgame.jpg', 'https://www.youtube.com/embed/TcMBFSGVi1c', '', '', '0000-00-00', '', '', ''),
(22, 'The Hangover', 'Comedy', 'Days before a wedding in Las Vegas, three friends wake up with no memory of the previous night and discover the groom is missing. As they retrace their chaotic steps, they uncover outrageous and hilarious consequences of their wild adventure.', 100, 'TheHangover.jpg', 'https://www.youtube.com/embed/tcdUhdOlz9M', '', '', '0000-00-00', '', '', ''),
(23, 'Superbad', 'Comedy', 'Two high school best friends plan to make their final days before graduation unforgettable. Their quest for popularity and romance quickly spirals into awkward, chaotic, and hilarious situations that ultimately test their friendship.', 113, 'Superbad.jpg', 'https://www.youtube.com/embed/4eaZ_48ZYog', '', '', '0000-00-00', '', '', ''),
(24, 'Step Brothers', 'Comedy', 'Two immature middle-aged men are forced to live together when their single parents marry. Their childish rivalry escalates into absurd and comedic situations, turning their shared home into a battleground of ridiculous behavior.', 98, 'StepBrothers.jpg', 'https://www.youtube.com/embed/CewglxElBK0', '', '', '0000-00-00', '', '', ''),
(25, 'Anchorman', 'Comedy', 'Ron Burgundy is the top news anchor in San Diego until a talented female journalist challenges his dominance. As professional rivalry turns personal, the newsroom becomes a battlefield of ego, ambition, and outrageous comedy.', 94, 'Anchorman.jpg', 'https://www.youtube.com/embed/QvJ1K0_JzFI', '', '', '0000-00-00', '', '', ''),
(26, 'Bridesmaids', 'Comedy', 'When her best friend gets engaged, Annie reluctantly becomes maid of honor. As wedding preparations spiral out of control, jealousy and insecurity create a series of chaotic and hilarious events that test their friendship.', 125, 'Bridesmaids.jpg', 'https://www.youtube.com/embed/FNppLrmdyug', '', '', '0000-00-00', '', '', ''),
(27, 'Zathura', 'Sci-Fi', 'Two young brothers discover a mysterious board game that transports them into outer space. To return home, they must complete the dangerous game while facing alien threats and unexpected adventures.', 135, 'ZathuraPoster.jpg', 'https://www.youtube.com/embed/zNxm_obDpNU', '', '', '0000-00-00', '', '', ''),
(28, 'Avengers: Infinity War', 'Acción', 'The Avengers and their allies must confront Thanos, a powerful titan determined to collect the Infinity Stones and eliminate half of all life. Their battle changes the fate of the universe forever.', 149, 'AvengersInfinityWar.jpg', 'https://www.youtube.com/embed/6ZfuNTqbHE8', 'Doblada', '12', '2018-04-27', 'Robert Downey Jr., Chris Evans', 'Anthony y Joe Russo', 'Marvel Studios'),
(29, 'Minions', 'Comedia', 'The Minions embark on a global journey to find the most evil villain to serve. Along the way, they encounter Scarlet Overkill and create chaotic and hilarious situations filled with mischief and adventure.', 91, 'Minions.webp', 'https://www.youtube.com/embed/eisKxhjBnZ0', 'Doblada', '0', '2015-07-10', 'Sandra Bullock', 'Pierre Coffin, Kyle Balda', 'Illumination'),
(30, 'Titanic', 'Drama', 'A poor artist and a young aristocrat fall deeply in love aboard the luxurious RMS Titanic. Their passionate romance unfolds against the backdrop of one of history’s most tragic maritime disasters.', 195, 'Titanic.jpg', 'https://www.youtube.com/embed/kVrqfYjkTdQ', 'Subtitulada', '12', '1997-12-19', 'Leonardo DiCaprio, Kate Winslet', 'James Cameron', '20th Century Fox'),
(31, 'Godzilla vs. Kong', 'Acción', 'Godzilla and Kong, two legendary titans, clash in a spectacular battle while humanity searches for the truth behind their origins. Massive destruction and epic confrontations redefine the balance of nature.', 113, 'gorzillavskong.jpg', 'https://www.youtube.com/embed/odM92ap8_c0', 'Doblada', '12', '2021-03-31', 'Alexander Skarsgård, Millie Bobby Brown', 'Adam Wingard', 'Warner Bros'),
(32, 'Avengers: Age Of Ultron', 'Acción', 'The Avengers accidentally create Ultron, an artificial intelligence that concludes humanity is the real threat to Earth. The team must unite once again to prevent global extinction and repair their fractured alliances.', 141, 'avengersAgeOfUltron.jpg', 'https://www.youtube.com/embed/tmeOjFno6Do', 'Doblada', '12', '2015-05-01', 'Robert Downey Jr., Chris Hemsworth', 'Joss Whedon', 'Marvel Studios'),
(33, 'Minions: The Rise of Gru', 'Comedia', 'The Minions assist a young Gru in his early attempts to become the world’s greatest supervillain. Their chaotic plans and comic failures lead to a fun-filled adventure packed with humor and energy.', 87, 'minionstheriseofgru.webp', 'https://www.youtube.com/embed/6DxjJzmYsXo', 'Doblada', '0', '2022-07-01', 'Steve Carell', 'Kyle Balda', 'Illumination'),
(34, 'Godzilla', 'Acción', 'After a catastrophic nuclear event awakens an ancient creature, Godzilla emerges from the ocean depths. As cities fall and humanity struggles to survive, the true nature of the monstrous force reshapes the world’s understanding of power and destruction.', 123, 'Godzilla.jpg', 'https://www.youtube.com/embed/QjKO10hKtYw', 'Doblada', '12', '2014-05-16', 'Aaron Taylor-Johnson', 'Gareth Edwards', 'Legendary Pictures');

-- --------------------------------------------------------

--
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `idsala` int(11) NOT NULL,
  `idcine` int(11) NOT NULL,
  `numerosala` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tiposala` varchar(50) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tamanopantalla` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salas`
--

INSERT INTO `salas` (`idsala`, `idcine`, `numerosala`, `nombre`, `tiposala`, `capacidad`, `tamanopantalla`) VALUES
(1, 1, '1', 'Sala 1', 'Normal', 120, 'Grande'),
(2, 1, '2', 'Sala 2', '3D', 100, 'Mediana'),
(3, 1, '3', 'Sala 3', 'VIP', 50, 'Pequeña'),
(4, 2, 'A', 'Sala A', 'Normal', 150, 'Grande'),
(5, 2, 'B', 'Sala B', 'IMAX', 120, 'Muy Grande'),
(6, 2, 'C', 'Sala C', '3D', 90, 'Mediana'),
(7, 3, 'R', 'Sala Roja', 'Normal', 200, 'Grande'),
(8, 3, 'B', 'Sala Azul', '3D', 150, 'Mediana'),
(9, 3, 'G', 'Sala Verde', 'VIP', 100, 'Pequeña'),
(10, 4, 'V1', 'Sala VIP', 'VIP', 50, 'Pequeña'),
(11, 4, 'N1', 'Sala Normal 1', 'Normal', 120, 'Mediana'),
(12, 4, 'N2', 'Sala Normal 2', 'Normal', 100, 'Mediana'),
(13, 5, '1', 'Sala 1', 'Normal', 120, 'Mediana'),
(14, 5, '2', 'Sala 2', '3D', 100, 'Mediana'),
(15, 5, '3', 'Sala 3', 'VIP', 50, 'Pequeña'),
(16, 5, '4', 'Sala 4', 'Normal', 120, 'Grande'),
(17, 5, '5', 'Sala 5', 'IMAX', 150, 'Muy Grande'),
(18, 5, '6', 'Sala 6', '3D', 100, 'Mediana'),
(19, 5, '7', 'Sala 7', 'VIP', 50, 'Pequeña'),
(20, 5, '1', 'Sala Avengers', 'Normal', 50, 'Grande'),
(21, 5, '2', 'Sala Hangover', '3D', 50, 'Mediana'),
(22, 5, '3', 'Sala Superbad', 'VIP', 50, 'Pequeña'),
(23, 5, '4', 'Sala Step Brothers', 'Normal', 50, 'Grande'),
(24, 5, '5', 'Sala Anchorman', 'IMAX', 50, 'Muy Grande'),
(25, 5, '6', 'Sala Bridesmaids', '3D', 50, 'Mediana'),
(26, 5, '7', 'Sala Zathura', 'VIP', 50, 'Pequeña'),
(27, 5, '8', 'VIP Avengers', 'VIP', 40, 'Pequeña'),
(28, 5, '9', 'VIP Hangover', 'VIP', 40, 'Pequeña'),
(29, 5, '10', 'VIP Superbad', 'VIP', 40, 'Pequeña'),
(30, 5, '11', 'VIP Step Brothers', 'VIP', 40, 'Pequeña'),
(31, 5, '12', 'VIP Anchorman', 'VIP', 40, 'Pequeña'),
(32, 5, '13', 'VIP Bridesmaids', 'VIP', 40, 'Pequeña'),
(33, 5, '14', 'VIP Zathura', 'VIP', 40, 'Pequeña'),
(34, 5, '8', 'Sala Infinity War', 'IMAX', 180, 'Muy Grande'),
(35, 5, '9', 'Sala Minions', 'Normal', 130, 'Grande'),
(36, 5, '10', 'Sala Titanic', 'VIP', 80, 'Mediana'),
(37, 5, '11', 'Sala Godzilla', '3D', 160, 'Grande'),
(38, 5, '12', 'Sala Endgame', 'IMAX', 200, 'Muy Grande'),
(39, 5, '13', 'Sala Gru', 'Normal', 120, 'Mediana'),
(40, 5, '14', 'Sala Kaiju', '3D', 150, 'Grande');

-- --------------------------------------------------------

--
-- Table structure for table `salasbutacas`
--

CREATE TABLE `salasbutacas` (
  `idsala` int(11) NOT NULL,
  `idbutaca` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `ocupado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salasbutacas`
--

INSERT INTO `salasbutacas` (`idsala`, `idbutaca`, `fecha`, `hora`, `ocupado`) VALUES
(1, 1, '2026-02-02', '14:00:00', 0),
(1, 1, '2026-02-02', '15:00:00', 0),
(1, 1, '2026-02-09', '14:00:00', 0),
(1, 1, '2026-02-09', '17:00:00', 0),
(1, 1, '2026-02-09', '20:00:00', 0),
(1, 2, '2026-02-02', '15:00:00', 0),
(1, 2, '2026-02-09', '14:00:00', 0),
(1, 2, '2026-02-09', '17:00:00', 0),
(1, 2, '2026-02-09', '20:00:00', 0),
(1, 3, '2026-02-02', '15:00:00', 0),
(1, 3, '2026-02-09', '14:00:00', 0),
(1, 3, '2026-02-09', '17:00:00', 0),
(1, 3, '2026-02-09', '20:00:00', 0),
(1, 4, '2026-02-02', '15:00:00', 0),
(1, 6, '2026-02-02', '15:00:00', 0),
(1, 7, '2026-02-02', '15:00:00', 0),
(1, 8, '2026-02-02', '15:00:00', 0),
(1, 12, '2026-02-02', '15:00:00', 0),
(1, 13, '2026-02-02', '15:00:00', 0),
(1, 14, '2026-02-02', '15:00:00', 0),
(1, 15, '2026-02-02', '15:00:00', 0),
(1, 16, '2026-02-02', '15:00:00', 0),
(8, 1, '2026-02-09', '14:00:00', 0),
(8, 2, '2026-02-09', '14:00:00', 0),
(8, 3, '2026-02-09', '14:00:00', 0),
(8, 4, '2026-02-09', '14:00:00', 0),
(8, 5, '2026-02-09', '14:00:00', 0),
(8, 6, '2026-02-09', '14:00:00', 0),
(8, 7, '2026-02-09', '14:00:00', 0),
(8, 8, '2026-02-09', '14:00:00', 0),
(8, 9, '2026-02-09', '14:00:00', 0),
(8, 10, '2026-02-09', '14:00:00', 0),
(8, 11, '2026-02-09', '14:00:00', 0),
(8, 12, '2026-02-09', '14:00:00', 0),
(8, 13, '2026-02-09', '14:00:00', 0),
(8, 14, '2026-02-09', '14:00:00', 0),
(8, 15, '2026-02-09', '14:00:00', 0),
(8, 16, '2026-02-09', '14:00:00', 0),
(8, 17, '2026-02-09', '14:00:00', 0),
(8, 18, '2026-02-09', '14:00:00', 0),
(8, 19, '2026-02-09', '14:00:00', 0),
(8, 20, '2026-02-09', '14:00:00', 0),
(8, 21, '2026-02-09', '14:00:00', 0),
(8, 22, '2026-02-09', '14:00:00', 0),
(8, 23, '2026-02-09', '14:00:00', 0),
(8, 24, '2026-02-09', '14:00:00', 0),
(8, 25, '2026-02-09', '14:00:00', 0),
(8, 26, '2026-02-09', '14:00:00', 0),
(8, 27, '2026-02-09', '14:00:00', 0),
(8, 28, '2026-02-09', '14:00:00', 0),
(8, 29, '2026-02-09', '14:00:00', 0),
(8, 30, '2026-02-09', '14:00:00', 0),
(8, 31, '2026-02-09', '14:00:00', 0),
(8, 32, '2026-02-09', '14:00:00', 0),
(8, 33, '2026-02-09', '14:00:00', 0),
(8, 34, '2026-02-09', '14:00:00', 0),
(8, 35, '2026-02-09', '14:00:00', 0),
(8, 36, '2026-02-09', '14:00:00', 0),
(8, 37, '2026-02-09', '14:00:00', 0),
(8, 38, '2026-02-09', '14:00:00', 0),
(8, 39, '2026-02-09', '14:00:00', 0),
(8, 40, '2026-02-09', '14:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `salaspeliculas`
--

CREATE TABLE `salaspeliculas` (
  `idsalapelicula` int(11) NOT NULL,
  `idsala` int(11) NOT NULL,
  `idpelicula` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horainicio` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salaspeliculas`
--

INSERT INTO `salaspeliculas` (`idsalapelicula`, `idsala`, `idpelicula`, `fecha`, `horainicio`) VALUES
(1, 1, 1, '2026-02-03', '18:00'),
(2, 1, 1, '2026-02-03', '20:00'),
(3, 2, 1, '2026-02-03', '19:00');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `carnetjoven` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `email`, `pass`, `fechadenacimiento`, `carnetjoven`) VALUES
(33, 'javi', '', '123', '0000-00-00', ''),
(34, 'sagar', '', '123', '0000-00-00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `butacas`
--
ALTER TABLE `butacas`
  ADD PRIMARY KEY (`idbutaca`);

--
-- Indexes for table `cines`
--
ALTER TABLE `cines`
  ADD PRIMARY KEY (`idcine`);

--
-- Indexes for table `detallecarrito`
--
ALTER TABLE `detallecarrito`
  ADD PRIMARY KEY (`iddetallecarrito`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Indexes for table `horas`
--
ALTER TABLE `horas`
  ADD PRIMARY KEY (`idfuncion`),
  ADD KEY `idpelicula` (`idpelicula`),
  ADD KEY `idsala` (`idsala`);

--
-- Indexes for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`idpelicula`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`idsala`);

--
-- Indexes for table `salasbutacas`
--
ALTER TABLE `salasbutacas`
  ADD PRIMARY KEY (`idsala`,`idbutaca`,`fecha`,`hora`);

--
-- Indexes for table `salaspeliculas`
--
ALTER TABLE `salaspeliculas`
  ADD PRIMARY KEY (`idsalapelicula`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `butacas`
--
ALTER TABLE `butacas`
  MODIFY `idbutaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `cines`
--
ALTER TABLE `cines`
  MODIFY `idcine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detallecarrito`
--
ALTER TABLE `detallecarrito`
  MODIFY `iddetallecarrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `idgenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `horas`
--
ALTER TABLE `horas`
  MODIFY `idfuncion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `idpelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `salas`
--
ALTER TABLE `salas`
  MODIFY `idsala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `salaspeliculas`
--
ALTER TABLE `salaspeliculas`
  MODIFY `idsalapelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `horas_ibfk_1` FOREIGN KEY (`idpelicula`) REFERENCES `peliculas` (`idpelicula`),
  ADD CONSTRAINT `horas_ibfk_2` FOREIGN KEY (`idsala`) REFERENCES `salas` (`idsala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
