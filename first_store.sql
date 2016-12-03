-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 03 2016 г., 03:20
-- Версия сервера: 5.7.11
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `first_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(10) unsigned NOT NULL,
  `color_name` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `color_name`) VALUES
(1, 'Dark Gray (темно-серый)'),
(2, 'Light Gray (светло-серый)'),
(3, 'Blue (синий)'),
(4, 'Pink (Розовый)'),
(5, 'Gold (золотой)'),
(6, 'Orange (оранжевый)'),
(7, 'Aqua (морская волна)'),
(8, 'Black (черный)'),
(9, 'Light Blue (голубой)'),
(10, 'Fuchsia (фуксин)'),
(11, 'Gray (серый)'),
(12, 'Green (зеленый)'),
(13, 'Lime (ярко-зеленый)'),
(14, 'Maroon (темно-бордовый)'),
(15, 'Navy (темно-синий)'),
(16, 'Olive (оливковый)'),
(17, 'Purple (фиолетовый)'),
(18, 'Red (красный)'),
(19, 'Silver (серебряный)'),
(20, 'Teal (серо-зеленый)'),
(21, 'White (белый)'),
(22, 'Yellow (желтый)');

-- --------------------------------------------------------

--
-- Структура таблицы `features`
--

CREATE TABLE IF NOT EXISTS `features` (
  `id` int(10) unsigned NOT NULL,
  `features` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float unsigned NOT NULL,
  `description` text,
  `public` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `price`, `description`, `public`) VALUES
(1, 'DYNAUDIO XEO 4', 22502, 'Wireless Active Acoustic Ststem	100W, 45 Hz – 23 kHz, 6.4 kg', 1),
(2, 'DYNAUDIO XEO 6', 3990, 'Wireless Active Acoustic Ststem	150W, 31 Hz – 23 kHz, 14.7 kg\n', 0),
(3, 'CERWIN-VEGA! XLS-215', 2100, 'Dual 15" 3-Way Tower	38 Hz-20 kHz/95,3db/500W\n', 0),
(4, 'testLENOVO', 2500.43, 'blahnblah', 0),
(5, 'testLENOVO', 2500.43, 'blahnblah', 1),
(6, 'testLENOVO', 600.05, 'description23123214', 1),
(7, 'test', 777, 'test2', 1),
(8, 'nokia', 888, 'govno', 1),
(9, 'nokia', 10.22, 'govno', 0),
(10, 'nokia2224', 9.99, '', 0),
(11, 'nokia', 10.22, 'govno', 0),
(12, 'Nokian Hackapelitah 8', 123.99, 'отличные шины', 1),
(13, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(14, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(15, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(16, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(17, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(18, 'Yokohama Geolandar A/T-S G012', 350, 'непоганые шины)))', 1),
(19, 'Nokia2', 9.99, 'based windows phone', 1),
(20, 'xxx', 123, 'вцвцф', 1),
(21, 'hello', 22.22, '', 1),
(22, 'hello', 22.22, '', 1),
(23, 'hello', 22.22, '', 1),
(24, 'hello', 22.22, '', 1),
(25, 'hello', 22.22, '', 1),
(26, 'hello', 22.22, '', 1),
(27, 'hello', 22.22, '', 1),
(28, 'dawdwawww', 123, 'dawdwawwwdwadwqqqaww', 1),
(29, 'dawdwawww', 123, 'dawdwawwwdwadwqqqaww', 1),
(30, 'dwa', 12.22, '111', 1),
(31, 'wwww', 123, '', 0),
(32, 'wawa', 123, '', 0),
(33, 'xxx', 123, '', 0),
(34, 'xxx', 123, '', 0),
(35, 'xxx', 123, '', 0),
(36, 'wwww', 121, '1111', 0),
(37, 'dwadawdwadwadwa', 1111, '', 0),
(38, 'RakaMakaFOO', 288282, 'LSD XTC', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_colors`
--

CREATE TABLE IF NOT EXISTS `goods_colors` (
  `g_id` int(10) unsigned NOT NULL,
  `c_id` int(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_colors`
--

INSERT INTO `goods_colors` (`g_id`, `c_id`) VALUES
(6, 2),
(7, 4),
(6, 22),
(6, 6),
(38, 1),
(38, 2),
(38, 3),
(38, 6),
(38, 7),
(38, 12),
(38, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_features`
--

CREATE TABLE IF NOT EXISTS `goods_features` (
  `g_id` int(10) unsigned NOT NULL,
  `f_id` int(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `login` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `login`) VALUES
(1, 'lol@ua.fm', '123', 'firex'),
(2, 'lol@ua.fm', '1234', 'firex'),
(3, 'lol@ua.fm', '1234', 'firex');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `goods_features`
--
ALTER TABLE `goods_features`
  ADD PRIMARY KEY (`g_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
