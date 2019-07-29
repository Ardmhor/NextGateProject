-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 02:37 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ng_music`
--

-- --------------------------------------------------------

--
-- Table structure for table `ng_albums`
--

CREATE TABLE `ng_albums` (
  `ng_albums_id` int(11) NOT NULL,
  `ng_singers_id` int(11) DEFAULT NULL,
  `album_name` varchar(100) DEFAULT NULL,
  `release_year` varchar(4) DEFAULT NULL,
  `record_company` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_albums`
--

INSERT INTO `ng_albums` (`ng_albums_id`, `ng_singers_id`, `album_name`, `release_year`, `record_company`) VALUES
(1, 10, 'BAD', '1980', 'MOTOWN-RECORD-CORP'),
(2, 11, 'BROWNIE', '1956', 'MOTOWN-RECORD-CORP'),
(3, 12, 'A-MAJOR', '2001', 'MOTOWN-RECORD-CORP'),
(4, 13, 'FIRST-TIME', '1999', 'WARNER-BROS.-RECORDS'),
(5, 14, 'MY-HEART', '1997', 'EPIC-RECORDS'),
(6, 15, 'DO-IT-LIKE', '1985', 'CAPITOL-RECORDS'),
(7, 16, 'I-WONDER', '1978', 'MOTOWN-RECORD-CORP'),
(8, 17, 'AMERICA', '2005', 'COLUMBIA-RECORDS'),
(9, 18, 'REPLACE', '2010', 'ATLANTIC-RECORDS'),
(10, 19, 'WILSON', '2000', 'INTERSCOPE-RECORDS');

-- --------------------------------------------------------

--
-- Table structure for table `ng_singers`
--

CREATE TABLE `ng_singers` (
  `ng_singers_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_singers`
--

INSERT INTO `ng_singers` (`ng_singers_id`, `name`, `dob`, `sex`) VALUES
(10, 'MICHAEL-JACKSON', '1952-05-12', 'MALE'),
(11, 'JAMES-BROWN', '1935-07-24', 'MALE'),
(12, 'ALICIA-KEYS', '1980-06-17', 'FEMALE'),
(13, 'BRITNEY-SPEARS', '1981-12-15', 'FEMALE'),
(14, 'CELINE-DION', '1962-02-23', 'FEMALE'),
(15, 'MICK-JAGGER', '1940-09-18', 'MALE'),
(16, 'STEVIE-WONDER', '1938-07-28', 'MALE'),
(17, 'KATY-PERRY', '1982-08-30', 'FEMALE'),
(18, 'BEYONCE-KNOWLES', '1978-04-11', 'FEMALE'),
(19, 'FERGIE', '1985-06-05', 'FEMALE');

-- --------------------------------------------------------

--
-- Table structure for table `ng_users`
--

CREATE TABLE `ng_users` (
  `ng_users_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ng_users`
--

INSERT INTO `ng_users` (`ng_users_id`, `username`, `password`) VALUES
(100, 'david.liechty', 'ngs'),
(101, 'dan.cidon', 'ngscidon'),
(102, 'sam.levin', 'sammysam!'),
(103, 'gevik001', 'Gev001!'),
(104, 'test20', 'test20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ng_albums`
--
ALTER TABLE `ng_albums`
  ADD PRIMARY KEY (`ng_albums_id`),
  ADD UNIQUE KEY `album_name` (`album_name`,`release_year`,`record_company`),
  ADD KEY `ng_singers_id` (`ng_singers_id`);

--
-- Indexes for table `ng_singers`
--
ALTER TABLE `ng_singers`
  ADD PRIMARY KEY (`ng_singers_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ng_users`
--
ALTER TABLE `ng_users`
  ADD PRIMARY KEY (`ng_users_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ng_albums`
--
ALTER TABLE `ng_albums`
  MODIFY `ng_albums_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ng_singers`
--
ALTER TABLE `ng_singers`
  MODIFY `ng_singers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ng_users`
--
ALTER TABLE `ng_users`
  MODIFY `ng_users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ng_albums`
--
ALTER TABLE `ng_albums`
  ADD CONSTRAINT `ng_albums_ibfk_1` FOREIGN KEY (`ng_singers_id`) REFERENCES `ng_singers` (`ng_singers_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
