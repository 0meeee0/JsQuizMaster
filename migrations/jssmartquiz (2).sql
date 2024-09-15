-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 04:47 PM
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
-- Database: `jssmartquiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id_answer` int(11) NOT NULL,
  `id_question` int(11) DEFAULT NULL,
  `answerText` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `inscriptionDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_quiz`
--

CREATE TABLE `etudiant_quiz` (
  `id_etudiant` int(11) NOT NULL,
  `id_quiz` int(11) NOT NULL,
  `attempt_number` int(11) NOT NULL,
  `score_obtained` int(11) NOT NULL,
  `final_result` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formateurs`
--

CREATE TABLE `formateurs` (
  `id_formateur` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `niveaux`
--

CREATE TABLE `niveaux` (
  `id_niveaux` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `valeurMin` int(11) DEFAULT NULL,
  `valeurMax` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL,
  `questionText` text DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `video` blob DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `id_niveaux` int(11) NOT NULL,
  `id_sujet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id_quiz` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `answerVisibility` tinyint(1) DEFAULT NULL,
  `chances` int(11) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sous_sujets`
--

CREATE TABLE `sous_sujets` (
  `id_sous_sujet` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `id_sujet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sujets`
--

CREATE TABLE `sujets` (
  `id_sujet` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('formateur','etudiant','admin') DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `firstName`, `name`, `email`, `password`, `role`, `birthDay`, `address`) VALUES
(1, 'alaeddine', 'rami', 'alaeddinerami@gmail.com', 'alaeddine', 'formateur', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `etudiant_quiz`
--
ALTER TABLE `etudiant_quiz`
  ADD PRIMARY KEY (`id_etudiant`,`id_quiz`),
  ADD KEY `id_quiz` (`id_quiz`);

--
-- Indexes for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id_formateur`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `niveaux`
--
ALTER TABLE `niveaux`
  ADD PRIMARY KEY (`id_niveaux`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `id_niveaux` (`id_niveaux`),
  ADD KEY `id_sujet` (`id_sujet`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indexes for table `sous_sujets`
--
ALTER TABLE `sous_sujets`
  ADD PRIMARY KEY (`id_sous_sujet`),
  ADD KEY `id_sujet` (`id_sujet`);

--
-- Indexes for table `sujets`
--
ALTER TABLE `sujets`
  ADD PRIMARY KEY (`id_sujet`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formateurs`
--
ALTER TABLE `formateurs`
  MODIFY `id_formateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `niveaux`
--
ALTER TABLE `niveaux`
  MODIFY `id_niveaux` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id_quiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sous_sujets`
--
ALTER TABLE `sous_sujets`
  MODIFY `id_sous_sujet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sujets`
--
ALTER TABLE `sujets`
  MODIFY `id_sujet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`) ON DELETE CASCADE;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `etudiant_quiz`
--
ALTER TABLE `etudiant_quiz`
  ADD CONSTRAINT `etudiant_quiz_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiant_quiz_ibfk_2` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE;

--
-- Constraints for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD CONSTRAINT `formateurs_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_niveaux`) REFERENCES `niveaux` (`id_niveaux`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`id_sujet`) REFERENCES `sujets` (`id_sujet`) ON DELETE CASCADE;

--
-- Constraints for table `sous_sujets`
--
ALTER TABLE `sous_sujets`
  ADD CONSTRAINT `sous_sujets_ibfk_1` FOREIGN KEY (`id_sujet`) REFERENCES `sujets` (`id_sujet`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
