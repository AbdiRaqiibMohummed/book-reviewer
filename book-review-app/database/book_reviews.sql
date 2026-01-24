-- this part was created by @abdiraqiibmohummed and designed by @syedhaider in phpmyadmin
-- Active: 1766855184461@@127.0.0.1@3307@book_reviews
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 14, 2026 at 03:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_reviews`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cover_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `description`, `cover_url`) VALUES
(1, 'Clean Code', 'Robert C. Martin', 'A handbook of agile software craftsmanship', 'https://covers.openlibrary.org/b/isbn/9780132350884-L.jpg'),
(2, 'The Pragmatic Programmer', 'Andrew Hunt', 'Classic software engineering book', 'https://covers.openlibrary.org/b/isbn/9780201616224-L.jpg'),
(3, 'Atomic Habits', 'James Clear', NULL, 'https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg'),
(4, 'Deep Work', 'Cal Newport', NULL, 'https://covers.openlibrary.org/b/isbn/9781455586691-L.jpg'),
(5, 'Design Patterns', 'Erich Gamma', NULL, 'https://covers.openlibrary.org/b/isbn/9780201633610-L.jpg'),
(6, 'Refactoring', 'Martin Fowler', NULL, 'https://covers.openlibrary.org/b/isbn/9780201485677-L.jpg'),
(7, 'You Don’t Know JS', 'Kyle Simpson', NULL, 'https://covers.openlibrary.org/b/isbn/9781491904244-L.jpg'),
(8, 'The Clean Coder', 'Robert C. Martin', NULL, 'https://covers.openlibrary.org/b/isbn/9780137081073-L.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `reviewer_name` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `book_id`, `reviewer_name`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 'adsasd', 2, 'asdasd', '2025-12-27 17:39:17'),
(2, 1, 'abdi', 2, 'this book was great\n', '2025-12-27 17:39:53'),
(3, 2, 'bob', 5, 'great read\n', '2025-12-27 17:48:26'),
(4, 1, 'karl', 4, 'great read', '2026-01-12 14:38:40'),
(5, 8, 'Abdi Raqiib', 4, 'The book was very beneficial', '2026-01-12 14:39:12'),
(6, 4, 'Anonymous', 5, 'Amazing read', '2026-01-12 14:54:25'),
(7, 1, 'Hank', 3, 'great read but was in java', '2026-01-14 13:49:17'),
(8, 1, 'john', 5, 'great book to read', '2026-01-14 14:19:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
