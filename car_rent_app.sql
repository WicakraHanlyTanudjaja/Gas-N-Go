-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jan 2023 pada 11.17
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car rent app`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser` (IN `ID1` INT(11), IN `Plat_Mobil1` VARCHAR(250), IN `ID_Supir1` INT(11))   BEGIN
    UPDATE data_mobil
	SET Avaiability = 'Avaiable'
	WHERE Plat_Mobil = Plat_Mobil1;
    
    UPDATE data_supir
	SET Avaiability = 'Avaiable'
	WHERE ID_Supir = ID_Supir1;
    
    DELETE FROM data_user
	WHERE ID = ID1;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUserNoDriver` (IN `ID1` INT, IN `Plat_Mobil1` INT)   BEGIN
    UPDATE data_mobil
	SET Avaiability = 'Avaiable'
	WHERE Plat_Mobil = Plat_Mobil1;
    
    DELETE FROM data_user
	WHERE ID = ID1;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTest` (IN `Plat_Mobil1` VARCHAR(250), IN `ID1` INT(11), IN `Durasi1` INT(11), IN `ID_Supir1` INT(11), IN `KSupir1` VARCHAR(250), IN `NSIM` VARCHAR(250))   BEGIN
    UPDATE data_mobil
	SET Avaiability = 'Not Avaiable'
	WHERE Plat_Mobil = Plat_Mobil1;
    
    UPDATE data_supir
	SET Avaiability = 'Not Avaiable'
	WHERE ID_Supir = ID_Supir1;
    
    UPDATE data_user
	SET `Ketersediaan Supir` = KSupir1,
    	`Nomor SIM` = NSIM,
        `Plat_Mobil` = Plat_Mobil1,
        Durasi = Durasi1,
        ID_Supir = ID_Supir1
	WHERE ID = ID1;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mobil`
--

CREATE TABLE `data_mobil` (
  `Class` varchar(250) NOT NULL,
  `Price` int(11) NOT NULL,
  `Plat_Mobil` varchar(255) NOT NULL,
  `Availabillity` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_mobil`
--

INSERT INTO `data_mobil` (`Class`, `Price`, `Plat_Mobil`, `Availabillity`) VALUES
('-', 0, '-', 'Avaiable'),
('Alphard', 2200000, 'B 1009 CS', 'Not Avaiable'),
('Brio', 300000, 'B 1267 GD', 'Not Avaiable'),
('Innova', 500000, 'B 2931 OI', 'Avaiable'),
('Brio', 300000, 'B 3294 OS', 'Not Avaiable'),
('Alphard', 2200000, 'B 6432 UF', 'Not Avaiable'),
('Alphard', 500000, 'B 6872 OG', 'Avaiable'),
('Innova', 500000, 'B 7312 ST', 'Not Avaiable'),
('Brio', 300000, 'B 7983 YS', 'Avaiable'),
('Brio', 300000, 'B 8742 JD', 'Avaiable'),
('Alphard', 2200000, 'B 8932 ID', 'Avaiable'),
('Innova', 500000, 'B 9273 CS', 'Not Avaiable'),
('Innova', 500000, 'DB 1037 UH', 'Avaiable'),
('Innova', 500000, 'DB 1673 KJ', 'Avaiable'),
('Alphard', 2200000, 'DB 2731 OF', 'Avaiable'),
('Brio', 300000, 'DB 2838 DJ', 'Avaiable');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_supir`
--

CREATE TABLE `data_supir` (
  `Nama_Supir` varchar(250) NOT NULL,
  `ID_Supir` int(11) NOT NULL,
  `Availabillity` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_supir`
--

INSERT INTO `data_supir` (`Nama_Supir`, `ID_Supir`, `Availabillity`) VALUES
('-', 0, 'Avaiable'),
('Agus', 1, 'Not Avaiable'),
('Brandon', 2, 'Avaiable'),
('Alvin', 3, 'Not Avaiable'),
('Aldo', 4, 'Avaiable'),
('Kenneth', 5, 'Not Avaiable'),
('Benny', 6, 'Avaiable'),
('Jimmy', 7, 'Not Avaiable'),
('Timmy', 8, 'Avaiable'),
('Daniel', 9, 'Avaiable');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_user`
--

CREATE TABLE `data_user` (
  `ID` int(11) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Nama` varchar(250) NOT NULL,
  `Umur` int(11) NOT NULL,
  `Nomor KTP` varchar(250) NOT NULL,
  `Ketersediaan Supir` varchar(250) NOT NULL,
  `Nomor SIM` varchar(250) NOT NULL,
  `Durasi` int(11) NOT NULL,
  `ID_Supir` int(11) DEFAULT NULL,
  `Plat_Mobil` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_user`
--

INSERT INTO `data_user` (`ID`, `Username`, `Password`, `Nama`, `Umur`, `Nomor KTP`, `Ketersediaan Supir`, `Nomor SIM`, `Durasi`, `ID_Supir`, `Plat_Mobil`) VALUES
(1, 'Andi01', 'andi01', 'Andi', 18, '7000928813720003', 'Ya', '-', 12, 1, 'B 1009 CS'),
(2, 'Budi01', 'budi01', 'Budi', 25, '7000669238630005', 'Tidak', '-', 24, 0, 'B 1267 GD'),
(3, 'Char01', 'c', 'Charles', 20, '7000126676402973', 'Ya', '-', 12, 3, 'B 6432 UF'),
(4, 'stefan123', 's', 'Stefan Bondito', 19, '7000718218728174', 'Ya', '-', 12, 5, 'B 3294 OS'),
(5, 'Vicken2.10.0', 'augg', 'Vicken Manginsela', 20, '7000273268181036', 'Tidak', '281839734', 24, 0, 'B 7312 ST'),
(6, 'Abam', 'bolabulu', 'Abraham Kussoy', 14, '7000317862461827', 'Tidak', '', 12, 0, 'B 9273 CS'),
(7, 'audreyksy', 'manamana', 'Audrey Kussoy', 19, '7000127534137163', '', '', 0, 0, '-'),
(8, 'Test', '123', 'Tester', 18, '7000627153781726', '', '', 0, 0, '-'),
(9, 'Leo', 'leo', 'Leonardo', 30, '7000917396732837', '', '', 0, 0, '-'),
(10, 'George1', '1', 'George', 19, '7000678173627839', '', '', 0, 0, '-'),
(11, 'hapus', '1', 'hapus', 20, 'we8912983981273', '', '', 12, 0, '-');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_mobil`
--
ALTER TABLE `data_mobil`
  ADD PRIMARY KEY (`Plat_Mobil`),
  ADD KEY `Plat_Mobil_2` (`Plat_Mobil`),
  ADD KEY `Plat_Mobil_3` (`Plat_Mobil`),
  ADD KEY `Plat_Mobil` (`Plat_Mobil`);

--
-- Indeks untuk tabel `data_supir`
--
ALTER TABLE `data_supir`
  ADD PRIMARY KEY (`ID_Supir`);

--
-- Indeks untuk tabel `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Supir` (`ID_Supir`),
  ADD KEY `Plat_Mobil` (`Plat_Mobil`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_user`
--
ALTER TABLE `data_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_user`
--
ALTER TABLE `data_user`
  ADD CONSTRAINT `data_user_ibfk_1` FOREIGN KEY (`ID_Supir`) REFERENCES `data_supir` (`ID_Supir`),
  ADD CONSTRAINT `data_user_ibfk_2` FOREIGN KEY (`Plat_Mobil`) REFERENCES `data_mobil` (`Plat_Mobil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
