-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : ven. 16 juil. 2021 à 15:28
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express_food`
--
CREATE DATABASE IF NOT EXISTS `express_food` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `express_food`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `postalCode` mediumint(5) NOT NULL,
  `city` varchar(45) NOT NULL,
  `streetName` varchar(45) NOT NULL,
  `streetNumber` smallint(3) NOT NULL,
  `floor` tinyint(2) DEFAULT NULL,
  `digicode` varchar(20) DEFAULT NULL,
  `additionalAdress` varchar(45) DEFAULT NULL,
  `User_idUser` int(11) NOT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`idAddress`, `postalCode`, `city`, `streetName`, `streetNumber`, `floor`, `digicode`, `additionalAdress`, `User_idUser`) VALUES
(1, 77220, 'Livery-en-Brie', 'Rue de la Croix de Retal', 29, NULL, NULL, NULL, 1),
(2, 75002, 'Paris', 'Rue du Caire', 48, 2, 'C145298', 'Batiment B', 2),
(3, 92, 'Nanterre', 'Avenue Pablo Picasso', 74, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `chief_cook`
--

DROP TABLE IF EXISTS `chief_cook`;
CREATE TABLE IF NOT EXISTS `chief_cook` (
  `idCook` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `password` char(60) NOT NULL,
  PRIMARY KEY (`idCook`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chief_cook`
--

INSERT INTO `chief_cook` (`idCook`, `firstName`, `lastName`, `password`) VALUES
(1, 'Jeanne', 'Durand', '$2y$10$lTlEOC9k4dy4aleQg8bfS.V.B5gujN0XvQdpZNZsmyMOmN9SfaXg6'),
(2, 'Gordon', 'Ramsay', '$2y$10$prn8dWvpfogW.eyuQEeNueFXLLqNSDY2//8FaKUtlGd.vthNwl2u2'),
(3, 'Manuel', 'Sanchez', '$2y$10$mnuSKA4P5QnFsfwqJhTaMOISzY1XAh5RD4Ov2yqQQVKJyhG5TRGQW');

-- --------------------------------------------------------

--
-- Structure de la table `deliveryman`
--

DROP TABLE IF EXISTS `deliveryman`;
CREATE TABLE IF NOT EXISTS `deliveryman` (
  `idDeliveryMan` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `password` char(60) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `pathToPhoto` varchar(45) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `deliveryManStatus` enum('AVAILABLE','IN_DELIVERY','OFF_DUTY') NOT NULL,
  PRIMARY KEY (`idDeliveryMan`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `deliveryman`
--

INSERT INTO `deliveryman` (`idDeliveryMan`, `firstName`, `lastName`, `password`, `phoneNumber`, `pathToPhoto`, `latitude`, `longitude`, `deliveryManStatus`) VALUES
(1, 'Jacques', 'Bauwer', '$2y$10$uPdGMjemOBtNn.Y0AqVuVevi7I7NsdwcicO1.R.Azu3HYdQl58/we', '0169452198', 'jbauwer.jpg', '48.889559', '2.216692', 'AVAILABLE'),
(2, 'Emilie', 'Geolih', '$2y$10$Yj2pZZCqEivYFSFNyBJ.bOWEi98d61DrVutNraGH/vNySvhCzxVza', '0659874101', 'egeolih.jpg', '48.869862', '2.323398', 'IN_DELIVERY'),
(3, 'Paco', 'Ernest', '$2y$10$J3P.fAM5qrd5H4WFCkDZX.RrpAOrF4IR4LUR8A9juiloQ4lHi32p2', '0185961202', 'pernest.jpg', '48.857842', '2.294829', 'OFF_DUTY');

-- --------------------------------------------------------

--
-- Structure de la table `deliverymanstock`
--

DROP TABLE IF EXISTS `deliverymanstock`;
CREATE TABLE IF NOT EXISTS `deliverymanstock` (
  `quantity` smallint(3) NOT NULL,
  `DeliveryMan_idDeliveryMan` int(11) NOT NULL,
  `Dish_idDish` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `deliverymanstock`
--

INSERT INTO `deliverymanstock` (`quantity`, `DeliveryMan_idDeliveryMan`, `Dish_idDish`) VALUES
(10, 1, 1),
(10, 1, 2),
(10, 1, 3),
(10, 1, 4),
(10, 2, 1),
(10, 2, 2),
(10, 2, 3),
(10, 2, 4),
(10, 3, 1),
(10, 3, 2),
(10, 3, 3),
(10, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `idDish` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dishType` enum('MAIN_DISH','DESSERT') NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `Cook_idCook` int(11) NOT NULL,
  PRIMARY KEY (`idDish`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`idDish`, `name`, `dishType`, `price`, `Cook_idCook`) VALUES
(1, 'Salade César', 'MAIN_DISH', '12.00', 1),
(2, 'Tagliatelles, courgettes et crème de parmesan', 'MAIN_DISH', '15.00', 1),
(3, 'Part de cheesecake', 'DESSERT', '6.00', 1),
(4, 'Panna Cotta', 'DESSERT', '6.00', 1),
(5, 'Risotto', 'MAIN_DISH', '16.00', 1),
(6, 'Tiramisu', 'DESSERT', '6.00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `dishstock`
--

DROP TABLE IF EXISTS `dishstock`;
CREATE TABLE IF NOT EXISTS `dishstock` (
  `idDishStock` int(11) NOT NULL AUTO_INCREMENT,
  `stock` int(3) NOT NULL,
  `stockDate` date NOT NULL,
  `Dish_idDish` int(11) NOT NULL,
  PRIMARY KEY (`idDishStock`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dishstock`
--

INSERT INTO `dishstock` (`idDishStock`, `stock`, `stockDate`, `Dish_idDish`) VALUES
(1, 30, '2021-07-15', 1),
(2, 52, '2021-07-15', 2),
(3, 23, '2021-07-15', 3),
(4, 66, '2021-07-15', 4),
(5, 29, '2021-07-15', 5),
(6, 62, '2021-07-15', 6),
(7, 65, '2021-07-14', 1),
(8, 9, '2021-07-14', 2),
(9, 15, '2021-07-14', 3),
(10, 26, '2021-07-14', 4),
(11, 39, '2021-07-14', 5),
(12, 55, '2021-07-14', 6);

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `idInvoice` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceDate` date NOT NULL,
  `ref` int(10) NOT NULL,
  PRIMARY KEY (`idInvoice`),
  UNIQUE KEY `ref` (`ref`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`idInvoice`, `invoiceDate`, `ref`) VALUES
(1, '2021-06-30', 202100001);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `orderStatus` enum('PENDING','SHIPPING','DELIVERED') NOT NULL,
  `deliveredInTime` tinyint(1) DEFAULT NULL,
  `DeliveryMan_idDeliveryMan` int(11) NOT NULL,
  `User_idUser` int(11) NOT NULL,
  `Invoice_idInvoice` int(11) NOT NULL,
  PRIMARY KEY (`idOrder`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`idOrder`, `orderDate`, `orderStatus`, `deliveredInTime`, `DeliveryMan_idDeliveryMan`, `User_idUser`, `Invoice_idInvoice`) VALUES
(1, '2021-06-03', 'PENDING', NULL, 0, 0, 0),
(2, '2021-06-30', 'SHIPPING', NULL, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reforder`
--

DROP TABLE IF EXISTS `reforder`;
CREATE TABLE IF NOT EXISTS `reforder` (
  `quantity` tinyint(2) NOT NULL,
  `Order_idOrder` int(11) NOT NULL,
  `Order_DeliveryMan_idDeliveryMan` int(11) NOT NULL,
  `Order_User_idUser` int(11) NOT NULL,
  `Dish_idDish` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reforder`
--

INSERT INTO `reforder` (`quantity`, `Order_idOrder`, `Order_DeliveryMan_idDeliveryMan`, `Order_User_idUser`, `Dish_idDish`) VALUES
(1, 2, 2, 1, 1),
(2, 2, 2, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `password` char(60) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `firstName`, `lastName`, `password`, `phoneNumber`, `email`) VALUES
(1, 'Jean', 'Dupont', '$2y$10$ThxZd4YHBnmcDpSsSqfaQOYTtOTbx5wZRvZcWiB7p2p474jZUFFte', '0162158930', 'jean.dupont@gmail.com'),
(2, 'Edward', 'Feels', '$2y$10$BtDBAWRCeZQMIEK7Ohq7D..QsBUK.NfXgvGcHmLukhPQlvZ/hzCCK', '0685239501', 'feelsed@hotmail.fr'),
(3, 'Lea', 'Helton', '$2y$10$.UwzwSfe4EVUEQzoIvj9zeTH9ce2CVJwxkDV53uLfx6lYqu8kVr.y', '0195632014', 'heltonlea92@laposte.net');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
