-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2025 at 09:32 AM
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
-- Database: `matchacih`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `idakun` varchar(10) NOT NULL,
  `alamat` varchar(600) DEFAULT NULL,
  `nomorhp` varchar(13) DEFAULT NULL,
  `namaakun` varchar(16) DEFAULT NULL,
  `pswrd` varchar(16) DEFAULT NULL,
  `jumlahkoin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `idkeranjang` varchar(10) NOT NULL,
  `idmenu` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `totalharga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idmenu` varchar(10) NOT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `jmlstok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`idmenu`, `nama`, `jmlstok`, `harga`) VALUES
('M-1', 'Bakso Matcha', 20, 20000),
('M-2', 'Ramen Kuah Matcha', 20, 25000),
('M-3', 'Ikan Bakar Bumbu Matcha', 20, 75000),
('M-4', 'Matcha Bubuk', 20, 30000),
('M-5', 'Ice Cream Matcha', 20, 15000),
('M-6', 'Kue Matcha', 20, 24500),
('M-7', 'Nasi Goreng Matcha', 20, 27500),
('M-8', 'Sweet Corn Milk with Melted Cheese and Matcha', 20, 17500);

-- --------------------------------------------------------

--
-- Table structure for table `struck`
--

CREATE TABLE `struck` (
  `idstruck` varchar(10) NOT NULL,
  `idakun` varchar(10) DEFAULT NULL,
  `namapenerima` varchar(60) DEFAULT NULL,
  `alamat` varchar(600) DEFAULT NULL,
  `nomorhp` varchar(13) DEFAULT NULL,
  `tglorder` date DEFAULT NULL,
  `statuspembayaran` enum('Sudah Dibayar','Belum Dibayar') DEFAULT NULL,
  `metodebayar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`idakun`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idkeranjang`),
  ADD KEY `idmenu` (`idmenu`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indexes for table `struck`
--
ALTER TABLE `struck`
  ADD PRIMARY KEY (`idstruck`),
  ADD KEY `idakun` (`idakun`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`);

--
-- Constraints for table `struck`
--
ALTER TABLE `struck`
  ADD CONSTRAINT `struck_ibfk_1` FOREIGN KEY (`idakun`) REFERENCES `akun` (`idakun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
