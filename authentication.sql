-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2017 at 05:30 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `authentication`
--

-- --------------------------------------------------------

--
-- Table structure for table `chiefminister`
--

CREATE TABLE IF NOT EXISTS `chiefminister` (
  `username` varchar(30) DEFAULT NULL,
  `rollno` varchar(30) NOT NULL DEFAULT '',
  `branch` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_eligible` varchar(10) DEFAULT NULL,
  `is_voted` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chiefminister`
--

INSERT INTO `chiefminister` (`username`, `rollno`, `branch`, `email`, `is_eligible`, `is_voted`) VALUES
('radhika', '14103095', 'cse', 'radhikag.cs.14@nitj.ac.in', 'NO', 'NO'),
('pallavi', '242424', 'cse', 'grgpallavi@gmail.com', 'YES', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `hodelection`
--

CREATE TABLE IF NOT EXISTS `hodelection` (
  `username` varchar(30) DEFAULT NULL,
  `rollno` varchar(30) NOT NULL DEFAULT '',
  `branch` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_eligible` varchar(10) DEFAULT NULL,
  `is_voted` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hodelection`
--

INSERT INTO `hodelection` (`username`, `rollno`, `branch`, `email`, `is_eligible`, `is_voted`) VALUES
('radhika', '14103095', 'cse', 'radhikag.cs.14@nitj.ac.in', 'NO', 'NO'),
('pallavi', '242424', 'cse', 'grgpallavi@gmail.com', 'YES', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `selectionofpr`
--

CREATE TABLE IF NOT EXISTS `selectionofpr` (
  `username` varchar(30) DEFAULT NULL,
  `rollno` varchar(30) NOT NULL DEFAULT '',
  `branch` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_eligible` varchar(10) DEFAULT NULL,
  `is_voted` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selectionofpr`
--

INSERT INTO `selectionofpr` (`username`, `rollno`, `branch`, `email`, `is_eligible`, `is_voted`) VALUES
('pallavi', '242424', 'cse', 'grgpallavi@gmail.com', 'YES', 'YES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chiefminister`
--
ALTER TABLE `chiefminister`
 ADD PRIMARY KEY (`rollno`);

--
-- Indexes for table `hodelection`
--
ALTER TABLE `hodelection`
 ADD PRIMARY KEY (`rollno`);

--
-- Indexes for table `selectionofpr`
--
ALTER TABLE `selectionofpr`
 ADD PRIMARY KEY (`rollno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
