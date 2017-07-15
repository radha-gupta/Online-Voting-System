-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2017 at 09:45 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ladmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `chiefminister`
--

CREATE TABLE IF NOT EXISTS `chiefminister` (
  `candidate` varchar(40) NOT NULL DEFAULT '',
  `designation` varchar(300) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `motto` varchar(200) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chiefminister`
--

INSERT INTO `chiefminister` (`candidate`, `designation`, `votes`, `description`, `contact`, `motto`, `image_url`) VALUES
('Akhilesh yadav', 'famous leader in Up', 101, 'Born 1 July 1973) is the National President of Samajwadi Party and the 20th Chief Minister of the Indian state of Uttar Pradesh.He is the son of Mulayam Singh Yadav.Most efficient leader till date.many supporters are in favour of him.He has a master''s degree in environmental engineering from the University of Sydney, Australia.Yadav married Dimple Yadav on 24 November 1999 and has two daughters and a son. Dimple is also a politician.Assuming office on 15 March 2012 at the age of 38, he is the youngest person to have held this office. ', '91-8878171823', 'To eradicate poverty and illiteracy from UP in five years.', ''),
('Arvind kejriwal', 'Chief Minister of Delhi', 0, 'Arvind Kejriwal (born 16 August 1968) is an Indian politician who is the Chief Minister of Delhi since February 2015. He previously served as Chief Minister from December 2013 to February 2014, stepping down after 49 days. He is the national convener of the Aam Aadmi Party. His party won the 2015 Delhi Assembly elections with a majority, obtaining 67 out of 70 assembly seats.Kejriwal is a graduate of the Indian Institute of Technology Kharagpur, and worked in the Indian Revenue Service as a Joint Commissioner of the Income Tax Department in New Delhi.', '91-7008927721', 'To make our country anti-corrupted.', '');

-- --------------------------------------------------------

--
-- Table structure for table `elections`
--

CREATE TABLE IF NOT EXISTS `elections` (
  `ename` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `details` varchar(500) NOT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'YES',
  `res_declared` varchar(5) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elections`
--

INSERT INTO `elections` (`ename`, `date`, `time`, `details`, `is_active`, `res_declared`) VALUES
('chief minister', '23-2-2017', '1pm - 2pm', 'Elections for the chief minister are going to held in Punjab on the mentioned date.Please go through all the candidates profile and choose the one who fits in your prosperity. ', 'YES', 'YES'),
('HOD election', '12-5-2017', '4am - 7pm', 'Hod election of CSE department is to be conducted in NIT Jalandhar.See the candidate profiles for further details.', 'YES', 'NO'),
('selection of PR', '23-7-2018', '1pm - 2pm', 'PR election is to be conducted for CSE department on the mentioned date.Please check candidate section for further details.', 'YES', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
`sno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`sno`, `name`, `comment`, `email`) VALUES
(2, 'rahul chaabra', 'thumbs up!!', 'grgpallavi@gmail.com'),
(7, 'shorya', 'great site!!', 'shreyalahari8@gmail.com'),
(21, 'radhika2596', 'good one', 'radhikag.cs.14@nitj.ac.in');

-- --------------------------------------------------------

--
-- Table structure for table `hodelection`
--

CREATE TABLE IF NOT EXISTS `hodelection` (
  `candidate` varchar(40) NOT NULL DEFAULT '',
  `designation` varchar(300) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `motto` varchar(200) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_head` varchar(10) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `is_head`) VALUES
('ayesha', '123', 'NO'),
('tarzen', '123', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `selectionofpr`
--

CREATE TABLE IF NOT EXISTS `selectionofpr` (
  `candidate` varchar(40) NOT NULL DEFAULT '',
  `designation` varchar(300) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `contact` varchar(20) NOT NULL,
  `motto` varchar(200) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `name` varchar(50) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `course` varchar(30) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileno` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmpass` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `unique_key` varchar(20) NOT NULL,
  `is_activated` varchar(10) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`name`, `rollno`, `course`, `branch`, `email`, `mobileno`, `username`, `password`, `confirmpass`, `gender`, `unique_key`, `is_activated`) VALUES
('Rupeshwar Singh', '14103088', 'cse', 'cse', 'rupeshwarspam@gmail.com', '1234567890', 'rupeshwar', '1234', '1234', 'Female', 'rqdQGshk', 'NO'),
('shubham', '151898', 'mtech', 'cse', 'shubhamgupta294@gmail.com', '2972787878', 'shubham', '1234', '1234', 'Male', 'q9KQn408', 'NO'),
('pallavi', '242424', 'mtech', 'cse', 'grgpallavi@gmail.com', '8699072590', 'pallavi', '1234', '1234', 'Female', '', 'YES'),
('dhujhjd', '83742847', 'whfwi', 'hehdjeh', 'radhikag.cs.14@nitj.ac.in', '1234567891', 'sanaya', '1234', '1234', 'Female', 'J23B9h6S', 'YES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chiefminister`
--
ALTER TABLE `chiefminister`
 ADD PRIMARY KEY (`candidate`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
 ADD PRIMARY KEY (`ename`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
 ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `hodelection`
--
ALTER TABLE `hodelection`
 ADD PRIMARY KEY (`candidate`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `selectionofpr`
--
ALTER TABLE `selectionofpr`
 ADD PRIMARY KEY (`candidate`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`rollno`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `unique_key` (`unique_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
