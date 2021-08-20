-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2021 at 09:10 AM
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
-- Table structure for table `coba_materi`
--

CREATE TABLE `coba_materi` (
  `id` int(11) NOT NULL,
  `id_materi` varchar(55) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `judul` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_history` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_materi`
--

INSERT INTO `coba_materi` (`id`, `id_materi`, `id_kelas`, `mapel`, `judul`, `created_at`, `update_history`) VALUES
(7, 'J7RNF3UV', 2, 6, 'Basis Path Testing: Flow Graph', '2021-08-16 06:09:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coba_materi_history`
--

CREATE TABLE `coba_materi_history` (
  `id` int(11) NOT NULL,
  `materi_id` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_materi_history`
--

INSERT INTO `coba_materi_history` (`id`, `materi_id`, `updated_by`, `updated_at`) VALUES
(1, '', 'user', '2021-08-16 07:11:16'),
(2, '', 'user', '2021-08-16 07:15:00'),
(3, 'J7RNF3UV', 'user', '2021-08-16 07:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `coba_materi_lampiran`
--

CREATE TABLE `coba_materi_lampiran` (
  `id` int(11) NOT NULL,
  `materi_id` varchar(55) NOT NULL,
  `attachment_name` text NOT NULL,
  `attachment_original_name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_materi_lampiran`
--

INSERT INTO `coba_materi_lampiran` (`id`, `materi_id`, `attachment_name`, `attachment_original_name`, `created_at`) VALUES
(3, 'J7RNF3UV', 'RC9cKBNlhPPS7K2ziJNyyJdWsGbvkFr817104410036 Zega Febrianto.docx', '17104410036 Zega Febrianto.docx', '2021-08-16 06:09:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coba_materi`
--
ALTER TABLE `coba_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coba_materi_history`
--
ALTER TABLE `coba_materi_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coba_materi_lampiran`
--
ALTER TABLE `coba_materi_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coba_materi`
--
ALTER TABLE `coba_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coba_materi_history`
--
ALTER TABLE `coba_materi_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coba_materi_lampiran`
--
ALTER TABLE `coba_materi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
