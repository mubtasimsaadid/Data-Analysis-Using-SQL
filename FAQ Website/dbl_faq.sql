-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 09:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbl_faq`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`question_id`, `answer_id`, `answer`) VALUES
(1, 1, 'To add or remove authorized users for your corporate account, please log into the corporate portal, go to the \"Account Settings\" section, and select \"Manage Users.\" You can then either add a new user by entering their details or remove an existing user by selecting the user and clicking \"Remove.\"\r\n'),
(2, 2, 'To update your company’s contact information, go to the \"Profile\" section of the corporate portal. From there, you can update your company’s address, phone number, and email. Make sure to save the changes after editing.'),
(4, 3, 'To enable two-factor authentication, log into your corporate portal and navigate to the \"Security\" settings. Select \"Enable Two-Factor Authentication\" and follow the instructions to link your account with an authenticator app or receive verification codes via SMS.'),
(6, 4, 'To apply for a business loan, log in to your corporate portal and navigate to the \"Loan Applications\" section. You can fill out the application form and upload any required documents. After submission, our loan department will review your application and contact you with further steps.\r\n\r\n'),
(3, 5, 'If you are unable to access the corporate portal, please ensure that your internet connection is stable. If the issue persists, try clearing your browser cache or using a different browser. If the problem continues, contact our technical support team for assistance.'),
(7, 6, 'You can integrate your corporate portal with accounting software by using the \"API Integration\" feature in the \"Settings\" section of your portal. You will need your company’s API key, which can be found under the \"Integration\" tab. For detailed instructions, consult our integration guide or contact support.'),
(5, 7, 'If you forget your password, click the \"Forgot Password?\" link on the login page. You will receive a password reset link via email. Follow the instructions to create a new password for your corporate account.\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Account Management'),
(2, 'Technical'),
(3, 'Software Support'),
(4, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `category_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `question` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`category_id`, `question_id`, `question`) VALUES
(1, 1, 'How can I add or remove authorized users for my corporate account?'),
(1, 2, 'How can I update the company’s contact information?\r\n'),
(2, 3, 'Why am I unable to access the corporate portal?'),
(2, 4, 'How do I enable two-factor authentication for additional security?'),
(1, 5, 'What do I do if I forget my corporate account password?'),
(4, 6, 'How can I apply for a business loan through the corporate portal?'),
(3, 7, 'How do I integrate the corporate portal with my company’s accounting software?');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
