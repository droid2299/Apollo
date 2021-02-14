-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2021 at 12:33 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apollo`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artistID` int(100) NOT NULL,
  `artistName` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artistID`, `artistName`) VALUES
(1, 'Beethoven'),
(2, 'Bach'),
(3, 'Mozart'),
(4, 'Chopin');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `songID` int(100) NOT NULL,
  `songName` varchar(900) NOT NULL,
  `ownerName` varchar(900) NOT NULL,
  `artistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`songID`, `songName`, `ownerName`, `artistID`) VALUES
(3, 'Beethoven_music/beethoven_test_outputY6D787Y.mid', 'Darryl Fernandes', 1),
(4, 'Beethoven_music/beethoven_test_outputXA8FZMO.mid', 'Darryl Fernandes', 1),
(5, 'Beethoven_music/beethoven_test_output7ONTK03.mid', 'Vishal Dube', 1),
(6, 'Bach_music/bach_test_outputTQ413XF.mid', 'Vishal Dube', 2),
(7, 'Beethoven_music/beethoven_test_output5SV70MH.mid', 'Droid', 1),
(8, 'Beethoven_music/beethoven_test_outputEX9ME2Y.mid', 'Droid', 1),
(9, 'Beethoven_music/beethoven_test_output4D6F2BX.mid', 'Droid', 1),
(10, 'Mozart_music/mozart_test_output8EMT7UV.mid', 'Droid', 3),
(11, 'Mozart_music/mozart_test_outputPTYQ93I.mid', 'Droid', 3),
(12, 'Bach_music/bach_test_output0RVMEEL.mid', 'Droid', 2),
(13, 'Chopin_music/chopin_test_outputG6U2G7C.mid', 'Droid', 4),
(14, 'Chopin_music/chopin_test_outputC3ZPKSX.mid', 'Droid', 4),
(15, 'Chopin_music/chopin_test_outputPXRHLNK.mid', 'Droid', 4),
(16, 'Chopin_music/chopin_test_outputL3A3N2Q.mid', 'Droid', 4),
(17, 'Chopin_music/chopin_test_outputK40ET0Z.mid', 'Droid', 4),
(18, 'Chopin_music/chopin_test_outputRMOE0ZX.mid', 'Droid', 4),
(19, 'Mozart_music/mozart_test_outputEBBFPQC.mid', 'Droid', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(100) NOT NULL,
  `name` varchar(900) NOT NULL,
  `email` varchar(900) NOT NULL,
  `password` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `email`, `password`) VALUES
(1, 'Darryl Fernandes', 'fernsdarryl1@gmail.com', 'darrylsf22'),
(2, 'Vishal Dube', 'vishaldube314@gmail.com', 'vdube123'),
(3, 'Droid', 'droid22299@gmail.com', '2217ddada8ff0850f1ea2089056e38ce948db73f15af0c60a3252a4e1db6ca27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artistID`),
  ADD UNIQUE KEY `artistID` (`artistID`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`songID`),
  ADD UNIQUE KEY `songName` (`songName`) USING HASH;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`) USING HASH,
  ADD UNIQUE KEY `username` (`name`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artistID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `songID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
