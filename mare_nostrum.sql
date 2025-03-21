-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 21, 2025 alle 11:45
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mare_nostrum`
--
CREATE DATABASE IF NOT EXISTS `mare_nostrum` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mare_nostrum`;

DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `registra` (`nome` VARCHAR(20), `arrivo` DATE, `pp` DATE, `pe` DATE, `ope` VARCHAR(20))   BEGIN
 INSERT INTO porto(nome_nave, data_arrivo, partenza_prev, partenza_eff, operazione) VALUES (nome, arrivo, pp, pe, ope); 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `carichi`
--

CREATE TABLE `carichi` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `carico_prodotto`
--

CREATE TABLE `carico_prodotto` (
  `id` int(11) NOT NULL,
  `carico` int(11) NOT NULL,
  `prodotto` int(11) NOT NULL,
  `quantità` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `magazzino`
--

CREATE TABLE `magazzino` (
  `prodotto` int(11) NOT NULL,
  `quantità` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `porto`
--

CREATE TABLE `porto` (
  `id` int(11) NOT NULL,
  `nome_nave` varchar(20) NOT NULL,
  `data_arrivo` date NOT NULL,
  `partenza_prev` date NOT NULL,
  `partenza_eff` date NOT NULL,
  `operazione` enum('Carico','Scarico') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `porto`
--

INSERT INTO `porto` (`id`, `nome_nave`, `data_arrivo`, `partenza_prev`, `partenza_eff`, `operazione`) VALUES
(1, 'Topolino', '2025-03-07', '2025-03-21', '2025-03-22', 'Carico');

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL,
  `nome` enum('Banana','Mela','Pera','Arancia','Melograno','Limone','Cipolla','Peperoni','Aglio') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `carichi`
--
ALTER TABLE `carichi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `carico_prodotto`
--
ALTER TABLE `carico_prodotto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carico` (`carico`),
  ADD KEY `prodotto` (`prodotto`);

--
-- Indici per le tabelle `magazzino`
--
ALTER TABLE `magazzino`
  ADD PRIMARY KEY (`prodotto`);

--
-- Indici per le tabelle `porto`
--
ALTER TABLE `porto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_nave` (`nome_nave`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `carichi`
--
ALTER TABLE `carichi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `carico_prodotto`
--
ALTER TABLE `carico_prodotto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `porto`
--
ALTER TABLE `porto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `carico_prodotto`
--
ALTER TABLE `carico_prodotto`
  ADD CONSTRAINT `carico_prodotto_ibfk_1` FOREIGN KEY (`carico`) REFERENCES `carichi` (`id`),
  ADD CONSTRAINT `carico_prodotto_ibfk_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotti` (`id`);

--
-- Limiti per la tabella `magazzino`
--
ALTER TABLE `magazzino`
  ADD CONSTRAINT `magazzino_ibfk_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotti` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
