-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2019 at 12:17 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(5) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `alamat`, `tgl_lahir`) VALUES
(1, 'ace', 'malang', '2001-05-03'),
(2, 'sabo', 'malang', '2016-12-20'),
(3, 'shank', 'malang', '2004-04-18'),
(4, 'roger', 'malang', '2005-06-24'),
(5, 'newgate', 'malang', '2015-06-15'),
(6, 'reyleigh', 'malang', '2002-07-22'),
(7, 'zoro', 'malang', '2006-05-04'),
(8, 'nami', 'malang', '2008-12-01'),
(9, 'brook', 'malang', '2000-01-20'),
(10, 'luffy', 'malang', '2005-05-05'),
(11, 'franky', 'malang', '2017-09-02'),
(12, 'robin', 'malang', '2009-08-21'),
(13, 'chopper', 'malang', '2010-10-04'),
(14, 'usopp', 'malang', '2011-07-28'),
(15, 'sanji', 'malang', '2008-04-27'),
(16, 'big mom', 'malang', '2001-06-19'),
(17, 'kaido', 'malang', '2002-02-22'),
(18, 'oda', 'malang', '2004-09-26'),
(19, 'souma', 'malang', '2005-11-08'),
(20, 'asta', 'malang', '2015-10-07'),
(21, 'yuno', 'malang', '2014-05-04'),
(22, 'yami', 'malang', '2002-08-09'),
(23, 'vannesa', 'malang', '2009-01-28'),
(24, 'jinbe', 'malang', '2002-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `jumlah` int(5) DEFAULT NULL,
  `id_pembeli` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jumlah`, `id_pembeli`) VALUES
('1', 'odal', 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` varchar(5) NOT NULL,
  `nama_pembeli` varchar(20) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `alamat`, `jk`) VALUES
('1', 'adib', 'malang', 'L');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
