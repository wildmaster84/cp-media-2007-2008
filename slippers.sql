-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2022 at 03:33 AM
-- Server version: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slippers`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `loginKey` text DEFAULT NULL,
  `rank` int(1) NOT NULL DEFAULT 0,
  `banned` int(1) NOT NULL DEFAULT 0,
  `member` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `buddies` text NOT NULL DEFAULT '[]',
  `head` int(11) NOT NULL DEFAULT 0,
  `face` int(11) NOT NULL DEFAULT 0,
  `neck` int(11) NOT NULL DEFAULT 0,
  `body` int(11) NOT NULL DEFAULT 0,
  `hand` int(11) NOT NULL DEFAULT 0,
  `feet` int(11) NOT NULL DEFAULT 0,
  `color` int(11) NOT NULL,
  `photo` int(11) NOT NULL DEFAULT 0,
  `flag` int(11) NOT NULL DEFAULT 0,
  `email` text NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `safemode` int(1) NOT NULL DEFAULT 0 COMMENT 'Safemode',
  `parenthint` varchar(255) DEFAULT NULL COMMENT 'Parent Hint',
  `parentpassword` varchar(255) DEFAULT NULL COMMENT 'Parent Password',
  `namekey` varchar(255) DEFAULT NULL COMMENT 'Name Key',
  `agegroup` int(11) NOT NULL COMMENT 'Age Group'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`userId`,`itemId`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventory_users` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
