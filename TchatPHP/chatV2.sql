-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : ven. 07 jan. 2022 à 08:47
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.3.21
create database chatV2;
use chatV2;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chatt`
--

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `destinataire` varchar(20) NOT NULL DEFAULT 'tous',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `pseudo`, `message`, `date`, `destinataire`) VALUES
(45, 'Paul', 'azerty', '2022-01-03 09:19:12', 'tous'),
(44, 'Fred', 'Super test', '2021-11-19 01:29:39', 'Paul'),
(43, 'test', 'test', '2021-11-18 09:12:03', 'tous'),
(42, 'Fred', 'On test le chat', '2021-11-16 08:33:32', 'tous'),
(46, 'Fred', 'Salut', '2022-01-03 09:37:26', 'tous'),
(47, 'test', 'test', '2022-01-07 08:29:52', 'tous'),
(48, 'Laurent', 'Salut tout le monde', '2022-01-07 08:47:00', 'Fred');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `niveau` int(1) NOT NULL,
  PRIMARY KEY (`idu`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idu`, `pseudo`, `mdp`, `niveau`) VALUES
(1, 'prof', 'prof', 2),
(2, 'eleve', 'eleve', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
