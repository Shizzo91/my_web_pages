-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2023 at 08:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Games`
--

-- --------------------------------------------------------

--
-- Table structure for table `ContactInformation`
--

CREATE TABLE `ContactInformation` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'unique id of the contact information',
  `street` varchar(150) NOT NULL COMMENT 'street of the developer studio',
  `city` varchar(100) NOT NULL COMMENT 'city of the developer studio',
  `zip` varchar(5) NOT NULL COMMENT 'zip code of the developer studio',
  `country` varchar(50) NOT NULL COMMENT 'country of the developer studio',
  `email` varchar(75) NOT NULL COMMENT 'email of the developer studio',
  `phone` varchar(25) NOT NULL COMMENT 'phone number of the developer studio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ContactInformation`
--

INSERT INTO `ContactInformation` (`id`, `street`, `city`, `zip`, `country`, `email`, `phone`) VALUES
(1, 'Alte Ixheimerstr. 64', 'Zweibrücken', '66482', 'Deutschland', 'callofdutyinfobase@gmail.com', 'nur auf Anfrage'),
(2, 'Söder Mälarstrand 43', 'Stockholm', '11825', 'Schweden', 'mojang.impressum.germany@minecraft.net', 'nur auf Anfrage'),
(3, 'ul. Jagiellońska 74', 'Warszawa', '03301', 'Polen', 'support.cdprojektred.com', '+48 22 519 69 00'),
(4, '', 'Ōta', '1234', 'Japan', 'nur auf Anfrage', 'nur auf Anfrage'),
(5, '', 'Shinagawa', '1234', 'Japan', 'nur auf Anfrage', 'nur auf Anfrage'),
(6, 'Sheet Street 14-16', 'Windsor', '1234', 'England', 'webportal_eu@konami.com', '+44 (0) 1753-271-888'),
(7, 'Alte Ixheimerstr. 64', 'Zweibrücken', '66482', 'Deutschland', 'destiny2infobase@gmail.com', 'nur auf Anfrage'),
(8, 'Domstraße 17', 'Hamburg', '20095', 'Deutschland', 'nur auf Anfrage', '+49 40 30633702'),
(9, 'Berliner Straße 6', 'Rheinbach', '53359', 'Deutschland', 'la-patches@gandimann.de', 'nur auf Anfrage'),
(10, 'Im Zollhafen 15-17', 'Köln', '50678', 'Deutschland', 'nur auf Anfrage', 'nur auf Anfrage');

-- --------------------------------------------------------

--
-- Table structure for table `DeveloperStudio`
--

CREATE TABLE `DeveloperStudio` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'unique id',
  `name` varchar(200) NOT NULL COMMENT 'name of Developer studio',
  `foundationYear` year(4) NOT NULL COMMENT 'foundation year of Developer studio',
  `story` text NOT NULL COMMENT 'story of Developer studio',
  `contactInformationID` int(10) UNSIGNED NOT NULL COMMENT 'id of the contact information of the developer studio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Developer studio table';

--
-- Dumping data for table `DeveloperStudio`
--

INSERT INTO `DeveloperStudio` (`id`, `name`, `foundationYear`, `story`, `contactInformationID`) VALUES
(1, 'Infinity Ward', 2019, 'Infinity Ward, Inc. ist ein US-amerikanisches Entwicklerstudio für Computerspiele, das insbesondere als Schöpfer der Reihe Call of Duty bekannt ist. Seit 2003 ist das Studio Teil des US-amerikanischen Publishers Activision. ', 1),
(2, 'Mojang Studios', 2009, 'Mojang Studios ist ein schwedisches Entwicklerstudio für Computerspiele mit Sitz in Stockholm. Mojang ist bekannt als Entwickler von Minecraft, dem meistverkauften Computerspiel aller Zeiten. Mojang wurde 2009 als Mojang Specifications von Markus Persson zur weiteren Entwicklung von Minecraft gegründet.', 2),
(3, 'CD PROJEKT RED', 2002, 'Hallo! Wir sind CD PROJEKT RED und wir produzieren Videospiele wie The Witcher, GWENT: The Witcher Card Game, Thronebreaker: The Witcher Tales und Cyberpunk 2077. Wir schätzen den Aufwand, mit dem unsere Community ihre Liebe zu unseren Spielen zeigt, wirklich sehr. Wir haben diese Vorgaben zusammengestellt, um dich dabei zu unterstützen. Sie enthalten auch ein paar rechtliche Sachen (das tut uns leid, aber wir hoffen, dass du verstehst, dass dies zum Schutz unserer Spiele, sowie zu deinem und zu unserem Schutz notwendig ist). Wenn du Fragen hast, erreichst du uns unter legal@cdprojektred.com.', 3),
(4, 'Konami', 1969, 'Konami Holdings Corp ist ein in Japan ansässiges Unternehmen, das Videospielsoftwareprodukte für stationäre und tragbare Konsolen entwickelt, veröffentlicht, vermarktet und vertreibt. Außerdem produziert es Spielautomaten für Casinos und betreibt Health & Fitness Clubs.', 6),
(5, 'Kojima Productions', 2015, 'Kojima Productions ist ein japanisches Entwicklerstudio für Videospiele und verantwortlich für die Produktion einiger führender Serien und Titel des japanischen Spielepublishers Konami. Es entstand 2005 nach einer Konzernrestrukturierung aus dem bereits existierenden Entwicklerteam des namensgebenden Designers Hideo Kojima. Bis 2015 arbeitete das Studio vor allem an Kojimas Hauptwerk, der Action-Spionage-Reihe Metal Gear. 2015 wurden nach einer weiteren Restrukturierung seitens Konami alle Verweise auf Kojima Productions einschließlich des Logos entfernt. Kojima Productions galt trotz fehlender Bestätigung seit der Veröffentlichung von Metal Gear Solid V: The Phantom Pain als aufgelöst. Im Dezember 2015 gründete Hideo Kojima das Entwicklerstudio als unabhängiges Unternehmen neu und kündigte zudem eine Partnerschaft mit Sony Computer Entertainment an', 5),
(6, 'SEGA', 1952, 'K.K. Sega (jap. 株式会社セガ, Kabushiki-gaisha Sega, engl. Sega Corporation – abgeleitet von Service Games, Eigenschreibweise: SEGA) ist ein japanischer Hersteller von Videospielen und Arcade-Automaten sowie ein ehemaliger Hersteller von Spielkonsolen. Segas Hauptsitz befindet sich in Ōta, Tokio, aber die Firma selbst hat noch weitere Sitze in den USA und Europa sowie mehrere Tochtergesellschaften auf mehreren Kontinenten. ', 4),
(7, 'bungie', 1991, 'Bungie, Inc. ist ein US-amerikanisches Entwicklungsstudio für Videospiele, mit Sitz in Bellevue, Washington. Das Unternehmen wurde 1991 unter dem Namen Bungie Software Products Corporation von zwei Studenten an der University of Chicago, Alex Seropian und Jason Jones, gegründet.', 7),
(8, 'Square Enix', 2003, 'Square Enix Holdings Co., Ltd. ist ein japanischer Hersteller von Videospielen und Mangas. Square Enix wurde bekannt durch seine Konsolenrollenspiele, darunter die Serien Final Fantasy, Dragon Quest und Kingdom Hearts', 8),
(9, 'Lucas Arts', 1991, 'Lucasfilm Games, von 1991 bis 2021 LucasArts Entertainment Company LLC ist die Firmenbezeichnung der 1982 von George Lucas gegründeten Tochterfirma der Lucasfilm Ltd.', 9),
(10, 'EA', 1982, 'Electronic Arts ist ein börsennotierter, weltweit operierender Hersteller und Publisher von Computer- und Videospielen. Das Unternehmen wurde vor allem für seine Sportspiele bekannt, publiziert aber auch zahlreiche andere Titel in weiteren Themengebieten.', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE `Games` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'unique id ',
  `title` varchar(200) NOT NULL COMMENT 'title of the game',
  `description` text NOT NULL COMMENT 'description of the game',
  `screenshot` varchar(200) NOT NULL COMMENT 'screenshot of the game',
  `trailer` varchar(200) NOT NULL COMMENT 'trailer of the game',
  `developerStudioID` int(10) UNSIGNED NOT NULL COMMENT 'developer studio of the game'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`id`, `title`, `description`, `screenshot`, `trailer`, `developerStudioID`) VALUES
(1, 'Call of Duty: Modern Warfare', 'Call of Duty: Modern Warfare ist ein Ego-Shooter, der am 25. Oktober 2019 von Activision veröffentlicht wurde. Das Videospiel stellt den 16. Teil der Call-of-Duty-Reihe dar und ist für Windows sowie für die Spielekonsolen Xbox One und PlayStation 4 ', ' https://image.api.playstation.com/cdn/EP0002/CUSA06341_00/XbipTCn6ifEEBaKQAA5uwDWUzyjlw0jT.png', ' https://www.youtube.com/embed/gYYOgMtkVkg', 1),
(2, 'Minecraft', 'Minecraft ist ein Open-World-Spiel. Das Hauptaugenmerk liegt auf der Erkundung und Entdeckung der Welt und sowie dem Bau eigener Gebäude und Vorrichtungen. Der Spieler kann Rohstoffe abbauen („Mine“), diese zu anderen Gegenständen weiterverarbeiten („Craft“) und gegen Monster kämpfen.', 'https://www.wikihow.com/images/thumb/a/ab/Take-a-Screenshot-in-Minecraft-PC-Step-2-Version-2.jpg/v4-460px-Take-a-Screenshot-in-Minecraft-PC-Step-2-Version-2.jpg', 'https://www.youtube.com/embed/MmB9b5njVbA', 2),
(3, 'Cyberpunk 2077', 'Cyberpunk 2077 ist ein Open-World-Action-Rollenspiel des polnischen Entwicklerstudios CD Projekt RED. Es ist am 10. Dezember 2020 für die PlayStation 4, Xbox One, GeForce Now, Google Stadia sowie für Microsoft Windows erschienen. Am 15. Februar 2022 erschien es für PlayStation 5 und Xbox Series.', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1091500/ss_bb1a60b8e5061caef7208369f42c5c9d574c9ac4.1920x1080.jpg?t=1680026109', 'https://www.youtube.com/embed/8X2kIfS6fb8', 3),
(4, 'The Witcher 3: Wild Hunt', 'The Witcher 3: Wild Hunt ist ein Action-Rollenspiel des polnischen Entwicklerstudios CD Projekt RED. Es wurde am 19. Mai 2015 veröffentlicht, als Nachfolger der Spiele The Witcher und The Witcher 2: Assassins of Kings.', 'https://static.kinguin.net/cdn-cgi/image/w=1140,q=80,fit=scale-down,f=auto/media/category/t/h/the-witcher-3-wild-hunt-e3-screenshots-and-artwork-are-impressive-13-1024x576.jpg', 'https://www.youtube.com/embed/tDfa1Qp2SwA', 3),
(5, 'Sonic the Hedgehog', 'Sonic the Hedgehog ist ein 2D-Jump-’n’-Run-Computerspiel, das von Sonic Team entwickelt und von Sega erstmals in Nordamerika am 23. Juni 1991 für das Sega Mega Drive veröffentlicht wurde.', 'https://www.sonicstadium.org/wp-content/uploads/2017/04/sadv1-pre04-895x375.jpg', '', 6),
(6, 'Death Stranding', 'Death Stranding ist ein Videospiel des japanischen Entwicklerstudios Kojima Productions. Das Open-World-Spiel erschien am 8. November 2019 für die PlayStation 4, am 14. Juli 2020 für Microsoft Windows sowie am 24.', 'https://gaming-cdn.com/images/products/10185/616x353/death-stranding-director-s-cut-director-s-cut-pc-spiel-steam-europe-cover.jpg?v=1670574833', 'https://www.youtube.com/embed/ucIw-GlWU1o', 5),
(7, 'Teenage Mutant Ninja Turtles: The Cowabunga Collection', 'Teenage Mutant Ninja Turtles: The Cowabunga Collection ist eine Videospielsammlung, die vom Digital Eclipse entwickelt und von Konami weltweit am 30. August 2022 für Nintendo Switch, PlayStation 4, PlayStation 5, Xbox One, Xbox Series und PC veröffentlicht wurde. ', '', 'https://www.youtube.com/embed/nlaZF5bxc50', 4),
(8, 'Destiny 2', 'Destiny 2 ist ein Mehrspieler-Computerspiel, entwickelt von Bungie und veröffentlicht von Activision. Bungie und Activision wurden im Jahre 2019 unabhängig voneinander. Der Ego-Shooter ist ein reines Onlinespiel und wurde für die PlayStation 4 und die Xbox One am 6. September 2017 veröffentlicht.', '', '', 7),
(9, 'Final Fantasy VII Remake', 'Final Fantasy VII Remake ist ein Action-Rollenspiel aus dem Jahr 2020, das von Square Enix entwickelt und veröffentlicht wurde. Es ist der erste Teil einer geplanten Trilogie von Spielen, die das PlayStation-Spiel Final Fantasy VII von 1997 neu auflegen.', 'https://images.squarespace-cdn.com/content/v1/55ef0e29e4b099e22cdc9eea/1641873886021-QB5FXXYS4ZUYASN8TYWE/ff7remake__2022_01_07_20_13_28_340.jpg', 'https://www.youtube.com/embed/ERgrFVhL-n4', 8),
(10, 'Battlefield 2042', '', 'https://preview.redd.it/a-couple-of-screenshots-from-2042-regardless-of-opinions-on-v0-8g7zon73sjs81.jpg?width=640&crop=smart&auto=webp&s=fccb7b9e7351d571845458876a811329e92962ba', 'https://www.youtube.com/embed/ASzOzrB-a9E', 10);

-- --------------------------------------------------------

--
-- Table structure for table `GamesGenre`
--

CREATE TABLE `GamesGenre` (
  `gameID` int(10) UNSIGNED NOT NULL,
  `genreID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `GamesGenre`
--

INSERT INTO `GamesGenre` (`gameID`, `genreID`) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 12),
(3, 1),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 3),
(4, 5),
(4, 7),
(5, 1),
(5, 2),
(5, 8),
(6, 1),
(6, 2),
(6, 7),
(7, 1),
(7, 2),
(7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `GamesPlatform`
--

CREATE TABLE `GamesPlatform` (
  `gameID` int(10) UNSIGNED NOT NULL,
  `platformID` int(10) UNSIGNED NOT NULL,
  `systemRequirements` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `GamesPlatform`
--

INSERT INTO `GamesPlatform` (`gameID`, `platformID`, `systemRequirements`) VALUES
(1, 4, NULL),
(1, 8, NULL),
(2, 5, 'Prozessor (CPU) Intel Core i5 4690 3.5 GHz, AMD A10 7800 APU 3.5 GHz oder höher\r\nGrafikkarte (GPU): NVIDIA GeForce 700, AMD Radeon RX 200 mit OpenGL 4.5 oder höher\r\nArbeitsspeicher (DDR4 RAM): 8 GB oder höher\r\nDirectX: 11.0\r\nFestplattenspeicher (HDD/SSD): kann variieren, jedoch sollten sicherheitshalber ca. 50 GB frei sein\r\n'),
(2, 6, 'Prozessor (CPU) Intel Core i5 4690 3.5 GHz, AMD A10 7800 APU 3.5 GHz oder höher\r\nGrafikkarte (GPU): NVIDIA GeForce 700, AMD Radeon RX 200 mit OpenGL 4.5 oder höher\r\nArbeitsspeicher (DDR4 RAM): 8 GB oder höher\r\nDirectX: 11.0\r\nFestplattenspeicher (HDD/SSD): kann variieren, jedoch sollten sicherheitshalber ca. 50 GB frei sein'),
(2, 4, 'Prozessor (CPU) Intel Core i5 4690 3.5 GHz, AMD A10 7800 APU 3.5 GHz oder höher\r\nGrafikkarte (GPU): NVIDIA GeForce 700, AMD Radeon RX 200 mit OpenGL 4.5 oder höher\r\nArbeitsspeicher (DDR4 RAM): 8 GB oder höher\r\nDirectX: 11.0\r\nFestplattenspeicher (HDD/SSD): kann variieren, jedoch sollten sicherheitshalber ca. 50 GB frei sein'),
(2, 7, NULL),
(2, 8, NULL),
(2, 9, NULL),
(2, 2, NULL),
(2, 3, NULL),
(2, 10, NULL),
(3, 8, NULL),
(3, 2, NULL),
(3, 3, NULL),
(3, 4, 'CPU: Intel Core i5-3570K or AMD FX-8310.\r\nRAM: 8 GB.\r\nGPU: NVIDIA GeForce GTX 970 or AMD Radeon RX 470.\r\nDX: DirectX 12.\r\nSTO: 70 GB HDD (SSD recommended)\r\nRES: 1080p, GFX Settings: Low, Ray Tracing Off.'),
(4, 8, NULL),
(4, 2, NULL),
(4, 3, NULL),
(4, 10, NULL),
(4, 4, 'CPU: Intel CPU Core i5-2500K 3.3GHz / AMD CPU Phenom II X4 940\r\nRAM: 6 GB RAM\r\nGPU: Nvidia GPU GeForce GTX 660 / AMD GPU Radeon HD 7870\r\nDX: 11\r\nSTO: 35 GB available space'),
(8, 2, NULL),
(8, 8, NULL),
(8, 4, 'CPU: Intel Core i3-3250 3.5 GHz \r\nCPU: AMD FX-4350 4.2 GHz\r\nGPU: Nvidia GeForce GTX 660 2GB \r\nRAM: 6GB'),
(5, 2, NULL),
(5, 9, NULL),
(9, 3, NULL),
(10, 3, NULL),
(7, 2, NULL),
(7, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Unique ID',
  `genre` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'genre name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='List of all game geners';

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`id`, `genre`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(13, 'Battle Royale'),
(3, 'Fighting'),
(4, 'Puzzle'),
(8, 'Racing'),
(7, 'Roleplaying'),
(12, 'Sandbox'),
(6, 'Shooter'),
(5, 'Simulation'),
(10, 'Sports'),
(9, 'Strategy');

-- --------------------------------------------------------

--
-- Table structure for table `Platforms`
--

CREATE TABLE `Platforms` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Unique ID',
  `name` varchar(120) NOT NULL COMMENT 'Name of the platform',
  `releaseDate` date NOT NULL COMMENT 'Release Date of the platform'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='List of all game platforms';

--
-- Dumping data for table `Platforms`
--

INSERT INTO `Platforms` (`id`, `name`, `releaseDate`) VALUES
(1, 'Sony PlayStation 3', '2006-11-11'),
(2, 'Sony PlayStation 4', '2013-11-15'),
(3, 'Sony PlayStation 5', '2020-11-12'),
(4, 'Computer (Windows)', '2015-06-29'),
(5, 'Computer (Linux)', '2004-10-20'),
(6, 'Computer (Mac OS)', '2012-08-13'),
(7, 'Microsoft Xbox 360', '2005-11-22'),
(8, 'Microsoft Xbox X', '2013-11-22'),
(9, 'Nintendo Switch', '2017-03-03'),
(10, 'Steam Deck', '2022-02-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ContactInformation`
--
ALTER TABLE `ContactInformation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DeveloperStudio`
--
ALTER TABLE `DeveloperStudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ContactInformation_DeveloperStudio` (`contactInformationID`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Game_DeveloperStudio` (`developerStudioID`);

--
-- Indexes for table `GamesGenre`
--
ALTER TABLE `GamesGenre`
  ADD UNIQUE KEY `dsfa` (`gameID`,`genreID`),
  ADD KEY `Genre_GenreGame` (`genreID`);

--
-- Indexes for table `GamesPlatform`
--
ALTER TABLE `GamesPlatform`
  ADD KEY `Game_GamePlatform` (`gameID`),
  ADD KEY `Platform_GamePlatform` (`platformID`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Unique name` (`genre`) USING BTREE;

--
-- Indexes for table `Platforms`
--
ALTER TABLE `Platforms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ContactInformation`
--
ALTER TABLE `ContactInformation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unique id of the contact information', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `DeveloperStudio`
--
ALTER TABLE `DeveloperStudio`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unique id', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Games`
--
ALTER TABLE `Games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unique id ', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique ID', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Platforms`
--
ALTER TABLE `Platforms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique ID', AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DeveloperStudio`
--
ALTER TABLE `DeveloperStudio`
  ADD CONSTRAINT `ContactInformation_DeveloperStudio` FOREIGN KEY (`contactInformationID`) REFERENCES `ContactInformation` (`id`);

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Game_DeveloperStudio` FOREIGN KEY (`developerStudioID`) REFERENCES `DeveloperStudio` (`id`);

--
-- Constraints for table `GamesGenre`
--
ALTER TABLE `GamesGenre`
  ADD CONSTRAINT `Game__GenreGame` FOREIGN KEY (`gameID`) REFERENCES `Games` (`id`),
  ADD CONSTRAINT `Genre_GenreGame` FOREIGN KEY (`genreID`) REFERENCES `Genres` (`id`);

--
-- Constraints for table `GamesPlatform`
--
ALTER TABLE `GamesPlatform`
  ADD CONSTRAINT `Game_GamePlatform` FOREIGN KEY (`gameID`) REFERENCES `Games` (`id`),
  ADD CONSTRAINT `Platform_GamePlatform` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
