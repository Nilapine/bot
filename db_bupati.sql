-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 12:06 PM
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
-- Database: `db_bupati`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'restu', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `kunci`
--

CREATE TABLE `kunci` (
  `kata` varchar(255) NOT NULL,
  `pesan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunci`
--

INSERT INTO `kunci` (`kata`, `pesan`) VALUES
('hello', 'Hello there! How can I assist you today?'),
('Jakarta Selatan', 'Budi Karya Sumadi'),
('Jakarta Utara', 'Anies Baswedan'),
('makasi', 'iya'),
('thanks', 'You\'re welcome!');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `chat_id`, `username`, `registered_at`) VALUES
(13, 'saSDSEW', 'qweqwe', '2024-07-14 05:18:54'),
(14, 'dadas', 'eratare', '2024-07-14 05:27:10'),
(16, '2313123', 'wqwqwqw', '2024-07-14 05:31:43'),
(17, '11111', 'twqyewq', '2024-07-14 05:34:12'),
(18, '5702419887', 'restulestarii', '2024-07-14 06:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id`, `chat_id`, `username`, `pesan`, `date`, `created_at`) VALUES
(365, '5702419887', 'restulestarii', '/daftar', '2024-07-14', '2024-07-13 22:22:57'),
(366, '2631836', 'frecipe_bot', 'Terima kasih telah mendaftar 🤗\n\nSilahkan pilih beberapa perintah di bawah\n--------------------------------------------------------------------\n /daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan\n /help - Menampilkan bantuan dan daftar perintah\n==================================\n Chat anda akan terlihat dalam database kami\n\nBy Restu Lestari', '2024-07-14', '2024-07-13 22:22:58'),
(367, '5702419887', 'restulestarii', 'hello', '2024-07-14', '2024-07-13 22:23:02'),
(368, '2631836', 'frecipe_bot', 'Hello there! How can I assist you today?', '2024-07-14', '2024-07-13 22:23:02'),
(369, '5702419887', 'restulestarii', '/resep spaghetti', '2024-07-14', '2024-07-13 22:25:00'),
(370, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:25:01'),
(371, '5702419887', 'restulestarii', '/resep spaghetti', '2024-07-14', '2024-07-13 22:36:40'),
(372, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:36:40'),
(373, '5702419887', 'restulestarii', '/resep nasi goreng', '2024-07-14', '2024-07-13 22:36:50'),
(374, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:36:50'),
(375, '5702419887', 'restulestarii', '/resep spaghetti', '2024-07-14', '2024-07-13 22:41:24'),
(376, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:41:24'),
(377, '5702419887', 'restulestarii', '/resep spaghetti', '2024-07-14', '2024-07-13 22:44:20'),
(378, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:44:20'),
(379, '5702419887', 'restulestarii', '/run', '2024-07-14', '2024-07-13 22:49:17'),
(380, '5702419887', 'restulestarii', '/daftar', '2024-07-14', '2024-07-13 22:49:21'),
(381, '2631836', 'frecipe_bot', 'Anda sudah terdaftar!', '2024-07-14', '2024-07-13 22:49:21'),
(382, '5702419887', 'restulestarii', '/resep spaghetti', '2024-07-14', '2024-07-13 22:49:32'),
(383, '2631836', 'frecipe_bot', 'Maaf, Pesan tidak tersedia.\n\nBerikut adalah beberapa perintah yang tersedia:\n\n/daftar - Daftar ke bot untuk mendapatkan akses penuh\n/resep <nama makanan> - Mencari resep makanan', '2024-07-14', '2024-07-13 22:49:32'),
(384, '2631836', 'frecipe_bot', '', '2024-07-14', '2024-07-14 04:37:54'),
(385, '2631836', 'frecipe_bot', 'haiiiiiiiii', '2024-07-14', '2024-07-14 04:37:59'),
(386, '2631836', 'frecipe_bot', 'haiiiiiiiii', '2024-07-14', '2024-07-14 04:39:11'),
(387, '5702419887', 'restulestarii', '/run', '2024-07-14', '2024-07-14 06:51:30'),
(388, '2631836', 'frecipe_bot', 'Please register first using the /register command', '2024-07-14', '2024-07-14 06:51:31'),
(389, '5702419887', 'restulestarii', '/register', '2024-07-14', '2024-07-14 06:51:34'),
(390, '2631836', 'frecipe_bot', 'Thank you for registering 🤗\n\nPlease use the commands below:\n--------------------------------------------------------------------\n/register - Register to gain full access\n/recipe <query> - Search for a recipe\n/recommend - Get recommended recipes\n/help - Display help and commands\n==================================\n Your chat will be visible in our database\n\nBy Restu Lestari', '2024-07-14', '2024-07-14 06:51:35'),
(391, '5702419887', 'restulestarii', '/recipe', '2024-07-14', '2024-07-14 06:51:38'),
(392, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:51:38'),
(393, '5702419887', 'restulestarii', '/recipe ramen', '2024-07-14', '2024-07-14 06:51:48'),
(394, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:51:48'),
(395, '5702419887', 'restulestarii', '/recipe ramen', '2024-07-14', '2024-07-14 06:51:59'),
(396, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:52:00'),
(397, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 06:52:02'),
(398, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:52:02'),
(399, '5702419887', 'restulestarii', '/recipe ramen', '2024-07-14', '2024-07-14 06:52:42'),
(400, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:52:43'),
(401, '5702419887', 'restulestarii', '/resep ramen', '2024-07-14', '2024-07-14 06:52:47'),
(402, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:52:48'),
(403, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 06:52:52'),
(404, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:52:52'),
(405, '5702419887', 'restulestarii', '/run', '2024-07-14', '2024-07-14 06:58:32'),
(406, '5702419887', 'restulestarii', '/register', '2024-07-14', '2024-07-14 06:58:35'),
(407, '2631836', 'frecipe_bot', 'You are already registered! Use the following commands:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 06:58:36'),
(408, '5702419887', 'restulestarii', '/recipe', '2024-07-14', '2024-07-14 06:58:37'),
(409, '5702419887', 'restulestarii', '/recipe ramen', '2024-07-14', '2024-07-14 06:58:47'),
(410, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 06:59:01'),
(411, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 07:00:16'),
(412, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 07:03:01'),
(413, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 07:03:02'),
(414, '5702419887', 'restulestarii', '/run', '2024-07-14', '2024-07-14 07:03:08'),
(415, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 07:03:09'),
(416, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 07:03:10'),
(417, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 07:03:11'),
(418, '5702419887', 'restulestarii', 'Raspberry-Rosé Sorbet', '2024-07-14', '2024-07-14 07:03:13'),
(419, '2631836', 'frecipe_bot', 'You are already registered!. Use the following command:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 07:03:13'),
(420, '5702419887', 'restulestarii', 'Raspberry-Rosé Sorbet', '2024-07-14', '2024-07-14 07:03:39'),
(421, '5702419887', 'restulestarii', '/help', '2024-07-14', '2024-07-14 07:03:41'),
(422, '5702419887', 'restulestarii', '/register', '2024-07-14', '2024-07-14 07:03:43'),
(423, '2631836', 'frecipe_bot', 'You are already registered! Use the following commands:\n/recipe <query> - To search for recipes\n/recommend - To get recipe recommendations\n/help - To display help and commands', '2024-07-14', '2024-07-14 07:03:43'),
(424, '5702419887', 'restulestarii', '/recommend', '2024-07-14', '2024-07-14 07:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `chat_id`, `username`, `created_at`) VALUES
(18, '5702419887', 'restulestarii', '2024-07-14 06:51:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kunci`
--
ALTER TABLE `kunci`
  ADD PRIMARY KEY (`kata`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_id` (`chat_id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_id` (`chat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
