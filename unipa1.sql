-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2018 at 07:08 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unipa1`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
(1, 'Adidas', 10500),
(2, 'Nike', 13500),
(3, 'Puma', 76900),
(4, 'Swallow', 46900),
(5, 'Diadora', 100450),
(6, 'New Balance', 150450),
(7, 'Bola Bekel', 123000),
(8, 'Topi', 34000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(40) DEFAULT NULL,
  `alamat` varchar(40) DEFAULT NULL,
  `no_telp` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `alamat`, `no_telp`) VALUES
(100, 'Dimas Syah', 'Malang', '08123894561'),
(101, 'Iffan Indra', 'Mojokerto', '08712873491'),
(102, 'Abdullah', 'Surabaya', '08123894361'),
(103, 'Yuliana Dwi R', 'Mojokerto', '08412873491');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `total_transaksi` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_customer`, `id_barang`, `tanggal_transaksi`, `total_transaksi`) VALUES
(1000, 100, 1, '2018-09-14', 10500),
(1001, 100, 2, '2018-09-14', 13500),
(1002, 101, 6, '2018-09-15', 150450),
(1003, 101, 4, '2018-09-15', 46900),
(1004, 101, 5, '2018-09-16', 100450),
(1005, 101, 3, '2018-09-16', 76900),
(1006, 101, 4, '2018-09-14', 46900),
(1007, 101, 1, '2018-09-18', 10500),
(1008, 103, 4, '2018-09-14', 46900),
(1009, 103, 2, '2018-09-20', 13500),
(1010, 103, 3, '2018-09-18', 76900),
(1011, 103, 6, '2018-09-26', 150450),
(1012, 100, 5, '2018-09-09', 100450),
(1013, 100, 1, '2018-09-26', 10500),
(1014, 100, 4, '2018-09-11', 46900),
(1015, 100, 6, '2018-09-25', 150450),
(1016, 100, 3, '2018-09-27', 76900),
(1017, 101, 4, '2018-09-04', 46900),
(1018, 101, 6, '2018-09-12', 150450),
(1019, 103, 4, '2018-09-25', 46900),
(1020, 100, 6, '2018-09-26', 150450);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `customer_fk` (`id_customer`),
  ADD KEY `barang_fk` (`id_barang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `barang_fk` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `customer_fk` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
