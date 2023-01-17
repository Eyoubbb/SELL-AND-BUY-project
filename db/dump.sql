-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 11:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sab-website`
--
CREATE DATABASE IF NOT EXISTS `sab-website` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sab-website`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `ADMIN_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`ADMIN_ID`) VALUES
(1),
(29),
(56),
(68),
(98);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `PRODUCT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `CART_QUANTITY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`PRODUCT_ID`, `USER_ID`, `CART_QUANTITY`) VALUES
(1, 47, 2),
(2, 1, 1),
(3, 13, 3),
(3, 15, 3),
(4, 47, 1),
(7, 13, 1),
(9, 30, 1),
(9, 42, 2),
(10, 91, 3),
(11, 26, 3),
(11, 83, 3),
(12, 15, 1),
(12, 56, 3),
(13, 91, 1),
(14, 56, 1),
(16, 30, 1),
(18, 97, 2),
(19, 91, 2),
(21, 1, 3),
(24, 56, 2),
(29, 75, 1),
(29, 79, 3),
(30, 76, 2),
(31, 5, 2),
(32, 52, 2),
(32, 75, 1),
(36, 83, 1),
(37, 26, 3),
(37, 63, 2),
(39, 13, 1),
(39, 97, 2),
(41, 52, 3),
(42, 79, 2),
(43, 5, 3),
(45, 1, 1),
(45, 58, 2),
(46, 75, 2),
(47, 83, 2),
(48, 47, 3),
(48, 56, 3),
(50, 5, 3),
(50, 15, 3),
(54, 30, 3),
(54, 79, 1),
(54, 83, 1),
(58, 66, 1),
(59, 75, 1),
(59, 97, 3),
(61, 26, 2),
(61, 56, 1),
(63, 42, 1),
(64, 76, 2),
(64, 79, 2),
(64, 83, 3),
(65, 66, 3),
(66, 75, 3),
(67, 15, 2),
(67, 52, 2),
(68, 63, 3),
(69, 52, 1),
(70, 58, 3),
(71, 66, 3),
(74, 91, 3),
(75, 5, 3),
(75, 13, 1),
(76, 76, 2),
(77, 5, 3),
(78, 42, 2),
(80, 56, 2),
(80, 63, 3),
(81, 63, 1),
(81, 79, 1),
(83, 1, 3),
(84, 58, 1),
(86, 15, 1),
(88, 76, 1),
(88, 97, 2),
(90, 56, 1),
(90, 63, 1),
(91, 30, 3),
(91, 58, 1),
(92, 26, 1),
(93, 13, 3),
(94, 47, 3),
(94, 76, 2),
(95, 97, 1),
(96, 1, 1),
(96, 30, 2),
(97, 56, 1),
(99, 56, 3),
(100, 47, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CATEGORY_ID` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(254) NOT NULL,
  `CATEGORY_DESCRIPTION` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `CATEGORY_DESCRIPTION`) VALUES
(1, 'Smartphones', 'Smartphones\' description'),
(2, 'Laptops', 'Laptops\' description'),
(3, 'Accessories', 'Accessories\' description'),
(4, 'Clothes', 'Clothes\' description'),
(5, 'Shoes', 'Shoes\' description'),
(6, 'Jewelry', 'Jewelry\'s description'),
(7, 'Beauty', 'Beauty\'s description'),
(8, 'Others', 'Other\'s description'),
(9, 'Sportswear', 'Sportswear\'s description');

-- --------------------------------------------------------

--
-- Table structure for table `categorytagcategories`
--

DROP TABLE IF EXISTS `categorytagcategories`;
CREATE TABLE `categorytagcategories` (
  `CATEGORY_ID` int(11) NOT NULL,
  `TAG_CATEGORY_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categorytagcategories`
--

INSERT INTO `categorytagcategories` (`CATEGORY_ID`, `TAG_CATEGORY_ID`) VALUES
(1, 2),
(1, 4),
(2, 2),
(2, 4),
(3, 2),
(3, 3),
(3, 5),
(3, 7),
(4, 1),
(4, 2),
(4, 3),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(6, 2),
(8, 2),
(9, 1),
(9, 2),
(9, 3),
(9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `COMMENT_ID` int(11) NOT NULL,
  `COMMENT_RATING_ID` int(11) NOT NULL,
  `COMMENT_TITLE` varchar(254) NOT NULL,
  `COMMENT_BODY` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`COMMENT_ID`, `COMMENT_RATING_ID`, `COMMENT_TITLE`, `COMMENT_BODY`) VALUES
(1, 1, 'Great product !', 'Just kidding sent it back first thing in the morning :)'),
(2, 2, 'Not very resistant', 'My friend Hedi punched it, and it died...');

-- --------------------------------------------------------

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
CREATE TABLE `creators` (
  `CREATOR_ID` int(11) NOT NULL,
  `CREATOR_DESCRIPTION` varchar(254) NOT NULL,
  `CREATOR_BANNER_URL` varchar(254) DEFAULT NULL,
  `CREATOR_VISIBLE` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `creators`
--

INSERT INTO `creators` (`CREATOR_ID`, `CREATOR_DESCRIPTION`, `CREATOR_BANNER_URL`, `CREATOR_VISIBLE`) VALUES
(2, 'Welcome to the page of Miles Cummerata', 'BAN-1.svg', 1),
(3, 'Welcome to the page of Sheldon Quigley', 'BAN-1.svg', 1),
(4, 'Welcome to the page of Mavis Schultz', 'BAN-1.svg', 1),
(5, 'Welcome to the page of Terry Medhurst', 'BAN-1.svg', 1),
(6, 'Welcome to the page of Griffin Braun', 'BAN-1.svg', 1),
(7, 'Welcome to the page of Doyle Ernser', 'BAN-1.svg', 1),
(8, 'Welcome to the page of Kody Terry', 'BAN-1.svg', 1),
(9, 'Welcome to the page of Kaya Emard', 'BAN-1.svg', 1),
(10, 'Welcome to the page of Jeanne O\'Keefe', 'BAN-1.svg', 1),
(11, 'Welcome to the page of Anais Yundt', 'BAN-1.svg', 1),
(12, 'Welcome to the page of Lee Schmidt', 'BAN-1.svg', 1),
(13, 'Welcome to the page of Lempi Runte', 'BAN-1.svg', 1),
(14, 'Welcome to the page of Clotilde Larson', 'BAN-1.svg', 1),
(15, 'Welcome to the page of Harrison Lemke', 'BAN-1.svg', 1),
(16, 'Welcome to the page of Rita Shields', 'BAN-1.svg', 1),
(17, 'Welcome to the page of Rory Conn', 'BAN-1.svg', 1),
(18, 'Welcome to the page of Darien Witting', 'BAN-1.svg', 1),
(19, 'Welcome to the page of Emely Schmitt', 'BAN-1.svg', 1),
(20, 'Welcome to the page of Edwina Ernser', 'BAN-1.svg', 1),
(21, 'Welcome to the page of Cristobal Watsica', 'BAN-1.svg', 1),
(22, 'Welcome to the page of Garret Klocko', 'BAN-1.svg', 1),
(23, 'Welcome to the page of Jeanne Halvorson', 'BAN-1.svg', 1),
(24, 'Welcome to the page of Ewell Mueller', 'BAN-1.svg', 1),
(25, 'Welcome to the page of Assunta Rath', 'BAN-1.svg', 1),
(26, 'Welcome to the page of Salvatore Fisher', 'BAN-1.svg', 1),
(27, 'Welcome to the page of Arne Jacobs', 'BAN-1.svg', 1),
(28, 'Welcome to the page of Macy Greenfelder', 'BAN-1.svg', 1),
(30, 'Welcome to the page of Gayle Krajcik', 'BAN-1.svg', 1),
(31, 'Welcome to the page of Terrell Schuppe', 'BAN-1.svg', 1),
(32, 'Welcome to the page of Davonte Heaney', 'BAN-1.svg', 1),
(33, 'Welcome to the page of Allene Harber', 'BAN-1.svg', 1),
(34, 'Welcome to the page of Terrence Koelpin', 'BAN-1.svg', 1),
(35, 'Welcome to the page of Maurine Stracke', 'BAN-1.svg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `USER_ID` int(11) NOT NULL,
  `CREATOR_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_CATEGORY_ID` int(11) NOT NULL,
  `PRODUCT_CREATOR_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(254) NOT NULL,
  `PRODUCT_DESCRIPTION_EN` varchar(254) NOT NULL,
  `PRODUCT_DESCRIPTION_FR` varchar(254) NOT NULL,
  `PRODUCT_IMAGE_URL` varchar(254) DEFAULT NULL,
  `PRODUCT_PRICE` decimal(8,2) NOT NULL,
  `PRODUCT_DISCOUNT_PERCENTAGE` decimal(5,2) NOT NULL DEFAULT 0.00,
  `PRODUCT_STOCK` int(11) NOT NULL DEFAULT 100,
  `PRODUCT_VISIBLE` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`PRODUCT_ID`, `PRODUCT_CATEGORY_ID`, `PRODUCT_CREATOR_ID`, `PRODUCT_NAME`, `PRODUCT_DESCRIPTION_EN`, `PRODUCT_DESCRIPTION_FR`, `PRODUCT_IMAGE_URL`, `PRODUCT_PRICE`, `PRODUCT_DISCOUNT_PERCENTAGE`, `PRODUCT_STOCK`, `PRODUCT_VISIBLE`) VALUES
(1, 2, 2, 'Infinix INBOOK', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 'Infinix Inbook X1 Ci3 10e 8 Go 256 Go 14 Win10 Gris – Garantie 1 an', 'PROD-1.jpg', '1099.00', '11.83', 96, 1),
(2, 7, 3, 'Hyaluronic Acid Serum', 'L\'Oreal Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 'L\'Oréal Paris présente le Sérum Repulpant Hyaluron Expert formulé avec 1,5% d\'Acide Hyaluronique', 'PROD-2.jpg', '19.00', '13.31', 110, 1),
(3, 1, 4, 'iPhone X', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip', 'Sans carte SIM, modèle A19211 Écran Super Retina HD de 6,5 pouces avec technologie OLED Puce A12 Bionic', 'PROD-3.jpg', '899.00', '17.94', 34, 1),
(4, 1, 5, 'iPhone 9', 'An apple mobile which is nothing like apple', 'Un mobile Apple qui n\'a rien à voir avec Apple', 'PROD-4.jpg', '549.00', '12.96', 94, 1),
(5, 2, 6, 'Microsoft Surface Laptop 4', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 'Style et vitesse. Démarquez-vous lors d\'appels vidéo HD soutenus par Studio Mics. Capturez des idées sur l\'écran tactile dynamique.', 'PROD-5.jpg', '1499.00', '10.23', 68, 1),
(6, 7, 7, 'Tree Oil 30ml', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 'L\'huile d\'arbre à thé contient un certain nombre de composés, dont le terpinène-4-ol, dont il a été démontré qu\'ils tuent certaines bactéries,', 'PROD-6.jpg', '12.00', '0.00', 78, 1),
(7, 4, 8, 'Tank Tops for Womens/Girls', 'Pack of 3 camisoles ,very comfortable soft cotton stuff, comfortable in all four seasons', 'L\'huile d\'arbre à thé contient un certain nombre de composés, dont le terpinène-4-ol, dont il a été démontré qu\'ils tuent certaines bactéries,', 'PROD-7.jpg', '50.00', '12.05', 107, 1),
(8, 8, 9, 'Orange Essence Food Flavou', 'Specifications of orange essence food flavour for cakes and baking food item', 'Spécifications de l\'arôme alimentaire à l\'essence d\'orange pour les gâteaux et les aliments de cuisson', 'PROD-8.jpg', '14.00', '0.00', 26, 1),
(9, 2, 10, 'Samsung Galaxy Book', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 'Ordinateur portable Samsung Galaxy Book S (2020) avec puce Intel Lakefield, 8 Go de RAM lancé', 'PROD-9.jpg', '1499.00', '0.00', 50, 1),
(10, 8, 11, 'Sofa for Coffe Cafe', 'Ratttan Outdoor furniture Set Waterproof  Rattan Sofa for Coffe Cafe', 'Ensemble de meubles d\'extérieur en rotin canapé en rotin étanche pour café café', 'PROD-10.jpg', '50.00', '15.59', 30, 1),
(11, 8, 12, 'Flying Wooden Bird', 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm', 'Contenu de l\'emballage : 6 oiseaux avec ruban adhésif. Forme : oiseaux en bois en forme de 3D. Matériau : bois MDF, laminé 3,5 mm.', 'PROD-11.webp', '51.00', '15.58', 17, 1),
(12, 8, 13, 'Key Holder', 'Attractive design metallic material with four key hooks. Reliable, durable and premium quality', 'Design attrayant Matériau métallique avec quatre crochets à clés. Fiable et durable et qualité supérieure', 'PROD-12.jpg', '30.00', '0.00', 54, 1),
(13, 2, 14, 'HP Pavilion 15-DK1056WM', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 'Ordinateur portable de jeu HP Pavilion 15-DK1056WM 10e génération Core i5, 8 Go, SSD 256 Go, GTX 1650 4 Go, Windows 10', 'PROD-13.jpeg', '1099.00', '0.00', 89, 1),
(14, 1, 15, 'Samsung Universe 9', 'Samsung\'s new variant which goes beyond Galaxy to the Universe', 'La nouvelle variante de Samsung qui va au-delà de Galaxy à l\'univers', 'PROD-14.jpg', '1249.00', '15.46', 36, 1),
(15, 8, 16, '3D Embellishment Art Lamp', '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)', 'Autocollant de lampe à led 3D autocollant mural 3d lumière d\'art mural bouton marche/arrêt actionné par pile (inclus)', 'PROD-15.jpg', '20.00', '16.49', 54, 1),
(16, 7, 17, 'Perfume', 'Impression of Acqua Di Gio by Giorgio Armani, a concentrated attar perfume oil', 'Attar d\'huile de parfum concentré avec l\'impression d\'Acqua Di Gio par Giorgio Armani', 'PROD-16.jpg', '13.00', '0.00', 65, 1),
(17, 8, 18, 'Plant Hanger For Home', 'Boho decor plant hanger for home wall decoration', 'Boho decor plante cintre pour la décoration murale de la maison', 'PROD-17.jpg', '41.00', '17.86', 131, 1),
(18, 8, 19, 'Elbow Macaroni - 400 gm', 'Bake Parlor Big Elbow Macaroni - 400 gm', 'Bake Parlor Big Elbow Macaroni - 400 g', 'PROD-18.jpg', '14.00', '15.58', 146, 1),
(19, 7, 20, 'Brown Perfume', 'Royal Mirage Sport Brown perfume for men and women - 120ml', 'Parfum Royal Mirage Sport Marron pour Homme et Femme - 120 ml', 'PROD-19.jpg', '40.00', '15.66', 52, 1),
(20, 4, 21, 'Sleeve Shirt Womens', 'Professional wear sleeve in cotton shirt for women', 'Chemise à manches professionnelles en coton pour femme', 'PROD-20.jpg', '90.00', '10.89', 39, 1),
(21, 1, 22, 'Huawei P30', 'Lighter, for better grip: By integrating the large screen and the battery in a compact body, the HUAWEI P50 Pro is lighter than the previous generation and offers better grip.', 'Plus léger, pour une meilleure prise en main : En intégrant le grand écran et la batterie dans un boîtier compact, le HUAWEI P50 Pro est plus léger que la génération précédente et offre une meilleure prise en main.', 'PROD-21.jpg', '499.00', '10.58', 32, 1),
(23, 5, 24, 'Womens\' Shoes', 'Laced and styled with rubber materials for the sole', 'Lacé et stylisé avec des matériaux en caoutchouc pour la semelle', 'PROD-23.jpg', '40.00', '16.96', 72, 1),
(24, 4, 25, 'Half Sleeves T-shirts', 'Many store is creating new designs and trend every month and every year. Daraz.pk have a beautiful range of men fashion brands', 'De nombreux magasins créent de nouveaux designs et tendances chaque mois et chaque année. Daraz.pk propose une belle gamme de marques de mode masculine', 'PROD-24.jpg', '23.00', '12.76', 132, 1),
(26, 5, 27, 'Women Strip Heel', 'Flip-flops with mid heel. Comfortable for daily use', 'Tongs à talon moyen. Confortable pour une utilisation quotidienne', 'PROD-26.jpg', '40.00', '10.83', 25, 1),
(27, 4, 28, 'Free Fire T-Shirt', 'Quality and professional print. It doesn\'t just look high quality, it is high quality', 'Impression de qualité et professionnelle. Il n\'a pas seulement l\'air de haute qualité, c\'est de haute qualité', 'PROD-27.jpg', '10.00', '14.72', 128, 1),
(28, 1, 30, 'OPPOF19', 'Don’t let a low battery dampen your prospects when life is calling. A 5,000mAh¹ battery keeps you in the action all day long. 33W Flash Charge lets you charge to 54% in just 30 minutes', 'Ne laissez pas une batterie faible freiner vos prospects lorsque la vie vous appelle. Une batterie de 5 000 mAh¹ vous permet de rester actif toute la journée. La charge flash de 33 W vous permet de recharger à 54 % en seulement 30 minutes', 'PROD-28.jpg', '280.00', '17.91', 123, 1),
(29, 7, 31, 'Non-Alcoholic Concentrated Perfume Oil', 'Original Al Munakh® by Mahal Al Musk. 6ml Non-Alcoholic concentrated perfume oil', 'Al Munakh® original de Mahal Al Musk. 6 ml d\'huile de parfum concentrée sans alcool', 'PROD-29.jpg', '120.00', '15.60', 114, 1),
(30, 5, 32, 'Stylish Casual Jeans Shoes', 'High quality, elegant design, wear comfortable, fashionable, durable', 'Haute qualité, design élégant, tenue confortable, tendance, durable', 'PROD-30.jpg', '58.00', '0.00', 129, 1),
(31, 8, 33, 'Bluetooth Aux', 'Bluetooth Aux for car with a hands free audio receiver. Universal 3.5mm Streaming A2DP Wireless AUX Audio Adapter with mic for phone and MP3', 'Bluetooth Aux pour voiture avec un récepteur audio mains libres. Adaptateur audio universel sans fil A2DP Streaming 3,5 mm avec micro pour téléphone et MP3', 'PROD-31.jpg', '25.00', '10.56', 22, 1),
(32, 4, 34, 'Woman Winter Cloth', 'Women winter clothes thick with sweat pant jogger women sweatsuit set and joggers pants ', 'Vêtements d\'hiver pour femmes épais avec pantalon de survêtement jogger femmes ensemble de survêtement et pantalon de jogging', 'PROD-32.jpg', '57.00', '13.39', 84, 1),
(33, 5, 35, 'Spring and summershoes', 'Comfortable stretch cloth, lightweight body, rubber sole with anti-skid wear', 'Tissu extensible confortable, corps léger, semelle en caoutchouc avec usure antidérapante', 'PROD-33.jpg', '20.00', '0.00', 137, 1),
(34, 4, 2, 'Pubg Printed Graphic T-Shirt', '100% Ultra soft Polyester Jersey. Vibrant and colorful printing. Feels soft as cotton.', 'Jersey 100% polyester ultra doux. Impression vibrante et colorée sur le devant. Se sent doux comme du coton.', 'PROD-34.jpg', '46.00', '16.44', 136, 1),
(35, 3, 3, 'Women Shoulder Bag', 'Louis Will women shoulder bag with long clutches', 'Sac bandoulière femme Louis Will avec pochettes longues', 'PROD-35.jpg', '46.00', '14.65', 17, 1),
(36, 8, 4, '3 Tier Corner Shelves', 'Decorate your home with a brand new shelves. Just make sure that your son doesn\'t climb this one', 'Décorez votre maison avec une toute nouvelle étagère. Assurez-vous simplement que votre fils ne grimpe pas celui-ci', 'PROD-36.jpg', '700.00', '17.00', 106, 1),
(37, 3, 5, 'Square Sunglass', 'Men sunglasses that can shutdown the sunlight', 'Lunettes de soleil pour hommes qui peuvent couper la lumière du soleil', 'PROD-37.jpg', '50.00', '15.60', 78, 1),
(38, 2, 6, 'MacBook Pro', 'MacBook Pro 2021 with mini-LED display', 'MacBook Pro 2021 avec mini-écran LED', 'PROD-38.png', '1749.00', '11.02', 83, 1),
(39, 8, 7, 'Plastic Table', 'Very good quality plastic table for multi purpose now in reasonable price', 'Table en plastique de très bonne qualité à usages multiples maintenant à un prix raisonnable', 'PROD-39.jpg', '50.00', '0.00', 136, 1),
(40, 5, 8, 'Women Shoes', 'Women shoes with genuine leather', 'Chaussures femme en cuir véritable', 'PROD-40.jpg', '36.00', '16.87', 46, 1),
(41, 8, 9, 'Mornadi Velvet Bed', 'Mornadi Velvet Bed Base with headboard slats support. A classic style bedroom furniture bed set', 'Sommier en velours Morandi avec support à lattes pour la tête de lit. Un ensemble de lit de meubles de chambre à coucher de style classique', 'PROD-41.jpg', '40.00', '17.00', 140, 1),
(42, 8, 10, 'Gulab Powder 50 Gram', 'This magic powder can treat wounds', 'Cette poudre magique peut soigner les plaies', 'PROD-42.jpg', '70.00', '13.58', 47, 1),
(43, 8, 11, 'Metal Ceramic Flower', 'Metal ceramic flower chandelier with an American vintage touch ', 'Lustre fleur métal céramique avec une touche vintage américaine', 'PROD-43.jpg', '35.00', '10.94', 146, 1),
(44, 3, 12, 'Waterproof Leather Brand Watch', 'Watch Crown With Environmental IPS Bronze Electroplating with a display system of 12 hours', 'Montre Crown With Environmental IPS Bronze Electroplating avec un système d\'affichage de 12 heures', 'PROD-44.jpg', '46.00', '0.00', 95, 1),
(45, 5, 13, 'Metallic Chappals for Women', 'Brand new chappals for your mother', 'De nouveaux chappals pour ta mère', 'PROD-45.jpg', '23.00', '0.00', 107, 1),
(46, 5, 14, 'Sneakers Joggers Shoes', 'Brand new sneakers for men ', 'Nouvelles baskets pour hommes', 'PROD-46.jpg', '40.00', '12.57', 6, 1),
(47, 5, 15, 'Loafers for men', 'Loafers for men. Made using rubber materials and nylon', 'Mocassins pour hommes. Fabriqué à partir de matériaux en caoutchouc et de nylon', 'PROD-47.jpg', '47.00', '10.91', 20, 1),
(48, 4, 16, 'Women Sweaters Wool', '2021 custom Winter Fall crop top women sweaters made using wool', '2021 chandails pour femmes haut court hiver automne personnalisés en laine', 'PROD-48.jpg', '600.00', '17.20', 55, 1),
(49, 4, 17, 'Malai Maxi Dress', 'This elegant dress features a classic silhouette with a fitted bodice and a flowing skirt. The bodice is adorned with delicate lace detailing, adding a touch of romance to the overall design', 'Cette robe élégante présente une silhouette classique avec un corsage ajusté et une jupe fluide. Le corsage est orné de détails en dentelle délicate, ajoutant une touche de romantisme à la conception globale', 'PROD-49.jpg', '50.00', '0.00', 96, 1),
(50, 3, 18, 'Leather Strap Skeleton Watch', 'Sleek skeleton watch with transparent dial revealing mechanical movement. Made of stainless steel with water-resistant, precise movement. Great gift for watch enthusiasts', 'Montre squelette élégante avec cadran transparent révélant un mouvement mécanique. Fabriqué en acier inoxydable avec un mouvement précis et résistant à l\'eau. Excellent cadeau pour les amateurs de montres', 'PROD-50.jpg', '46.00', '10.20', 61, 1),
(51, 6, 19, 'Silver Ring Set Women', 'Elegant silver ring with intricate design and sparkling gemstone. Made of sterling silver with thin, delicate band. Gemstone securely set in prong setting. Great gift or personal treat', 'Bague en argent élégante avec un design complexe et une pierre précieuse étincelante. Fabriqué en argent sterling avec une bande fine et délicate. Pierre précieuse solidement fixée dans un sertissage à griffes. Grand cadeau ou gâterie personnelle', 'PROD-51.jpg', '70.00', '13.57', 51, 1),
(52, 7, 20, 'Fog Scent Xpressio Perfume', 'Fog scent perfume with top notes of green leaves and citrus, a heart of dew-covered flowers and herbs, and a warm, woody base of amber and musk. Unique and captivating fragrance packaged in a sleek bottle', 'Parfum de brume avec des notes de tête de feuilles vertes et d\'agrumes, un cœur de fleurs et d\'herbes couvertes de rosée et une base chaude et boisée d\'ambre et de musc. Parfum unique et captivant présenté dans un flacon élégant', 'PROD-52.webp', '13.00', '0.00', 61, 1),
(54, 4, 22, 'Sublimation Plain Tank for Kids', 'Plain tank top for kids with a classic, relaxed fit and round neck. Made of soft, lightweight fabric and available in a range of solid colors', 'Débardeur uni pour enfant avec une coupe classique et décontractée et un col rond. Fabriqué en tissu doux et léger et disponible dans une gamme de couleurs unies', 'PROD-54.jpg', '100.00', '11.12', 20, 1),
(55, 7, 23, 'Skin Beauty Serum', 'Powerful skin beauty serum with natural ingredients to nourish, hydrate, and revitalize skin. Lightweight and easily absorbed with no greasy residue. Suitable for all skin types and daily use', 'Puissant sérum de beauté pour la peau avec des ingrédients naturels pour nourrir, hydrater et revitaliser la peau. Léger et facilement absorbé sans résidu gras. Convient à tous les types de peau et à un usage quotidien', 'PROD-55.jpg', '46.00', '10.68', 54, 1),
(56, 3, 24, 'Stainless Steel Wrist Watch', 'Stainless steel wrist watch with sleek, modern design and durable case and bracelet. Bold, clear markers and hands on easy-to-read dial. Reliable, precise movement and water-resistant for everyday wear', 'Montre-bracelet en acier inoxydable avec un design élégant et moderne et un boîtier et un bracelet durables. Marqueurs et aiguilles audacieux et clairs sur un cadran facile à lire. Mouvement fiable et précis et résistant à l\'eau pour un usage quotidien', 'PROD-56.webp', '47.00', '17.79', 94, 1),
(57, 3, 25, 'Leather Hand Bag', 'It features an attractive design that makes it a must have accessory in your collection.', 'Il présente un design attrayant qui en fait un accessoire indispensable dans votre collection', 'PROD-57.jpg', '57.00', '11.19', 43, 1),
(58, 3, 26, 'Fancy hand clutch', 'This fashion is designed to add a charming effect to your casual outfit. This bag is made of synthetic leather', 'Cette mode est conçue pour ajouter un effet charmant à votre tenue décontractée. Ce sac est en cuir synthétique', 'PROD-58.jpg', '44.00', '10.39', 101, 1),
(59, 7, 27, 'Oil Free Moisturizer 100ml', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 'L\'hydratant sans huile Dermive avec SPF 20 est spécifiquement formulé avec des céramides, de l\'acide hyaluronique et un écran solaire.', 'PROD-59.jpg', '40.00', '13.10', 88, 1),
(60, 8, 28, 'Electric Motorcycle', 'Electric motorcycle with high-performance motor and long-lasting battery. Eco-friendly and efficient alternative to gas-powered motorcycles', 'Moto électrique avec moteur haute performance et batterie longue durée. Alternative écologique et efficace aux motos à essence.', 'PROD-60.jpg', '920.00', '14.40', 22, 1),
(61, 3, 30, 'Leather Straps Wristwatch', 'Leather straps wrist watch with a classic, timeless design. Durable, comfortable straps and precise movement. A perfect accessory for any outfit.', 'Montre-bracelet à bracelets en cuir au design classique et intemporel. Sangles durables et confortables et mouvements précis. Un accessoire parfait pour n\'importe quelle tenue.', 'PROD-61.jpg', '120.00', '0.00', 91, 1),
(62, 3, 31, 'LouisWill Men Sunglasses', 'Sunglasses with polarized lenses and UV protection. Stylish frames in a variety of colors. Protects eyes and enhances vision', 'Lunettes de soleil avec verres polarisés et protection UV. Cadres élégants dans une variété de couleurs. Protège les yeux et améliore la vision', 'PROD-62.jpg', '50.00', '11.27', 92, 1),
(63, 8, 32, 'Wooden Wardrobe', 'Wooden wardrobe with a spacious interior and sturdy construction. Classic design with a natural finish. Durable and long-lasting storage solution', 'Armoire en bois avec un intérieur spacieux et une construction robuste. Design classique avec une finition naturelle. Solution de stockage durable et durable.', 'PROD-63.jpg', '41.00', '0.00', 68, 1),
(64, 7, 33, 'Freckle Treatment Cream- 15gm', 'Freckle treatment cream with natural ingredients to fade and reduce the appearance of freckles. Safe and gentle for all skin types. Improves skin tone and texture', 'Crème de traitement des taches de rousseur avec des ingrédients naturels pour estomper et réduire l\'apparence des taches de rousseur. Sûr et doux pour tous les types de peau. Améliore le teint et la texture de la peau.', 'PROD-64.jpg', '70.00', '16.99', 140, 1),
(65, 3, 34, 'Golden Watch Pearls Bracelet Watch', 'Golden watch with a delicate pearl bracelet. Elegant and sophisticated design with a precise movement. A perfect accessory for any special occasion', 'Montre dorée avec un délicat bracelet en perles. Design élégant et sophistiqué avec un mouvement précis. Un accessoire parfait pour toute occasion spéciale.', 'PROD-65.jpg', '47.00', '17.55', 89, 1),
(66, 4, 35, 'Money Heist Summer T Shirts', 'Money Heist t-shirt with a bold, graphic design inspired by the popular television show. Made of soft, comfortable fabric and available in a range of sizes. A must-have for any fan', 'T-shirt Money Heist avec un design graphique audacieux inspiré de la populaire émission de télévision. Fabriqué en tissu doux et confortable et disponible dans une gamme de tailles. Un must pour tout fan', 'PROD-66.jpg', '66.00', '15.97', 122, 1),
(67, 6, 2, 'Rose Ring', 'Rose ring with a beautiful, intricate design. Made of high-quality gold or silver with a sparkling gemstone. A romantic and feminine accessory', 'Bague rose avec un beau design complexe. Fabriqué en or ou en argent de haute qualité avec une pierre précieuse étincelante. Un accessoire romantique et féminin', 'PROD-67.jpg', '100.00', '0.00', 149, 1),
(68, 8, 3, 'American Vintage Wood Pendant Light', 'American Vintage wood pendant light with a rustic, industrial design. Made of high-quality wood and metal. Adds warmth and character to any room', 'Suspension en bois American Vintage au design rustique et industriel. Fabriqué en bois et métal de haute qualité. Ajoute de la chaleur et du caractère à n\'importe quelle pièce', 'PROD-68.jpg', '46.00', '0.00', 138, 1),
(69, 6, 4, 'Chain Pin Tassel Earrings', 'Chain pin tassel earrings with a stylish, bohemian design. Made of high-quality metal with a bold, colorful tassel. A unique and eye-catching accessory.', 'Boucles d\'oreilles à pampilles en chaîne avec un design élégant et bohème. Fabriqué en métal de haute qualité avec un pompon audacieux et coloré. Un accessoire unique et accrocheur.', 'PROD-69.jpg', '45.00', '17.75', 9, 1),
(70, 7, 5, 'Eau De Perfume Spray', 'Eau de perfume spray with a luxurious, long-lasting fragrance. Made of high-quality ingredients and packaged in a sleek, stylish bottle. A perfect gift or personal indulgence', 'Eau de parfum en spray au parfum luxueux et longue durée. Fabriqué à partir d\'ingrédients de haute qualité et emballé dans une bouteille élégante et élégante. Un cadeau parfait ou une indulgence personnelle', 'PROD-70.jpg', '30.00', '10.99', 105, 1),
(71, 3, 6, 'Handbag For Girls', 'Handbag for girls with a cute and stylish design. Made of durable materials with plenty of space for all of their belongings. A perfect accessory for any outfit', 'Sac à main pour filles avec un design mignon et élégant. Fabriqué à partir de matériaux durables avec beaucoup d\'espace pour tous leurs effets personnels. Un accessoire parfait pour n\'importe quelle tenue', 'PROD-71.webp', '23.00', '17.50', 27, 1),
(72, 3, 7, 'Square Sunglasses', 'Square sunglasses with a trendy, modern design. Made of high-quality materials with polarized lenses and UV protection. A fashionable and practical accessory', 'Lunettes de soleil carrées au design tendance et moderne. Fabriqué avec des matériaux de haute qualité avec des verres polarisés et une protection UV. Un accessoire mode et pratique', 'PROD-72.jpg', '28.00', '13.89', 64, 1),
(73, 5, 8, 'Sneaker shoes', 'Synthetic leather casual sneaker shoes for women or girls ', 'Chaussures de baskets décontractées en cuir synthétique pour femmes ou filles', 'PROD-73.jpeg', '120.00', '10.37', 50, 1),
(74, 4, 9, 'High Quality T-shirts', 'Made by Vintage Apparel with a very high quality material', 'Fabriqué par Vintage Apparel avec un matériau de très haute qualité', 'PROD-74.jpg', '35.00', '0.00', 6, 1),
(75, 5, 10, 'Formal Shoes', 'Formal shoes with a classic, sophisticated design. Made of high-quality materials with a comfortable fit. Perfect for business or formal occasions', 'Chaussures habillées au design classique et sophistiqué. Fabriqué avec des matériaux de haute qualité avec un ajustement confortable. Parfait pour les affaires ou les occasions formelles', 'PROD-75.jpg', '57.00', '12.00', 68, 1),
(76, 8, 11, 'Daal Masoor 500 gm', 'Fine quality product. Keep in a cool and dry place', 'Produit de belle qualité. Conserver dans un endroit frais et sec', 'PROD-76.png', '20.00', '0.00', 133, 1),
(77, 8, 12, 'Cargo Lashing Belt', 'Cargo lashing belt with a durable, heavy-duty design. Made of high-quality materials with a secure buckle and strong, adjustable straps. Perfect for securing cargo in place during transport', 'Ceinture d\'arrimage de cargaison avec une conception durable et robuste. Fabriqué à partir de matériaux de haute qualité avec une boucle sécurisée et des sangles solides et réglables. Parfait pour sécuriser la cargaison en place pendant le transport.', 'PROD-77.jpg', '930.00', '17.67', 144, 1),
(78, 6, 13, 'Rhinestone Korean Style Open Rings', 'Rhinestone Korean style open rings with a delicate, elegant design. Made of high-quality materials with sparkling rhinestones. A feminine and fashionable accessory', 'Anneaux ouverts de style coréen en strass avec un design délicat et élégant. Fait de matériaux de haute qualité avec des strass étincelants. Un accessoire féminin et mode.', 'PROD-78.jpg', '30.00', '0.00', 9, 1),
(79, 3, 14, 'Round Silver Frame Sun Glasses', 'A pair of sunglasses can protect your eyes from being hurt. For car driving, vacation travel, outdoor activities or social gatherings', 'Une paire de lunettes de soleil peut protéger vos yeux contre les blessures. Pour la conduite automobile, les voyages de vacances, les activités de plein air ou les rassemblements sociaux', 'PROD-79.jpg', '19.00', '10.10', 78, 1),
(80, 3, 15, 'Wiley X Night Vision Yellow Glasses', 'Wiley X Night Vision Yellow Glasses for Riders. A night vision and anti-fog for driving. Comes with a free glass \r\ncover', 'Lunettes jaunes Wiley X Night Vision pour les cavaliers. Une vision nocturne et anti-buée pour la conduite. Livré avec un verre gratuit\r\ncouverture', 'PROD-80.jpg', '30.00', '0.00', 115, 1),
(81, 8, 16, 'Kitchen Islang Lamp', 'Kitchen island lamp with a modern, minimalist design. Made of high-quality materials with an adjustable height and a warm, inviting light. Perfect for adding ambiance to any kitchen', 'Lampe d\'îlot de cuisine au design moderne et minimaliste. Fabriqué avec des matériaux de haute qualité avec une hauteur réglable et une lumière chaleureuse et invitante. Parfait pour ajouter de l\'ambiance à n\'importe quelle cuisine', 'PROD-81.jpg', '34.00', '0.00', 44, 1),
(82, 8, 17, 'Motocross Goggles', 'Motocross goggles with a durable, high-performance design. Made of high-quality materials with a comfortable fit and a clear, unobstructed view. Essential protective gear for any motocross enthusiast', 'Lunettes de motocross au design durable et performant. Fabriqué avec des matériaux de haute qualité avec un ajustement confortable et une vue claire et dégagée. Équipement de protection essentiel pour tout amateur de motocross', 'PROD-82.webp', '900.00', '0.00', 109, 1),
(83, 8, 18, 'Cycle Bike Glow', 'Universal fitment and easy to install no special wires, can be easily installed and removed. Fits most standard tyre air stem valves of road, mountain bicycles, motorcycles and cars', 'Montage universel et facile à installer sans fils spéciaux, peut être facilement installé et retiré. Convient à la plupart des valves de tige d\'air de pneu standard des vélos de route, de montagne, de motos et de voitures', 'PROD-83.jpg', '35.00', '11.08', 63, 1),
(84, 6, 19, 'Female Pearl Earrings', 'Female pearl earrings with a classic, sophisticated design. Made of high-quality materials with a delicate pearl and a secure, comfortable fit. A perfect accessory for any outfit', 'Boucles d\'oreilles en perles pour femmes au design classique et sophistiqué. Fabriqué à partir de matériaux de haute qualité avec une perle délicate et un ajustement sûr et confortable. Un accessoire parfait pour n\'importe quelle tenue', 'PROD-84.jpg', '30.00', '12.80', 16, 1),
(85, 3, 20, 'Analog Royal Blue Watch', 'Analog royal blue watch with a bold, vibrant design. Made of high-quality materials with a precise movement and a comfortable, adjustable band. A stylish and functional accessory', 'Montre analogique bleu royal au design audacieux et vibrant. Fabriqué avec des matériaux de haute qualité avec un mouvement précis et une bande confortable et réglable. Un accessoire élégant et fonctionnel', 'PROD-85.webp', '50.00', '0.00', 142, 1),
(86, 4, 21, 'Frock Fold Printed', 'Ghazi fabric long frock gold printed ready to wear stitched collection', 'Robe longue en tissu Ghazi or imprimé prêt à porter collection cousue', 'PROD-86.jpg', '600.00', '15.55', 150, 1),
(87, 8, 22, 'Qualcomm Car Charger', 'Qualcomm car charger with a high-speed, efficient design. Made of high-quality materials with a secure, reliable fit and compatibility with a variety of devices', 'Chargeur de voiture Qualcomm avec une conception rapide et efficace. Fabriqué à partir de matériaux de haute qualité avec un ajustement sûr et fiable et une compatibilité avec une variété d\'appareils', 'PROD-87.jpg', '40.00', '17.53', 79, 1),
(88, 3, 23, 'Stylish Luxury Digital Watch', 'Stylish Luxury Digital Watch for girls and women', 'Montre numérique de luxe élégante pour les filles et les femmes', 'PROD-88.webp', '57.00', '0.00', 77, 1),
(89, 8, 24, 'Incubator Temperature Controller', 'Incubator temperature controller with a precise. Made of high-quality materials with an easy-to-read display and a wide temperature range. Perfect for maintaining consistent temperatures in incubators', 'Contrôleur de température d\'incubateur avec un précis. Fabriqué avec des matériaux de haute qualité avec un affichage facile à lire et une large plage de température. Parfait pour maintenir des températures constantes dans les incubateurs', 'PROD-89.jpg', '40.00', '11.30', 37, 1),
(90, 3, 25, 'Fashion Magnetic Wrist Watch', 'Buy this awesome product. The product is originally manufactured by the company and it\'s a top selling product with a very reasonable price', 'Achetez ce produit génial. Le produit est fabriqué à l\'origine par la société et c\'est un produit le plus vendu avec un prix très raisonnable', 'PROD-90.jpg', '60.00', '16.69', 46, 1),
(91, 8, 26, 'Automatic Motor Gas Motorcycles', 'Automatic motor gas motorcycles with a powerful, high-performance design. Made of high-quality materials with a smooth, comfortable ride and a sleek, stylish appearance. A reliable and efficient mode of transportation', 'Motos à essence à moteur automatique au design puissant et performant. Fabriqué à partir de matériaux de haute qualité avec une conduite douce et confortable et une apparence élégante et élégante. Un moyen de transport fiable et efficace', 'PROD-91.jpg', '1050.00', '0.00', 127, 1),
(92, 4, 27, 'Ladies Multicolored Dress', 'This classy shirt for women gives you a gorgeous look on everyday wear and specially for semi-casual wears', 'Cette chemise chic pour femme vous donne un look magnifique au quotidien et spécialement pour les tenues semi-décontractées', 'PROD-92.jpg', '79.00', '16.88', 2, 1),
(93, 8, 28, 'Kitchen Ceiling Lighting', 'Kitchen ceiling lighting with a modern, stylish design. Made of high-quality materials with a warm, inviting light and an easy-to-install mounting system. Perfect for adding ambiance to any kitchen', 'Plafonnier de cuisine au design moderne et élégant. Fabriqué avec des matériaux de haute qualité avec une lumière chaleureuse et invitante et un système de montage facile à installer. Parfait pour ajouter de l\'ambiance à n\'importe quelle cuisine', 'PROD-93.jpg', '30.00', '14.89', 96, 1),
(94, 8, 30, 'Maria Theresa Crystal Chandelier', 'Crystal chandelier made by Maria Theresa with a luxurious, elegant design. Made of high-quality materials with sparkling crystals and a classic, timeless appearance. A beautiful and sophisticated addition to any room', 'Lustre en cristal de Marie-Thérèse au design luxueux et élégant. Fabriqué à partir de matériaux de haute qualité avec des cristaux étincelants et un aspect classique et intemporel. Un ajout beau et sophistiqué à n\'importe quelle pièce', 'PROD-94.jpg', '47.00', '16.00', 133, 1),
(95, 8, 31, 'Black Motorbike', 'Engine Type:Wet sump, Single Cylinder, Four Stroke, Two Valves, Air Cooled with SOHC (Single Over Head Cam) Chain Drive Bore & Stroke:47.0 x 49.5 MM', 'Type de moteur : carter humide, monocylindre, quatre temps, deux soupapes, refroidi par air avec SOHC (came unique en tête) Alésage et course : 47,0 x 49,5 mm', 'PROD-95.jpg', '569.00', '13.63', 115, 1),
(96, 3, 32, 'Steel Analog Couple Watches', 'Steel analog couple watches with a sleek, modern design. Made of high-quality steel with a precise movement and a comfortable, adjustable band. A stylish and functional accessory for any couple', 'Montres de couple analogiques en acier au design élégant et moderne. Fabriqué en acier de haute qualité avec un mouvement précis et une bande confortable et réglable. Un accessoire élégant et fonctionnel pour tout couple', 'PROD-96.jpg', '35.00', '0.00', 24, 1),
(97, 8, 33, 'TC Reusable Silicone Magic Washing Gloves', 'TC reusable silicone magic washing gloves with scrubber', 'TC Gants de lavage magiques en silicone réutilisables avec épurateur', 'PROD-97.jpg', '29.00', '0.00', 42, 1),
(99, 3, 35, 'Seven Pocket Women Bag', 'Seven pocket women bag with a spacious, functional design. Made of high-quality materials with a stylish appearance and multiple pockets for organization. A perfect accessory for any outfit', 'Sac pour femme à sept poches au design spacieux et fonctionnel. Fabriqué à partir de matériaux de haute qualité avec une apparence élégante et de multiples poches pour l\'organisation. Un accessoire parfait pour n\'importe quelle tenue', 'PROD-99.jpg', '68.00', '14.87', 13, 1),
(100, 3, 2, 'Stainless Steel Watch for Women', 'Stainless steel watch for women with a sleek, modern design. Made of high-quality stainless steel with a precise movement and a comfortable band', 'Montre en acier inoxydable pour femme au design épuré et moderne. Fabriqué en acier inoxydable de haute qualité avec un mouvement précis et une bande confortable', 'PROD-100.jpg', '35.00', '0.00', 111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `producttags`
--

DROP TABLE IF EXISTS `producttags`;
CREATE TABLE `producttags` (
  `PRODUCT_ID` int(11) NOT NULL,
  `TAG_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `RATING_ID` int(11) NOT NULL,
  `RATING_PRODUCT_ID` int(11) NOT NULL,
  `RATING_COMMENT_ID` int(11) DEFAULT NULL,
  `RATING_USER_ID` int(11) NOT NULL,
  `RATING_GRADE` int(11) NOT NULL,
  `RATING_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`RATING_ID`, `RATING_PRODUCT_ID`, `RATING_COMMENT_ID`, `RATING_USER_ID`, `RATING_GRADE`, `RATING_DATE`) VALUES
(1, 1, 1, 56, 5, '2022-12-05'),
(2, 1, 2, 98, 1, '2022-12-12'),
(3, 1, NULL, 68, 3, '2022-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `socialmediaaccounts`
--

DROP TABLE IF EXISTS `socialmediaaccounts`;
CREATE TABLE `socialmediaaccounts` (
  `USER_ID` int(11) NOT NULL,
  `SOCIAL_MEDIA_ID` int(11) NOT NULL,
  `SOCIAL_MEDIA_ACCOUNT` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `socialmediaaccounts`
--

INSERT INTO `socialmediaaccounts` (`USER_ID`, `SOCIAL_MEDIA_ID`, `SOCIAL_MEDIA_ACCOUNT`) VALUES
(2, 1, 'Miles-Cummerata'),
(2, 2, 'Miles-Cummerata'),
(2, 3, 'Miles-Cummerata'),
(2, 4, 'Miles-Cummerata'),
(2, 5, 'Miles-Cummerata.com'),
(2, 6, 'Miles-Cummerata'),
(3, 1, 'Sheldon-Quigley'),
(3, 2, 'Sheldon-Quigley'),
(3, 3, 'Sheldon-Quigley'),
(3, 4, 'Sheldon-Quigley'),
(3, 5, 'Sheldon-Quigley.com'),
(3, 6, 'Sheldon-Quigley'),
(4, 1, 'Mavis-Schultz'),
(4, 2, 'Mavis-Schultz'),
(4, 3, 'Mavis-Schultz'),
(4, 4, 'Mavis-Schultz'),
(4, 5, 'Mavis-Schultz.com'),
(4, 6, 'Mavis-Schultz'),
(5, 1, 'Terry-Medhurst'),
(5, 2, 'Terry-Medhurst'),
(5, 3, 'Terry-Medhurst'),
(5, 4, 'Terry-Medhurst'),
(5, 5, 'Terry-Medhurst.com'),
(5, 6, 'Terry-Medhurst'),
(6, 1, 'Griffin-Braun'),
(6, 2, 'Griffin-Braun'),
(6, 3, 'Griffin-Braun'),
(6, 4, 'Griffin-Braun'),
(6, 5, 'Griffin-Braun.com'),
(6, 6, 'Griffin-Braun'),
(7, 1, 'Doyle-Ernser'),
(7, 2, 'Doyle-Ernser'),
(7, 3, 'Doyle-Ernser'),
(7, 4, 'Doyle-Ernser'),
(7, 5, 'Doyle-Ernser.com'),
(7, 6, 'Doyle-Ernser'),
(8, 1, 'Kody-Terry'),
(8, 2, 'Kody-Terry'),
(8, 3, 'Kody-Terry'),
(8, 4, 'Kody-Terry'),
(8, 5, 'Kody-Terry.com'),
(8, 6, 'Kody-Terry'),
(9, 1, 'Kaya-Emard'),
(9, 2, 'Kaya-Emard'),
(9, 3, 'Kaya-Emard'),
(9, 4, 'Kaya-Emard'),
(9, 5, 'Kaya-Emard.com'),
(9, 6, 'Kaya-Emard'),
(10, 1, 'Jeanne-O\'Keefe'),
(10, 2, 'Jeanne-O\'Keefe'),
(10, 3, 'Jeanne-O\'Keefe'),
(10, 4, 'Jeanne-O\'Keefe'),
(10, 5, 'Jeanne-O\'Keefe.com'),
(10, 6, 'Jeanne-O\'Keefe'),
(11, 1, 'Anais-Yundt'),
(11, 2, 'Anais-Yundt'),
(11, 3, 'Anais-Yundt'),
(11, 4, 'Anais-Yundt'),
(11, 5, 'Anais-Yundt.com'),
(11, 6, 'Anais-Yundt'),
(12, 1, 'Lee-Schmidt'),
(12, 2, 'Lee-Schmidt'),
(12, 3, 'Lee-Schmidt'),
(12, 4, 'Lee-Schmidt'),
(12, 5, 'Lee-Schmidt.com'),
(12, 6, 'Lee-Schmidt'),
(13, 1, 'Lempi-Runte'),
(13, 2, 'Lempi-Runte'),
(13, 3, 'Lempi-Runte'),
(13, 4, 'Lempi-Runte'),
(13, 5, 'Lempi-Runte.com'),
(13, 6, 'Lempi-Runte'),
(14, 1, 'Clotilde-Larson'),
(14, 2, 'Clotilde-Larson'),
(14, 3, 'Clotilde-Larson'),
(14, 4, 'Clotilde-Larson'),
(14, 5, 'Clotilde-Larson.com'),
(14, 6, 'Clotilde-Larson'),
(15, 1, 'Harrison-Lemke'),
(15, 2, 'Harrison-Lemke'),
(15, 3, 'Harrison-Lemke'),
(15, 4, 'Harrison-Lemke'),
(15, 5, 'Harrison-Lemke.com'),
(15, 6, 'Harrison-Lemke'),
(16, 1, 'Rita-Shields'),
(16, 2, 'Rita-Shields'),
(16, 3, 'Rita-Shields'),
(16, 4, 'Rita-Shields'),
(16, 5, 'Rita-Shields.com'),
(16, 6, 'Rita-Shields'),
(17, 1, 'Rory-Conn'),
(17, 2, 'Rory-Conn'),
(17, 3, 'Rory-Conn'),
(17, 4, 'Rory-Conn'),
(17, 5, 'Rory-Conn.com'),
(17, 6, 'Rory-Conn'),
(18, 1, 'Darien-Witting'),
(18, 2, 'Darien-Witting'),
(18, 3, 'Darien-Witting'),
(18, 4, 'Darien-Witting'),
(18, 5, 'Darien-Witting.com'),
(18, 6, 'Darien-Witting'),
(19, 1, 'Emely-Schmitt'),
(19, 2, 'Emely-Schmitt'),
(19, 3, 'Emely-Schmitt'),
(19, 4, 'Emely-Schmitt'),
(19, 5, 'Emely-Schmitt.com'),
(19, 6, 'Emely-Schmitt'),
(20, 1, 'Edwina-Ernser'),
(20, 2, 'Edwina-Ernser'),
(20, 3, 'Edwina-Ernser'),
(20, 4, 'Edwina-Ernser'),
(20, 5, 'Edwina-Ernser.com'),
(20, 6, 'Edwina-Ernser'),
(21, 1, 'Cristobal-Watsica'),
(21, 2, 'Cristobal-Watsica'),
(21, 3, 'Cristobal-Watsica'),
(21, 4, 'Cristobal-Watsica'),
(21, 5, 'Cristobal-Watsica.com'),
(21, 6, 'Cristobal-Watsica'),
(22, 1, 'Garret-Klocko'),
(22, 2, 'Garret-Klocko'),
(22, 3, 'Garret-Klocko'),
(22, 4, 'Garret-Klocko'),
(22, 5, 'Garret-Klocko.com'),
(22, 6, 'Garret-Klocko'),
(23, 1, 'Jeanne-Halvorson'),
(23, 2, 'Jeanne-Halvorson'),
(23, 3, 'Jeanne-Halvorson'),
(23, 4, 'Jeanne-Halvorson'),
(23, 5, 'Jeanne-Halvorson.com'),
(23, 6, 'Jeanne-Halvorson'),
(24, 1, 'Ewell-Mueller'),
(24, 2, 'Ewell-Mueller'),
(24, 3, 'Ewell-Mueller'),
(24, 4, 'Ewell-Mueller'),
(24, 5, 'Ewell-Mueller.com'),
(24, 6, 'Ewell-Mueller'),
(25, 1, 'Assunta-Rath'),
(25, 2, 'Assunta-Rath'),
(25, 3, 'Assunta-Rath'),
(25, 4, 'Assunta-Rath'),
(25, 5, 'Assunta-Rath.com'),
(25, 6, 'Assunta-Rath'),
(26, 1, 'Salvatore-Fisher'),
(26, 2, 'Salvatore-Fisher'),
(26, 3, 'Salvatore-Fisher'),
(26, 4, 'Salvatore-Fisher'),
(26, 5, 'Salvatore-Fisher.com'),
(26, 6, 'Salvatore-Fisher'),
(27, 1, 'Arne-Jacobs'),
(27, 2, 'Arne-Jacobs'),
(27, 3, 'Arne-Jacobs'),
(27, 4, 'Arne-Jacobs'),
(27, 5, 'Arne-Jacobs.com'),
(27, 6, 'Arne-Jacobs'),
(28, 1, 'Macy-Greenfelder'),
(28, 2, 'Macy-Greenfelder'),
(28, 3, 'Macy-Greenfelder'),
(28, 4, 'Macy-Greenfelder'),
(28, 5, 'Macy-Greenfelder.com'),
(28, 6, 'Macy-Greenfelder'),
(30, 1, 'Gayle-Krajcik'),
(30, 2, 'Gayle-Krajcik'),
(30, 3, 'Gayle-Krajcik'),
(30, 4, 'Gayle-Krajcik'),
(30, 5, 'Gayle-Krajcik.com'),
(30, 6, 'Gayle-Krajcik'),
(31, 1, 'Terrell-Schuppe'),
(31, 2, 'Terrell-Schuppe'),
(31, 3, 'Terrell-Schuppe'),
(31, 4, 'Terrell-Schuppe'),
(31, 5, 'Terrell-Schuppe.com'),
(31, 6, 'Terrell-Schuppe'),
(32, 1, 'Davonte-Heaney'),
(32, 2, 'Davonte-Heaney'),
(32, 3, 'Davonte-Heaney'),
(32, 4, 'Davonte-Heaney'),
(32, 5, 'Davonte-Heaney.com'),
(32, 6, 'Davonte-Heaney'),
(33, 1, 'Allene-Harber'),
(33, 2, 'Allene-Harber'),
(33, 3, 'Allene-Harber'),
(33, 4, 'Allene-Harber'),
(33, 5, 'Allene-Harber.com'),
(33, 6, 'Allene-Harber'),
(34, 1, 'Terrence-Koelpin'),
(34, 2, 'Terrence-Koelpin'),
(34, 3, 'Terrence-Koelpin'),
(34, 4, 'Terrence-Koelpin'),
(34, 5, 'Terrence-Koelpin.com'),
(34, 6, 'Terrence-Koelpin'),
(35, 1, 'Maurine-Stracke'),
(35, 2, 'Maurine-Stracke'),
(35, 3, 'Maurine-Stracke'),
(35, 4, 'Maurine-Stracke'),
(35, 5, 'Maurine-Stracke.com'),
(35, 6, 'Maurine-Stracke');

-- --------------------------------------------------------

--
-- Table structure for table `socialmedias`
--

DROP TABLE IF EXISTS `socialmedias`;
CREATE TABLE `socialmedias` (
  `SOCIAL_MEDIA_ID` int(11) NOT NULL,
  `SOCIAL_MEDIA_NAME` varchar(254) NOT NULL,
  `SOCIAL_MEDIA_PREFIX` varchar(254) NOT NULL,
  `SOCIAL_MEDIA_ICON_URL` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `socialmedias`
--

INSERT INTO `socialmedias` (`SOCIAL_MEDIA_ID`, `SOCIAL_MEDIA_NAME`, `SOCIAL_MEDIA_PREFIX`, `SOCIAL_MEDIA_ICON_URL`) VALUES
(1, 'Facebook', 'https://facebook.com/', 'SM-1.svg'),
(2, 'Instagram', 'https://instagram.com/', 'SM-2.svg'),
(3, 'YouTube', 'https://youtube.com/@', 'SM-3.svg'),
(4, 'Pinterest', 'https://pinterest.com/', 'SM-4.svg'),
(5, 'Website', '', 'SM-5.svg'),
(6, 'Twitter', 'https://twitter.com/', 'SM-6.svg');

-- --------------------------------------------------------

--
-- Table structure for table `tagcategories`
--

DROP TABLE IF EXISTS `tagcategories`;
CREATE TABLE `tagcategories` (
  `TAG_CATEGORY_ID` int(11) NOT NULL,
  `TAG_CATEGORY_NAME` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tagcategories`
--

INSERT INTO `tagcategories` (`TAG_CATEGORY_ID`, `TAG_CATEGORY_NAME`) VALUES
(1, 'Size'),
(2, 'Color'),
(3, 'Material'),
(4, 'Brand'),
(5, 'Gender'),
(6, 'Shoe Type'),
(7, 'Accessories Type');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `TAG_ID` int(11) NOT NULL,
  `TAG_TAG_CATEGORY_ID` int(11) NOT NULL,
  `TAG_NAME` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`TAG_ID`, `TAG_TAG_CATEGORY_ID`, `TAG_NAME`) VALUES
(1, 1, 'XS'),
(2, 1, 'S'),
(3, 1, 'M'),
(4, 1, 'L'),
(5, 1, 'XL'),
(6, 1, 'XXL'),
(7, 2, 'Red'),
(8, 2, 'Green'),
(9, 2, 'Blue'),
(10, 2, 'Yellow'),
(11, 2, 'Black'),
(12, 2, 'White'),
(13, 3, 'Leather'),
(14, 3, 'Wool'),
(15, 3, 'Polyester'),
(16, 3, 'Nylon'),
(17, 3, 'Cotton'),
(18, 4, 'Apple'),
(19, 4, 'HP'),
(20, 4, 'Microsoft'),
(21, 4, 'Samsung'),
(22, 4, 'OPPO'),
(23, 4, 'Huawei'),
(24, 4, 'Infinix'),
(25, 5, 'Male'),
(26, 5, 'Female'),
(27, 6, 'Boots'),
(28, 6, 'Sandals'),
(29, 6, 'Slippers'),
(30, 6, 'Sneakers'),
(31, 7, 'Watches'),
(32, 7, 'Bags'),
(33, 7, 'Glasses');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `TICKET_ID` int(11) NOT NULL,
  `TICKET_USER_ID` int(11) NOT NULL,
  `TICKET_TICKET_TYPE_ID` int(11) NOT NULL,
  `TICKET_ADMIN_ID` int(11) NOT NULL,
  `TICKET_NAME` varchar(254) NOT NULL,
  `TICKET_DESCRIPTION` varchar(254) NOT NULL,
  `TICKET_DATE` date NOT NULL,
  `TICKET_RESOLVED` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickettypes`
--

DROP TABLE IF EXISTS `tickettypes`;
CREATE TABLE `tickettypes` (
  `TICKET_TYPE_ID` int(11) NOT NULL,
  `TICKET_TYPE_NAME` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tickettypes`
--

INSERT INTO `tickettypes` (`TICKET_TYPE_ID`, `TICKET_TYPE_NAME`) VALUES
(1, 'Help'),
(2, 'ProductReport'),
(3, 'UserReport'),
(4, 'CommentReport'),
(5, 'CreatorRequest'),
(6, 'ContactRequest');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_FIRST_NAME` varchar(254) NOT NULL,
  `USER_LAST_NAME` varchar(254) NOT NULL,
  `USER_PASSWORD_HASH` varchar(254) NOT NULL,
  `USER_EMAIL` varchar(254) NOT NULL,
  `USER_PICTURE_URL` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USER_FIRST_NAME`, `USER_LAST_NAME`, `USER_PASSWORD_HASH`, `USER_EMAIL`, `USER_PICTURE_URL`) VALUES
(1, 'Hazim', 'Asri', '$2b$10$XoJlaa/lG1vdbf2cPdFKk.9/zl2jHc1XwcUAKlsmR8xoaQwDqvN5e', 'wan-muhammad-hazim.wan-mohd-asri@etu.univ-lyon1.fr', 'PP-1.png'),
(2, 'Miles', 'Cummerata', '$2b$10$kb5fmWipLnhUbvQcVLlqsOOktE3WKP2lLpB9o8/QzZoGDJEhcVN9q', 'yraigatt3@nature.com', 'PP-2.png'),
(3, 'Sheldon', 'Quigley', '$2b$10$qCKcdfhoQaZPueBRV1QTcOGVA7LA1Boly2liIEBmysZZypDCyDPm.', 'hbingley1@plala.or.jp', 'PP-3.png'),
(4, 'Mavis', 'Schultz', '$2b$10$rMusayjYlkPfAGjbcR9R7uJgHiAXaJA/3JFkDUXSzMKOl9x5CO1kK', 'kmeus4@upenn.edu', 'PP-4.png'),
(5, 'Terry', 'Medhurst', '$2b$10$Tt4KBaLPAucsAdoOhLS0FOTXcb0P1189T7sqaWQNTDfjsgsV8ZYM6', 'atuny0@sohu.com', 'PP-5.png'),
(6, 'Griffin', 'Braun', '$2b$10$RvtuP.fPJqOV600tzeE8gObLLf9ZP7vEkty7ga8NDYQ.vXCI8aMnu', 'lgronaverp@cornell.edu', 'PP-6.png'),
(7, 'Doyle', 'Ernser', '$2b$10$US2B4B1/0lBZwyD8zdY4z.ssVHvx1JRYnvfv6iqZDkjS06XJ9wlCq', 'ckensleyk@pen.io', 'PP-7.png'),
(8, 'Kody', 'Terry', '$2b$10$x8HkFnjWE9F.RG.2IU041.x6K9VM2I08QJ8eZdDdYr/rbUrAOu8wq', 'xisherwoodr@ask.com', 'PP-8.png'),
(9, 'Kaya', 'Emard', '$2b$10$RsM54IEpM8LPU2V.hWjJA.lfrf6HVtvpSlUa..E1j/QN8nWE5Wn72', 'lskeelv@webeden.co.uk', 'PP-9.png'),
(10, 'Jeanne', 'O\'Keefe', '$2b$10$21SLfYV1MVfY1AkOEtrnAuWjxeb.zEzHtshs.HaMzZNsmirkoJSza', 'hollet1s@trellian.com', 'PP-10.png'),
(11, 'Anais', 'Yundt', '$2b$10$K9Nv96dtIk6oFSGe6Z6N1eTGGiF8TSkipT6I.IKWJUfUS64B3u99S', 'agreenhouse2f@mashable.com', 'PP-11.png'),
(12, 'Lee', 'Schmidt', '$2b$10$HEwH0TMVrIEiModn9cmKGeIt3xaDypvG3zXv1MA6UQq68POR6U50O', 'gsilcockw@infoseek.co.jp', 'PP-12.png'),
(13, 'Lempi', 'Runte', '$2b$10$JvnJC8Kp9KUQdd3SnRrvQ.vPFgNE5s2Q1rFubw7YWGLRDzD6PGB8i', 'zstenning2p@list-manage.com', 'PP-13.png'),
(14, 'Clotilde', 'Larson', '$2b$10$lW5UeW19WiW1L8UzDHsUAO0C5JnwexRYnDnh64YHJo6mwwMRXINj6', 'wfeldon20@netlog.com', 'PP-14.png'),
(15, 'Harrison', 'Lemke', '$2b$10$0dwBHJeGj.mpUcLBLlgNWeqR9ZDw6cISMskOryT79n61xKavLcrrO', 'pmoraleda26@symantec.com', 'PP-15.png'),
(16, 'Rita', 'Shields', '$2b$10$USxkrceaubrKoLSP830D9.o/kwPc9afyQSPUkFxoR8KWzaDT2mxQO', 'gconford2a@wordpress.com', 'PP-16.png'),
(17, 'Rory', 'Conn', '$2b$10$GysmQZzUlG4c47WC2eoVOetir7WWRF.oiwftb44PkQgdDxzIaL0Ui', 'cchomiszewski2m@cbsnews.com', 'PP-17.png'),
(18, 'Darien', 'Witting', '$2b$10$.luYWIu9R6PAyl6kwQqPr.BhpeDEsAG3oSpWMv/fPSFfBf75knram', 'aaughtonx@businessweek.com', 'PP-18.png'),
(19, 'Emely', 'Schmitt', '$2b$10$OndqReBO5FFhy8aSlIzlHuHgsEgyTTtRdBpv/B/XENyo3WEOmAJ6K', 'clambol2j@bloglovin.com', 'PP-19.png'),
(20, 'Edwina', 'Ernser', '$2b$10$NBUszqT9n3bJrd5WaHK43O3wHWz4IMSqjGULn7E2oudnGTSYQmbH2', 'dfundello@amazon.co.jp', 'PP-20.png'),
(21, 'Cristobal', 'Watsica', '$2b$10$Ev2wPiHtpcFoQbA/wg859upa8x5NNImwxRrag.E40RpZmLDtQ2EeS', 'bgoby2n@washingtonpost.com', 'PP-21.png'),
(22, 'Garret', 'Klocko', '$2b$10$ScoOUCuDmIPJ8jFp8GnXWeVBE4lIc4bNOBSHSvVExuVejl8oRqw3O', 'kbrecknock16@marriott.com', 'PP-22.png'),
(23, 'Jeanne', 'Halvorson', '$2b$10$WdvRlyELnoexpY89nN3u4uWC9hFpU6VjKlrafsKk6X6uUrEPDCAsq', 'kminchelle@qq.com', 'PP-23.png'),
(24, 'Ewell', 'Mueller', '$2b$10$xL2R6WukPuf85qN0ohOaMeVQMgKaJeeNdUKfR8vkW.gvfm25iKvce', 'ggude7@chron.com', 'PP-24.png'),
(25, 'Assunta', 'Rath', '$2b$10$SC0gBgyhKL3pU4h0/PLSE.RHqS39S8nVT3GkKd8pMzoTKWisM3PgO', 'rhallawellb@dropbox.com', 'PP-25.png'),
(26, 'Salvatore', 'Fisher', '$2b$10$NLVVXliDZ5553eu2IPRdEORYhuPv5964ZPrbImf1g8Im2VIGbuHp.', 'lgherardi12@washington.edu', 'PP-26.png'),
(27, 'Arne', 'Jacobs', '$2b$10$sgla/OCo9JqwyKAFegPqPu8cQobxF.H5xHsOkD7BAD4xtQK4NpZ4i', 'hyaknov2i@hhs.gov', 'PP-27.png'),
(28, 'Macy', 'Greenfelder', '$2b$10$1t0VAFl/Nr.ltji3piajFu3F/c2kg1n74deZH8XybyF4FpYIx4Nbe', 'jissetts@hostgator.com', 'PP-28.png'),
(29, 'Mathis', 'Guerin', '$2y$10$6I7x.RXDju.V6YZOI6RTS.Buka8Zi46OgOJICpZzbtylrlOHl7xsy', 'mathis.guerin@etu.univ-lyon1.fr', 'PP-29.png'),
(30, 'Gayle', 'Krajcik', '$2b$10$hcyxRqoEyQixJRnYglbKEOA6zYTiTqQJWIHNbHUq9SwLh5lpEamRm', 'cdwyr2g@shop-pro.jp', 'PP-30.png'),
(31, 'Terrell', 'Schuppe', '$2b$10$1iCL.aqfE16MTi.CzXP5d.gHEwN3tXzRtKN7w9bJgIg5LSszlxbGy', 'flesslie2q@google.nl', 'PP-31.png'),
(32, 'Davonte', 'Heaney', '$2b$10$SLbv01FKaUuFLsGbLXL3uO00F7g4OYcybsG8ddDTP4d/27Mu6zl9C', 'gbarhams1u@cnet.com', 'PP-32.png'),
(33, 'Allene', 'Harber', '$2b$10$3w9OkQ1n9hJ55NNmSoXEbez69XYZvVEGSQaG.il6Go.tPyMw09eha', 'cdavydochkin2o@globo.com', 'PP-33.png'),
(34, 'Terrence', 'Koelpin', '$2b$10$1C859sdDAkxHts0o9bTvaO6BZgTQtvDr4PIthxbJQmMyaCXKuduKW', 'hfasey1t@home.pl', 'PP-34.png'),
(35, 'Maurine', 'Stracke', '$2b$10$F3FfgMAxWlL8bUfPS8dGneNBLCdaxAIxsVZXa4mQ/IgRvA2bbqAKO', 'kdulyt@umich.edu', 'PP-35.png'),
(36, 'Jasmin', 'Hermiston', '$2b$10$J3jjwvzBMa2XXd0p1iY5Ren9gd.m3Ff77ha5PHLvoxX8E/Q64gI0i', 'lgutridge13@sun.com', 'PP-36.png'),
(37, 'Arely', 'Skiles', '$2b$10$jXgiayCTAPlYwTYJORyZWOLsOMp08h8a8nEMcGMGsxyi1s3.0Ahpu', 'sberminghamh@chron.com', 'PP-37.png'),
(38, 'Eleazar', 'Torp', '$2b$10$kYMLuPdAPaeloxJD6HYHJuv1IHs9Yfq8c0JGZZJ9S453xqncJVBQS', 'fschlagman2e@deliciousdays.com', 'PP-38.png'),
(39, 'Trace', 'Douglas', '$2b$10$C35i0JUFClawP339KtJXgezUeljux56qEaJ4pCdWp.MsTc10/7rd.', 'lgribbinc@posterous.com', 'PP-39.png'),
(40, 'Justus', 'Sipes', '$2b$10$Xt024mtbuPz2uutLXKz/Z.VgaDxqw7ywAhX3DGuMb9qXmeevw/0.K', 'rmcritchie19@topsy.com', 'PP-40.png'),
(41, 'Aniya', 'Wisozk', '$2b$10$GleSV9zELpLWiyTeQQTfoeqKlLN7vN/REbJpgGS/mtiGNvJOOOzdG', 'dmantle2b@reuters.com', 'PP-41.png'),
(42, 'Rupert', 'Upton', '$2b$10$7jUf/8251np/BK8OHpY/uumwefgotw7ehsbMtzR6pMFzRAu2kJAU6', 'whuman2d@hp.com', 'PP-42.png'),
(43, 'Jerry', 'Kertzmann', '$2b$10$3E.RUf.nw9wNRj82.5CfBeii.3BtstP8LOZqdTvl.S/T59pzxGkVS', 'tmullender1e@scientificamerican.com', 'PP-43.png'),
(44, 'Reginald', 'Wisoky', '$2b$10$dqzUl3QsFM/X9yhNPBsC9uMHA74QoTR7z8rjBBT/V4YsL5ZzB8fZG', 'rlaxe17@tamu.edu', 'PP-44.png'),
(45, 'Eleanora', 'Price', '$2b$10$v4r21fSfa8TeBAJSnUMRhu/u0yJdRCAnIkwpn5Nvzdi7NbW6YuN9S', 'umcgourty9@jalbum.net', 'PP-45.png'),
(46, 'Humberto', 'Botsford', '$2b$10$GTinPWdX2hdxfKH.hnWUueNPS/bDivYU.b6YOfg9p5uJrT6zDswIW', 'pidill18@china.com.cn', 'PP-46.png'),
(47, 'Delfina', 'Ziemann', '$2b$10$5jnzPZ7cqbgYmTP3pjJuBuv.GvCDXtjGBueWOrSmcyTOBq9ULGUEi', 'nwytchard10@blogspot.com', 'PP-47.png'),
(48, 'Angelica', 'Baumbach', '$2b$10$4YMRCDPPzJ9ChgIlMBEjuukw7yZW8V6H9Emf70ntYWjr6ISgiSb5W', 'dalmondz@joomla.org', 'PP-48.png'),
(49, 'Tressa', 'Weber', '$2b$10$l1inw.X.nzrFrSjQ66cLcek2pPwb6HOzt.9f.YPWT7QhofcUQQwSK', 'froachel@howstuffworks.com', 'PP-49.png'),
(50, 'Marcel', 'Jones', '$2b$10$O3GfN7k2MuaWMOjya05jiuCefzkq2BnN/ciyR1KARp2TyF44TAItq', 'acharlota@liveinternet.ru', 'PP-50.png'),
(51, 'Frankie', 'Hudson', '$2b$10$uIhKgjBexoXzboQsCfi8POgt4kYXs4kA6YzgUdM2.vrmGokis9be.', 'dbuist25@hao123.com', 'PP-51.png'),
(52, 'Twila', 'Padberg', '$2b$10$QFcO7byeK4c90.oExucgI.LvWne1o.YGMRH84BWgqLt1mUiajdCcm', 'cmasurel1x@baidu.com', 'PP-52.png'),
(53, 'Maymie', 'Yundt', '$2b$10$BsbtUfuoUK.MW3yIdhuyZ.lzk2YdctrHB./GEy9FsmUn3VGo5EGFe', 'kogilvy29@blogtalkradio.com', 'PP-53.png'),
(54, 'Lenna', 'Renner', '$2b$10$qZhM.zURdXLhEa1GPqXpqu8Dtz7f1/k51l6ESHJt0tBn8mqOJxQp.', 'aeatockj@psu.edu', 'PP-54.png'),
(55, 'Bradford', 'Prohaska', '$2b$10$gQPzdikzP0Rv6h5eQYQMz.2JzV.PQEqd9DlVGy/QsTWpkstEH7DTC', 'vcholdcroftg@ucoz.com', 'PP-55.png'),
(56, 'Albert', 'Vaillon', '$2b$10$O9rj5sKxo.G7o.YDj2tTU.z/3U3TxcLXaobLiv1j1wyvnjZriVbxe', 'albert.vaillon@etu.univ-lyon1.fr', 'PP-56.png'),
(57, 'Toy', 'Olson', '$2b$10$MtJEQZBXN26cNwB7PPxzHe9NL0JhhvGkDQy.H6OtIJLRnJ83t5syO', 'bpickering1k@clickbank.net', 'PP-57.png'),
(58, 'Telly', 'Spinka', '$2b$10$GAQu2TdjPzOg0KMV6MdvjeMXSd.jXhZegzr2tucaffsMnBUUv46wu', 'bpetts1h@smugmug.com', 'PP-58.png'),
(59, 'Piper', 'Schowalter', '$2b$10$l3d5PUZiPU173F8nWIIKa.RCry8XhXsl4jIWcVp5wx7/UAwmQKeRm', 'fokillq@amazon.co.jp', 'PP-59.png'),
(60, 'Pearl', 'Blick', '$2b$10$E1ENkxzvX.5ip019PHqQmuB11VzD/PX4Why0FXVf9Pumu1aY98X/O', 'ssarjant1c@statcounter.com', 'PP-60.png'),
(61, 'Quinn', 'Witting', '$2b$10$1lwtLTNr7iDSzJEsAw7x1.4ubgQ4rczcIYH6NiWGFnjI2PsvesalO', 'gfernandes1r@virginia.edu', 'PP-61.png'),
(62, 'Johnathon', 'Predovic', '$2b$10$RxyVGOY6VjpbTs664v4REezUZrQfmWbflbeYNc6pKjsDO25KAo3F.', 'xlinster1d@bravesites.com', 'PP-62.png'),
(63, 'Felicita', 'Gibson', '$2b$10$1PSyZKKCQfS5Dr8/PW9ROeTXUCwa8xwyw0qD23IMsrBWkx0ibI8Ue', 'jevanson1b@admin.ch', 'PP-63.png'),
(64, 'Tiara', 'Rolfson', '$2b$10$kQQxHrxu5/UD2PH3vnT1xOBUvgYzfsMntlOWD3zHcLw.TBym3bvXG', 'mhaslegrave15@springer.com', 'PP-64.png'),
(65, 'Hal', 'Keebler', '$2b$10$xf1dNiYdGiZtgAPneBdXuO8eQA.spC.0Ko8.WgfgaHiqU36wmvZ/i', 'ajozef1i@usatoday.com', 'PP-65.png'),
(66, 'Rachel', 'Jacobson', '$2b$10$qVEJSEV9Sd0IGIIepwYUcuqrfsTOs8/NRlgyGOvO9OBFvtO7wcIvu', 'dlambarth1n@blinklist.com', 'PP-66.png'),
(67, 'Sincere', 'Mueller', '$2b$10$nRPfsvgCBW6TVpcq7GcYGu7wGFe5lJkn7ou5KV7.5U5BbPtPw9Wme', 'gmaccumeskey1g@buzzfeed.com', 'PP-67.png'),
(68, 'Hedi', 'Bouazza', '$2b$10$JlyqE72WK9dzsXAmwYbOQOJBtO2b/8.WbM3zrPt4Y5chqRFI89/Lm', 'hedi.bouazza@etu.univ-lyon1.fr', 'PP-68.png'),
(69, 'Amelia', 'Mann', '$2b$10$CMKck2eA0jMzOoJEDYRkFO9rZveO.pdKvCVI0spnrRVhXQqm9aKli', 'omarsland1y@washingtonpost.com', 'PP-69.png'),
(70, 'Everette', 'Prohaska', '$2b$10$ztC/Q7.qlPp3LXm7Ofm45umAwFvZKVCqtXxUQwzK8MEy5jpD3Gvb6', 'rstrettle1v@globo.com', 'PP-70.png'),
(71, 'Nicklaus', 'Cruickshank', '$2b$10$h2wp9etP5ylcaD7q.Im1z.jHVG8983HMecMn22COKnoT89PqlURPG', 'cslateford14@blogspot.com', 'PP-71.png'),
(72, 'Kari', 'Schinner', '$2b$10$O0OF28XUNotRkFCm.ZEHa.amFMFle3sdQuwp2HiJJBMCDqnQimg9q', 'jtossell2l@drupal.org', 'PP-72.png'),
(73, 'Oleta', 'Abbott', '$2b$10$mrGRuOBo6qAsXG6e4hXiguyCTctS4MWj7B3lOzhJeauAPKYpfnhfu', 'dpettegre6@columbia.edu', 'PP-73.png'),
(74, 'Claudia', 'Dooley', '$2b$10$Ylg8oonnIn4l3hfgdmEiruRigeLZHvnnsO0knfUwRACgPhRSwD4Fu', 'ptilson22@360.cn', 'PP-74.png'),
(75, 'Coralie', 'Boyle', '$2b$10$KfukKqVa6O/oZDB8lrSTVOfnG.6cwfgkznxhDU9mU79vSOw7MBfvW', 'rlangston1a@51.la', 'PP-75.png'),
(76, 'Terrill', 'Hills', '$2b$10$JTOh8AOeHJbG1nVmRO3KpO4CjlhPLWfZhmFwh3jHmgOIVFZM0f7ZK', 'rshawe2@51.la', 'PP-76.png'),
(77, 'Demetrius', 'Corkery', '$2b$10$RTfPfeQhfWkS5roU5uUS6OBkngMJmWIcLbSyHGvh1Ue1W0tQXpWU2', 'nloiterton8@aol.com', 'PP-77.png'),
(78, 'Elbert', 'Gottlieb', '$2b$10$bUskjt/1RJk9gBipO5pEBuygotP36PLya6Xk0e6gGywaQfGuMNH1S', 'gmein1f@nasa.gov', 'PP-78.png'),
(79, 'Thaddeus', 'McCullough', '$2b$10$w8rXc92rp1ptLMI2KCFcxekENI./W6rDDMo6lT/s/ZGd2ofzkBfi.', 'igannan11@microsoft.com', 'PP-79.png'),
(80, 'Guy', 'Franecki', '$2b$10$pcMv8x.iXg9o.MHqLb1lZuu5GAt.fKpqsVDoQwkJAsh6F/HirUcEi', 'vkohrt27@hostgator.com', 'PP-80.png'),
(81, 'Deanna', 'Glover', '$2b$10$hC8EbDR9EyviGnWkPuc6pu2u0TMWwqMr5lAUBNl.t71WqRcULE5rO', 'nworley1l@thetimes.co.uk', 'PP-81.png'),
(82, 'Amos', 'Weimann', '$2b$10$7OYBNtNWxoNpB.kUQH/jdOr0uxel8rie0xffHbYwC33dF3Cej3Zwq', 'rkingswood24@usa.gov', 'PP-82.png'),
(83, 'Moriah', 'Mills', '$2b$10$iPVKjBl0r8zGhhnJYOCWsO9z9J/Jk02Zq7jZxkQoxMq/aGxC2h2G.', 'ahinckes21@google.es', 'PP-83.png'),
(84, 'Enoch', 'Lynch', '$2b$10$7QSICEIeDlld2KzHEVvl3OwIY54fsv/UZvLxh4NcKCUuPinl4Auj.', 'mturleyd@tumblr.com', 'PP-84.png'),
(85, 'Fabiola', 'Oberbrunner', '$2b$10$5cYS18Vj9uECrUwOaESa1u07Z15FzkZ07hwMb9s.7JBn76SiOQJpa', 'dduggan2k@simplemachines.org', 'PP-85.png'),
(86, 'Megane', 'Armstrong', '$2b$10$.qHp6JLZP3lwP2zVhQENVeAEavnFYS17/SGBzhPb74q3.cgyudSTm', 'oyakushkev1j@oracle.com', 'PP-86.png'),
(87, 'Oda', 'Schmidt', '$2b$10$IvjRBjWOmuvxei9IbuW8yeH4okaEUBcpXBKQUe9NWvSKpBiS8b8JW', 'btegler1w@elegantthemes.com', 'PP-87.png'),
(88, 'Marcella', 'Shanahan', '$2b$10$MP.dkyxGqt9ijhwM4SThCuU1A/SBsOsHdErPbGqI.LXCNJwIBNxQe', 'klife1m@i2i.jp', 'PP-88.png'),
(89, 'Jacklyn', 'Schimmel', '$2b$10$EAQeHxhF97mQ/AdMdewSGeWxh3M9KzkoGyb9QWXscV.OhtGs1jB2C', 'mbrooksbanky@gnu.org', 'PP-89.png'),
(90, 'Angelica', 'Metz', '$2b$10$auQ7K/awDHP52X1YFxtzWe.C2i9rboB5W6JG3bRQcGJHqugmxyAzS', 'kpondjones2c@nsw.gov.au', 'PP-90.png'),
(91, 'Deon', 'Gutkowski', '$2b$10$hsgDDGqm./66IIwOrnfF.OcQNaK0jIHY1CXHrr6E3Hg.StfslHk.K', 'cgaber23@prlog.org', 'PP-91.png'),
(92, 'Tevin', 'Prohaska', '$2b$10$u43KqICnQia6wCgy80pKgerfuOx5k1ucCuV.PeNmkmnmhlhyXawqC', 'pcumbes2r@networkadvertising.org', 'PP-92.png'),
(93, 'Mozell', 'O\'Connell', '$2b$10$L4l9e1tvupM0eiuLlzocmuVvxDrkTobMNG/L7mXinc.GpCxvE6aZm', 'mpoyner1p@google.co.uk', 'PP-93.png'),
(94, 'Jocelyn', 'Schuster', '$2b$10$ALN7VX8e7ejVkLF/74LDOeChcJLAwKXPbLj4s7JUe2Zc2xnufKSTi', 'brickeardn@fema.gov', 'PP-94.png'),
(95, 'Trycia', 'Fadel', '$2b$10$fXcwDmz7OljkDR.nJ01VZ.uWWSHJcN4n6QgU43jCL/TVaEikZaaum', 'dpierrof@vimeo.com', 'PP-95.png'),
(96, 'Sidney', 'Rutherford', '$2b$10$ndE//QTYLOonSppgH2BJfu9.ohkyBYX8JkSm6DKD6nsSXFdtR62by', 'capplewhite28@nationalgeographic.com', 'PP-96.png'),
(97, 'Alison', 'Reichert', '$2b$10$ZZIlYFREGQPRy7jVqvc8H.X1obdc85QCp2AmsY7mf7X9w.VEMZivW', 'jtreleven5@nhs.uk', 'PP-97.png'),
(98, 'Eyoub', 'Benkacem', '$2b$10$wYMnJWFvTmGU3jwqcnwZtus7NoTXzdYEsfmJRG4pAevxxHQbsmHLW', 'eyoub.benkacem@etu.univ-lyon1.fr', 'PP-98.png'),
(99, 'Wilma', 'Hickle', '$2b$10$o7sYvsRR66l7NKnz684LF.oJ/piefNjv7iI0ZwE19Y3cXBQ3hcPEG', 'omottley2h@hugedomains.com', 'PP-99.png'),
(100, 'Nora', 'Sawayn', '$2b$10$tRTRVW6AaUVz7dHwJ2mSB.Zz9e9qegCp1SDcU4Ag6tP4vr4qNDtdi', 'cepgrave1o@biblegateway.com', 'PP-100.png'),
(101, 'Nasir', 'Leuschke', '$2b$10$BMSnDWqN7qxC43Bhj72b5uY4jgg3utEiA4.8k5x8wVy/2/LiPZDWq', 'eburras1q@go.com', 'PP-101.png'),
(102, 'Frederique', 'Boehm', '$2b$10$s6tC9u7YQPHMAhf.g8.AmOsmsTpk7shuDlTH.NHaiHPouSY9r11p.', 'mcrumpe1z@techcrunch.com', 'PP-102.png'),
(103, 'Luciano', 'Sauer', '$2b$10$gum51TYNhoc0lbpRLmGQcuMCBBEgDAAnCzP1KSNnddhjYCTun10Ri', 'smargiottau@altervista.org', 'PP-103.png'),
(104, 'Felicity', 'O\'Reilly', '$2b$10$9YuNwi8KmuoEtR3pT0qmKO.xzWP/Qz6BIXtSB1f7sg2FVfJ5vy.5q', 'beykelhofm@wikispaces.com', 'PP-104.png'),
(105, 'Gust', 'Purdy', '$2b$10$j56WqJk6QlMr7LJZK2fureAUXJQF.Wtbjnstz7xb0JaoGBZmfcBf.', 'bleveragei@so-net.ne.jp', 'PP-105.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`PRODUCT_ID`,`USER_ID`),
  ADD KEY `FK_CONTAINS2` (`USER_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Indexes for table `categorytagcategories`
--
ALTER TABLE `categorytagcategories`
  ADD PRIMARY KEY (`CATEGORY_ID`,`TAG_CATEGORY_ID`),
  ADD KEY `FK_PRECISES2` (`TAG_CATEGORY_ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`COMMENT_ID`),
  ADD KEY `FK_INFORMS` (`COMMENT_RATING_ID`);

--
-- Indexes for table `creators`
--
ALTER TABLE `creators`
  ADD PRIMARY KEY (`CREATOR_ID`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`USER_ID`,`CREATOR_ID`),
  ADD KEY `FK_FAVORITES2` (`CREATOR_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `FK_BELONGS_TO` (`PRODUCT_CATEGORY_ID`),
  ADD KEY `FK_SELLS` (`PRODUCT_CREATOR_ID`);

--
-- Indexes for table `producttags`
--
ALTER TABLE `producttags`
  ADD PRIMARY KEY (`PRODUCT_ID`,`TAG_ID`),
  ADD KEY `FK_DEFINES2` (`TAG_ID`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`RATING_ID`),
  ADD KEY `FK_GIVES` (`RATING_USER_ID`),
  ADD KEY `FK_GRADES` (`RATING_PRODUCT_ID`),
  ADD KEY `FK_INFORMS2` (`RATING_COMMENT_ID`);

--
-- Indexes for table `socialmediaaccounts`
--
ALTER TABLE `socialmediaaccounts`
  ADD PRIMARY KEY (`USER_ID`,`SOCIAL_MEDIA_ID`),
  ADD KEY `FK_IS_ON2` (`SOCIAL_MEDIA_ID`);

--
-- Indexes for table `socialmedias`
--
ALTER TABLE `socialmedias`
  ADD PRIMARY KEY (`SOCIAL_MEDIA_ID`);

--
-- Indexes for table `tagcategories`
--
ALTER TABLE `tagcategories`
  ADD PRIMARY KEY (`TAG_CATEGORY_ID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`TAG_ID`),
  ADD KEY `FK_IS_PART_OF` (`TAG_TAG_CATEGORY_ID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`TICKET_ID`),
  ADD KEY `FK_HANDLES` (`TICKET_ADMIN_ID`),
  ADD KEY `FK_OF_TYPE` (`TICKET_TICKET_TYPE_ID`),
  ADD KEY `FK_OPENS` (`TICKET_USER_ID`);

--
-- Indexes for table `tickettypes`
--
ALTER TABLE `tickettypes`
  ADD PRIMARY KEY (`TICKET_TYPE_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `AK_FULL_NAME` (`USER_FIRST_NAME`,`USER_LAST_NAME`),
  ADD UNIQUE KEY `EMAIL` (`USER_EMAIL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `RATING_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `socialmedias`
--
ALTER TABLE `socialmedias`
  MODIFY `SOCIAL_MEDIA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tagcategories`
--
ALTER TABLE `tagcategories`
  MODIFY `TAG_CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `TAG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `TICKET_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickettypes`
--
ALTER TABLE `tickettypes`
  MODIFY `TICKET_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `FK_HERITAGE_USER` FOREIGN KEY (`ADMIN_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK_CONTAINS` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CONTAINS2` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `categorytagcategories`
--
ALTER TABLE `categorytagcategories`
  ADD CONSTRAINT `FK_PRECISES` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`),
  ADD CONSTRAINT `FK_PRECISES2` FOREIGN KEY (`TAG_CATEGORY_ID`) REFERENCES `tagcategories` (`TAG_CATEGORY_ID`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_INFORMS` FOREIGN KEY (`COMMENT_RATING_ID`) REFERENCES `ratings` (`RATING_ID`) ON DELETE CASCADE;

--
-- Constraints for table `creators`
--
ALTER TABLE `creators`
  ADD CONSTRAINT `FK_HERITAGE_USER2` FOREIGN KEY (`CREATOR_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `FK_FAVORITES` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `FK_FAVORITES2` FOREIGN KEY (`CREATOR_ID`) REFERENCES `creators` (`CREATOR_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_BELONGS_TO` FOREIGN KEY (`PRODUCT_CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`),
  ADD CONSTRAINT `FK_SELLS` FOREIGN KEY (`PRODUCT_CREATOR_ID`) REFERENCES `creators` (`CREATOR_ID`);

--
-- Constraints for table `producttags`
--
ALTER TABLE `producttags`
  ADD CONSTRAINT `FK_DEFINES` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DEFINES2` FOREIGN KEY (`TAG_ID`) REFERENCES `tags` (`TAG_ID`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `FK_GIVES` FOREIGN KEY (`RATING_USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `FK_GRADES` FOREIGN KEY (`RATING_PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_INFORMS2` FOREIGN KEY (`RATING_COMMENT_ID`) REFERENCES `comments` (`COMMENT_ID`) ON DELETE CASCADE;

--
-- Constraints for table `socialmediaaccounts`
--
ALTER TABLE `socialmediaaccounts`
  ADD CONSTRAINT `FK_IS_ON` FOREIGN KEY (`USER_ID`) REFERENCES `creators` (`CREATOR_ID`),
  ADD CONSTRAINT `FK_IS_ON2` FOREIGN KEY (`SOCIAL_MEDIA_ID`) REFERENCES `socialmedias` (`SOCIAL_MEDIA_ID`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `FK_IS_PART_OF` FOREIGN KEY (`TAG_TAG_CATEGORY_ID`) REFERENCES `tagcategories` (`TAG_CATEGORY_ID`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `FK_HANDLES` FOREIGN KEY (`TICKET_ADMIN_ID`) REFERENCES `admins` (`ADMIN_ID`),
  ADD CONSTRAINT `FK_OF_TYPE` FOREIGN KEY (`TICKET_TICKET_TYPE_ID`) REFERENCES `tickettypes` (`TICKET_TYPE_ID`),
  ADD CONSTRAINT `FK_OPENS` FOREIGN KEY (`TICKET_USER_ID`) REFERENCES `users` (`USER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
