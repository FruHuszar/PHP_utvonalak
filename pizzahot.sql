-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Máj 19. 11:11
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Adatbázis: `pizzahot`
--
CREATE DATABASE IF NOT EXISTS `pizzahot` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `pizzahot`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `azon` int(11) NOT NULL AUTO_INCREMENT,
  `jogAzon` int(11) NOT NULL,
  `nev` varchar(32) NOT NULL,
  `email` varchar(150) NOT NULL,
  `jelszo` varchar(32) NOT NULL,
  `bejelentkezett` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`azon`),
  UNIQUE KEY `felhAzon` (`azon`),
  KEY `jogAzon` (`jogAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `felhasznalo`:
--   `jogAzon`
--       `jogosultsag` -> `azon`
--

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`azon`, `jogAzon`, `nev`, `email`, `jelszo`, `bejelentkezett`) VALUES
(1, 1, 'teszt11', 'teszt11@szamalk.hu', '26549e22263d93682083f53dfeaaab4e', 1),
(4, 2, 'teszt22', 'teszt22@szamalk.hu', '89f6b41d27a4b8ae07ca7eae8eaf3ff0', 1),
(5, 2, 'teszt33', 'teszt33@szamalk.hu', '621d0fb23f2597fd462c9250e9cfee07', 1),
(10, 2, 'Haha', 'haha@gmail.com', '4e4d6c332b6fe62a63afe56171fd3725', 0),
(13, 3, 'Zoli', 'zoli@gmail.com', 'dd71d14c9212c3108b642d0e9f3d1883', 1),
(14, 2, 'Peti', 'peti@gmail.com', 'ee465671cf0cf54ee42b2bbefce03f54', 0),
(17, 2, 'tesztuser', 'tesztuser@tesztuser.hu', '0ecdad9dbc273bbc32c4cea7ac7263fb', 0),
(18, 1, 'Balázs', 'balazs@teszt.hu', 'a5155dc8f88bcdd33b061c3d00f028d4', 1),
(19, 2, 'asd', 'asd@asd.asd', '7815696ecbf1c96e6894b779456d330e', 0),
(20, 2, 'teszt23', 'teszt23@teszt23.hu', '92bbe40ea6784df27cd8165a9f843734', 0),
(21, 2, 'Bori', 'bori@teszt.hu', '1f96aa515af2086fa01e7d85c906679b', 0),
(22, 2, 'Dominika', 'domi@teszt.hu', '9aa88ba44887012a38d3c68e8427179d', 0),
(23, 2, 'András', 'andras@teszt.hu', 'bfc6e985f34ca240d81de1fc8fd99583', 0),
(24, 2, 'zzzzz', 'zzzz@ttt.hu', '95ebc3c7b3b9f1d2c40fec14415d3cb8', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jogosultsag`
--

DROP TABLE IF EXISTS `jogosultsag`;
CREATE TABLE IF NOT EXISTS `jogosultsag` (
  `azon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(32) NOT NULL,
  PRIMARY KEY (`azon`),
  UNIQUE KEY `jogAzon` (`azon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `jogosultsag`:
--

--
-- A tábla adatainak kiíratása `jogosultsag`
--

INSERT INTO `jogosultsag` (`azon`, `nev`) VALUES
(1, 'admin'),
(2, 'felhasznalo'),
(3, 'keszito');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE IF NOT EXISTS `kategoria` (
  `azon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(32) NOT NULL,
  `ar` int(11) NOT NULL DEFAULT 1000,
  PRIMARY KEY (`azon`),
  UNIQUE KEY `nev` (`nev`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `kategoria`:
--

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`azon`, `nev`, `ar`) VALUES
(1, 'ital', 500),
(2, 'kicsike', 2200),
(3, 'alkohol2', 2200),
(4, 'nagy66', 1222),
(77, 'alkohol', 1000),
(116, 'nagysali', 200),
(121, 'der', 1200),
(123, 'der2', 1200),
(124, 'fuzetea', 450),
(125, 'ital656', 500),
(126, 'ital23', 500),
(128, 'ital3', 500),
(132, 'itakkl3', 500);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

DROP TABLE IF EXISTS `rendeles`;
CREATE TABLE IF NOT EXISTS `rendeles` (
  `azon` int(11) NOT NULL AUTO_INCREMENT,
  `termekAzon` int(11) NOT NULL,
  `felhAzon` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  PRIMARY KEY (`azon`),
  KEY `pizzaAzon` (`termekAzon`),
  KEY `felhAzon` (`felhAzon`),
  KEY `termekAzon` (`termekAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `rendeles`:
--   `termekAzon`
--       `termek` -> `azon`
--   `felhAzon`
--       `felhasznalo` -> `azon`
--

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`azon`, `termekAzon`, `felhAzon`, `mennyiseg`) VALUES
(1, 2, 5, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

DROP TABLE IF EXISTS `termek`;
CREATE TABLE IF NOT EXISTS `termek` (
  `azon` int(11) NOT NULL AUTO_INCREMENT,
  `kategoria` int(11) NOT NULL,
  `keszito` int(11) DEFAULT NULL,
  `leiras` varchar(150) NOT NULL,
  PRIMARY KEY (`azon`),
  KEY `kategoria` (`kategoria`),
  KEY `keszito` (`keszito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `termek`:
--   `kategoria`
--       `kategoria` -> `azon`
--   `keszito`
--       `felhasznalo` -> `azon`
--

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`azon`, `kategoria`, `keszito`, `leiras`) VALUES
(1, 1, NULL, 'Coca-Cola'),
(2, 2, NULL, 'Nestea - barack'),
(3, 1, NULL, 'Cappy'),
(4, 3, 13, 'Margaréta');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD CONSTRAINT `felhasznalo_ibfk_1` FOREIGN KEY (`jogAzon`) REFERENCES `jogosultsag` (`azon`);

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`termekAzon`) REFERENCES `termek` (`azon`),
  ADD CONSTRAINT `rendeles_ibfk_2` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`azon`);

--
-- Megkötések a táblához `termek`
--
ALTER TABLE `termek`
  ADD CONSTRAINT `termek_ibfk_1` FOREIGN KEY (`kategoria`) REFERENCES `kategoria` (`azon`),
  ADD CONSTRAINT `termek_ibfk_2` FOREIGN KEY (`keszito`) REFERENCES `felhasznalo` (`azon`);
COMMIT;
