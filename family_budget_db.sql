-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2025 at 05:37 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `family_budget_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
CREATE TABLE IF NOT EXISTS `budgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_id` int NOT NULL,
  `category_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `period` enum('weekly','monthly','yearly') DEFAULT 'monthly',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `family_id` (`family_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `family_id`, `category_id`, `amount`, `period`, `start_date`, `end_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1200.00, 'monthly', NULL, NULL, 1, '2025-08-22 06:47:39', '2025-08-22 06:47:39'),
(2, 1, 7, 300.00, 'monthly', NULL, NULL, 1, '2025-08-22 06:47:39', '2025-08-22 06:47:39'),
(3, 1, 8, 600.00, 'monthly', NULL, NULL, 1, '2025-08-22 06:47:39', '2025-08-22 06:47:39'),
(4, 1, 9, 400.00, 'monthly', NULL, NULL, 1, '2025-08-22 06:47:39', '2025-08-22 06:47:39'),
(5, 1, 10, 200.00, 'monthly', NULL, NULL, 1, '2025-08-22 06:47:39', '2025-08-22 06:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `family_id` int DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `family_id` (`family_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `description`, `created_by`, `family_id`, `is_default`, `created_at`) VALUES
(1, 'Salary', 'income', 'Monthly salary income', NULL, NULL, 1, '2025-08-22 06:47:38'),
(2, 'Freelance', 'income', 'Freelance work income', NULL, NULL, 1, '2025-08-22 06:47:38'),
(3, 'Investment', 'income', 'Investment returns', NULL, NULL, 1, '2025-08-22 06:47:38'),
(4, 'Gift', 'income', 'Gift money received', NULL, NULL, 1, '2025-08-22 06:47:38'),
(5, 'Other Income', 'income', 'Other income sources', NULL, NULL, 1, '2025-08-22 06:47:38'),
(6, 'Housing', 'expense', 'Rent or mortgage payments', NULL, NULL, 1, '2025-08-22 06:47:38'),
(7, 'Utilities', 'expense', 'Electricity, water, gas, etc.', NULL, NULL, 1, '2025-08-22 06:47:38'),
(8, 'Food', 'expense', 'Groceries and dining out', NULL, NULL, 1, '2025-08-22 06:47:38'),
(9, 'Transportation', 'expense', 'Vehicle expenses, public transport', NULL, NULL, 1, '2025-08-22 06:47:38'),
(10, 'Healthcare', 'expense', 'Medical expenses', NULL, NULL, 1, '2025-08-22 06:47:38'),
(11, 'Entertainment', 'expense', 'Movies, games, hobbies', NULL, NULL, 1, '2025-08-22 06:47:38'),
(12, 'Education', 'expense', 'Tuition, books, courses', NULL, NULL, 1, '2025-08-22 06:47:38'),
(13, 'Personal Care', 'expense', 'Clothing, grooming', NULL, NULL, 1, '2025-08-22 06:47:38'),
(14, 'Other Expense', 'expense', 'Other expenses', NULL, NULL, 1, '2025-08-22 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
CREATE TABLE IF NOT EXISTS `families` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_name` varchar(255) NOT NULL,
  `monthly_budget` decimal(10,2) DEFAULT '0.00',
  `yearly_budget` decimal(10,2) DEFAULT '0.00',
  `currency_code` varchar(3) DEFAULT 'USD',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `family_name`, `monthly_budget`, `yearly_budget`, `currency_code`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Smith Family', 5000.00, 60000.00, 'USD', 2, '2025-08-22 06:47:34', '2025-08-22 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `related_id` int DEFAULT NULL,
  `related_type` enum('transaction','budget','savings','family') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `related_id`, `related_type`, `created_at`) VALUES
(1, 2, 'Budget Alert', 'You have exceeded your food budget for this month', 0, 8, 'budget', '2025-08-22 06:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `savings_goals`
--

DROP TABLE IF EXISTS `savings_goals`;
CREATE TABLE IF NOT EXISTS `savings_goals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `target_amount` decimal(10,2) NOT NULL,
  `current_amount` decimal(10,2) DEFAULT '0.00',
  `target_date` date DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `family_id` (`family_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `savings_goals`
--

INSERT INTO `savings_goals` (`id`, `family_id`, `name`, `target_amount`, `current_amount`, `target_date`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 1, 'Summer Vacation', 3000.00, 750.00, '2024-06-01', 0, '2025-08-22 06:47:39', '2025-08-22 06:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_id` int NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `description` text,
  `transaction_date` date NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'approved',
  `needs_approval` tinyint(1) DEFAULT '0',
  `approved_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `family_id` (`family_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `approved_by` (`approved_by`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `family_id`, `user_id`, `category_id`, `amount`, `type`, `description`, `transaction_date`, `status`, `needs_approval`, `approved_by`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 4500.00, 'income', 'Monthly salary', '2023-10-01', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38'),
(2, 1, 2, 2, 500.00, 'income', 'Freelance project', '2023-10-05', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38'),
(3, 1, 2, 6, 1200.00, 'expense', 'Rent payment', '2023-10-03', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38'),
(4, 1, 3, 8, 350.00, 'expense', 'Weekly groceries', '2023-10-07', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38'),
(5, 1, 4, 9, 100.00, 'expense', 'Gas refill', '2023-10-08', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38'),
(6, 1, 3, 11, 75.00, 'expense', 'Movie tickets', '2023-10-10', 'approved', 0, NULL, '2025-08-22 06:47:38', '2025-08-22 06:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('admin','owner','member') NOT NULL,
  `family_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receive_notification` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `family_id` (`family_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `full_name`, `role`, `family_id`, `is_active`, `created_at`, `updated_at`, `receive_notification`) VALUES
(1, 'admin@familybudget.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System Administrator', 'admin', 1, 1, '2025-08-22 06:47:30', '2025-08-22 06:47:35', 1),
(2, 'john.smith@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John Smith', 'owner', 1, 1, '2025-08-22 06:47:38', '2025-08-22 06:47:38', 1),
(3, 'sarah.smith@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Sarah Smith', 'member', 1, 1, '2025-08-22 06:47:38', '2025-08-22 06:47:38', 1),
(4, 'mike.smith@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Mike Smith', 'member', 1, 1, '2025-08-22 06:47:38', '2025-08-22 06:47:38', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
