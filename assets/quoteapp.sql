-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2021 at 05:34 PM
-- Server version: 8.0.22
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quoteapp`
--
CREATE DATABASE IF NOT EXISTS `quoteapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quoteapp`;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(500) DEFAULT NULL,
  `low_image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `low_image`) VALUES
(1, 'https://www.meme-arsenal.com/memes/eacda0e6b01fcbfb7542b47eb932a001.jpg', 'https://www.meme-arsenal.com/memes/eacda0e6b01fcbfb7542b47eb932a001.jpg'),
(2, 'https://img4.goodfon.com/wallpaper/big/4/b5/firewatch-campo-santo-kholmy-les-peizazh-igra-gory-pozharnyi.jpg', 'https://img4.goodfon.com/wallpaper/big/4/b5/firewatch-campo-santo-kholmy-les-peizazh-igra-gory-pozharnyi.jpg'),
(3, 'https://static.vecteezy.com/system/resources/previews/000/342/777/non_2x/vector-landscape-background-with-mountains-and-flock-of-birds.jpg?nocache=true&cache_buster=c348477c-0f45-4333-afb7-e1b3949541d3', 'https://static.vecteezy.com/system/resources/previews/000/342/777/non_2x/vector-landscape-background-with-mountains-and-flock-of-birds.jpg?nocache=true&cache_buster=c348477c-0f45-4333-afb7-e1b3949541d3'),
(4, 'https://image.freepik.com/free-vector/background-mountains-with-green-color_68166-41.jpg', 'https://image.freepik.com/free-vector/background-mountains-with-green-color_68166-41.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quote` varchar(255) DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upload_by` varchar(255) DEFAULT NULL,
  `published_on` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_by` (`upload_by`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `author`, `upload_by`, `published_on`) VALUES
(13, 'You will face many defeats in life, but never let yourself be defeated.', 'Maya Angelou', 'panha', 1231245132413),
(14, 'Today is your opportunity to build the tomorrow you want.', 'Ken Poirot', 'panha', 1231245132413),
(15, 'The way I see it,if you want the rainbow, you gotta put up with the rain.', 'Dolly Parton', 'panha', 1231245132413),
(16, 'If opportunity doesn\t knock, build a door.', 'Milton Berle', 'panha', 1231245132413);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_on` double DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `create_on`) VALUES
('panha', '$2y$10$2v1LyAR30pPh7vGhmTyIOeVV8fAUNugbe5NCsdme870S1vy/EJwlK', 515421236457);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`upload_by`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
