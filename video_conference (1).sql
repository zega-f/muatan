-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2021 at 08:25 AM
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
-- Database: `bimbelver2`
--

-- --------------------------------------------------------

--
-- Table structure for table `video_conference`
--

CREATE TABLE `video_conference` (
  `id` int(11) NOT NULL,
  `meet_id` varchar(16) NOT NULL,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `tanggal` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `room_id` varchar(55) NOT NULL,
  `owner_id` varchar(55) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `passed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_conference`
--

INSERT INTO `video_conference` (`id`, `meet_id`, `title`, `url`, `tanggal`, `start`, `end`, `schedule_id`, `room_id`, `owner_id`, `status`, `passed`, `created_at`) VALUES
(1, 'iPEfeMh2VxqROFFm', 'tatap muka pertamax', 'https://apps.google.com/meet/', '2021-09-13', '13:17:00', '14:17:00', 5, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-11 06:17:37'),
(2, 'AZ5AeJiDrJgWIqyR', 'tatap muka ke-12', 'https://stackoverflow.com/questions/12137033/load-external-url-into-modal-jquery-ui-dialog', '2021-09-16', '14:47:00', '15:47:00', 5, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-11 06:47:18'),
(12, 'QrSNG4ftK2K0ztJe', 'tatap muka pertamax', 'https://laravel.com/docs/8.x/urls#generating-urls', '2021-09-11', '14:42:00', '15:42:00', 3, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-11 07:42:43'),
(13, 'DoKBCvhIKgIitGQI', 'Perkenalan', 'https://getbootstrap.com/docs/4.0/components/tooltips/', '2021-09-11', '16:29:00', '17:30:00', 1, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-11 09:30:20'),
(16, 'atpLszAnu2maBXli', 'tatap muka ke-1', 'https://spark.bootlab.io/dashboard-default.html?theme=dark#', '2021-09-15', '12:25:00', '13:25:00', 2, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-14 05:25:11'),
(17, 'mmJpm9Lqxp9dbpQW', 'tatap muka ke-2', 'https://spark.bootlab.io/dashboard-default.html?theme=dark#', '2021-09-23', '15:57:00', '16:58:00', 3, 'qbw2N9', 'ulZI5INb', 0, 0, '2021-09-14 08:58:04'),
(22, 'bdrd6VmMTweEdvA2', 'perkenalan', 'https://www.youtube.com/', '2021-09-22', '11:47:00', '12:47:00', 1, '1mt5nn', 'AsmF7LKC', 0, 0, '2021-09-22 04:47:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `video_conference`
--
ALTER TABLE `video_conference`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `video_conference`
--
ALTER TABLE `video_conference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
