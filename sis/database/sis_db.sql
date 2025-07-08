-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2025 at 03:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_history`
--

CREATE TABLE `academic_history` (
  `id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `school_year` text NOT NULL,
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '1= New,\r\n2= Regular,\r\n3= Returnee,\r\n4= Transferee',
  `end_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=Completed,\r\n2=Dropout,\r\n3=failed,\r\n4=Transferred-out,\r\n5=Graduated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_history`
--

INSERT INTO `academic_history` (`id`, `student_id`, `course_id`, `semester`, `year`, `school_year`, `status`, `end_status`, `date_created`, `date_updated`) VALUES
(8, 4, 13, 'First Semester', '2024', '2024', 2, 1, '2025-05-17 09:19:36', NULL),
(9, 4, 15, 'Second Semester', '2025', '2025', 2, 0, '2025-05-17 09:19:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `department_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(13, 8, 'Calculus', 'Bachelor in Computer Science', 1, 0, '2025-05-17 08:08:35', NULL),
(14, 7, 'Econ Math', 'Diploma in Economics', 1, 0, '2025-05-17 08:30:57', NULL),
(15, 8, 'Database', 'Bachelor in Data Science', 1, 0, '2025-05-17 08:49:11', NULL),
(16, 7, 'Econ Math II', 'Diploma in Economics', 1, 0, '2025-05-17 09:24:33', NULL),
(17, 8, 'Calculus II', 'Bachelor in Computer Science', 1, 0, '2025-05-17 09:29:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_list`
--

CREATE TABLE `department_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_list`
--

INSERT INTO `department_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(7, 'FOE', 'Faculty of Economics', 1, 0, '2025-05-17 07:58:45', NULL),
(8, 'FCI', 'Faculty Computing and Informatics', 1, 0, '2025-05-17 08:06:42', NULL),
(9, 'FOM', 'Faculty of Management', 1, 0, '2025-05-17 09:01:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `dob` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `roll`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `present_address`, `permanent_address`, `dob`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(3, 'test1', 'test1', 'test1', 'test1', 'Male', '012345678', 'test1', 'test1', '2019-02-17', 1, 0, '2025-05-17 07:05:32', NULL),
(4, 'Regular', 'daniyal', '', 'razman', 'Male', '0123456789', 'Multimedia University', 'Multimedia University', '2025-03-13', 1, 0, '2025-05-17 08:44:02', NULL),
(5, 'Prefect', 'test2', 'test2', 'test2', 'Male', '0123456789', 'test2', 'test2', '2025-03-30', 1, 0, '2025-05-17 08:46:26', NULL),
(6, 'test3', 'test3', 'test3', 'test3', 'Male', 'test3', 'test3', 'test3', '2025-05-27', 1, 0, '2025-05-17 08:48:10', NULL),
(7, 'test2', 'test2', 'test2', 'test2', 'Male', '011228965', 'test2', 'test2', '2000-06-07', 1, 0, '2025-05-17 09:32:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Data Student'),
(6, 'short_name', 'DS'),
(11, 'logo', 'uploads/logo-1643245863.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1643245863.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(9, 'admin1', NULL, 'admin1', 'admin1', '0192023a7bbd73250516f069df18b500', NULL, NULL, 1, 1, '2025-05-17 08:04:50', NULL),
(10, 'staff1', NULL, 'staff1', 'staff1', 'de9bf5643eabf80f4a56fda3bbb84483', NULL, NULL, 2, 1, '2025-05-17 09:06:50', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_history`
--
ALTER TABLE `academic_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department_list`
--
ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_history`
--
ALTER TABLE `academic_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course_list`
--
ALTER TABLE `course_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `department_list`
--
ALTER TABLE `department_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_history`
--
ALTER TABLE `academic_history`
  ADD CONSTRAINT `academic_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `academic_history_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_list`
--
ALTER TABLE `course_list`
  ADD CONSTRAINT `course_list_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
