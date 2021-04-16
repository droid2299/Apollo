-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2021 at 01:38 PM
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
(4, 'Chopin'),
(5, 'Happy'),
(6, 'Sad');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `playlistID` int(255) NOT NULL,
  `songName` varchar(900) DEFAULT NULL,
  `userName` varchar(900) DEFAULT NULL,
  `uid` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`playlistID`, `songName`, `userName`, `uid`) VALUES
(4, 'Beethoven_music/beethoven_test_output_YULYEUJ.mid', 'Darryl Fernandes', 5),
(5, 'Beethoven_music/beethoven_test_output_C3NCEMF.mid', 'Darryl Fernandes', 5),
(6, 'Beethoven_music/beethoven_test_output_B2008P8.mid', 'Darryl Fernandes', 5),
(7, 'Beethoven_music/beethoven_test_output_OGVU8XM.mid', 'Vishal Dube', 4),
(8, 'Beethoven_music/beethoven_test_output_S0GETE1.mid', 'Vishal Dube', 4),
(9, 'Beethoven_music/beethoven_test_output_6ZX04HW.mid', 'Darryl Fernandes', 5),
(10, 'Beethoven_music/beethoven_test_output_TOGJV0V.mid', 'Darryl Fernandes', 5),
(11, 'Beethoven_music/beethoven_test_output_M5Y87ZZ.mid', 'Darryl Fernandes', 5),
(12, 'Beethoven_music/beethoven_test_output_VEAFEVW.mid', 'Darryl Fernandes', 5),
(13, 'Beethoven_music/beethoven_test_output_8HAP9GR.mid', 'Vishal Dube', 4),
(14, 'Beethoven_music/beethoven_test_output_BIMUT9Q.mid', 'Vishal Dube', 4),
(15, 'Beethoven_music/beethoven_test_output_CBDRARI.mid', 'Vishal Dube', 4),
(16, 'Beethoven_music/beethoven_test_output_6RNOMRP.mid', 'Vishal Dube', 4),
(17, 'Beethoven_music/beethoven_test_output_BXAXK7E.mid', 'Vishal Dube', 4),
(18, 'Bach_music/bach_test_output_6RV6VTC.mid', 'Vishal Dube', 4),
(19, 'Chopin_music/chopin_test_output_SN0LFCD.mid', 'Vishal Dube', 4),
(20, 'Mozart_music/mozart_test_output_V9IW5MW.mid', 'Vishal Dube', 4),
(21, 'Bach_music/bach_test_output_IAKHKG7.mid', 'Droid', 3);

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
(19, 'Mozart_music/mozart_test_outputEBBFPQC.mid', 'Droid', 3),
(20, 'Bach_music/bach_test_output9LJTBDV.mid', 'Vishal Dube', 2),
(21, 'Bach_music/bach_test_outputHLV161M.mid', 'Vishal Dube', 2),
(22, 'Bach_music/bach_test_outputCY449NN.mid', 'Droid', 2),
(23, 'Bach_music/bach_test_outputWO3WHTU.mid', 'Droid', 2),
(24, 'Mozart_music/mozart_test_outputG5QMNBA.mid', 'Darryl Fernandes', 3),
(25, 'Mozart_music/mozart_test_outputZXQJBPW.mid', 'Darryl Fernandes', 3),
(26, 'Bach_music/bach_test_output_CYAIO29.mid', 'Darryl Fernandes', 2),
(27, 'Happy_music/happy_test_output_JLHBFRK.mid', 'Darryl Fernandes', 4),
(28, 'Bach_music/bach_test_output_2E010X9.mid', 'Darryl Fernandes', 2),
(29, 'Sad_music/sad_test_output_WZ88OC4.mid', 'Darryl Fernandes', 4),
(30, 'Sad_music/sad_test_output_YICOMBE.mid', 'Darryl Fernandes', 4),
(31, 'Sad_music/sad_test_output_11NTF4I.mid', 'Darryl Fernandes', 6),
(32, 'Happy_music/happy_test_output_4RAN7XH.mid', 'Darryl Fernandes', 5),
(33, 'Happy_music/happy_test_output_A5VP58F.mid', 'Darryl Fernandes', 5),
(34, 'Chopin_music/chopin_test_output_F49P6AI.mid', 'Vishal Dube', 4),
(35, 'Happy_music/happy_test_output_C84YV0S.mid', 'Vishal Dube', 5),
(36, 'Happy_music/happy_test_output_PEZCG01.mid', 'Vishal Dube', 5),
(37, 'Happy_music/happy_test_output_9ZZ71YG.mid', 'Vishal Dube', 5),
(38, 'Sad_music/sad_test_output_EJG1XIE.mid', 'Vishal Dube', 6),
(39, 'Sad_music/sad_test_output_1MYG60K.mid', 'Vishal Dube', 6),
(40, 'Happy_music/happy_test_output_U3E88KA.mid', 'Droid', 5),
(41, 'Sad_music/sad_test_output_9PMB9HK.mid', 'Droid', 6),
(42, 'Sad_music/sad_test_output_F01N6P7.mid', 'Droid', 6),
(43, 'Beethoven_music/beethoven_test_output_JYXYBCD.mid', 'Darryl Fernandes', 1),
(44, 'Beethoven_music/beethoven_test_output_O5RU5L0.mid', 'Darryl Fernandes', 1),
(45, 'Beethoven_music/beethoven_test_output_NPYH144.mid', 'Darryl Fernandes', 1),
(46, 'Beethoven_music/beethoven_test_output_5CA6KNX.mid', 'Darryl Fernandes', 1),
(47, 'Happy_music/happy_test_output_CCST8YF.mid', 'Darryl Fernandes', 5),
(48, 'Happy_music/happy_test_output_EV0P8YQ.mid', 'Darryl Fernandes', 5),
(49, 'Happy_music/happy_test_output_PO3Z5B7.mid', 'Darryl Fernandes', 5),
(50, 'Sad_music/sad_test_output_74AT9RI.mid', 'Darryl Fernandes', 6),
(51, 'Bach_music/bach_test_output_BPQUBRW.mid', 'Darryl Fernandes', 2),
(52, 'Mozart_music/mozart_test_output_80B5XI2.mid', 'Darryl Fernandes', 3),
(53, 'Beethoven_music/beethoven_test_output_WL72Z7C.mid', 'Darryl Fernandes', 1),
(54, 'Beethoven_music/beethoven_test_output_7XNZEX0.mid', 'Darryl Fernandes', 1),
(55, 'Beethoven_music/beethoven_test_output_WYFZPC1.mid', 'Darryl Fernandes', 1),
(56, 'Beethoven_music/beethoven_test_output_YULYEUJ.mid', 'Darryl Fernandes', 1),
(57, 'Beethoven_music/beethoven_test_output_C3NCEMF.mid', 'Darryl Fernandes', 1),
(58, 'Beethoven_music/beethoven_test_output_B2008P8.mid', 'Darryl Fernandes', 1),
(59, 'Beethoven_music/beethoven_test_output_OGVU8XM.mid', 'Vishal Dube', 1),
(60, 'Beethoven_music/beethoven_test_output_S0GETE1.mid', 'Vishal Dube', 1),
(61, 'Beethoven_music/beethoven_test_output_6ZX04HW.mid', 'Darryl Fernandes', 1),
(62, 'Beethoven_music/beethoven_test_output_TOGJV0V.mid', 'Darryl Fernandes', 1),
(63, 'Beethoven_music/beethoven_test_output_5ZD6S9D.mid', 'Darryl Fernandes', 1),
(64, 'Beethoven_music/beethoven_test_output_M5Y87ZZ.mid', 'Darryl Fernandes', 1),
(65, 'Beethoven_music/beethoven_test_output_VEAFEVW.mid', 'Darryl Fernandes', 1),
(66, 'Beethoven_music/beethoven_test_output_8HAP9GR.mid', 'Vishal Dube', 1),
(67, 'Beethoven_music/beethoven_test_output_BIMUT9Q.mid', 'Vishal Dube', 1),
(68, 'Beethoven_music/beethoven_test_output_CBDRARI.mid', 'Vishal Dube', 1),
(69, 'Beethoven_music/beethoven_test_output_6RNOMRP.mid', 'Vishal Dube', 1),
(70, 'Beethoven_music/beethoven_test_output_BXAXK7E.mid', 'Vishal Dube', 1),
(71, 'Bach_music/bach_test_output_6RV6VTC.mid', 'Vishal Dube', 2),
(72, 'Chopin_music/chopin_test_output_SN0LFCD.mid', 'Vishal Dube', 4),
(73, 'Mozart_music/mozart_test_output_V9IW5MW.mid', 'Vishal Dube', 3),
(74, 'Bach_music/bach_test_output_IAKHKG7.mid', 'Droid', 2),
(75, 'Beethoven_music/beethoven_test_output_53GV0NC.mid', 'Darryl Fernandes', 1),
(76, 'Beethoven_music/beethoven_test_output_MZ0RH3U.mid', 'Darryl Fernandes', 1),
(77, 'Beethoven_music/beethoven_test_output_8EU2NXO.mid', 'Droid', 1),
(78, 'Bach_music/bach_test_output_PJNHHOB.mid', 'Droid', 2),
(79, 'Bach_music/bach_test_output_WKTJ0QM.mid', 'Droid', 2),
(80, 'Beethoven_music/beethoven_test_output_4PB7INH.mid', 'Droid', 1),
(81, 'Beethoven_music/beethoven_test_output_GIOPLDK.mid', 'Darryl Fernandes', 1),
(82, 'Beethoven_music/beethoven_test_output_RG5VIAO.mid', 'Darryl Fernandes', 1),
(83, 'Beethoven_music/beethoven_test_output_XZZSLUW.mid', 'Darryl Fernandes', 1),
(84, 'Beethoven_music/beethoven_test_output_NIET4CR.mid', 'Darryl Fernandes', 1),
(85, 'Beethoven_music/beethoven_test_output_RS1YMOV.mid', 'Darryl Fernandes', 1),
(86, 'Beethoven_music/beethoven_test_output_GWCOSWA.mid', 'Darryl Fernandes', 1),
(87, 'Beethoven_music/beethoven_test_output_ESRV3Y2.mid', 'Darryl Fernandes', 1),
(88, 'Beethoven_music/beethoven_test_output_3WD3AXO.mid', 'Darryl Fernandes', 1),
(89, 'Bach_music/bach_test_output_E9WJUPG.mid', 'Darryl Fernandes', 2),
(90, 'Beethoven_music/beethoven_test_output_ZZPUXSB.mid', 'Darryl Fernandes', 1),
(91, 'Beethoven_music/beethoven_test_output_CQ1QJ98.mid', 'Darryl Fernandes', 1),
(92, 'Beethoven_music/beethoven_test_output_EYZW22M.mid', 'Darryl Fernandes', 1),
(93, 'Sad_music/sad_test_output_G637VK3.mid', 'Darryl Fernandes', 6);

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
(3, 'Droid', 'droid22299@gmail.com', '2217ddada8ff0850f1ea2089056e38ce948db73f15af0c60a3252a4e1db6ca27'),
(4, 'Vishal Dube', 'vishaldube314@gmail.com', 'db41128c8b695fdba6541ab85f8fb536addf7d16cef584a35605d3c7e91ad84a'),
(5, 'Darryl Fernandes', 'fernsdarryl1@gmail.com', '2217ddada8ff0850f1ea2089056e38ce948db73f15af0c60a3252a4e1db6ca27');

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
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD UNIQUE KEY `playlistID` (`playlistID`),
  ADD UNIQUE KEY `songName` (`songName`) USING HASH;

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
  MODIFY `artistID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `playlistID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `songID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
