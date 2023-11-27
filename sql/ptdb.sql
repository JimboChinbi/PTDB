-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2023 at 06:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `Audit_ID` int(11) NOT NULL,
  `Table_ID` int(11) NOT NULL,
  `Action` varchar(45) NOT NULL,
  `Table_Column` varchar(45) DEFAULT NULL,
  `Row_ID` int(11) DEFAULT NULL,
  `Old_Value` varchar(45) DEFAULT NULL,
  `New_Value` varchar(45) DEFAULT NULL,
  `User_ID` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`Audit_ID`, `Table_ID`, `Action`, `Table_Column`, `Row_ID`, `Old_Value`, `New_Value`, `User_ID`, `Timestamp`) VALUES
(1005, 7, 'READ', NULL, 1, NULL, NULL, 1, '2022-12-23 14:10:46'),
(1006, 7, 'READ', NULL, 4, NULL, NULL, 1, '2022-12-23 14:10:46'),
(1007, 2, 'READ', NULL, 1, NULL, NULL, 1, '2022-12-23 14:10:46'),
(1008, 9, 'READ', NULL, 13, NULL, NULL, 1, '2022-12-23 14:10:51'),
(1009, 6, 'READ', NULL, 4, NULL, NULL, 1, '2022-12-23 14:10:51'),
(1010, 3, 'READ', NULL, 2, NULL, NULL, 1, '2022-12-23 14:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `Fine_ID` int(11) NOT NULL,
  `Incident_ID` int(11) NOT NULL,
  `Fine_Points` int(11) NOT NULL,
  `Fine_Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`Fine_ID`, `Incident_ID`, `Fine_Points`, `Fine_Amount`) VALUES
(1, 3, 6, 2000),
(2, 2, 0, 50),
(3, 4, 3, 500);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `Incident_ID` int(11) NOT NULL,
  `Vehicle_ID` int(11) NOT NULL,
  `People_ID` int(11) NOT NULL,
  `Incident_Date` date NOT NULL,
  `Incident_Time` time NOT NULL,
  `Incident_Report` varchar(500) NOT NULL,
  `Offence_ID` int(11) NOT NULL,
  `Officer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`Incident_ID`, `Vehicle_ID`, `People_ID`, `Incident_Date`, `Incident_Time`, `Incident_Report`, `Offence_ID`, `Officer_ID`) VALUES
(1, 15, 4, '2017-12-01', '00:00:00', '40mph in a 30 limit', 1, 1),
(2, 20, 8, '2017-11-01', '00:00:00', 'Double parked', 4, 1),
(3, 13, 4, '2017-09-17', '00:00:00', '110mph on motorway', 1, 1),
(4, 14, 2, '2017-08-22', '00:00:00', 'Failure to stop at a red light - travelling 25mph', 8, 2),
(5, 13, 4, '2017-10-17', '00:00:00', 'Not wearing a seatbelt on the M1', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `offence`
--

CREATE TABLE `offence` (
  `Offence_ID` int(11) NOT NULL,
  `Offence_description` varchar(50) NOT NULL,
  `Offence_maxFine` int(11) NOT NULL,
  `Offence_maxPoints` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `offence`
--

INSERT INTO `offence` (`Offence_ID`, `Offence_description`, `Offence_maxFine`, `Offence_maxPoints`) VALUES
(0, 'No offence', 0, 0),
(1, 'Speeding', 1000, 3),
(2, 'Speeding on a motorway', 2500, 6),
(3, 'Seat belt offence', 500, 0),
(4, 'Illegal parking', 500, 0),
(5, 'Drunk driving', 10000, 11),
(6, 'Driving without a licence', 10000, 0),
(8, 'Traffic light offences', 1000, 3),
(9, 'Cycling on pavement', 500, 0),
(10, 'Failure to have control of vehicle', 1000, 3),
(11, 'Dangerous driving', 1000, 11),
(12, 'Careless driving', 5000, 6),
(13, 'Dangerous cycling', 2500, 0);

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `Officer_ID` int(11) NOT NULL,
  `Officer_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`Officer_ID`, `Officer_name`) VALUES
(1, 'Bob Mcnulty'),
(2, 'Alina Moreland');

-- --------------------------------------------------------

--
-- Table structure for table `ownership`
--

CREATE TABLE `ownership` (
  `Ownership_ID` int(11) NOT NULL,
  `People_ID` int(11) NOT NULL,
  `Vehicle_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ownership`
--

INSERT INTO `ownership` (`Ownership_ID`, `People_ID`, `Vehicle_ID`) VALUES
(1, 3, 12),
(2, 8, 20),
(3, 4, 15),
(4, 4, 13),
(5, 1, 16),
(6, 2, 14),
(7, 5, 17),
(8, 6, 18),
(9, 7, 21);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `People_ID` int(11) NOT NULL,
  `People_name` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `People_address` varchar(50) DEFAULT NULL,
  `People_licence` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`People_ID`, `People_name`, `DOB`, `People_address`, `People_licence`) VALUES
(1, 'James Smith', NULL, '23 Barnsdale Road, Leicester', 'SMITH92LDOFJJ829'),
(2, 'Jennifer Allen', NULL, '46 Bramcote Drive, Nottingham', 'ALLEN88K23KLR9B3'),
(3, 'John Myers', NULL, '323 Derby Road, Nottingham', 'MYERS99JDW8REWL3'),
(4, 'James Smith', NULL, '26 Devonshire Avenue, Nottingham', 'SMITHR004JFS20TR'),
(5, 'Terry Brown', NULL, '7 Clarke Rd, Nottingham', 'BROWND3PJJ39DLFG'),
(6, 'Mary Adams', NULL, '38 Thurman St, Nottingham', 'ADAMSH9O3JRHH107'),
(7, 'Neil Becker', NULL, '6 Fairfax Close, Nottingham', 'BECKE88UPR840F9R'),
(8, 'Angela Smith', NULL, '30 Avenue Road, Grantham', 'SMITH222LE9FJ5DS'),
(9, 'Xene Medora', NULL, '22 House Drive, West Bridgford', 'MEDORH914ANBB223');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'officer'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `Table_ID` int(11) NOT NULL,
  `Table_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`Table_ID`, `Table_Name`) VALUES
(1, 'Audit'),
(2, 'Fines'),
(3, 'Incident'),
(4, 'Offence'),
(5, 'Officer'),
(6, 'Ownership'),
(7, 'People'),
(8, 'Users'),
(9, 'Vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Username`, `Password`, `role_id`) VALUES
(1, 'mcnulty', 'plod123', 1),
(2, 'moreland', 'fuzz42', 1),
(3, 'daniels', 'copper99', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Vehicle_ID` int(11) NOT NULL,
  `Vehicle_type` varchar(20) NOT NULL,
  `Vehicle_colour` varchar(20) NOT NULL,
  `Vehicle_licence` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Vehicle_ID`, `Vehicle_type`, `Vehicle_colour`, `Vehicle_licence`) VALUES
(12, 'Ford Fiesta', 'Blue', 'LB15AJL'),
(13, 'Ferrari 458', 'Red', 'MY64PRE'),
(14, 'Vauxhall Astra', 'Silver', 'FD65WPQ'),
(15, 'Honda Civic', 'Green', 'FJ17AUG'),
(16, 'Toyota Prius', 'Silver', 'FP16KKE'),
(17, 'Ford Mondeo', 'Black', 'FP66KLM'),
(18, 'Ford Focus', 'White', 'DJ14SLE'),
(20, 'Nissan Pulsar', 'Red', 'NY64KWD'),
(21, 'Renault Scenic', 'Silver', 'BC16OEA'),
(22, 'Hyundai i30', 'Grey', 'AD223NG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`Audit_ID`),
  ADD KEY `fk_table_id_idx` (`Table_ID`),
  ADD KEY `fk_user_id_2_idx` (`User_ID`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`Fine_ID`),
  ADD KEY `Incident_ID` (`Incident_ID`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`Incident_ID`),
  ADD KEY `fk_incident_vehicle` (`Vehicle_ID`),
  ADD KEY `fk_incident_people` (`People_ID`),
  ADD KEY `fk_officer_id_idx` (`Officer_ID`),
  ADD KEY `fk_incident_offence_idx` (`Offence_ID`);

--
-- Indexes for table `offence`
--
ALTER TABLE `offence`
  ADD PRIMARY KEY (`Offence_ID`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`Officer_ID`);

--
-- Indexes for table `ownership`
--
ALTER TABLE `ownership`
  ADD PRIMARY KEY (`Ownership_ID`),
  ADD UNIQUE KEY `Vehicle_ID_UNIQUE` (`Vehicle_ID`),
  ADD KEY `fk_person_idx` (`People_ID`),
  ADD KEY `fk_vehicle_idx` (`Vehicle_ID`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`People_ID`),
  ADD UNIQUE KEY `LICENCE_INDEX` (`People_licence`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`Table_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username_UNIQUE` (`Username`),
  ADD KEY `fk_role` (`role_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Vehicle_ID`),
  ADD UNIQUE KEY `Vehicle_licence_UNIQUE` (`Vehicle_licence`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `Audit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `Fine_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `Incident_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `offence`
--
ALTER TABLE `offence`
  MODIFY `Offence_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `officer`
--
ALTER TABLE `officer`
  MODIFY `Officer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ownership`
--
ALTER TABLE `ownership`
  MODIFY `Ownership_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `People_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `Table_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `Vehicle_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `fk_table_id` FOREIGN KEY (`Table_ID`) REFERENCES `tables` (`Table_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fk_fines` FOREIGN KEY (`Incident_ID`) REFERENCES `incident` (`Incident_ID`);

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `fk_incident_offence` FOREIGN KEY (`Offence_ID`) REFERENCES `offence` (`Offence_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incident_people` FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incident_vehicle` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_officer_id` FOREIGN KEY (`Officer_ID`) REFERENCES `officer` (`Officer_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`Officer_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ownership`
--
ALTER TABLE `ownership`
  ADD CONSTRAINT `fk_person` FOREIGN KEY (`People_ID`) REFERENCES `people` (`People_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vehicle` FOREIGN KEY (`Vehicle_ID`) REFERENCES `vehicle` (`Vehicle_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
