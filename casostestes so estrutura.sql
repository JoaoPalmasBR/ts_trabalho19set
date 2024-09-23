-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2024 at 03:18 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casostestes`
--

-- --------------------------------------------------------

--
-- Table structure for table `casodeteste`
--

DROP TABLE IF EXISTS `casodeteste`;
CREATE TABLE IF NOT EXISTS `casodeteste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) DEFAULT NULL,
  `entrada` varchar(250) DEFAULT NULL,
  `saida` varchar(250) DEFAULT NULL,
  `ambiente` varchar(250) DEFAULT '--',
  `exigenciasespeciais` varchar(250) DEFAULT '--',
  `precondicoes` varchar(250) DEFAULT NULL,
  `poscondicoes` varchar(250) DEFAULT NULL,
  `cenario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cenarios`
--

DROP TABLE IF EXISTS `cenarios`;
CREATE TABLE IF NOT EXISTS `cenarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requisito` varchar(250) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
CREATE TABLE IF NOT EXISTS `procedimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(250) DEFAULT NULL,
  `resultadoesperado` varchar(250) DEFAULT NULL,
  `caso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
