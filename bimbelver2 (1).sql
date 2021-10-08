-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2021 at 06:48 AM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 2,
  `role_access` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `name`, `email`, `password`, `level`, `role_access`, `status`, `created_at`) VALUES
(1, 'SGWZyo', 'Zega', 'xegalol@gmail.com', '$2y$10$w4lCScSNYnH69HSPS290lerYRuzT6ifApbLUJZCa4huFrVAsWvZlC', 1, '', 1, '2021-02-20 06:29:51'),
(2, 'itTaLlwM', 'zega', 'admin1@email.com', '$2y$10$vyB7RKmpULiutba0CoBm8.KTeoUrD/pDMQHV92lUmA8dswYwJc4G2', 2, '[\"r_p\",\"k_p\",\"k_p\",\"k_p\",\"b_s\",\"b_a\"]', 1, '2021-05-10 09:32:27'),
(3, 'sM0BcNjY', 'admin2', 'admin2@email.com', '$2y$10$8Qhg64qEIpnbDPHCCmw/ZOfYUM8nAJj7krz/zPbF3ZbDTOq3Gj9o6', 2, '[\"k_p\",\"k_p\",\"k_p\"]', 0, '2021-05-10 09:36:54'),
(6, 'neIZ1h', 'adminTam99', 'admin@email.com', '$2y$10$Y5Am9yc/U6m1fvuzm0Fi.u8KM3jK5/quWG.TCpuz473OaKCA2gcS.', 1, NULL, 1, '2021-08-09 06:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `atur_jam`
--

CREATE TABLE `atur_jam` (
  `id` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `atur_jam`
--

INSERT INTO `atur_jam` (`id`, `nama`, `start`, `end`, `update`) VALUES
(1, 1, '13:00:00', '13:45:00', '2021-08-24 08:08:38'),
(2, 2, '13:45:00', '14:30:00', '2021-08-24 08:08:38'),
(3, 3, '14:30:00', '15:15:00', '2021-08-24 08:08:38'),
(4, 4, '15:15:00', '16:00:00', '2021-08-24 08:08:38'),
(5, 5, '16:00:00', '16:45:00', '2021-08-24 08:08:38'),
(6, 6, '16:45:00', '17:30:00', '2021-08-24 08:08:38'),
(7, 7, '17:30:00', '18:15:00', '2021-08-24 08:08:38'),
(8, 8, '18:15:00', '19:00:00', '2021-08-24 08:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `a_jam`
--

CREATE TABLE `a_jam` (
  `id` int(11) NOT NULL,
  `start` time NOT NULL,
  `durasi` int(11) NOT NULL,
  `jam` int(11) NOT NULL,
  `update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_jam`
--

INSERT INTO `a_jam` (`id`, `start`, `durasi`, `jam`, `update`) VALUES
(1, '13:00:00', 45, 8, '2021-08-24 08:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `bab`
--

CREATE TABLE `bab` (
  `id` int(11) NOT NULL,
  `bab_name` varchar(255) NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `room_id` varchar(55) NOT NULL,
  `mapel` int(11) DEFAULT NULL,
  `type` enum('kelas','umum') NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bab`
--

INSERT INTO `bab` (`id`, `bab_name`, `urutan`, `room_id`, `mapel`, `type`, `status`, `created_at`) VALUES
(1, 'pendahuluan', NULL, '9', 2, 'kelas', 1, '2021-09-21 08:18:25'),
(2, 'pendalaman', NULL, '9', 2, 'kelas', 1, '2021-09-21 08:20:27'),
(3, 'perkenalanan', NULL, '9', 1, 'kelas', 1, '2021-09-21 08:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `footer_alamat` varchar(100) NOT NULL,
  `footer_whatsapp` int(15) NOT NULL,
  `footer_email` varchar(50) NOT NULL,
  `footer_youtube` varchar(50) NOT NULL,
  `footer_website` varchar(50) NOT NULL,
  `rekening` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `logo`, `name`, `footer_alamat`, `footer_whatsapp`, `footer_email`, `footer_youtube`, `footer_website`, `rekening`, `deskripsi`) VALUES
(1, '20210915054507.png', 'Astar Bimbel2', 'JL. Warujayeng - Kediri, RT. 18/RW 08, Bancar, Singkalanyar, Kec. Prambon, Kabupaten Nganjuk, Jawa T', 2147483647, 'admin@jayabayabimbel.co.id', 'youtube.com/jayabayabimbel', 'jayabayabimbel.co.id', '1234567890', '<p>Bimbingan belajar Jayabaya atau yang dikenal dengan Jayabaya Bimbel berdiri sejak tahun 1999. Menyediakan jasa bimbingan belajar yang mampu memenuhi kebutuhan belajar dan terus berkembang menyesuaikan alur pendidikan di Indonesia.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `coba_materi`
--

CREATE TABLE `coba_materi` (
  `id` int(11) NOT NULL,
  `id_materi` varchar(55) NOT NULL,
  `id_kelas` varchar(11) NOT NULL,
  `mapel` int(11) DEFAULT NULL,
  `judul` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_history` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_materi`
--

INSERT INTO `coba_materi` (`id`, `id_materi`, `id_kelas`, `mapel`, `judul`, `created_at`, `update_history`) VALUES
(1, '2A4SkvnA', '9', 2, 'What is E-learning?', '2021-09-21 08:18:34', NULL),
(2, 'wrrsZ5Aq', '9', 2, 'Pendahuluan', '2021-09-21 08:19:42', NULL),
(3, 'V00gqYBo', '9', 2, 'Laravel + Pusher : Real-Time Notification 2', '2021-09-21 08:20:54', NULL),
(4, 'eCFxum89', '9', 1, 'The 10 Best Database Software Systems For Business Professionals', '2021-09-21 08:22:34', NULL),
(5, 'aEw7nPog', '9', 1, 'The 5 Best Database Software Systems For Business Professionals part 2', '2021-09-21 08:22:59', NULL);

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
(1, 'zzlKnKN3', 'VIxCCOo3XFi8K79K6naX5vsJTXoRhkKBBAB Ipercobaan.pdf', 'BAB Ipercobaan.pdf', '2021-09-10 07:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `coba_quiz_question`
--

CREATE TABLE `coba_quiz_question` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coba_tugas`
--

CREATE TABLE `coba_tugas` (
  `id` int(11) NOT NULL,
  `id_tugas` varchar(55) NOT NULL,
  `judul` text NOT NULL,
  `id_kelas` varchar(55) NOT NULL,
  `mapel` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coba_tugas`
--

INSERT INTO `coba_tugas` (`id`, `id_tugas`, `judul`, `id_kelas`, `mapel`, `waktu`, `created_at`) VALUES
(1, 'DXWvzSqT', 'Laravel + Pusher : Real-Time Notification', '9', 2, '2021-09-23 16:19:00', '2021-09-21 08:20:02'),
(2, 'xl880PgB', 'Penerapan Query dari masing - masing database part 1', '9', 1, '2021-09-21 18:26:00', '2021-09-21 08:26:44');

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

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `konten_id` varchar(55) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 2,
  `body` text DEFAULT NULL,
  `attachmentOriginalName` text DEFAULT NULL,
  `attachmentName` text DEFAULT NULL,
  `attachment_ext` varchar(55) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `konten_id`, `user_id`, `user_type`, `body`, `attachmentOriginalName`, `attachmentName`, `attachment_ext`, `date`, `time`) VALUES
(4, 'gSbfW2qj', 'ZPmNU34HMGmFKVka', 2, 'test', NULL, NULL, NULL, '2021-09-02', '15:50:24'),
(6, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'm', NULL, NULL, NULL, '2021-09-02', '15:50:24'),
(7, 'gSbfW2qj', 'ZPmNU34HMGmFKVka', 2, 'k', NULL, NULL, NULL, '2021-09-02', '15:50:24'),
(8, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'I have a div which I have attached an onclick event to. in this div there is a tag with a link. When I click the link the onclick event from the div is also triggered. How can i disable this so that if the link is clicked on the div onclick is not fired?', NULL, NULL, NULL, '2021-09-02', '15:50:24'),
(9, 'gSbfW2qj', 'ZPmNU34HMGmFKVka', 2, 'coba', NULL, NULL, NULL, '2021-09-02', '15:59:13'),
(10, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'lll', NULL, NULL, NULL, '2021-09-02', '16:00:11'),
(11, 'gSbfW2qj', 'ZPmNU34HMGmFKVka', 2, 'I believe I have found a solution to this, the key is the DATE() function in mysql, which converts a DateTime into just Date:', NULL, NULL, NULL, '2021-09-02', '16:21:28'),
(15, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'testing 1', NULL, NULL, NULL, '2021-09-03', '13:00:32'),
(18, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, '<script>alert(\'surprise!\');</script>', NULL, NULL, NULL, '2021-09-03', '14:38:17'),
(22, '61', 'ZPmNU34HMGmFKVka', 2, 'p', NULL, NULL, NULL, '2021-09-03', '15:01:03'),
(23, '61', 'ZPmNU34HMGmFKVka', 2, 'halo guys', NULL, NULL, NULL, '2021-09-03', '15:01:10'),
(31, '63', 'ZovrKpzeljwa5Z6j', 2, 'a', NULL, NULL, NULL, '2021-09-03', '17:03:41'),
(32, '63', 'ZovrKpzeljwa5Z6j', 2, 'ini adalah hasil saya', 'zega febrianto - hasil.pdf', 'Dcw1Bx7xQdHm5HaiOZALrh3L5Ibi7pUbzega febrianto - hasil.pdf', 'pdf', '2021-09-03', '17:04:01'),
(34, '61', 'ZPmNU34HMGmFKVka', 2, 'hey', NULL, NULL, NULL, '2021-09-04', '13:23:47'),
(35, '61', 'ZPmNU34HMGmFKVka', 2, 'jude', NULL, NULL, NULL, '2021-09-04', '13:24:32'),
(36, '61', 'ZovrKpzeljwa5Z6j', 2, 'sa', NULL, NULL, NULL, '2021-09-04', '13:24:45'),
(43, '61', 'ZovrKpzeljwa5Z6j', 2, 'Place one add-on or button on either side of an input. You may also place one on both sides of an input. We do not support multiple form-controls in a single input group and <label>s must come outside the input group.', NULL, NULL, NULL, '2021-09-04', '16:44:45'),
(44, '61', 'ZPmNU34HMGmFKVka', 2, 'Hello', NULL, NULL, NULL, '2021-09-04', '16:48:43'),
(45, '66', 'ZPmNU34HMGmFKVka', 2, NULL, 'IMG-20210902-WA0030.jpg', 'CctN5YQO9ujT4XCapOPmDZZE1FtfupwFIMG-20210902-WA0030.jpg', 'jpg', '2021-09-04', '16:49:26'),
(46, '66', 'ZPmNU34HMGmFKVka', 2, 'P', 'FB_IMG_16304121330345305.jpg', 'mzAarBxsJ98eWZxM2vwY1GF29Qd9UPxnFB_IMG_16304121330345305.jpg', 'jpg', '2021-09-04', '16:50:34'),
(54, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'test', NULL, NULL, NULL, '2021-09-06', '11:42:46'),
(55, '61', 'ulZI5INb', 1, 'halo', NULL, NULL, NULL, '2021-09-06', '12:49:23'),
(61, 'NiubIcx4', 'ulZI5INb', 1, 'e learning?', NULL, NULL, NULL, '2021-09-06', '13:21:24'),
(62, '111', 'ulZI5INb', 1, 'p', NULL, NULL, NULL, '2021-09-06', '13:22:36'),
(89, 'gSbfW2qj', 'ulZI5INb', 1, 'a', NULL, NULL, NULL, '2021-09-06', '15:29:46'),
(90, 'gSbfW2qj', 'ulZI5INb', 1, 'Test', NULL, NULL, NULL, '2021-09-06', '16:48:59'),
(91, 'gSbfW2qj', 'ZovrKpzeljwa5Z6j', 2, 'hallo', NULL, NULL, NULL, '2021-09-06', '16:49:08'),
(100, '61', 'ulZI5INb', 2, NULL, 'IMG-20210904-WA0019.jpg', '1un7kcTCR7Ud9Nmw7hvWYuJIFxdo10N7IMG-20210904-WA0019.jpg', 'jpg', '2021-09-06', '16:56:30'),
(102, '101', 'ZPmNU34HMGmFKVka', 2, 'p', NULL, NULL, NULL, '2021-09-09', '13:51:12'),
(103, 'qbw2N9', 'Lkt4RvJtmwHk0I4P', 2, 'p', NULL, NULL, NULL, '2021-09-09', '14:36:02'),
(104, '1_qbw2N9', 'ZPmNU34HMGmFKVka', 2, 'a', NULL, NULL, NULL, '2021-09-09', '14:42:29'),
(105, '2_qbw2N9', 'ZPmNU34HMGmFKVka', 2, 'c', NULL, NULL, NULL, '2021-09-09', '14:42:40'),
(106, 'qbw2N9_1_10', 'ZPmNU34HMGmFKVka', 2, 'a', NULL, NULL, NULL, '2021-09-09', '14:58:57'),
(107, 'nCHe25a4', 'Lkt4RvJtmwHk0I4P', 2, 'a', NULL, NULL, NULL, '2021-09-09', '15:04:45'),
(108, 'nCHe25a4', 'ZPmNU34HMGmFKVka', 2, 'b', NULL, NULL, NULL, '2021-09-09', '15:05:08'),
(109, 'nCHe25a4', 'ZPmNU34HMGmFKVka', 2, 'a', NULL, NULL, NULL, '2021-09-09', '15:07:13'),
(110, 'nCHe25a4', 'ZPmNU34HMGmFKVka', 2, 'c', NULL, NULL, NULL, '2021-09-09', '15:07:19'),
(111, 'nCHe25a4_qbw2N9', 'ZPmNU34HMGmFKVka', 2, 'a', NULL, NULL, NULL, '2021-09-09', '15:07:48'),
(112, 'nCHe25a4_qbw2N9', 'Lkt4RvJtmwHk0I4P', 2, 'b', NULL, NULL, NULL, '2021-09-09', '15:07:54'),
(113, 'qbw2N9_1_10', 'Lkt4RvJtmwHk0I4P', 2, 'stream kelas', NULL, NULL, NULL, '2021-09-09', '15:09:58'),
(115, 'qbw2N95', 'ulZI5INb', 1, 'p', NULL, NULL, NULL, '2021-09-13', '11:24:55'),
(116, 'qbw2N93', 'ulZI5INb', 1, 'p', NULL, NULL, NULL, '2021-09-13', '11:38:48'),
(117, 'qbw2N91', 'ulZI5INb', 1, 'halo', NULL, NULL, NULL, '2021-09-14', '11:39:16'),
(118, 'qbw2N95', 'ulZI5INb', 1, 'p', NULL, NULL, NULL, '2021-09-14', '11:50:05'),
(119, 'nCHe25a4', 'ulZI5INb', 1, 'halo', NULL, NULL, NULL, '2021-09-14', '11:54:12'),
(120, 'nCHe25a4', 'ulZI5INb', 1, 'anak anak', NULL, NULL, NULL, '2021-09-14', '11:58:16'),
(121, 'nCHe25a4', 'ulZI5INb', 1, 'a', NULL, NULL, NULL, '2021-09-14', '11:58:50'),
(123, 'qbw2N9_2', 'ulZI5INb', 1, 'halo', NULL, NULL, NULL, '2021-09-14', '12:14:15'),
(125, 'qbw2N9_2', 'ulZI5INb', 1, 'Selamat pagi anak - anak. Mohon maaf, bapak hari ini ingin menginformasikan bahwasanya saya tidak bisa mengajar untuk hari ini dikarenakan sakit. Terima kasih.', NULL, NULL, NULL, '2021-09-14', '12:23:37'),
(126, 'qbw2N9_2', 'ZPmNU34HMGmFKVka', 2, 'Siap pak', NULL, NULL, NULL, '2021-09-14', '12:24:36'),
(127, 'nCHe25a4_qbw2N9', 'ulZI5INb', 1, 'halo anak - anak', NULL, NULL, NULL, '2021-09-14', '13:26:54'),
(128, '1mt5nn_1', 'AlLwVCmEgC9xBPhP', 2, 'ping', NULL, NULL, NULL, '2021-09-14', '16:39:05'),
(129, '1mt5nn_2_9', 'YMRvWmKHDDZVbMjz', 2, 'halo', NULL, NULL, NULL, '2021-09-14', '16:40:31'),
(131, 'zzlKnKN3_1mt5nn', 'AlLwVCmEgC9xBPhP', 2, 'p', NULL, NULL, NULL, '2021-09-14', '16:59:20'),
(140, '1mt5nn_2_9', 'AlLwVCmEgC9xBPhP', 2, 'test', NULL, NULL, NULL, '2021-09-21', '12:33:04'),
(141, '1mt5nn_2_9', 'AlLwVCmEgC9xBPhP', 2, 'p', NULL, NULL, NULL, '2021-09-21', '12:33:21'),
(142, '1mt5nn_7_9', 'AlLwVCmEgC9xBPhP', 2, 'p', NULL, NULL, NULL, '2021-09-21', '14:16:05'),
(143, '1mt5nn_1_9', 'AlLwVCmEgC9xBPhP', 2, 'p', NULL, NULL, NULL, '2021-09-21', '15:29:57'),
(144, '2A4SkvnA_1mt5nn', 'AsmF7LKC', 1, 'p', NULL, NULL, NULL, '2021-09-21', '15:35:53'),
(145, 'V00gqYBo_1mt5nn', 'AlLwVCmEgC9xBPhP', 2, 'hallo', NULL, NULL, NULL, '2021-09-21', '15:37:25'),
(150, 'V00gqYBo_1mt5nn', 'AsmF7LKC', 1, 'Silahkan untuk absensi terlebih dahulu', NULL, NULL, NULL, '2021-09-21', '15:39:19'),
(151, 'V00gqYBo_1mt5nn', 'AlLwVCmEgC9xBPhP', 2, 'zega febrianto - 17104410036', NULL, NULL, NULL, '2021-09-21', '15:39:28'),
(152, 'V00gqYBo_1mt5nn', 'AlLwVCmEgC9xBPhP', 2, 'awokawokawok', NULL, NULL, NULL, '2021-09-21', '16:56:32'),
(153, '1mt5nn_2', 'AlLwVCmEgC9xBPhP', 2, 'test', NULL, NULL, NULL, '2021-09-21', '16:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `db_jenjang`
--

CREATE TABLE `db_jenjang` (
  `id` int(11) NOT NULL,
  `jenjang` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_jenjang`
--

INSERT INTO `db_jenjang` (`id`, `jenjang`, `tingkat`, `nama`, `status`) VALUES
(1, 1, 1, 'SD Kelas 1', '0'),
(2, 1, 2, 'SD Kelas 2', '0'),
(3, 1, 3, 'SD Kelas 3', '0'),
(4, 1, 4, 'SD Kelas 4', '0'),
(5, 1, 5, 'SD Kelas 5', '0'),
(6, 1, 6, 'SD Kelas 6', '0'),
(7, 2, 7, 'SMP Kelas 7', '0'),
(8, 2, 8, 'SMP Kelas 8', '0'),
(9, 2, 9, 'SMP Kelas 9', '1'),
(10, 3, 10, 'SMA Kelas 10', '0'),
(11, 3, 11, 'SMA Kelas 11', '0'),
(12, 3, 12, 'SMA Kelas 12', '0');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengajar`
--

CREATE TABLE `detail_pengajar` (
  `id` int(11) NOT NULL,
  `pengajar` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `universitas` varchar(50) NOT NULL,
  `tentor_progam` int(11) DEFAULT NULL,
  `tlp` int(15) NOT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pengajar`
--

INSERT INTO `detail_pengajar` (`id`, `pengajar`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `pendidikan`, `universitas`, `tentor_progam`, `tlp`, `foto`) VALUES
(1, 'ulZI5INb', 'L', 'Blitar', '1999-08-17', 'Jln. Raya Blitar No 190', 'S1', 'Blitar', NULL, 1234567889, ''),
(2, 'AsmF7LKC', 'P', 'Kediri', '1997-05-07', 'Jln. Kediri Blitar No 125', 'S1', 'UNP Kediri', NULL, 85345678, ''),
(4, 'p1rlKK09', 'L', 'kediri', '2021-09-01', 'kediri', 'Strata 1', 'hh', NULL, 888, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE `faq_category` (
  `id` int(11) NOT NULL,
  `category_id` varchar(55) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq_category`
--

INSERT INTO `faq_category` (`id`, `category_id`, `category`, `created_at`) VALUES
(1, 'JZaL88pE', 'Teknis Pendaftaran', '2021-06-19 09:30:53'),
(2, 'VaaWGkas', 'Teknis Pembayaran', '2021-06-19 09:44:37'),
(3, 'iNbSY5dd', 'Dokumen yang dibutuhkan', '2021-06-19 09:44:45'),
(4, 'gDEjEIJd', 'Fasilitas yang didapat', '2021-06-19 09:44:59'),
(5, 'JwozOUxq', 'Nomor Customer Service', '2021-06-19 09:45:08'),
(6, '12lnrmAW', 'tanya', '2021-09-15 06:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `faq_question`
--

CREATE TABLE `faq_question` (
  `id` int(11) NOT NULL,
  `faq_category` varchar(255) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq_question`
--

INSERT INTO `faq_question` (`id`, `faq_category`, `question`, `answer`, `created_at`) VALUES
(1, 'JZaL88pE', 'Apa saja syarat yang diperlukan untuk pendaftaran?', '<ol>\r\n	<li>E-mail aktif</li>\r\n	<li>No handphone aktif</li>\r\n	<li>Kartu Tanda Pelajar</li>\r\n</ol>', '2021-06-26 08:56:59'),
(3, 'VaaWGkas', 'Berapa nomor rekening yang dapat menerima pembayaran untuk program ini?', '<p>Rekening BRI atas nama astartekno 111.222.333.4444</p>', '2021-06-26 09:17:05'),
(4, 'VaaWGkas', 'Bagaimana cara menyetor bukti pembayaran?', '<p>Unggah di astartekno.com/partnership/unggah_bukti_pembayaran lalu masukkan id pembayaran anda&nbsp;</p>', '2021-06-26 09:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `index_html`
--

CREATE TABLE `index_html` (
  `id` int(11) NOT NULL,
  `comp_id` varchar(55) NOT NULL,
  `comp_url` text NOT NULL,
  `header` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `index_html`
--

INSERT INTO `index_html` (`id`, `comp_id`, `comp_url`, `header`, `description`, `url`) VALUES
(1, 'slideshow', 'public/1st.jpg', 'Lomba Desain Logo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', ''),
(2, 'slideshow', 'public/2nd.jpg', 'Program Guru', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL),
(3, 'slideshow', 'public/3rd.jpg', 'Magang', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kelas`
--

CREATE TABLE `jadwal_kelas` (
  `id` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `kelas` varchar(11) NOT NULL,
  `tingkat` int(11) DEFAULT NULL,
  `mapel` int(11) DEFAULT NULL,
  `pengajar` varchar(50) NOT NULL,
  `hari` int(11) NOT NULL,
  `jam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_kelas`
--

INSERT INTO `jadwal_kelas` (`id`, `id_jadwal`, `kelas`, `tingkat`, `mapel`, `pengajar`, `hari`, `jam`) VALUES
(1, 1, '1mt5nn', 9, 1, 'AsmF7LKC', 1, 1),
(2, 2, '1mt5nn', 9, 2, 'AsmF7LKC', 2, 2),
(3, 3, 'PNfSIs', 8, 1, 'AsmF7LKC', 6, 1),
(4, 4, 'PNfSIs', 8, 1, '6Ue6z5Rr', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `id_kelas` varchar(10) NOT NULL,
  `room_name` varchar(30) NOT NULL,
  `jenjang` varchar(20) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `info` varchar(100) DEFAULT NULL,
  `registrasi` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `id_kelas`, `room_name`, `jenjang`, `tingkat`, `status`, `info`, `registrasi`, `created_at`) VALUES
(1, '1mt5nn', 'A', '2', '9', '1', NULL, NULL, '2021-09-14 09:33:35'),
(2, 'PNfSIs', 'A', '2', '8', '1', NULL, NULL, '2021-09-21 08:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_kelas`
--

CREATE TABLE `mapel_kelas` (
  `id` int(11) NOT NULL,
  `id_mapel_kelas` int(11) NOT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `jenjang` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `mapel` int(11) NOT NULL,
  `harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel_kelas`
--

INSERT INTO `mapel_kelas` (`id`, `id_mapel_kelas`, `id_kelas`, `jenjang`, `tingkat`, `mapel`, `harga`) VALUES
(1, 1, NULL, 2, 9, 1, 150000),
(2, 2, NULL, 2, 9, 2, 150000),
(6, 3, NULL, 2, 9, 6, 150000),
(7, 7, NULL, 2, 9, 7, 150000),
(8, 8, NULL, 2, 8, 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `mapel_pengajar`
--

CREATE TABLE `mapel_pengajar` (
  `id` int(11) NOT NULL,
  `id_mapel_pengajar` varchar(11) NOT NULL,
  `id_pengajar` varchar(11) NOT NULL,
  `id_mapel` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel_pengajar`
--

INSERT INTO `mapel_pengajar` (`id`, `id_mapel_pengajar`, `id_pengajar`, `id_mapel`) VALUES
(1, '1', 'ulZI5INb', '1'),
(2, '2', 'AsmF7LKC', '3'),
(3, '3', 'E8FqKdRB', '2'),
(4, '4', 'SHob4PyA', '6'),
(5, '5', '6Ue6z5Rr', '1'),
(9, '6', 'ulZI5INb', '2'),
(10, '10', 'SHob4PyA', '7'),
(12, '12', 'AsmF7LKC', '1'),
(13, '13', 'p1rlKK09', '7'),
(14, '14', 'p1rlKK09', '2'),
(16, '15', 'AsmF7LKC', '0'),
(17, '17', 'AsmF7LKC', '2');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `materi_id` varchar(55) NOT NULL,
  `materi_name` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `konten` longtext NOT NULL,
  `video_url` text DEFAULT NULL,
  `video_duration` int(11) DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `meet_url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `del_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `materi_id`, `materi_name`, `user_id`, `konten`, `video_url`, `video_duration`, `lampiran`, `meet_url`, `created_at`, `del_status`) VALUES
(1, '3ksdIG', 'How to auto change position of <li> in Jquery', 'Q10pwu6Z', '<p>jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and extensibility, jQuery has changed the way that millions of people write JavaScript.</p>', 'XercfCyjL-c', 38, 'q4ygbpdb_class_client (2).sql', NULL, '2021-04-07 09:35:57', 0),
(2, 'oSOETh', 'MySQL database', 'Q10pwu6Z', '<p>s</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-04-07 09:36:21', 0),
(3, 'g2oSbG', 'a', 'Q10pwu6Z', '<p>a</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-04-07 09:42:39', 0),
(4, 'QqY0Tr', 'c', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-04-07 09:43:35', 0),
(5, 'wOlT9w', 'coba 1', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-04-07 09:44:19', 1),
(6, 'QEFsRP', 'Bahasa inggris', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, 'VxFrX7dist.zip', NULL, '2021-04-07 09:53:18', 0),
(8, 'AdcCpo', 'materi 1', 'Q10pwu6Z', 'c', 'XercfCyjL-c', 38, NULL, NULL, '2021-04-13 09:32:33', 0),
(12, 'qyGjxe', 'percobaan lampiran', 'Q10pwu6Z', '<p>coba</p>', 'XercfCyjL-c', 38, 'qyGjxejcpicker (1).txt', NULL, '2021-04-15 06:45:39', 0),
(13, 'rnai8c', 'c', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, 'rnai8cjcpicker (1).txt', NULL, '2021-04-15 06:48:50', 0),
(14, 'tIRTFO', 'ccc', 'Q10pwu6Z', '<p>cc</p>', 'XercfCyjL-c', 38, 'tIRTFOjcpicker (1).txt', NULL, '2021-04-15 06:49:58', 0),
(15, 'CJVuRK', 'd', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, 'CJVuRKjcpicker (1).txt', NULL, '2021-04-15 06:51:14', 0),
(16, 'R4HibO', 'c', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, 'R4HibOjcpicker (1).txt', NULL, '2021-04-15 06:51:55', 0),
(17, '0oTis9', 'c', 'Q10pwu6Z', '<p>c</p>', 'XercfCyjL-c', 38, '0oTis9jcpicker (1).txt', NULL, '2021-04-15 06:53:10', 1),
(18, 'GYf10f', 'tugas 1', 'Q10pwu6Z', '<p>tugas</p>', NULL, NULL, NULL, NULL, '2021-04-27 07:01:00', 1),
(19, 'cIlNFa', 'materi pertama', 'ulZI5INb', '<p>coba</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-05-22 08:37:36', 0),
(20, 'W1sGy6', 'pendahuluan', 'ulZI5INb', '<p>xss</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-05-22 09:17:09', 0),
(21, '8MieIJ', 'Database Migration', 'ulZI5INb', '<p>Migrations are like version control for your database, allowing your team to define and share the application&#39;s database schema definition. If you have ever had to tell a teammate to manually add a column to their local database schema after pulling in your changes from source control, you&#39;ve faced the problem that database migrations solve.</p>\r\n\r\n<p>The Laravel&nbsp;<code>Schema</code>&nbsp;<a href=\"https://laravel.com/docs/8.x/facades\">facade</a>&nbsp;provides database agnostic support for creating and manipulating tables across all of Laravel&#39;s supported database systems. Typically, migrations will use this facade to create and modify database tables and columns.</p>', 'XercfCyjL-c', 38, NULL, NULL, '2021-05-24 09:45:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `materi_room`
--

CREATE TABLE `materi_room` (
  `id` int(11) NOT NULL,
  `materi_id` varchar(55) NOT NULL,
  `room_id` varchar(55) NOT NULL,
  `owner_id` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi_room`
--

INSERT INTO `materi_room` (`id`, `materi_id`, `room_id`, `owner_id`, `created_at`) VALUES
(2, 'pYuEpZ', 'IN7Ezf', 'Q10pwu6Z', '2021-04-03 07:26:03'),
(4, 'lzvMUa', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 06:11:22'),
(5, 'ojWmVe', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 07:02:10'),
(6, 'rjQnmE', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 08:23:48'),
(7, 'fhiy86', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 08:54:46'),
(8, 'Z7GEhm', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:14:40'),
(9, 'NkmdAn', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:18:48'),
(10, 'oKI8XT', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:30:10'),
(11, 'TrPGIb', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:32:55'),
(12, 'XgNvmy', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:33:29'),
(13, '3ksdIG', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:35:56'),
(14, 'oSOETh', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:36:21'),
(15, 'g2oSbG', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:42:39'),
(16, 'QqY0Tr', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:43:35'),
(17, 'wOlT9w', 'IN7Ezf', 'Q10pwu6Z', '2021-04-07 09:44:19'),
(18, 'QEFsRP', 'QiE8JD', 'Q10pwu6Z', '2021-04-07 09:53:18'),
(19, 'rk05tF', 'IN7Ezf', 'Q10pwu6Z', '2021-04-13 08:45:13'),
(20, 'AdcCpo', 'vBYGKo', 'Q10pwu6Z', '2021-04-13 09:32:33'),
(21, 'AdcCpo', 'vBYGKo', 'Q10pwu6Z', '2021-04-13 09:45:22'),
(22, '4Wjs9L', 'IN7Ezf', 'Q10pwu6Z', '2021-04-14 09:43:18'),
(23, 'cPMg6p', 'IN7Ezf', 'Q10pwu6Z', '2021-04-14 09:44:06'),
(24, 'Jbw7HO', 'IN7Ezf', 'Q10pwu6Z', '2021-04-14 09:44:35'),
(25, 'ER0UGu', 'IN7Ezf', 'Q10pwu6Z', '2021-04-14 09:45:23'),
(26, 'bazwb5', 'IN7Ezf', 'Q10pwu6Z', '2021-04-14 09:50:47'),
(27, 'qyGjxe', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:45:39'),
(28, 'rnai8c', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:48:49'),
(29, 'tIRTFO', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:49:57'),
(30, 'CJVuRK', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:51:14'),
(31, 'R4HibO', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:51:55'),
(32, '0oTis9', 'IN7Ezf', 'Q10pwu6Z', '2021-04-15 06:53:10'),
(33, 'GYf10f', 'IN7Ezf', 'Q10pwu6Z', '2021-04-27 07:01:00'),
(34, 'cIlNFa', '8DtGaf', 'ulZI5INb', '2021-05-22 08:37:35'),
(35, 'W1sGy6', 'vBYGKo', 'ulZI5INb', '2021-05-22 09:17:09'),
(36, '8MieIJ', 'vBYGKo', 'ulZI5INb', '2021-05-24 09:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `materi_user`
--

CREATE TABLE `materi_user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `materi_id` varchar(55) NOT NULL,
  `on_screen_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi_user`
--

INSERT INTO `materi_user` (`id`, `user_id`, `materi_id`, `on_screen_time`, `created_at`) VALUES
(1, 'gewbjo12', '3ksdIG', 0, '2021-04-08 06:13:02'),
(2, 'gewbjo12', 'oSOETh', 0, '2021-04-10 07:27:34'),
(3, 'gewbjo12', 'QqY0Tr', 0, '2021-04-10 07:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `partner_type` int(11) DEFAULT NULL,
  `partner_id` varchar(255) NOT NULL,
  `partner_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_instansi` varchar(255) DEFAULT NULL,
  `user_kuota` int(11) NOT NULL DEFAULT 50,
  `verify` int(11) NOT NULL DEFAULT 0,
  `otp` varchar(255) NOT NULL,
  `instansi` text DEFAULT NULL,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `surat_izin` text DEFAULT NULL,
  `ktp_penanggung_jawab` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `partner_type`, `partner_id`, `partner_name`, `email`, `nama_instansi`, `user_kuota`, `verify`, `otp`, `instansi`, `penanggung_jawab`, `surat_izin`, `ktp_penanggung_jawab`, `phone`, `password`, `created_at`) VALUES
(1, 2, 'gewbjo12', 'zega', 'randombox38@gmail.com', 'Bimbingan Skripsi', 100, 1, 'gewbjo12', NULL, 'saya sendiri', '2344-6564-1-PB.pdf', '14-IJCSE-04947.pdf', '+6281252867991', '$2y$10$6y4TKlM185DmLuQq/fEiCu6uYxUlx4P3ZbAU9jVHCZcKfFs.xXQ..', '2021-02-20 09:06:08'),
(2, 1, '59GcRdfT', 'zegas', 'randombox38@gmail.coms', NULL, 50, 1, '59GcRdfT', NULL, NULL, NULL, NULL, '', '$2y$10$uGqC0Qm2bLzQceZxKF7x0uRA03V2ZoQ1X0yussLN4jdRpa3Hb791a', '2021-02-20 10:10:02'),
(4, 1, 'NovdUhMF', 'zega3', 'randombox382@gmail.com', NULL, 50, 0, 'NovdUhMF', NULL, NULL, NULL, NULL, '', '$2y$10$pyvdtFXHOp5JKETE2Se.1.auD8qadrGw9vJfUUtVVI7fLXBcu26Cy', '2021-02-22 07:29:49'),
(5, NULL, '8UaMJij7', 'zega34', 'randombox3856@gmail.com', NULL, 50, 0, '8UaMJij7', NULL, NULL, NULL, NULL, '', '$2y$10$2NSiJLDWH6h8/jQtFmhRS.nDJHkJv.irUXduDCwC3yxScR0MfcWR6', '2021-02-22 07:45:26'),
(6, NULL, 'AHACeHpQ', 's', 'zega@gmail.com', NULL, 50, 1, 'AHACeHpQ', NULL, NULL, NULL, NULL, '', '$2y$10$vjfx0pCWcbW1T5x5B83VLe/YZkZeAb8SQDUQ11SPn9U9TmUF5s36q', '2021-03-08 07:47:10'),
(7, 1, 'Q10pwu6Z', 'Joseph', 'coba@gmail.com', 'Bimbingan Skripsi', 720, 1, 'Q10pwu6Z', NULL, 'saya sendiri', '2344-6564-1-PB.pdf', 'jcpicker (1).txt', '+6281252867991', '$2y$10$6y4TKlM185DmLuQq/fEiCu6uYxUlx4P3ZbAU9jVHCZcKfFs.xXQ..', '2021-03-08 07:52:45'),
(9, 2, 'khQEPY1v', 'a', 'a@gmail.com', NULL, 50, 1, 'khQEPY1v', NULL, NULL, NULL, NULL, NULL, '$2y$10$QaNnwDClqeUA4XnS3VmvJu048HdiE2A7rkOBS9bnPJan.u.J35hni', '2021-03-26 10:27:05'),
(11, NULL, 'Eena5YGT', 'zega_feb', 'xegalol@gmail.com', NULL, 50, 0, 'Eena5YGT', NULL, NULL, NULL, NULL, NULL, '$2y$10$IBfhGPlhewKVdCpFjtgtGOwcAIHJ2K0W8IGiFs0uv9jTJvc3a/7zC', '2021-04-15 07:25:33'),
(12, 1, 'Blv9nJ0U', 'zega_feb', 'xegalol@gmail.com', 'PT SAYASENDIRI', 40, 1, 'Blv9nJ0U', NULL, 'saya sendiri', NULL, NULL, '081252867991', '$2y$10$L.EbCaOY/e6iLkPlOHLThuAVvYbYWZaNkyTzELFwrbNH9jxlV4FAO', '2021-04-15 07:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `partnership`
--

CREATE TABLE `partnership` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `instansi` text NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `partnership`
--

INSERT INTO `partnership` (`id`, `nama`, `instansi`, `alamat`, `telpon`, `created_at`) VALUES
(1, 'saya', 'jayabaya', 'blitar', '081222333444', '2021-07-03 08:40:12'),
(2, 'saya', 'jayabaya', 'blitar', '081222333444', '2021-07-03 08:40:36'),
(3, 'saya', 'jayabaya 2', 'blitar', '081222333444', '2021-07-03 08:41:56'),
(4, 'saya', 'jayabaya 2', 'blitar', '081222333444', '2021-07-03 08:42:07'),
(5, 'saya', 'jayabaya', 'blitar', '081222333444', '2021-07-03 09:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `bab_id` int(11) NOT NULL,
  `mapel_id` int(11) DEFAULT NULL,
  `room_id` varchar(55) NOT NULL,
  `quiz_id` varchar(55) NOT NULL,
  `quiz_name` text DEFAULT NULL,
  `kkm` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `del_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_option`
--

CREATE TABLE `quiz_option` (
  `id` int(11) NOT NULL,
  `quiz_id` varchar(55) NOT NULL,
  `quiz_question_id` int(11) NOT NULL,
  `option_text` text NOT NULL,
  `benar` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `id` int(11) NOT NULL,
  `quiz_id` varchar(55) NOT NULL,
  `question` text NOT NULL,
  `attachment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_user`
--

CREATE TABLE `quiz_user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `quiz_id` varchar(55) NOT NULL,
  `nilai` int(11) NOT NULL,
  `lulus` int(11) NOT NULL,
  `user_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`user_answer`)),
  `right_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`right_answer`)),
  `user_right_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`user_right_answer`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_id` varchar(55) NOT NULL,
  `role_name` varchar(55) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_id`, `role_name`, `url`) VALUES
(1, 'k_a', 'Kelola Admin', 'all_admin'),
(2, 'k_p', 'Kelola Partner', 'all_partner'),
(3, 'k_u', 'Kelola User', 'all_user'),
(4, 'k_r', 'Kelola Ruangan', 'all_room'),
(5, 'k_s', 'Kelola Slideshow', ''),
(6, 'b_u', 'Buat Artikel', '');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_id` varchar(255) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `locked` int(11) NOT NULL DEFAULT 0,
  `biaya` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_id`, `room_name`, `description`, `locked`, `biaya`, `created_at`) VALUES
(1, 'i8344c', 'Bahasa Jepang', 'bahasa jepang bla bla bla', 0, 400000, '2021-09-10 09:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `room_user`
--

CREATE TABLE `room_user` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `room_id` varchar(255) DEFAULT NULL,
  `jenjang` int(11) DEFAULT NULL,
  `tingkat` int(11) DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `bukti_pembayaran` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_user`
--

INSERT INTO `room_user` (`id`, `type`, `room_id`, `jenjang`, `tingkat`, `school_name`, `user_id`, `status`, `bukti_pembayaran`, `created_at`) VALUES
(3, 0, '1mt5nn', NULL, 9, 'sman 3 blitar', 'AlLwVCmEgC9xBPhP', 1, '0lPAlLwVCmEgC9xBPhPBIOLOGI.png', '2021-09-20 08:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `room_user_mapel`
--

CREATE TABLE `room_user_mapel` (
  `id` int(11) NOT NULL,
  `register_id` varchar(55) DEFAULT NULL,
  `room_id` varchar(55) DEFAULT NULL,
  `tingkat` int(11) DEFAULT NULL,
  `user_id` varchar(55) NOT NULL,
  `mapel` int(11) NOT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `harga` int(11) NOT NULL,
  `bukti_pembayaran` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_user_mapel`
--

INSERT INTO `room_user_mapel` (`id`, `register_id`, `room_id`, `tingkat`, `user_id`, `mapel`, `verify`, `harga`, `bukti_pembayaran`, `created_at`) VALUES
(2, 'YgcSXwen', '1mt5nn', 9, 'AlLwVCmEgC9xBPhP', 1, 1, 150000, '0lPAlLwVCmEgC9xBPhPBIOLOGI.png', '2021-09-20 09:07:38'),
(3, 'YgcSXwen', '1mt5nn', 9, 'AlLwVCmEgC9xBPhP', 2, 1, 150000, '0lPAlLwVCmEgC9xBPhPBIOLOGI.png', '2021-09-20 09:07:38'),
(17, 'C5ftxRrj', '1mt5nn', 9, 'AlLwVCmEgC9xBPhP', 3, 1, 150000, 'qybwk1ZrPJOK.png', '2021-09-21 07:29:00'),
(18, 'C5ftxRrj', '1mt5nn', 9, 'AlLwVCmEgC9xBPhP', 7, 1, 150000, 'qybwk1ZrPJOK.png', '2021-09-21 07:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `sub_bab`
--

CREATE TABLE `sub_bab` (
  `id` int(11) NOT NULL,
  `room_id` varchar(55) NOT NULL,
  `bab_id` int(11) NOT NULL,
  `mapel` int(11) DEFAULT NULL,
  `sub_id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `type_id` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_bab`
--

INSERT INTO `sub_bab` (`id`, `room_id`, `bab_id`, `mapel`, `sub_id`, `type`, `type_id`, `created_at`) VALUES
(1, '9', 1, 2, 1, 'Materi', '2A4SkvnA', '2021-09-21 08:18:34'),
(2, '9', 1, 2, 2, 'Materi', 'wrrsZ5Aq', '2021-09-21 08:19:42'),
(3, '9', 1, 2, 3, 'Tugas', 'DXWvzSqT', '2021-09-21 08:20:02'),
(4, '9', 2, 2, 1, 'Materi', 'V00gqYBo', '2021-09-21 08:20:54'),
(5, '9', 3, 1, 1, 'Materi', 'eCFxum89', '2021-09-21 08:22:34'),
(6, '9', 3, 1, 2, 'Materi', 'aEw7nPog', '2021-09-21 08:22:59'),
(7, '9', 3, 1, 3, 'Tugas', 'xl880PgB', '2021-09-21 08:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `sub_bab_user`
--

CREATE TABLE `sub_bab_user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `room_id` varchar(55) NOT NULL,
  `type` varchar(55) NOT NULL,
  `type_id` varchar(55) NOT NULL,
  `bab_id` int(11) NOT NULL,
  `sub_bab_id` int(11) NOT NULL,
  `mapel_id` int(11) DEFAULT NULL,
  `passed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_bab_user`
--

INSERT INTO `sub_bab_user` (`id`, `user_id`, `room_id`, `type`, `type_id`, `bab_id`, `sub_bab_id`, `mapel_id`, `passed`, `created_at`) VALUES
(1, 'AlLwVCmEgC9xBPhP', '9', 'Materi', 'V00gqYBo', 2, 1, 2, 0, '2021-09-21 08:21:12'),
(2, 'AlLwVCmEgC9xBPhP', '9', 'Materi', '2A4SkvnA', 1, 1, 2, 0, '2021-09-21 08:21:16'),
(3, 'AlLwVCmEgC9xBPhP', '9', 'Materi', 'wrrsZ5Aq', 1, 2, 2, 0, '2021-09-21 08:21:20'),
(4, 'AlLwVCmEgC9xBPhP', '9', 'Materi', 'eCFxum89', 3, 1, 1, 0, '2021-09-21 08:24:32'),
(5, 'AlLwVCmEgC9xBPhP', '9', 'Materi', 'aEw7nPog', 3, 2, 1, 0, '2021-09-21 08:24:35'),
(6, 'AlLwVCmEgC9xBPhP', '1mt5nn', 'tugas', 'DXWvzSqT', 1, 3, 2, 1, '2021-09-21 08:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblhari`
--

CREATE TABLE `tblhari` (
  `id` int(11) NOT NULL,
  `namahari` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblhari`
--

INSERT INTO `tblhari` (`id`, `namahari`) VALUES
(1, 'senin'),
(2, 'selasa'),
(3, 'rabu'),
(4, 'kamis'),
(5, 'jumat'),
(6, 'sabtu'),
(7, 'minggu');

-- --------------------------------------------------------

--
-- Table structure for table `tblmapel`
--

CREATE TABLE `tblmapel` (
  `id` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` text DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = ya, 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmapel`
--

INSERT INTO `tblmapel` (`id`, `id_mapel`, `nama`, `info`, `aktif`) VALUES
(1, 1, 'Matematika', NULL, 1),
(2, 2, 'Bahasa Indonesia', NULL, 1),
(3, 3, 'Bahasa Inggris', NULL, 1),
(4, 4, 'Kewarganegaraan', NULL, 0),
(5, 5, 'Bahasa Jawa', NULL, 0),
(6, 6, 'Fisika', NULL, 1),
(7, 7, 'Biologi', NULL, 1),
(8, 8, 'Seni Budaya', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmapel22`
--

CREATE TABLE `tblmapel22` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL DEFAULT 30000,
  `info` text DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = ya, 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmapel22`
--

INSERT INTO `tblmapel22` (`id`, `nama`, `harga`, `info`, `aktif`) VALUES
(1, 'Matematika', 30000, NULL, 1),
(2, 'Bahasa Indonesia', 30000, NULL, 1),
(3, 'Bahasa Inggris', 30000, NULL, 1),
(4, 'Kewarganegaraan', 30000, NULL, 1),
(5, 'Bahasa Jawa', 30000, NULL, 1),
(6, 'Fisika', 30000, NULL, 1),
(7, 'Biologi', 30000, NULL, 1),
(8, 'Seni Budaya', 30000, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `b` time NOT NULL,
  `c` time NOT NULL,
  `0` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `a`, `b`, `c`, `0`) VALUES
(1, 1, '13:00:00', '13:45:00', NULL),
(2, 2, '13:45:00', '14:30:00', NULL),
(3, 3, '14:30:00', '15:15:00', NULL),
(4, 4, '15:15:00', '16:00:00', NULL),
(5, 5, '16:00:00', '16:45:00', NULL),
(6, 6, '16:45:00', '17:30:00', NULL),
(7, 7, '17:30:00', '18:15:00', NULL),
(8, 8, '18:15:00', '19:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `feedback_id` varchar(55) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `testimoni` text NOT NULL,
  `room_id` varchar(55) NOT NULL,
  `star` varchar(55) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0 = kelas, 1 = kursus',
  `status` int(11) NOT NULL DEFAULT 0,
  `anonymous` varchar(11) DEFAULT 'off',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `testimoni_lampiran`
--

CREATE TABLE `testimoni_lampiran` (
  `id` int(11) NOT NULL,
  `feedback_id` varchar(55) NOT NULL,
  `lampiran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimoni_lampiran`
--

INSERT INTO `testimoni_lampiran` (`id`, `feedback_id`, `lampiran`) VALUES
(1, 'TPV4K4ZD', 'test.jpg'),
(2, 'TPV4K4ZD', 'koala.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `test_register`
--

CREATE TABLE `test_register` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `verification_hash` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_register`
--

INSERT INTO `test_register` (`id`, `email`, `password`, `verification_hash`, `verify`) VALUES
(1, 'randombox38@gmail.com', '$2y$10$9Lw.F177qasyc9NA9w4JWuPTMlCd0ZN93eLfOyySC9f62szzNuWwW', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `tugas_id` varchar(55) NOT NULL,
  `tugas_name` text NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `tugas_konten` longtext NOT NULL,
  `deadline` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_submit`
--

CREATE TABLE `tugas_submit` (
  `id` int(11) NOT NULL,
  `submit_id` varchar(55) NOT NULL,
  `tugas_id` varchar(55) NOT NULL,
  `room_id` varchar(55) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `comments` text DEFAULT NULL,
  `submission_status` int(11) NOT NULL DEFAULT 1,
  `nilai` int(11) DEFAULT NULL,
  `t_comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas_submit`
--

INSERT INTO `tugas_submit` (`id`, `submit_id`, `tugas_id`, `room_id`, `user_id`, `comments`, `submission_status`, `nilai`, `t_comment`, `created_at`) VALUES
(1, 'gObc7pI1Nrg5ltMa', 'DXWvzSqT', '1mt5nn', 'AlLwVCmEgC9xBPhP', 'tugas saya', 1, 80, '<p>Harap diberikan komentar yang relevan dengan gambar yang kamu kirimkan</p>', '2021-09-21 08:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `tugas_submit_attachment`
--

CREATE TABLE `tugas_submit_attachment` (
  `id` int(11) NOT NULL,
  `submit_id` varchar(55) NOT NULL,
  `user_id` varchar(55) NOT NULL,
  `tugas_id` varchar(55) NOT NULL,
  `attachment_name` text NOT NULL,
  `attachmentOriginalName` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tugas_submit_attachment`
--

INSERT INTO `tugas_submit_attachment` (`id`, `submit_id`, `user_id`, `tugas_id`, `attachment_name`, `attachmentOriginalName`, `created_at`) VALUES
(1, 'gObc7pI1Nrg5ltMa', 'AlLwVCmEgC9xBPhP', 'DXWvzSqT', 'cuHP9ridJWlduIcrtbBIOLOGI.png', 'BIOLOGI.png', '2021-09-21 08:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `partner_type` int(11) NOT NULL,
  `partner_id` varchar(55) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_id` varchar(55) CHARACTER SET utf8mb4 NOT NULL,
  `partner_type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `verification_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `user_kuota` int(11) NOT NULL DEFAULT 50,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `partner_id`, `partner_type`, `name`, `email`, `verify`, `verification_token`, `email_verified_at`, `user_kuota`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'AsmF7LKC', 1, 'Guru', 'guru@email.com', 1, '', NULL, 50, '$2y$10$kfXnZWR6Q4x7Is4v3C20Pep1vh5mgurkOxb1vlu6ZCDt/7Fq3RiTa', NULL, '2021-07-02 02:49:50', '2021-07-02 02:49:50'),
(6, 'SHob4PyA', 1, 'andi', 'andi@email.com', 0, '', NULL, 50, '$2y$10$BszXicmVUg3kYPuoiQmrUOcS/qV58kCa8E/wEjp1EZx4sOO0tb3OO', NULL, NULL, NULL),
(7, '6Ue6z5Rr', 1, 'toni', 'rinorinounp@email.com', 0, '', NULL, 50, '$2y$10$/mUR3b3ZLZ1VWnTYdexC7OJbgJ88WKT4mtswKWCou2H0h0lR5NP3W', NULL, NULL, NULL),
(11, 'ZovrKpzeljwa5Z6j', 2, 'budi', 'budi@astar.com', 1, '$2y$10$uhB5ifTZ4p.GVDQC2ceU2ud32HoTuQwgphPWGVfFqpaaBrpsAE1hO', NULL, 50, '$2y$10$qNcqXOuvfw.mYN3XppI/3O2gJWlZ3ULCvnFzeoI81JEzt5b7nUlDi', NULL, '2021-07-31 02:01:20', '2021-07-31 02:01:20'),
(12, 'eVPOqrgqZYhIbTpa', 2, 'adi', 'rinorinounp@gmail.com', 1, '$2y$10$ZGE24LT1VUyHTW8NsWMlaOlOroFknBxKS1Mlit.idTDkNoyCbOP8C', NULL, 50, '$2y$10$tmlo.wpms17XZ6DfGg4HjuPRw.C/fH4gZ7kgZwXt//Rh1sz5V8VLO', NULL, '2021-08-02 01:19:32', '2021-08-02 01:19:32'),
(13, '0e4mbFZA', 2, 'Toni', 'tam@gmail.com', 1, NULL, NULL, 50, '$2y$10$UkR2HMMvErRvmruk2pKaq.Fig.MU8790iWpKM7l7G1zityPt7DUgq', NULL, NULL, NULL),
(16, 'M63STrx1', 2, 'Joni', 'fauzytamimkdr@gmail.com', 1, NULL, NULL, 50, '$2y$10$PpdjO/RRRXAU2Zsf70hTre4uHepZ/N/HznrKW1Kt29pjHlCiqV9BK', NULL, NULL, NULL),
(25, '4TPVDZ4K', 2, 'Burhan', 'efef@gmail.com', 1, NULL, NULL, 50, '$2y$10$EtkobQisgL27kMiqZI0PiuSmhoAzY/zuiwAXQvG6H5Q3ijiDzs.pO', NULL, NULL, NULL),
(28, 'p1rlKK09', 1, 'Tamim', 'hhhh@mail.com', 1, NULL, NULL, 50, '$2y$10$boaTNFZ5pvORMozSEUdzAuWE/ZZjv6deHJI4jzpIoXWfj9Y5Rai56', NULL, NULL, NULL),
(30, 'AlLwVCmEgC9xBPhP', 2, 'zega', 'randombox38@gmail.com', 1, NULL, NULL, 50, '$2y$10$KiWSdgW6Gt7I3rVVN76AkeRskHKp0k2sXVxu2ouPi08FIngo6t982', NULL, '2021-09-09 23:55:55', '2021-09-09 23:55:55'),
(31, 'YMRvWmKHDDZVbMjz', 2, 'mawad', 'namaku.mawad@gmail.com', 1, NULL, NULL, 50, '$2y$10$ve9ioaCrnsjwnJzUvGt4Ee.36RmV4PTquqon4YP/qRNEpC5HF8kfO', NULL, '2021-09-11 03:04:32', '2021-09-11 03:04:32'),
(32, 'vhMYFCjcqkZHTOTi', 2, 'xegalol', 'xegalol@gmail.com', 1, NULL, NULL, 50, '$2y$10$CWWIJBkJsFbcurBnpGtt2ur/PiN1potPL0IMAeq1QmAX/J7NYLDAe', NULL, '2021-09-12 21:15:51', '2021-09-12 21:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `user_id` varchar(55) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `b_place` varchar(55) DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  `parent_phone` varchar(50) DEFAULT NULL,
  `parent_job` varchar(50) DEFAULT NULL,
  `f_profile` varchar(255) DEFAULT 'public/image/profile/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `user_id`, `jenis_kelamin`, `username`, `phone`, `first_name`, `last_name`, `address`, `b_date`, `b_place`, `parent_name`, `parent_phone`, `parent_job`, `f_profile`) VALUES
(1, 'AlLwVCmEgC9xBPhP', 'L', 'zegato', '081252867991', 'Zega', 'Febrianto', 'ss', '2021-09-21', 'blitar', 'Bapak Budi', '08111122233', 'Developer', 'public/image/profile/gxb8dxBTAlLwVCmEgC9xBPhPPJOK.png');

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

-- --------------------------------------------------------

--
-- Table structure for table `video_conference_presensi`
--

CREATE TABLE `video_conference_presensi` (
  `id` int(11) NOT NULL,
  `v_conf_id` varchar(55) NOT NULL,
  `participant` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participant`)),
  `status` int(11) NOT NULL DEFAULT 1,
  `ss` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_conference_presensi`
--

INSERT INTO `video_conference_presensi` (`id`, `v_conf_id`, `participant`, `status`, `ss`, `created_at`) VALUES
(1, 'ECF7ouLcTD1tSHpm', '[{\"name\":\"E8FqKdRB\"},{\"name\":\"gewbjo12\"}]', 0, NULL, '2021-05-08 06:31:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atur_jam`
--
ALTER TABLE `atur_jam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_jam`
--
ALTER TABLE `a_jam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `coba_quiz_question`
--
ALTER TABLE `coba_quiz_question`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_jenjang`
--
ALTER TABLE `db_jenjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pengajar`
--
ALTER TABLE `detail_pengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_question`
--
ALTER TABLE `faq_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_html`
--
ALTER TABLE `index_html`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_kelas`
--
ALTER TABLE `jadwal_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_kelas`
--
ALTER TABLE `mapel_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_pengajar`
--
ALTER TABLE `mapel_pengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi_room`
--
ALTER TABLE `materi_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi_user`
--
ALTER TABLE `materi_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partnership`
--
ALTER TABLE `partnership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_option`
--
ALTER TABLE `quiz_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_user`
--
ALTER TABLE `quiz_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_user`
--
ALTER TABLE `room_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_user_mapel`
--
ALTER TABLE `room_user_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_bab`
--
ALTER TABLE `sub_bab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_bab_user`
--
ALTER TABLE `sub_bab_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhari`
--
ALTER TABLE `tblhari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmapel`
--
ALTER TABLE `tblmapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmapel22`
--
ALTER TABLE `tblmapel22`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni_lampiran`
--
ALTER TABLE `testimoni_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_register`
--
ALTER TABLE `test_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas_submit`
--
ALTER TABLE `tugas_submit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tugas_submit_attachment`
--
ALTER TABLE `tugas_submit_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_conference`
--
ALTER TABLE `video_conference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_conference_presensi`
--
ALTER TABLE `video_conference_presensi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `atur_jam`
--
ALTER TABLE `atur_jam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `a_jam`
--
ALTER TABLE `a_jam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bab`
--
ALTER TABLE `bab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coba_materi`
--
ALTER TABLE `coba_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coba_materi_history`
--
ALTER TABLE `coba_materi_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coba_materi_lampiran`
--
ALTER TABLE `coba_materi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coba_quiz_question`
--
ALTER TABLE `coba_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coba_tugas`
--
ALTER TABLE `coba_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coba_tugas_lampiran`
--
ALTER TABLE `coba_tugas_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `db_jenjang`
--
ALTER TABLE `db_jenjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_pengajar`
--
ALTER TABLE `detail_pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq_question`
--
ALTER TABLE `faq_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `index_html`
--
ALTER TABLE `index_html`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jadwal_kelas`
--
ALTER TABLE `jadwal_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapel_kelas`
--
ALTER TABLE `mapel_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mapel_pengajar`
--
ALTER TABLE `mapel_pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `materi_room`
--
ALTER TABLE `materi_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `materi_user`
--
ALTER TABLE `materi_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `partnership`
--
ALTER TABLE `partnership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_option`
--
ALTER TABLE `quiz_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_user`
--
ALTER TABLE `quiz_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_user`
--
ALTER TABLE `room_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_user_mapel`
--
ALTER TABLE `room_user_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sub_bab`
--
ALTER TABLE `sub_bab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_bab_user`
--
ALTER TABLE `sub_bab_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblhari`
--
ALTER TABLE `tblhari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblmapel`
--
ALTER TABLE `tblmapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblmapel22`
--
ALTER TABLE `tblmapel22`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimoni_lampiran`
--
ALTER TABLE `testimoni_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_register`
--
ALTER TABLE `test_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas_submit`
--
ALTER TABLE `tugas_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tugas_submit_attachment`
--
ALTER TABLE `tugas_submit_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video_conference`
--
ALTER TABLE `video_conference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `video_conference_presensi`
--
ALTER TABLE `video_conference_presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
