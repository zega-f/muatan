-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2021 at 08:26 AM
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
-- Database: `bimbelver3`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question_attachment`
--

CREATE TABLE `quiz_question_attachment` (
  `id` int(11) NOT NULL,
  `quiz_id` varchar(55) NOT NULL,
  `question_id` varchar(55) NOT NULL,
  `filename` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_question_attachment`
--

INSERT INTO `quiz_question_attachment` (`id`, `quiz_id`, `question_id`, `filename`, `created_at`) VALUES
(3, 'NtF52aNV', '1', '03XP2At9ilSwakLTBIOLOGI.png', '2021-10-08 15:10:37'),
(4, 'NtF52aNV', '2', 'WzcLWPAdeaXeB6rJSEJARAH.png', '2021-10-08 15:10:51'),
(5, 'NtF52aNV', '3', 'C0DdSAchC7mc0umfGEOGRAFI.png', '2021-10-08 16:13:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz_question_attachment`
--
ALTER TABLE `quiz_question_attachment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz_question_attachment`
--
ALTER TABLE `quiz_question_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
