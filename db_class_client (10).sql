-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 09:21 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_class_client`
--

-- --------------------------------------------------------

--
-- Table structure for table `coba_tugas`
--

CREATE TABLE `coba_tugas` (
  `id` int(11) NOT NULL,
  `id_tugas` varchar(55) NOT NULL,
  `judul` text NOT NULL,
  `id_kelas` varchar(55) NOT NULL,
  `mapel` int(11) NOT NULL,
  `waktu` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_tugas`
--

INSERT INTO `coba_tugas` (`id`, `id_tugas`, `judul`, `id_kelas`, `mapel`, `waktu`, `created_at`) VALUES
(9, 'Q8feFm6v', 'Basis Path Testing: Flow Graph', '1', 3, '2021-08-28 16:49:00', '2021-08-20 09:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `coba_tugas_lampiran`
--

CREATE TABLE `coba_tugas_lampiran` (
  `id` int(11) NOT NULL,
  `tugas_id` varchar(55) NOT NULL,
  `attachment_name` text NOT NULL,
  `attachment_original_name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_tugas_lampiran`
--

INSERT INTO `coba_tugas_lampiran` (`id`, `tugas_id`, `attachment_name`, `attachment_original_name`, `created_at`) VALUES
(5, 'Q8feFm6v', 'nPoQTUG5sTOix31TDZhsl7qHyTpXwUwTdb_class_client (9).sql', 'db_class_client (9).sql', '2021-08-20 09:47:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coba_tugas`
--
ALTER TABLE `coba_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coba_tugas_lampiran`
--
ALTER TABLE `coba_tugas_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coba_tugas`
--
ALTER TABLE `coba_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coba_tugas_lampiran`
--
ALTER TABLE `coba_tugas_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
