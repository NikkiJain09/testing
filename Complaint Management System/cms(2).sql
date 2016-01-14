-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2014 at 08:36 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_assigned_complaints`(
IN crid VARCHAR(25),
IN cid VARCHAR(25),
OUT noc INT)
BEGIN
SELECT count(*) INTO noc FROM Complaint where assigned_id=crid and resolved=0;
IF noc < 10 THEN
UPDATE Complaint SET assigned_id=crid, Status_id=2 WHERE C_id=cid;

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_status_cr`(
IN cid VARCHAR(25),
IN var INT,
OUT flag INT)
BEGIN
IF var= 3 THEN
UPDATE Complaint SET status_id=3 WHERE C_id=cid;
SET flag=1;
ELSEIF var=4 THEN
UPDATE Complaint SET status_id=4,resolved=1, complaint_resolved_date=CURRENT_DATE() WHERE C_id=cid;
SET flag=1;
ELSEIF var=5 THEN
UPDATE Complaint SET status_id=5 WHERE C_id=cid;
SET flag=1;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` varchar(125) NOT NULL,
  `Password` varchar(125) NOT NULL,
  `Name` varchar(125) NOT NULL,
  `Designation` varchar(125) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `Password`, `Name`, `Designation`) VALUES
('A1', 'admin', 'Naresh Gupta', 'IIT Adminstrator');

-- --------------------------------------------------------

--
-- Table structure for table `Complaint`
--

CREATE TABLE IF NOT EXISTS `Complaint` (
  `C_id` varchar(125) NOT NULL,
  `Complaint_description` varchar(250) NOT NULL,
  `Status_id` int(11) NOT NULL,
  `assigned_id` varchar(125) DEFAULT NULL,
  `resolved` tinyint(1) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `admin_request` tinyint(1) NOT NULL,
  `Date_of_complaint` date NOT NULL,
  `location` varchar(250) NOT NULL,
  `nearby_location` varchar(125) NOT NULL,
  `Complaint_resolved_date` date NOT NULL,
  `Complaint_category` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`C_id`),
  KEY `assigned` (`assigned_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Complaint`
--

INSERT INTO `Complaint` (`C_id`, `Complaint_description`, `Status_id`, `assigned_id`, `resolved`, `notified`, `admin_request`, `Date_of_complaint`, `location`, `nearby_location`, `Complaint_resolved_date`, `Complaint_category`, `user_id`) VALUES
('EE11', 'Fan not working', 4, 'E1', 1, 1, 0, '2014-08-23', 'Sarojini ', 'Sarojini Bhawan', '2014-08-23', 'Tube light related', 1),
('EE6', 'Tube light not working', 3, 'E1', 0, 0, 0, '2014-08-23', 'Sarojini ', 'Sarojini Bhawan', '0000-00-00', 'Tube light related', 1),
('EW1', 'Leakage in Washroom Tap', 3, 'W1', 0, 0, 1, '2013-11-03', 'Sarojini Bhawan G Alaknanada ground floor washroom', 'Sarojini Bhawan', '0000-00-00', 'Water Leakage', 1),
('EW5', 'water impure', 5, 'W1', 0, 0, 0, '2014-08-23', 'Sarojini ', 'Sarojini Bhawan', '0000-00-00', 'Water Impure', 1),
('SC2', 'Wall about to fall', 2, 'E1', 0, 0, 0, '2014-08-05', 'Cautley Bhawan', 'Cautley Bhawan', '0000-00-00', 'Civil Division', 2),
('SE12', 'Fan not working', 1, NULL, 0, 0, 0, '2014-08-23', 'Sarojini ', 'Sarojini Bhawan', '0000-00-00', 'Tube light related', 5),
('SE13', 'Fan not working', 1, NULL, 0, 0, 0, '2014-08-23', 'Sarojini ', 'Sarojini Bhawan', '0000-00-00', 'Tube light related', 5),
('SE3', 'Tube light broken ', 4, 'E1', 1, 1, 0, '2014-08-03', 'G-69 Alaknanada Sarojini Bhawan IIT Roorkee', 'Sarojini Bhawan', '2014-08-17', 'Tube light related', 1),
('SW4', 'Water impure', 1, 'W1', 0, 0, 0, '2014-08-12', 'Sarojini Bhawan', 'Computer Science Department', '0000-00-00', 'Water impure', 2);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_resolver`
--

CREATE TABLE IF NOT EXISTS `complaint_resolver` (
  `cr_id` varchar(125) NOT NULL,
  `Password` varchar(125) NOT NULL,
  `Name` varchar(125) NOT NULL,
  `Designation` varchar(125) NOT NULL,
  `Division` varchar(125) NOT NULL,
  PRIMARY KEY (`cr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_resolver`
--

INSERT INTO `complaint_resolver` (`cr_id`, `Password`, `Name`, `Designation`, `Division`) VALUES
('C1', 'abcd', 'Ms. Geeta', 'Head Supervisor', 'Civil'),
('E1', 'abcd', 'Deva Gupta', 'Head electrician', 'Electricity'),
('W1', 'abcd', 'Sanjay Kumar', 'Head Water Division Treatment Manager', 'Water');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(125) NOT NULL,
  `Name` varchar(125) NOT NULL,
  `Address` varchar(125) NOT NULL,
  `Contact_no` bigint(11) NOT NULL,
  `Email_id` varchar(125) NOT NULL,
  `type` char(1) NOT NULL,
  `validity` date NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Password`, `Name`, `Address`, `Contact_no`, `Email_id`, `type`, `validity`) VALUES
(1, 'abc', 'Ankit Gupta', '42 sector-1 vikas nagar iit roorkee', 2147483647, 'ankit@gmail.com', 'e', '2013-09-02'),
(2, 'sacb', 'Ankita Sharma', 'G-77 Sarojini Bhawan IIT Roorkee', 2147483647, 'anjita@gmail.com', 's', '2014-08-03'),
(3, 'abcd', 'Nikita jain', 'G-05 kasturba Bhawan', 9934562345, 'nikita@gmail.com', 's', '2016-06-30'),
(4, 'abcde', 'Amala Thampi', 'G-07 kasturba Bhawan', 9934562345, 'amala@gmail.com', 's', '2016-06-30'),
(5, 'abcde', 'Nishtha Behal', 'S-09 Sarojini Bhawan', 7878343456, 'nishtha@gmail.com', 's', '2016-06-30');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD CONSTRAINT `Complaint_ibfk_1` FOREIGN KEY (`assigned_id`) REFERENCES `complaint_resolver` (`cr_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `Complaint_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
