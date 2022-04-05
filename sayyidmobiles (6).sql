-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 05 2022 г., 09:23
-- Версия сервера: 8.0.27
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sayyidmobiles`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ALCATEL', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(2, 'ARTEL', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(3, 'CDMA', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(4, 'INOI', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(5, 'IPHONE', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(6, 'KGTEL', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(7, 'MAXVI', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(8, 'NOBBY', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(9, 'NOKIA', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(10, 'SAMSUNG', '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(11, 'XIAOMI', '2022-04-04 06:52:54', '2022-04-04 06:52:54');

-- --------------------------------------------------------

--
-- Структура таблицы `cashboxes`
--

DROP TABLE IF EXISTS `cashboxes`;
CREATE TABLE IF NOT EXISTS `cashboxes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `income` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `expend` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `submitted` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `residue` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `kod` int DEFAULT NULL,
  `region` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `main_currency_id` int DEFAULT NULL,
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `phone`, `kod`, `region`, `address`, `main_currency_id`, `second_currency_id`, `stock_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tayla Lane', '+998 00 000-00-00', 2, '2', 'Узбекистан, Ташкент, Олмазорский район, жилой комплекс Olmazor Business City', 1, '2|3', 2, NULL, '2022-04-04 07:25:55', '2022-04-04 07:25:55');

-- --------------------------------------------------------

--
-- Структура таблицы `client_operations`
--

DROP TABLE IF EXISTS `client_operations`;
CREATE TABLE IF NOT EXISTS `client_operations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `client_payment_id` int DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `sum_currency_id` int DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_operations_invoice_id_foreign` (`invoice_id`),
  KEY `client_operations_client_id_foreign` (`client_id`),
  KEY `client_operations_client_payment_id_foreign` (`client_payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `client_operations`
--

INSERT INTO `client_operations` (`id`, `invoice_id`, `client_id`, `client_payment_id`, `date`, `operation`, `type`, `sum_currency_id`, `sum_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2022-04-04', 'Mahsulot(kirim)', 1, NULL, 1, '2022-04-04 07:26:23', '2022-04-04 07:26:23'),
(2, 2, 1, NULL, '2022-04-05', 'Mahsulot(chiqim)', -1, 1, 16, '2022-04-05 08:11:43', '2022-04-05 08:11:43');

-- --------------------------------------------------------

--
-- Структура таблицы `client_payments`
--

DROP TABLE IF EXISTS `client_payments`;
CREATE TABLE IF NOT EXISTS `client_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_payments_stock_id_foreign` (`stock_id`),
  KEY `client_payments_client_id_foreign` (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `converts`
--

DROP TABLE IF EXISTS `converts`;
CREATE TABLE IF NOT EXISTS `converts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `currency_from` int DEFAULT NULL,
  `currency_to` int DEFAULT NULL,
  `currency` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_val` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_val` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `currency`, `rate`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'USD', '1', '$', '2022-04-04 06:16:23', '2022-04-04 06:16:23'),
(2, 'UZS', '11050', 'sum', '2022-04-04 06:16:50', '2022-04-04 06:16:50'),
(3, 'EUR', '0.89', '€', '2022-04-04 06:17:20', '2022-04-04 06:17:20');

-- --------------------------------------------------------

--
-- Структура таблицы `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int DEFAULT NULL,
  `main_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `main_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `expenses`
--

INSERT INTO `expenses` (`id`, `invoice_id`, `name`, `type`, `note`, `expense`, `mark_id`, `main_currency_id`, `main_currency_pay`, `main_currency_rate`, `created_at`, `updated_at`) VALUES
(4, 1, 'Umumiy', '1', NULL, NULL, '43', 1, '20', '1', '2022-04-04 07:29:27', '2022-04-04 07:29:27');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_stock_id_foreign` (`stock_id`),
  KEY `invoices_client_id_foreign` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `invoices`
--

INSERT INTO `invoices` (`id`, `stock_id`, `client_id`, `name`, `type`, `sum_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'CyM1i0QaEE', 4, 1, '2022-04-04', '2022-04-04 07:26:23', '2022-04-04 07:26:23'),
(2, 2, 1, 'tzKkM2us21', 1, 16, '2022-04-05', '2022-04-05 08:11:43', '2022-04-05 08:11:43');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marks_type_id_foreign` (`type_id`),
  KEY `marks_brand_id_foreign` (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`id`, `type_id`, `brand_id`, `name`, `version`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '4009', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(2, 1, 2, 'M5', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(3, 1, 2, 'V5', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(4, 1, 2, 'X3', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(5, 1, 3, 'Gusto 1', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(6, 1, 4, 'S1272 Black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(7, 1, 4, 'inoi 103 bk', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(8, 1, 4, 'inoi 101 black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(9, 1, 4, 'inoi 244 blue', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(10, 1, 4, 'inoi 247 black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(11, 1, 4, 'Inoi 118 red', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(12, 1, 4, 'inoi 242 blue', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(13, 1, 5, 'I Phone 13 Pro Max 128GB Gold VCA', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(14, 1, 6, 'C3592 silver', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(15, 1, 6, 'M370 blue', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(16, 1, 7, 'E1', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(17, 1, 8, 'nobby 230 black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(18, 1, 9, 'N105 black 2 sim G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(19, 1, 9, 'N125 black G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(20, 1, 9, 'N150 bk New G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(21, 1, 9, 'N210 black G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(22, 1, 9, 'N216 black G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(23, 1, 9, 'N220 black G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(24, 1, 9, 'N2720 black G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(25, 1, 9, 'N3310 BLUE 2 SIM G', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(26, 1, 9, 'SICCO S6700 BK', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(27, 1, 9, 'Sicco S1272 black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(28, 1, 9, 'Sicco S1276', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(29, 1, 9, 'Sicco S1277', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(30, 1, 9, 'N130 DS black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(31, 1, 9, 'N215 DS black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(32, 1, 9, 'N6300 DS black', '-', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(33, 1, 10, 'A032 32gb black', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(34, 1, 10, 'A032 32gb blue', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(35, 1, 10, 'A035 32gb black', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(36, 1, 10, 'A035 32gb blue', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(37, 1, 10, 'A035 32gb red', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(38, 1, 10, 'A035 64gb red', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(39, 1, 10, 'A037 32gb black', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(40, 1, 10, 'A037 32gb white', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(41, 1, 10, 'A037 64gb black', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(42, 1, 10, 'A037 64gb black oylik', 'Oylik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(43, 1, 10, 'A127 32 blue + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(44, 1, 10, 'A127 32 red + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(45, 1, 10, 'A127 64 black + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(46, 1, 10, 'A127 64 black + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(47, 1, 10, 'A127 64 blue + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(48, 1, 10, 'A127 64 red + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:53', '2022-04-04 06:52:53'),
(49, 1, 10, 'M127 32gb black', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(50, 1, 10, 'M127 32gb blue', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(51, 1, 10, 'M127 32gb green', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(52, 1, 10, 'M325 6+128gb black arabic', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(53, 1, 10, 'A022 black', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(54, 1, 10, 'A022 blue', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(55, 1, 10, 'A022 red', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(56, 1, 10, 'A127 4+128gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(57, 1, 10, 'A127 4+128gb blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(58, 1, 10, 'A127 4+64gb black oylik', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(59, 1, 10, 'A127 4+64gb blue oylik', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(60, 1, 10, 'A127 4+64gb white oylik', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(61, 1, 10, 'A127 64 black yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(62, 1, 10, 'A127 64 blue yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(63, 1, 10, 'A127 64 red yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(64, 1, 10, 'A225 4+128gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(65, 1, 10, 'A225 4+128gb green', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(66, 1, 10, 'A225 4+128gb white', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(67, 1, 10, 'A225 64gb green', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(68, 1, 10, 'A225 64gb white', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(69, 1, 10, 'A225 64gb violet', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(70, 1, 10, 'A226 5G 128gb Gray Arabic', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(71, 1, 10, 'A226 5G 64gb Mint Arabic', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(72, 1, 10, 'A226 5G 64gb White Arabic', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(73, 1, 10, 'A325 4+128gb blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(74, 1, 10, 'A325 6+128gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(75, 1, 10, 'A325 6+128gb blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(76, 1, 10, 'A325 6+128gb violet', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(77, 1, 10, 'A325 6+128gb white', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(78, 1, 10, 'A325 64gb Black yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(79, 1, 10, 'A325 64gb Blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(80, 1, 10, 'A325 64gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(81, 1, 10, 'A525 4+128gb Blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(82, 1, 10, 'A525 4+128gb Violet', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(83, 1, 10, 'A525 4+128gb White', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(84, 1, 10, 'A525 4+128gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(85, 1, 10, 'A525 4+128gb black yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(86, 1, 10, 'A525 4+128gb blue yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(87, 1, 10, 'A525 4+128gb violet yillik', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(88, 1, 10, 'A525 6+128gb Blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(89, 1, 10, 'A525 8+128gb Black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(90, 1, 10, 'A525 8+256gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(91, 1, 10, 'A525 8+256gb blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(92, 1, 10, 'G780 (S20 FE) 8+128gb blue Arabic', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(93, 1, 10, 'G990 (S21 FE) 5G 6+128gb Graphite', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(94, 1, 10, 'G990 (S21 FE) 5G 8+128gb Graphite', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(95, 1, 10, 'G990 (S21 FE) 5G 8+256gb Graphite', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(96, 1, 10, 'M12 4+64gb black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(97, 1, 10, 'M12 4+64gb blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(98, 1, 10, 'M12 4+64gb white Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(99, 1, 10, 'M12 6+128gb black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(100, 1, 10, 'M21 4+64gb black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(101, 1, 10, 'M21 4+64gb blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(102, 1, 10, 'M21 6+128gb blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(103, 1, 10, 'M225 4+128gb black Arabic', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(104, 1, 10, 'M225 4+128gb white Arabic', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(105, 1, 10, 'M325 6+128GB 5G black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(106, 1, 10, 'M325 6+128GB 5G blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(107, 1, 10, 'M325 6+128gb black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(108, 1, 10, 'M325 6+128gb blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(109, 1, 10, 'M526 8+128gb 5G Black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(110, 1, 10, 'M526 8+128gb 5G Blue Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(111, 1, 10, 'T225 Tab A7 lite 32gb gray yillik', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(112, 1, 10, 'T225 Tab A7 lite 32gb silver yillik', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(113, 1, 11, 'Mi 11 Lite 8+128GB Blue Indonesia', 'INDZ', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(114, 1, 11, 'Note 10 4+64GB Green Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(115, 1, 11, 'Note 10 Pro 8+256gb 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(116, 1, 11, 'Redmi 10 4+128gb blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(117, 1, 11, 'Redmi 10 4+64 blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(118, 1, 11, 'Redmi 10 4+64 gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(119, 1, 11, 'Redmi 9C 4+128gb gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(120, 1, 11, 'Mi 11 Lite 6+128GB 5G Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(121, 1, 11, 'Mi 11 Lite 8+128GB 5G Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(122, 1, 11, 'Mi 11 Lite NE 6+128GB 5G Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(123, 1, 11, 'Mi 11 lite NE/8+128GB 5G Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(124, 1, 11, 'Mi 11 lite NE/8+128GB 5G Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(125, 1, 11, 'Mi 11 lite NE/8+128GB 5G Green EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(126, 1, 11, 'Mi 11 lite NE/8+128GB 5G Pink EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(127, 1, 11, 'Mi 11T 8+128GB 5G white EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(128, 1, 11, 'Mi 12X 5G 8+128G Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(129, 1, 11, 'Mi 12X 5G 8+128G Purple EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(130, 1, 11, 'Mi 12X 5G 8+256G Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(131, 1, 11, 'Mi 12X 5G 8+256G Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(132, 1, 11, 'Note 10 4+128GB 5G Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(133, 1, 11, 'Note 10 4+128GB 5G Gray CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(134, 1, 11, 'Note 10 4+128GB 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(135, 1, 11, 'Note 10 4+128GB 5G Silver CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(136, 1, 11, 'Note 10 4+64GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(137, 1, 11, 'Note 10 6+128GB 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(138, 1, 11, 'Note 10 6+128GB 5G Grey CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(139, 1, 11, 'Note 10 8+128GB 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(140, 1, 11, 'Note 10 8+128GB 5G Grey CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(141, 1, 11, 'Note 10 8+256GB 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(142, 1, 11, 'Note 10 8+256GB 5G Grey CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(143, 1, 11, 'Note 10 8+256GB 5G Silver CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(144, 1, 11, 'Note 10 Pro 6+128gb Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(145, 1, 11, 'Note 10 Pro 6+128gb Black Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(146, 1, 11, 'Note 10 Pro 6+128gb Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(147, 1, 11, 'Note 10 Pro 6+128gb Bronze Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(148, 1, 11, 'Note 10 Pro 6+128gb Dark Nebula Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(149, 1, 11, 'Note 10 Pro 6+128gb Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(150, 1, 11, 'Note 10 Pro 6+128gb Grey CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(151, 1, 11, 'Note 10 Pro 6+64gb EU black', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(152, 1, 11, 'Note 10 Pro 8+128GB 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(153, 1, 11, 'Note 10 Pro 8+128gb Black Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(154, 1, 11, 'Note 10 Pro 8+128gb Bronze Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(155, 1, 11, 'Note 10 Pro 8+128gb Dark Nebula Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(156, 1, 11, 'Note 10 Pro 8+128gb Gray Indonesia', 'INDZ', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(157, 1, 11, 'Note 10 pro 8+128gb EU Blue', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(158, 1, 11, 'Note 10 pro 8+128gb EU Bronze', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(159, 1, 11, 'Note 10 pro 8+128gb EU Gray', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(160, 1, 11, 'Note 10S 6+128GB Black Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(161, 1, 11, 'Note 10S 6+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(162, 1, 11, 'Note 10S 6+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(163, 1, 11, 'Note 10S 6+128GB White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(164, 1, 11, 'Note 10S 6+64GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(165, 1, 11, 'Note 10S 6+64GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(166, 1, 11, 'Note 10S 6+64GB White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(167, 1, 11, 'Note 10S 8+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(168, 1, 11, 'Note 10T 4+64GB 5G Blue Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(169, 1, 11, 'Note 10T 4+64GB 5G Green Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(170, 1, 11, 'Note 11 4+128GB Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(171, 1, 11, 'Note 11 4+128GB Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(172, 1, 11, 'Note 11 4+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(173, 1, 11, 'Note 11 4+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(174, 1, 11, 'Note 11 4+128GB Star Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(175, 1, 11, 'Note 11 4+128GB White CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(176, 1, 11, 'Note 11 4+64GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(177, 1, 11, 'Note 11 4+64GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(178, 1, 11, 'Note 11 6+128GB Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(179, 1, 11, 'Note 11 6+128GB Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(180, 1, 11, 'Note 11 6+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(181, 1, 11, 'Note 11 6+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(182, 1, 11, 'Note 11 6+128GB White CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(183, 1, 11, 'Note 11 Pro 4G 6+128gb Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(184, 1, 11, 'Note 11 Pro 5G 6+128gb Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(185, 1, 11, 'Note 11 Pro 5G 6+128gb White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(186, 1, 11, 'Note 11 Pro 5G 6+64gb Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(187, 1, 11, 'Note 11 Pro 5G 6+64gb Grey EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(188, 1, 11, 'Note 11 Pro 5G 8+128gb Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(189, 1, 11, 'Note 11 Pro 5G 8+128gb Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(190, 1, 11, 'Note 11 Pro 5G 8+128gb White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(191, 1, 11, 'Note 11 Pro 6+128gb 5G Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(192, 1, 11, 'Note 11 Pro 6+128gb 5G Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(193, 1, 11, 'Note 11 Pro 6+128gb 5G Purple CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(194, 1, 11, 'Note 11 Pro 8+128gb Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(195, 1, 11, 'Note 11 Pro 8+128gb White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(196, 1, 11, 'Note 11S 6+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(197, 1, 11, 'Note 11S 6+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(198, 1, 11, 'Note 11S 6+64GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(199, 1, 11, 'Note 11S 6+64GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(200, 1, 11, 'Note 11S 6+64GB White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(201, 1, 11, 'Note 11S 8+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(202, 1, 11, 'Note 11S 8+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(203, 1, 11, 'Note 11S 8+128GB White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(204, 1, 11, 'Note 9 4+128GB Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(205, 1, 11, 'POCO F2 Pro 6+128GB 5G Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(206, 1, 11, 'Pad 5 6+128gb black CN', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(207, 1, 11, 'Pad 5 6+128gb gray EU', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(208, 1, 11, 'Pad 5 Pro 6+128gb black CN', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(209, 1, 11, 'Pad 5 Pro 6+256gb black CN', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(210, 1, 11, 'Poco F3 6+128GB Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(211, 1, 11, 'Poco F3 6+128GB White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(212, 1, 11, 'Poco X3 Pro 6+128gb black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(213, 1, 11, 'Poco X3 Pro 8+256 Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(214, 1, 11, 'Poco X4 Pro 6+128 Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(215, 1, 11, 'Redmi 10 4+128gb white EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(216, 1, 11, 'Redmi 10 6+128gb gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(217, 1, 11, 'Redmi 9 4+128GB Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(218, 1, 11, 'Redmi 9 4+128GB Gray CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(219, 1, 11, 'Redmi 9A 2+32gb EU blue', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(220, 1, 11, 'Redmi 9A 2+32gb EU gray', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(221, 1, 11, 'Redmi 9A 2+32gb EU green', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(222, 1, 11, 'Redmi 9A 2+32gb black Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(223, 1, 11, 'Redmi 9A 2+32gb blue Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(224, 1, 11, 'Redmi 9A 4+64gb Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(225, 1, 11, 'Redmi 9A 4+64gb Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(226, 1, 11, 'Redmi 9A 4+64gb Gray CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(227, 1, 11, 'Redmi 9A 4+64gb Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(228, 1, 11, 'Redmi 9C 4+128gb blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(229, 1, 11, 'Redmi 9C 4+128gb green EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(230, 1, 11, 'Redmi 9C 4+128gb purple EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(231, 1, 11, 'Redmi 9i 4+64GB blue Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(232, 1, 10, 'A525 4+128gb Blue', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(233, 1, 10, 'A525 4+128gb black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(234, 1, 10, 'A525 8+128gb Black', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(235, 1, 10, 'A525 4+128gb Violet', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(236, 1, 11, 'Redmi 9A 4+64gb Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(237, 1, 11, 'Redmi 9A 4+64gb Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(238, 1, 11, 'Redmi 9A 4+64gb Green CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(239, 1, 11, 'Mi 12X 5G 8+128G Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(240, 1, 11, 'Mi 12X 5G 8+256G Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(241, 1, 11, 'Mi 12X 5G 8+256G Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(242, 1, 11, 'Mi 12X 5G 8+128G Purple EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(243, 1, 11, 'Note 11 4+128GB Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(244, 1, 11, 'Note 11 4+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(245, 1, 11, 'Note 11 4+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(246, 1, 11, 'Note 11 6+128GB Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(247, 1, 11, 'Note 11 4+128GB White CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(248, 1, 11, 'Note 11 4+128GB Black CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(249, 1, 11, 'Note 11 Pro 4G 6+128gb Gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(250, 1, 9, 'N150 bk New G', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(251, 1, 9, 'Sicco S1272 black', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(252, 1, 10, 'A037 32gb black', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(253, 1, 10, 'A127 64 black + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(254, 1, 4, 'inoi 289 black', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(255, 1, 5, 'I Phone 13 Pro 256GB Blue LLA', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(256, 1, 5, 'I Phone 13 Pro Max 128GB Gray LLA', '-', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(257, 1, 10, 'A127 32 black + (Original chexol)', 'Yillik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(258, 1, 10, 'A225 64gb Mint', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(259, 1, 10, 'A226 5G 64gb Gray Arabic', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(260, 1, 10, 'A226 5G 64gb Violet Arabic', 'Oylik', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(261, 1, 10, 'G780 (S20 FE) 6+128gb blue', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(262, 1, 10, 'G991 S21 128gb gray', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(263, 1, 10, 'G991 S21 128gb violet', '$', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(264, 1, 10, 'M315 8+128gb Black Indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(265, 1, 10, 'M325 4+64gb black indian', 'M seria', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(266, 1, 11, 'Mi 11 lite NE/8+256GB 5G Pink EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(267, 1, 11, 'Mi 11 lite NE/8+256GB 5G White EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(268, 1, 11, 'Mi 11T Pro 5G 12+256gb gray EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(269, 1, 11, 'Note 10 8+256GB 5G Blue CN', 'China', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(270, 1, 11, 'Poco F3 6+128GB Blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(271, 1, 11, 'Poco F3 8+256GB Black EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(272, 1, 11, 'Poco M4 pro 4+64GB 5G EU Blue', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(273, 1, 11, 'Poco X3 Pro 6+128gb blue EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(274, 1, 11, 'Poco X3 Pro 6+128gb bronza EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(275, 1, 11, 'Redmi 10 4+64 white EU', 'Global', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54'),
(276, 1, 11, 'Redmi 9 Active 6+128gb Green Indian', 'India', NULL, '2022-04-04 06:52:54', '2022-04-04 06:52:54');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(279, '2014_10_12_000000_create_users_table', 1),
(280, '2014_10_12_100000_create_password_resets_table', 1),
(281, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(282, '2019_08_19_000000_create_failed_jobs_table', 1),
(283, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(284, '2022_01_03_080958_create_sessions_table', 1),
(285, '2022_01_03_090733_create_types_table', 1),
(286, '2022_01_03_090916_create_brands_table', 1),
(287, '2022_01_03_094450_create_stocks_table', 1),
(288, '2022_01_03_095502_create_clients_table', 1),
(289, '2022_01_03_100010_create_marks_table', 1),
(290, '2022_01_03_101904_create_products_table', 1),
(291, '2022_01_03_102618_create_invoices_table', 1),
(292, '2022_01_03_102642_create_expenses_table', 1),
(293, '2022_01_04_085555_create_currencies_table', 1),
(294, '2022_01_04_133209_create_stock_marks_table', 1),
(295, '2022_01_05_073558_create_shipments_table', 1),
(296, '2022_01_10_084207_create_orders_table', 1),
(297, '2022_01_10_111944_create_order_details_table', 1),
(298, '2022_01_10_112117_create_cashboxes_table', 1),
(310, '2022_01_12_123810_create_stock_payments_table', 2),
(300, '2022_01_14_172856_create_transfers_table', 1),
(301, '2022_01_14_193541_create_client_payments_table', 1),
(302, '2022_01_20_122908_create_price_types_table', 1),
(303, '2022_01_31_151237_create_converts_table', 1),
(304, '2022_02_12_161148_create_client_operations_table', 1),
(305, '2022_02_12_193817_create_stock_operations_table', 1),
(306, '2022_02_15_125503_create_tests_table', 1),
(307, '2022_02_28_175636_create_sums_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `order_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `amount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `discount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `products_price` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_stock_id_foreign` (`stock_id`),
  KEY `orders_client_id_foreign` (`client_id`),
  KEY `orders_invoice_id_foreign` (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `stock_id`, `order_type`, `invoice_id`, `date`, `quantity`, `amount`, `total_amount`, `payment_type`, `sum_id`, `discount`, `products`, `products_price`, `created_at`, `updated_at`) VALUES
(1, '1', 2, '1', '2', NULL, 1, NULL, NULL, NULL, 16, '0', NULL, NULL, '2022-04-05 08:11:43', '2022-04-05 08:11:43');

-- --------------------------------------------------------

--
-- Структура таблицы `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `order_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `date_agreement` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_agreement` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_payment` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_agreement_month` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `every_days` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_client_id_foreign` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `order_type`, `client_id`, `sum_id`, `date_agreement`, `monthly_pay`, `price_agreement`, `initial_payment`, `date_agreement_month`, `every_days`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 08:11:43', '2022-04-05 08:11:43');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `price_types`
--

DROP TABLE IF EXISTS `price_types`;
CREATE TABLE IF NOT EXISTS `price_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `price_types`
--

INSERT INTO `price_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Malika', '2022-04-04 06:51:40', '2022-04-04 06:51:40');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_acc_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `shipment_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `mark_id` int DEFAULT NULL,
  `imei` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sell_price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_stock_id_foreign` (`stock_id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_shipment_id_foreign` (`shipment_id`),
  KEY `products_invoice_id_foreign` (`invoice_id`),
  KEY `products_mark_id_foreign` (`mark_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `stock_acc_id`, `stock_id`, `user_id`, `shipment_id`, `invoice_id`, `mark_id`, `imei`, `price`, `bonus`, `expense`, `cost`, `sell_price`, `stock_price`, `order_id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(30, 2, 2, 2, 4, 2, 43, 'Код-Ey6y1649057347', '145', '0', '2.2222222222222', '147.22222222222', '160', NULL, 1, NULL, NULL, '2022-04-04 07:29:27', '2022-04-05 08:11:43'),
(31, 2, 1, 2, 4, 1, 43, 'Код-jTU41649057347', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 10:20:24'),
(29, 2, 2, 2, 4, 1, 43, 'Код-uHWR1649057183', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27'),
(28, 2, 2, 2, 4, 1, 43, 'Код-LgTr1649057183', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27'),
(27, 2, 1, 2, 4, 1, 43, 'Код-XDCe1649057183', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 10:20:24'),
(25, 2, 2, 2, 4, 1, 43, 'Код-DkYX1649057346', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27'),
(26, 2, 2, 2, 4, 1, 43, 'Код-VXyg1649057183', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27'),
(24, 2, 2, 2, 4, 1, 43, 'Код-a0LW1649057346', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27'),
(23, 2, 2, 2, 4, 1, 43, 'Код-z9t41649057346', '145', NULL, '2.2222222222222', '147.22222222222', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QHzbB9NGp5G6MvT75yCGbmkMhbKF6tsBpVjn0rwY', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.119 YaBrowser/22.3.0.2430 Yowser/2.5 Safari/537.36', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6InIyNlBWcVI5U0E3b0FSS1QyaHVIODJrZGtKRHNwNG0wOTNZSlFheUQiO3M6MzoidXJsIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL3NheXlpZG1vYmlsZXMudGVzdC9zdG9ja19wYXltZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRqWndXdjEvenVVRWdDa0prTE5hUTVlSUNjWHFLOU11ZmJmNjJOQ21mcm5lWnp4Y2hweE9qRyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkalp3V3YxL3p1VUVnQ2tKa0xOYVE1ZUlDY1hxSzlNdWZiZjYyTkNtZnJuZVp6eGNocHhPakciO3M6MTA6Im1hcmtfcHJpY2UiO2E6MTp7aTo0MztzOjM6IjE2MCI7fXM6NDoiY2FydCI7YToxOntpOjQzO2E6MTp7czoyOiJpZCI7aTo0Mzt9fXM6NzoicHJvZHVjdCI7YToxOntpOjMwO2E6Mjp7czoyOiJpZCI7aTozMDtzOjc6Im1hcmtfaWQiO2k6NDM7fX1zOjExOiJvbGRfaW52b2ljZSI7aToxO30=', 1649147457),
('sEgi7KUsUf6M7RXZxPIDl4eUDhd9Sln7V9QZzSKs', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiemNaUThXcE5HdkdmWTljUTdCbmJFZ3N4RFNqdk5NZFRFMWd3VXJ6OCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vc2F5eWlkbW9iaWxlcy50ZXN0L2luY29tZT9kYXRhX2lkPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRSMXRIcVJoWFYvU2xUUlFqZFJQOS51cjE5ZUtheVZWTTBaN0RSaWNKN2RIbHE5c1BWTXNQZSI7czo0OiJjYXJ0IjthOjE6e2k6NDc7YToxOntzOjI6ImlkIjtpOjQ3O319fQ==', 1649148863);

-- --------------------------------------------------------

--
-- Структура таблицы `shipments`
--

DROP TABLE IF EXISTS `shipments`;
CREATE TABLE IF NOT EXISTS `shipments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `mark_id` int DEFAULT NULL,
  `quantity` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_invoice_id_foreign` (`invoice_id`),
  KEY `shipments_client_id_foreign` (`client_id`),
  KEY `shipments_mark_id_foreign` (`mark_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `shipments`
--

INSERT INTO `shipments` (`id`, `invoice_id`, `client_id`, `mark_id`, `quantity`, `price`, `cost`, `note`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 43, '9', '145', '147.22222222222', NULL, '2022-04-04 07:29:27', '2022-04-04 07:29:27');

-- --------------------------------------------------------

--
-- Структура таблицы `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `price_type_id` int DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int DEFAULT NULL,
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stocks_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stocks`
--

INSERT INTO `stocks` (`id`, `stock_id`, `user_id`, `price_type_id`, `name`, `main_currency_id`, `second_currency_id`, `address`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'Malika', 1, '2|3', 'Malikada', '2022-04-04 06:52:05', '2022-04-04 06:52:05'),
(2, NULL, 2, 1, 'Viloyat', 1, '2|3', 'Viloyat', '2022-04-04 06:59:13', '2022-04-04 07:06:35');

-- --------------------------------------------------------

--
-- Структура таблицы `stock_marks`
--

DROP TABLE IF EXISTS `stock_marks`;
CREATE TABLE IF NOT EXISTS `stock_marks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `price_type_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `mark_id` int NOT NULL,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stock_marks`
--

INSERT INTO `stock_marks` (`id`, `stock_id`, `price_type_id`, `currency_id`, `mark_id`, `price`, `bonus`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 1, '28', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(2, NULL, 1, 1, 2, '10', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(3, NULL, 1, 1, 3, '13', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(4, NULL, 1, 1, 4, '12', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(5, NULL, 1, 1, 5, '30', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(6, NULL, 1, 1, 6, '16', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(7, NULL, 1, 1, 7, '13.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(8, NULL, 1, 1, 8, '7', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(9, NULL, 1, 1, 9, '18', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(10, NULL, 1, 1, 10, '16', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(11, NULL, 1, 1, 11, '17', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(12, NULL, 1, 1, 12, '14.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(13, NULL, 1, 1, 13, '1140', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(14, NULL, 1, 1, 14, '34.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(15, NULL, 1, 1, 15, '42', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(16, NULL, 1, 1, 16, '12', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(17, NULL, 1, 1, 17, '15', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(18, NULL, 1, 1, 18, '15', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(19, NULL, 1, 1, 19, '19', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(20, NULL, 1, 1, 20, '0', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:28'),
(21, NULL, 1, 1, 21, '19', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(22, NULL, 1, 1, 22, '20.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(23, NULL, 1, 1, 23, '20.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(24, NULL, 1, 1, 24, '29.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(25, NULL, 1, 1, 25, '22.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(26, NULL, 1, 1, 26, '20.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(27, NULL, 1, 1, 27, '0', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:28'),
(28, NULL, 1, 1, 28, '15', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(29, NULL, 1, 1, 29, '15', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(30, NULL, 1, 1, 30, '32', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(31, NULL, 1, 1, 31, '43', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(32, NULL, 1, 1, 32, '60.3', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(33, NULL, 1, 1, 33, '109', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(34, NULL, 1, 1, 34, '109', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(35, NULL, 1, 1, 35, '143', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(36, NULL, 1, 1, 36, '143', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(37, NULL, 1, 1, 37, '143', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(38, NULL, 1, 1, 38, '155', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(39, NULL, 1, 1, 39, '0', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:28'),
(40, NULL, 1, 1, 40, '146', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(41, NULL, 1, 1, 41, '164', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(42, NULL, 1, 1, 42, '164', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(43, NULL, 1, 1, 43, '157', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(44, NULL, 1, 1, 44, '157', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(45, NULL, 1, 1, 45, '0', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:28'),
(46, NULL, 1, 1, 47, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(47, NULL, 1, 1, 48, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(48, NULL, 1, 1, 49, '157', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(49, NULL, 1, 1, 50, '157', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(50, NULL, 1, 1, 51, '157', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(51, NULL, 1, 1, 52, '230', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(52, NULL, 1, 1, 53, '116.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(53, NULL, 1, 1, 54, '116.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(54, NULL, 1, 1, 55, '116.5', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(55, NULL, 1, 1, 56, '182', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(56, NULL, 1, 1, 57, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(57, NULL, 1, 1, 58, '174', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(58, NULL, 1, 1, 59, '173', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(59, NULL, 1, 1, 60, '173', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(60, NULL, 1, 1, 61, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(61, NULL, 1, 1, 62, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(62, NULL, 1, 1, 63, '181', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(63, NULL, 1, 1, 64, '226', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(64, NULL, 1, 1, 65, '225', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(65, NULL, 1, 1, 66, '225', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(66, NULL, 1, 1, 67, '207', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(67, NULL, 1, 1, 68, '207', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(68, NULL, 1, 1, 69, '207', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(69, NULL, 1, 1, 70, '223', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(70, NULL, 1, 1, 71, '195', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(71, NULL, 1, 1, 72, '195', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(72, NULL, 1, 1, 73, '255', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(73, NULL, 1, 1, 74, '263', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(74, NULL, 1, 1, 75, '262', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(75, NULL, 1, 1, 76, '262', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(76, NULL, 1, 1, 77, '262', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(77, NULL, 1, 1, 78, '264', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(78, NULL, 1, 1, 79, '237', NULL, '2022-04-04 06:56:26', '2022-04-04 06:56:26'),
(79, NULL, 1, 1, 80, '240', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(80, NULL, 1, 1, 81, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(81, NULL, 1, 1, 82, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(82, NULL, 1, 1, 83, '289', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(83, NULL, 1, 1, 84, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(84, NULL, 1, 1, 85, '297', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(85, NULL, 1, 1, 86, '297', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(86, NULL, 1, 1, 87, '297', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(87, NULL, 1, 1, 88, '295', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(88, NULL, 1, 1, 89, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(89, NULL, 1, 1, 90, '344', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(90, NULL, 1, 1, 91, '343', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(91, NULL, 1, 1, 92, '438', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(92, NULL, 1, 1, 93, '540', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(93, NULL, 1, 1, 94, '583', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(94, NULL, 1, 1, 95, '600', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(95, NULL, 1, 1, 96, '162', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(96, NULL, 1, 1, 97, '161', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(97, NULL, 1, 1, 98, '161', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(98, NULL, 1, 1, 99, '180', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(99, NULL, 1, 1, 100, '181', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(100, NULL, 1, 1, 101, '180', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(101, NULL, 1, 1, 102, '195', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(102, NULL, 1, 1, 103, '222', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(103, NULL, 1, 1, 104, '220', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(104, NULL, 1, 1, 105, '244', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(105, NULL, 1, 1, 106, '243', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(106, NULL, 1, 1, 107, '230', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(107, NULL, 1, 1, 108, '229', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(108, NULL, 1, 1, 109, '350', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(109, NULL, 1, 1, 110, '349', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(110, NULL, 1, 1, 111, '160', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(111, NULL, 1, 1, 112, '160', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(112, NULL, 1, 1, 113, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(113, NULL, 1, 1, 114, '183', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(114, NULL, 1, 1, 115, '285', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(115, NULL, 1, 1, 116, '210', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(116, NULL, 1, 1, 117, '198', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(117, NULL, 1, 1, 118, '199', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(118, NULL, 1, 1, 119, '155', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(119, NULL, 1, 1, 120, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(120, NULL, 1, 1, 121, '300', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(121, NULL, 1, 1, 122, '274', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(122, NULL, 1, 1, 123, '285', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(123, NULL, 1, 1, 124, '284', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(124, NULL, 1, 1, 125, '284', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(125, NULL, 1, 1, 126, '283', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(126, NULL, 1, 1, 127, '339', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(127, NULL, 1, 1, 128, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(128, NULL, 1, 1, 129, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(129, NULL, 1, 1, 130, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(130, NULL, 1, 1, 131, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(131, NULL, 1, 1, 132, '181', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(132, NULL, 1, 1, 133, '182', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(133, NULL, 1, 1, 134, '181', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(134, NULL, 1, 1, 135, '181', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(135, NULL, 1, 1, 136, '195', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(136, NULL, 1, 1, 137, '190', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(137, NULL, 1, 1, 138, '190', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(138, NULL, 1, 1, 139, '215', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(139, NULL, 1, 1, 140, '216', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(140, NULL, 1, 1, 141, '224', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(141, NULL, 1, 1, 142, '225', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(142, NULL, 1, 1, 143, '224', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(143, NULL, 1, 1, 144, '264', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(144, NULL, 1, 1, 145, '250', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(145, NULL, 1, 1, 146, '283', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(146, NULL, 1, 1, 147, '249', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(147, NULL, 1, 1, 148, '249', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(148, NULL, 1, 1, 149, '284', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(149, NULL, 1, 1, 150, '264', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(150, NULL, 1, 1, 151, '280', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(151, NULL, 1, 1, 152, '270', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(152, NULL, 1, 1, 153, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(153, NULL, 1, 1, 154, '274', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(154, NULL, 1, 1, 155, '274', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(155, NULL, 1, 1, 156, '285', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(156, NULL, 1, 1, 157, '292', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(157, NULL, 1, 1, 158, '292', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(158, NULL, 1, 1, 159, '293', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(159, NULL, 1, 1, 160, '223', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(160, NULL, 1, 1, 161, '228', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(161, NULL, 1, 1, 162, '229', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(162, NULL, 1, 1, 163, '228', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(163, NULL, 1, 1, 164, '206', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(164, NULL, 1, 1, 165, '207', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(165, NULL, 1, 1, 166, '206', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(166, NULL, 1, 1, 167, '239', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(167, NULL, 1, 1, 168, '180', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(168, NULL, 1, 1, 169, '180', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(169, NULL, 1, 1, 170, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(170, NULL, 1, 1, 171, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(171, NULL, 1, 1, 172, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(172, NULL, 1, 1, 173, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(173, NULL, 1, 1, 174, '196', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(174, NULL, 1, 1, 175, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(175, NULL, 1, 1, 176, '186', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(176, NULL, 1, 1, 177, '186', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(177, NULL, 1, 1, 178, '198', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(178, NULL, 1, 1, 179, '197', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(179, NULL, 1, 1, 180, '207', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(180, NULL, 1, 1, 181, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(181, NULL, 1, 1, 182, '197', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(182, NULL, 1, 1, 183, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(183, NULL, 1, 1, 184, '300', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(184, NULL, 1, 1, 185, '300', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(185, NULL, 1, 1, 186, '285', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(186, NULL, 1, 1, 187, '285', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(187, NULL, 1, 1, 188, '325', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(188, NULL, 1, 1, 189, '326', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(189, NULL, 1, 1, 190, '325', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(190, NULL, 1, 1, 191, '293', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(191, NULL, 1, 1, 192, '292', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(192, NULL, 1, 1, 193, '292', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(193, NULL, 1, 1, 194, '307', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(194, NULL, 1, 1, 195, '307', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(195, NULL, 1, 1, 196, '254', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(196, NULL, 1, 1, 197, '255', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(197, NULL, 1, 1, 198, '243', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(198, NULL, 1, 1, 199, '244', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(199, NULL, 1, 1, 200, '243', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(200, NULL, 1, 1, 201, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(201, NULL, 1, 1, 202, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(202, NULL, 1, 1, 203, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(203, NULL, 1, 1, 204, '170', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(204, NULL, 1, 1, 205, '275', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(205, NULL, 1, 1, 206, '305', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(206, NULL, 1, 1, 207, '340', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(207, NULL, 1, 1, 208, '445', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(208, NULL, 1, 1, 209, '495', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(209, NULL, 1, 1, 210, '305', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(210, NULL, 1, 1, 211, '304', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(211, NULL, 1, 1, 212, '260', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(212, NULL, 1, 1, 213, '286', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(213, NULL, 1, 1, 214, '320', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(214, NULL, 1, 1, 215, '210', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(215, NULL, 1, 1, 216, '217', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(216, NULL, 1, 1, 217, '171', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(217, NULL, 1, 1, 218, '171', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(218, NULL, 1, 1, 219, '119', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(219, NULL, 1, 1, 220, '120', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(220, NULL, 1, 1, 221, '119', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(221, NULL, 1, 1, 222, '118', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(222, NULL, 1, 1, 223, '117', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(223, NULL, 1, 1, 224, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(224, NULL, 1, 1, 225, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(225, NULL, 1, 1, 226, '129', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(226, NULL, 1, 1, 227, '0', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:28'),
(227, NULL, 1, 1, 228, '154', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(228, NULL, 1, 1, 229, '154', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(229, NULL, 1, 1, 230, '154', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(230, NULL, 1, 1, 231, '137', NULL, '2022-04-04 06:56:27', '2022-04-04 06:56:27'),
(231, NULL, 1, 1, 254, '15.2', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(232, NULL, 1, 1, 255, '1150', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(233, NULL, 1, 1, 256, '1140', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(234, NULL, 1, 1, 257, '156', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(235, NULL, 1, 1, 258, '208', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(236, NULL, 1, 1, 259, '197', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(237, NULL, 1, 1, 260, '195', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(238, NULL, 1, 1, 261, '430', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(239, NULL, 1, 1, 262, '623', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(240, NULL, 1, 1, 263, '623', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(241, NULL, 1, 1, 264, '220', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(242, NULL, 1, 1, 265, '210', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(243, NULL, 1, 1, 266, '308', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(244, NULL, 1, 1, 267, '308', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(245, NULL, 1, 1, 268, '562', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(246, NULL, 1, 1, 269, '225', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(247, NULL, 1, 1, 270, '304', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(248, NULL, 1, 1, 271, '321', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(249, NULL, 1, 1, 272, '212', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(250, NULL, 1, 1, 273, '260', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(251, NULL, 1, 1, 274, '260', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(252, NULL, 1, 1, 275, '198', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28'),
(253, NULL, 1, 1, 276, '173', NULL, '2022-04-04 06:56:28', '2022-04-04 06:56:28');

-- --------------------------------------------------------

--
-- Структура таблицы `stock_operations`
--

DROP TABLE IF EXISTS `stock_operations`;
CREATE TABLE IF NOT EXISTS `stock_operations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `convert_id` int DEFAULT NULL,
  `stock_id` int DEFAULT NULL,
  `client_payment_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `stock_payment_id` int DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_id` int DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_operations_user_id_foreign` (`user_id`),
  KEY `stock_operations_invoice_id_foreign` (`invoice_id`),
  KEY `stock_operations_convert_id_foreign` (`convert_id`),
  KEY `stock_operations_stock_id_foreign` (`stock_id`),
  KEY `stock_operations_client_payment_id_foreign` (`client_payment_id`),
  KEY `stock_operations_client_id_foreign` (`client_id`),
  KEY `stock_operations_stock_payment_id_foreign` (`stock_payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stock_operations`
--

INSERT INTO `stock_operations` (`id`, `user_id`, `invoice_id`, `convert_id`, `stock_id`, `client_payment_id`, `client_id`, `stock_payment_id`, `date`, `operation`, `sum_currency_id`, `sum_id`, `type`, `created_at`, `updated_at`) VALUES
(11, 1, NULL, NULL, 1, NULL, NULL, 5, '2022-04-05', 'Pul(chiqim | Ombor)', NULL, 15, -1, '2022-04-05 07:17:23', '2022-04-05 07:17:23'),
(12, 1, NULL, NULL, 2, NULL, NULL, 5, '2022-04-05', 'Pul(kirim | Ombor)', NULL, 15, 1, '2022-04-05 07:17:23', '2022-04-05 07:17:23'),
(13, 2, 2, NULL, 2, NULL, 1, NULL, '2022-04-05', 'Mahsulot(chiqim)', 1, 16, -1, '2022-04-05 08:11:43', '2022-04-05 08:11:43');

-- --------------------------------------------------------

--
-- Структура таблицы `stock_payments`
--

DROP TABLE IF EXISTS `stock_payments`;
CREATE TABLE IF NOT EXISTS `stock_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_from` int DEFAULT NULL,
  `stock_to` int DEFAULT NULL,
  `sum_id` int DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_payments_stock_from_foreign` (`stock_from`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stock_payments`
--

INSERT INTO `stock_payments` (`id`, `stock_from`, `stock_to`, `sum_id`, `date`, `note`, `type`, `status`, `created_at`, `updated_at`) VALUES
(5, 1, 2, 15, '2022-04-05', NULL, '-1', '1', '2022-04-05 07:17:23', '2022-04-05 08:26:02');

-- --------------------------------------------------------

--
-- Структура таблицы `sums`
--

DROP TABLE IF EXISTS `sums`;
CREATE TABLE IF NOT EXISTS `sums` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sum_currency_id` int DEFAULT NULL,
  `sum_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_pay_get` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_pay_will` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int DEFAULT NULL,
  `main_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `main_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sums`
--

INSERT INTO `sums` (`id`, `sum_currency_id`, `sum_currency_pay`, `sum_currency_pay_get`, `sum_currency_pay_will`, `discount`, `main_currency_id`, `main_currency_pay`, `main_currency_rate`, `second_currency_id`, `second_currency_pay`, `second_currency_rate`, `created_at`, `updated_at`) VALUES
(1, 1, '1305', '0', NULL, NULL, 1, '0', '1', '2|3', '0|0', '11050|0.89', '2022-04-04 07:26:23', '2022-04-04 07:29:27'),
(16, 1, NULL, '160.18', NULL, '0', 1, '0', '1', '2|3', '1770000|0', '11050|0.89', '2022-04-05 08:11:43', '2022-04-05 08:11:43'),
(15, 1, '300', '300', NULL, NULL, 1, '300', '1', '2|3', '0|0', '11050|0.89', '2022-04-05 07:17:23', '2022-04-05 07:17:23'),
(14, 1, '300', '300', NULL, NULL, 1, '300', '1', '2|3', '0|0', '11050|0.89', '2022-04-05 07:15:29', '2022-04-05 07:15:29');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `transfers`
--

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE IF NOT EXISTS `transfers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_from` int DEFAULT NULL,
  `stock_to` int DEFAULT NULL,
  `marks` text COLLATE utf8mb4_unicode_ci,
  `products` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `transfers`
--

INSERT INTO `transfers` (`id`, `date`, `name`, `stock_from`, `stock_to`, `marks`, `products`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-04-04', 'AMRYRzbtlJ', 2, 1, '43', '31,27', NULL, 1, '2022-04-04 07:40:18', '2022-04-04 10:20:24');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Telefon va gadjetlar', '2022-04-04 06:52:33', '2022-04-04 06:52:33');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `stock_id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rustam', 'mannopovr@gmail.com', NULL, NULL, '$2y$10$R1tHqRhXV/SlTRQjdRP9.ur19eKayVVM0Z7DRicJ7dHlq9sPVMsPe', NULL, NULL, NULL, NULL, NULL, '2022-04-04 06:16:05', '2022-04-04 08:36:37'),
(2, 2, 'O\'rikzor', 'orikzor@gmail.com', NULL, NULL, '$2y$10$jZwWv1/zuUEgCkJkLNaQ5eICcXqK9Mufbf62NCmfrneZzxchpxOjG', NULL, NULL, NULL, NULL, NULL, '2022-04-04 07:06:10', '2022-04-04 07:06:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
