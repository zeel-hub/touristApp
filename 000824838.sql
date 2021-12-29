-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2021 at 04:20 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `000824838`
--

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `student_id` int(11) NOT NULL,
  `a1` int(11) NOT NULL DEFAULT 0,
  `a2` int(11) NOT NULL DEFAULT 0,
  `a3` int(11) NOT NULL DEFAULT 0,
  `a4` int(11) NOT NULL DEFAULT 0,
  `a5` int(11) NOT NULL DEFAULT 0,
  `midterm_exam` int(11) NOT NULL DEFAULT 0,
  `final_exam` int(11) NOT NULL DEFAULT 0,
  `start` date NOT NULL DEFAULT '2019-09-04',
  `end` date DEFAULT NULL,
  `reflection` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`firstname`, `lastname`, `student_id`, `a1`, `a2`, `a3`, `a4`, `a5`, `midterm_exam`, `final_exam`, `start`, `end`, `reflection`) VALUES
('Sam', 'Scott', 1, 0, 0, 0, 0, 0, 0, 10, '2019-09-04', NULL, NULL),
('Anne', 'St-amand', 2, 10, 10, 10, 10, 10, 90, 100, '2018-09-05', '2018-12-21', 'Good course!'),
('Rosa', 'Rosannadanna', 3, 1, 2, 3, 4, 5, 6, 17, '2019-09-04', NULL, NULL),
('Max', 'Maximus', 4, 10, 9, 8, 7, 6, 5, 14, '2019-09-04', '2019-12-20', 'I liked this course. More databases!'),
('Fiver', 'Fivarious', 5, 8, 8, 8, 8, 8, 80, 90, '2019-09-04', NULL, NULL),
('Drizzt', 'Do\'Urden', 6, 0, 0, 0, 0, 0, 0, 0, '2019-09-04', NULL, NULL),
('Paul', 'Todd', 7, 0, 0, 0, 0, 0, 0, 55, '2020-10-09', NULL, NULL),
('Drizzt', 'Do\'Urden', 10, 0, 0, 0, 0, 0, 0, 0, '2019-09-04', NULL, NULL),
('matt', 'collier', 11, 0, 0, 0, 0, 0, 0, 99, '2020-10-22', NULL, NULL),
('Drizzt', 'Do\'Urden', 12, 0, 0, 0, 0, 0, 0, 0, '2019-09-04', NULL, NULL),
('matt', 'collier', 13, 0, 0, 0, 0, 0, 0, 0, '2020-10-14', NULL, NULL),
('matt', 'collier', 14, 0, 0, 0, 0, 0, 0, 0, '2020-10-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `userId` int(11) NOT NULL,
  `noteId` int(11) NOT NULL,
  `noteName` varchar(20) NOT NULL,
  `noteDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `emailAddress` varchar(100) NOT NULL,
  `wins` int(11) NOT NULL DEFAULT 0,
  `losses` int(11) NOT NULL DEFAULT 0,
  `dateLastPlayed` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`emailAddress`, `wins`, `losses`, `dateLastPlayed`) VALUES
('101@yahoo', 0, 8, '2020-10-24'),
('101@yahoo.com', 1, 1, '2020-10-24'),
('1233455@example.com', 0, 1, '2020-12-07'),
('123@yahoo.com', 0, 2, '2020-10-24'),
('abc@gmail.com', 0, 1, '2020-10-24'),
('abc@yahoo.com', 1, 1, '2020-10-24'),
('def@gmail.com', 1, 0, '2020-10-24'),
('ghi@gmail.com', 0, 1, '2020-10-24'),
('hello@yahoo.com', 1, 0, '2020-10-24'),
('user2@gmail.com', 0, 1, '2020-10-24'),
('user3@gmail.com', 0, 1, '2020-10-24'),
('user@gmail.com', 1, 0, '2020-10-24'),
('world@hello.com', 9, 0, '2020-10-24'),
('zeel.patel5@mohawkcollege.ca', 0, 2, '2020-12-07');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `place` varchar(150) NOT NULL,
  `review` varchar(200) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `place`, `review`, `rating`) VALUES
(13, 'Zeel', 'Hamilton', 'Peaceful', 9),
(14, 'abc', 'Blue Mountains', 'Beautiful', 10),
(15, 'xyz', 'Blue Mountains', 'Wonderful', 9),
(16, 'pqr', 'Niagra falls', 'Calm and nice', 8);

-- --------------------------------------------------------

--
-- Table structure for table `shoppinglist`
--

CREATE TABLE `shoppinglist` (
  `id` int(11) NOT NULL,
  `item` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppinglist`
--

INSERT INTO `shoppinglist` (`id`, `item`, `quantity`) VALUES
(1, 'Baby Corn', 1),
(2, 'Butter', 1),
(3, 'Cilantro', 1),
(4, 'Eggs', 4),
(5, 'Chicken Broth', 4),
(6, 'Frozen Lasagna', 1),
(15, 'Gucci Shoes', 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Assignment1` int(11) NOT NULL DEFAULT 0,
  `Assignment2` int(11) NOT NULL DEFAULT 0,
  `Assignment3` int(11) NOT NULL DEFAULT 0,
  `Assignment4` int(11) NOT NULL DEFAULT 0,
  `Assignment5` int(11) NOT NULL DEFAULT 0,
  `Midterm` int(11) NOT NULL DEFAULT 0,
  `FinalExam` int(11) NOT NULL DEFAULT 0,
  `StartDate` date NOT NULL DEFAULT '2020-09-09',
  `CompletionDate` date DEFAULT NULL,
  `StudentReflection` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `Assignment1`, `Assignment2`, `Assignment3`, `Assignment4`, `Assignment5`, `Midterm`, `FinalExam`, `StartDate`, `CompletionDate`, `StudentReflection`) VALUES
(1, 'hello', 'world', 54, 76, 84, 55, 77, 55, 98, '2020-09-09', '2020-12-16', 'abcd'),
(2, 'hello1', 'world1', 56, 45, 19, 76, 76, 54, 76, '2020-09-09', NULL, 'efgh'),
(3, 'hello2', 'world2', 0, 0, 0, 0, 0, 0, 10, '2020-09-09', NULL, NULL),
(4, 'hello3', 'world3', 65, 78, 65, 76, 44, 77, 98, '2020-09-09', NULL, 'ijkl');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userPassword` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wumpuses`
--

CREATE TABLE `wumpuses` (
  `wumpusRow` int(11) NOT NULL,
  `wumpusCol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wumpuses`
--

INSERT INTO `wumpuses` (`wumpusRow`, `wumpusCol`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`noteId`),
  ADD KEY `fk_userid` (`userId`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`emailAddress`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shoppinglist`
--
ALTER TABLE `shoppinglist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `noteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `shoppinglist`
--
ALTER TABLE `shoppinglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
