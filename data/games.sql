-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2017 at 05:18 PM
-- Server version: 10.2.3-MariaDB-log
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `games`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `previous_balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `user_id`, `email`, `balance`, `previous_balance`, `created_at`, `updated_at`) VALUES
(1, 1, 'johntobby02@gmail.com', '9950.00', '10000.00', '2017-06-11 16:20:50', '2017-06-14 12:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `total_questions` varchar(45) NOT NULL,
  `duration` int(11) NOT NULL,
  `played` tinyint(1) DEFAULT 0,
  `show` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `amount`, `start_time`, `end_time`, `total_questions`, `duration`, `played`, `show`, `created_at`, `updated_at`) VALUES
(1, '10000001Zd', '50.00', '2017-06-12 13:50:00', '2017-06-13 13:51:00', '6', 200, 1, 1, '2017-06-12 13:46:25', '2017-06-13 14:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_ranks`
--

CREATE TABLE `monthly_ranks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result_id` varchar(255) NOT NULL,
  `total_points` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `month` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `optionA` text DEFAULT NULL,
  `optionB` text DEFAULT NULL,
  `optionC` text DEFAULT NULL,
  `optionD` text DEFAULT NULL,
  `answer` text NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `game_id`, `question`, `optionA`, `optionB`, `optionC`, `optionD`, `answer`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'Who wrote the book "Oliver Twist"?', 'Mark Twain', 'Charles Dickens', 'Oscar Wilde', 'William Shakespeare', 'B', 0, '2017-06-13 17:40:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_user_id` int(11) NOT NULL,
  `ref_username` varchar(255) NOT NULL,
  `first_recharge` decimal(10,2) DEFAULT 0.00,
  `is_ref_commissioned` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `user_id`, `ref_user_id`, `ref_username`, `first_recharge`, `is_ref_commissioned`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'system', '0.00', 0, 0, '2017-06-11 16:20:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `question_id` varchar(255) NOT NULL,
  `answers` varchar(255) NOT NULL,
  `chosen` varchar(255) DEFAULT NULL,
  `correct` varchar(255) DEFAULT NULL,
  `wrong` varchar(255) DEFAULT NULL,
  `time_taken` int(11) DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT NULL,
  `time_returned` timestamp NULL DEFAULT NULL,
  `total_points` varchar(45) DEFAULT NULL,
  `score` varchar(45) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `calculated` tinyint(1) DEFAULT 0,
  `processed` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `game_id`, `question_id`, `answers`, `chosen`, `correct`, `wrong`, `time_taken`, `time_sent`, `time_returned`, `total_points`, `score`, `percentage`, `calculated`, `processed`, `deleted`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '1', 'B', NULL, NULL, NULL, NULL, '2017-06-25 13:58:45', NULL, NULL, NULL, NULL, 0, 0, 0, '2017-06-25 13:58:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `current_question` varchar(255) DEFAULT NULL,
  `game_attempted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `game_id`, `amount`, `start_time`, `end_time`, `current_question`, `game_attempted`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '50.00', '2017-06-12 13:50:00', '2017-06-13 13:51:00', NULL, 1, '2017-06-14 12:00:28', '2017-06-25 13:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `previous_balance` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `type` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `previous_balance`, `description`, `type`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, '50.00', '10000.00', 'Account Funding', 1, 0, '2017-06-14 12:00:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Referral Bonus', '2017-06-14 11:26:15', NULL),
(2, 'Account Funding', '2017-06-14 11:26:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT 0,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_type` varchar(45) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(45) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT 0,
  `is_online` tinyint(1) DEFAULT 0,
  `sec_question` text DEFAULT NULL,
  `sec_answer` text DEFAULT NULL,
  `priority` tinyint(1) DEFAULT 0,
  `ref_link` text NOT NULL,
  `mobile_verified` tinyint(1) DEFAULT 0,
  `email_verified` tinyint(1) DEFAULT 0,
  `verification_code` varchar(45) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ref_id`, `username`, `password`, `firstname`, `lastname`, `middlename`, `mobile`, `email`, `bank_name`, `bank_type`, `account_name`, `account_number`, `user_type`, `is_online`, `sec_question`, `sec_answer`, `priority`, `ref_link`, `mobile_verified`, `email_verified`, `verification_code`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 0, 'jontee', '$2y$10$Pi9DOD5I/ybXkU0y.zPG7OafcVOv8welNt0MqivhFly1jE9c4YuvS', 'Oyetunde', 'O', 'John', '2348038021699', 'johntobby02@gmail.com', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 'http://gamebox.com/register/jontee', 0, 0, NULL, 0, '2017-06-11 16:20:50', '2017-06-11 16:20:50');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_ranks`
--

CREATE TABLE `weekly_ranks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `week` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total_points` varchar(255) NOT NULL,
  `week_range` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `monthly_ranks`
--
ALTER TABLE `monthly_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_unq` (`game_id`,`created_at`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `res_unq` (`user_id`,`game_id`,`question_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_unq` (`user_id`,`game_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USR_AMT_UNQ` (`user_id`,`amount`,`created_at`,`previous_balance`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USR_UNQ` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `weekly_ranks`
--
ALTER TABLE `weekly_ranks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `monthly_ranks`
--
ALTER TABLE `monthly_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `weekly_ranks`
--
ALTER TABLE `weekly_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
