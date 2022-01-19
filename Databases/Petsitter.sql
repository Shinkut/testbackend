-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2022 at 12:48 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petsitter`
--
CREATE DATABASE IF NOT EXISTS `petsitter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `petsitter`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `Stateid` int(11) NOT NULL,
  `Nombre` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `Stateid`, `Nombre`) VALUES
(1, 1, 'Culiacan'),
(2, 2, 'Monterrey'),
(3, 3, 'Guadalajara');

-- --------------------------------------------------------

--
-- Table structure for table `petsitter`
--

DROP TABLE IF EXISTS `petsitter`;
CREATE TABLE `petsitter` (
  `id` int(11) NOT NULL,
  `CityId` int(11) NOT NULL,
  `name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photoUrl` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petsitter`
--

INSERT INTO `petsitter` (`id`, `CityId`, `name`, `lastname`, `email`, `cellphone`, `photoUrl`) VALUES
(18, 2, 'Rafael', 'Zaragoza', 'Rzaragosa@mail.com', '667528585', 0x63726564656e6369616c2e706e67),
(19, 1, 'Luis Francisco', 'Gonzalez', 'luisfgv96@hotmail.com', '6675246457', 0x6467626678636e67762c62696b6a2c6e2e706e67),
(20, 3, 's', 's', 's@s.s', '6675246457', 0x63726564656e6369616c322e706e67),
(21, 1, 't', 's', 't@t.t', '6675246457', 0x63726564656e6369616c2e706e67),
(22, 3, 'r', 'r', 'r@r.r', '6675243256', 0x63726564656e6369616c2e706e67);

-- --------------------------------------------------------

--
-- Table structure for table `petstype`
--

DROP TABLE IF EXISTS `petstype`;
CREATE TABLE `petstype` (
  `id` int(11) NOT NULL,
  `Description` varchar(92) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petstype`
--

INSERT INTO `petstype` (`id`, `Description`) VALUES
(1, 'Perros'),
(2, 'Gatos'),
(3, 'Serpientes');

-- --------------------------------------------------------

--
-- Table structure for table `sitterxtype`
--

DROP TABLE IF EXISTS `sitterxtype`;
CREATE TABLE `sitterxtype` (
  `id` int(11) NOT NULL,
  `petsitterid` int(11) NOT NULL,
  `petstypeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sitterxtype`
--

INSERT INTO `sitterxtype` (`id`, `petsitterid`, `petstypeid`) VALUES
(6, 18, 3),
(7, 18, 2),
(8, 19, 3),
(9, 0, 0),
(10, 18, 1),
(11, 21, 1),
(12, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `Nombre`) VALUES
(1, 'Culiacan'),
(2, 'Nuevo Leon'),
(3, 'Jalisco');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petsitter`
--
ALTER TABLE `petsitter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petstype`
--
ALTER TABLE `petstype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitterxtype`
--
ALTER TABLE `sitterxtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `petsitter`
--
ALTER TABLE `petsitter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `petstype`
--
ALTER TABLE `petstype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sitterxtype`
--
ALTER TABLE `sitterxtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
