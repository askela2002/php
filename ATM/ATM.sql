-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Сер 01 2019 р., 12:45
-- Версія сервера: 5.6.38
-- Версія PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `ATM`
--

-- --------------------------------------------------------

--
-- Структура таблиці `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `balance`, `currency_id`) VALUES
(8, 0, 1500, 1),
(9, 0, 500, 0),
(11, 0, 10000, 2),
(12, 1, 430, 1),
(13, 1, 5200, 0),
(15, 1, 638, 2),
(16, 2, 999, 1),
(17, 2, 1200, 2),
(18, 2, 560, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `amounts`
--

CREATE TABLE `amounts` (
  `id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `amounts`
--

INSERT INTO `amounts` (`id`, `cashbox_id`, `value`, `quantity`) VALUES
(1, 1, 500, 10),
(2, 1, 200, 30),
(3, 1, 100, 50),
(4, 1, 50, 1000),
(5, 1, 10, 5000),
(7, 2, 500, 10),
(8, 2, 50, 20),
(9, 2, 10, 100),
(10, 6, 500, 200),
(11, 6, 200, 5000),
(12, 6, 10, 1000);

-- --------------------------------------------------------

--
-- Структура таблиці `cashboxes`
--

CREATE TABLE `cashboxes` (
  `id` int(11) NOT NULL,
  `city` varchar(30) COLLATE utf8_unicode_520_ci NOT NULL,
  `model` varchar(10) COLLATE utf8_unicode_520_ci NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `cashboxes`
--

INSERT INTO `cashboxes` (`id`, `city`, `model`, `currency_id`) VALUES
(1, 'Poltava', 'ATM-0', 1),
(2, 'Poltava', 'ATM-1', 2),
(3, 'Poltava', 'ATM-0', 0),
(4, 'Kyiv', 'ATM-0', 1),
(5, 'Kyiv', 'ATM-2', 0),
(6, 'Kyiv', 'ATM-2', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `sign` varchar(5) COLLATE utf8_unicode_520_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `currencies`
--

INSERT INTO `currencies` (`id`, `sign`, `name`) VALUES
(0, '₴', 'Ukrainian hryvnias'),
(1, '$', 'US dollars'),
(2, '€', 'Euros');

-- --------------------------------------------------------

--
-- Структура таблиці `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `logs`
--

INSERT INTO `logs` (`id`, `date`, `cashbox_id`, `account_id`, `amount`) VALUES
(1, '2019-08-01 10:00:00', 1, 8, 100),
(2, '2019-08-02 13:00:00', 2, 12, 500),
(3, '2019-07-15 00:00:00', 4, 15, 1000),
(4, '2019-07-16 00:00:00', 5, 16, 10),
(5, '2019-07-15 00:00:00', 6, 13, 250),
(6, '2019-07-14 00:00:00', 6, 9, 350),
(7, '2019-07-09 00:00:00', 2, 12, 1000),
(8, '2019-07-17 00:00:00', 3, 15, 900),
(9, '2019-07-09 00:00:00', 6, 17, 150),
(10, '2019-07-11 00:00:00', 5, 12, 150),
(11, '2019-07-15 00:00:00', 5, 11, 550),
(12, '2019-07-21 00:00:00', 5, 15, 500),
(13, '2019-07-18 00:00:00', 2, 16, 600),
(14, '2019-07-09 00:00:00', 1, 9, 160),
(15, '2019-07-15 00:00:00', 3, 17, 1000);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_520_ci NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `name`, `age`) VALUES
(0, 'Salma', 52),
(1, 'Monica', 54),
(2, 'Tom', 63),
(3, 'Keanu', 54),
(4, 'Sebastian', 32),
(5, 'Eddie', 53),
(6, 'Jennifer', 28);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_currency_id` (`user_id`,`currency_id`) USING BTREE,
  ADD KEY `currency_id` (`currency_id`);

--
-- Індекси таблиці `amounts`
--
ALTER TABLE `amounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cashbox_id_value` (`cashbox_id`,`value`);

--
-- Індекси таблиці `cashboxes`
--
ALTER TABLE `cashboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Індекси таблиці `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sign` (`sign`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Індекси таблиці `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `cashbox_id` (`cashbox_id`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблиці `amounts`
--
ALTER TABLE `amounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `cashboxes`
--
ALTER TABLE `cashboxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `amounts`
--
ALTER TABLE `amounts`
  ADD CONSTRAINT `amounts_ibfk_1` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `cashboxes`
--
ALTER TABLE `cashboxes`
  ADD CONSTRAINT `cashboxes_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `logs_ibfk_3` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
