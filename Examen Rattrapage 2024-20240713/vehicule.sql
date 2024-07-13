-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 03 juil. 2024 à 09:29
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vehicule`
--

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

DROP TABLE IF EXISTS `modele`;
CREATE TABLE IF NOT EXISTS `modele` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `modele` varchar(15) NOT NULL,
  `marque` varchar(15) NOT NULL,
  `puissance` varchar(15) NOT NULL,
  `carburant` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`id`, `modele`, `marque`, `puissance`, `carburant`) VALUES
(1, '108', 'peugeot', '4cv', 'Essence'),
(2, '508', 'peugeot', '7CV', 'Essence'),
(3, '308', 'peugeot', '4cv', 'Essence'),
(4, 'Megan Coupe', 'renault', '5CV', 'Diesel');

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
CREATE TABLE IF NOT EXISTS `proprietaire` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(15) NOT NULL,
  `PRENOM` varchar(15) NOT NULL,
  `ADRESSE` varchar(50) NOT NULL,
  `CODE_POSTAL` int NOT NULL,
  `VILLE` varchar(15) NOT NULL,
  `TEL` int NOT NULL,
  `ID_VOITURE` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_VOITURE` (`ID_VOITURE`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `proprietaire`
--

INSERT INTO `proprietaire` (`ID`, `NOM`, `PRENOM`, `ADRESSE`, `CODE_POSTAL`, `VILLE`, `TEL`, `ID_VOITURE`) VALUES
(1, 'AIT EL HADJ', 'MARYEM', 'Poly Agadir', 80000, 'Agadir', 660606060, 1);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(20) NOT NULL,
  `couleur` varchar(15) NOT NULL,
  `kilometrage` int NOT NULL,
  `id_modele` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_modele` (`id_modele`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`ID`, `immatriculation`, `couleur`, `kilometrage`, `id_modele`) VALUES
(1, '123 AB 120', 'Noire', 5000, 1),
(2, '123 AB 121', 'Blanche', 6000, 2),
(3, '123 AB 122', 'Rouge', 40000, 3),
(4, '123 AB 123', 'Noire', 60000, 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD CONSTRAINT `proprietaire_ibfk_1` FOREIGN KEY (`ID_VOITURE`) REFERENCES `voiture` (`ID`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
