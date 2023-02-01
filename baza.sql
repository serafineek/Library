-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Gru 2021, 16:44
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `biblioteka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(26) COLLATE utf16_polish_ci NOT NULL,
  `nazwisko` varchar(26) COLLATE utf16_polish_ci NOT NULL,
  `login` varchar(15) COLLATE utf16_polish_ci NOT NULL,
  `password` varchar(12) COLLATE utf16_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `login`, `password`) VALUES
(1, 'mateusz', 'serafin', 'matser1', '1234');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id` int(11) NOT NULL,
  `tytul` varchar(40) COLLATE utf16_polish_ci NOT NULL,
  `autor` varchar(35) COLLATE utf16_polish_ci NOT NULL,
  `typ` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id`, `tytul`, `autor`, `typ`, `ilosc`) VALUES
(1, 'Pan Tadeusz', 'Adam Mickiewicz', 1, 0),
(2, 'Balladyna', 'Juliusz Słowacki', 2, 1),
(3, 'Pieśń nad pieśniami', 'Salomon', 3, 0),
(4, 'Odyseja', 'Homer', 1, 1),
(5, 'Na lipę', 'Jan Kochanowski', 3, 0),
(6, 'Antygona', 'Sofokles', 2, 0),
(7, 'Zemsta', 'Aleksander Fredro', 2, 0),
(8, 'Opowieść wigilijna', 'Charles Dickens', 1, 5),
(9, 'Smutno mi, Boże!', 'Juliusz Słowacki', 3, 1),
(10, 'Krzyżacy', 'Henryk Sienkiewicz', 1, 3),
(11, 'W pustyni i w puszczy', 'Henryk Sienkiewicz', 1, 7),
(12, 'Ogniem i mieczem', 'Henryk Sienkiewicz', 1, 2),
(13, 'Potop', 'Henryk Sienkiewicz', 1, 5),
(14, 'Quo vadis', 'Henryk Sienkiewicz', 1, 0),
(15, 'Pan Wołodyjowski', 'Henryk Sienkiewicz', 1, 1),
(16, 'Kordian', 'Juliusz Słowacki', 2, 0),
(17, 'Nie-Boska komedia ', 'Zygmunt Krasiński', 2, 5),
(18, 'Wesele', 'Stanisława Wyspiański', 2, 3),
(19, 'Niebo', 'Wisława Szymborska', 3, 5),
(20, 'Reduta Ordona', 'Adam Mickiewicz', 3, 3),
(21, 'Na Wieży Babel', 'Wisława Szymborska', 3, 9),
(22, 'List do ludożerców', 'Tadeusz Różewicz', 3, 15),
(23, 'O żywocie ludzkim', 'Jan Kochanowski', 3, 1),
(24, 'Kamienie na szaniec', 'Aleksander Kamiński', 2, 4),
(25, 'Bogurodzica', 'autor nieznany', 3, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id_klienci` int(11) NOT NULL,
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(40) COLLATE utf16_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_klienci`, `id_ksiazki`, `tytul`) VALUES
(1, 8, 'Opowieść wigilijna'),
(1, 17, 'Nie-Boska komedia '),
(1, 21, 'Na Wieży Babel');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `login_2` (`login`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD KEY `id_klienci` (`id_klienci`),
  ADD KEY `id_ksiazki` (`id_ksiazki`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`id_klienci`) REFERENCES `klienci` (`id`),
  ADD CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
