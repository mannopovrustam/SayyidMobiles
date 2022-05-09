-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 09 2022 г., 16:39
-- Версия сервера: 5.7.27-30
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u1478952_default`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(36, 'SAMSUNG', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(35, 'XIAOMI', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(34, 'NOBBY', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(33, 'KGTEL', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(32, 'CDMA', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(31, 'MAXVI', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(30, 'ARTEL', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(29, 'ALCATEL', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(28, 'SICCOO', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(27, 'NOKIA', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(26, 'IPHONE', '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(25, 'INOI', '2022-04-13 13:11:31', '2022-04-13 13:11:31');

-- --------------------------------------------------------

--
-- Структура таблицы `cashboxes`
--

CREATE TABLE `cashboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `income` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `expend` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `submitted` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `residue` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `kod` int(11) DEFAULT NULL,
  `region` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `main_currency_id` int(11) DEFAULT NULL,
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `name`, `phone`, `kod`, `region`, `address`, `main_currency_id`, `second_currency_id`, `stock_id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'BALANS', NULL, NULL, '1', NULL, 1, '1|2', 15, NULL, '2022-04-13 13:19:36', '2022-05-07 13:29:19'),
(3, '312@Mobile (Temur)', NULL, NULL, '1', 'Yo\'l', 1, '1|2', 16, 'Pastavshik', '2022-04-20 11:16:36', '2022-04-20 11:16:36');

-- --------------------------------------------------------

--
-- Структура таблицы `client_operations`
--

CREATE TABLE `client_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `client_payment_id` int(11) DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sum_currency_id` int(11) DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `client_operations`
--

INSERT INTO `client_operations` (`id`, `invoice_id`, `client_id`, `client_payment_id`, `date`, `operation`, `type`, `sum_currency_id`, `sum_id`, `created_at`, `updated_at`) VALUES
(28, 24, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 59, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(27, 23, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 58, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(26, 22, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 57, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(25, 21, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 1, 56, '2022-05-05 15:16:38', '2022-05-07 08:41:21'),
(24, 20, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 55, '2022-05-05 15:05:17', '2022-05-05 15:05:17'),
(23, 19, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 54, '2022-05-05 13:55:44', '2022-05-05 13:55:44'),
(22, 18, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 53, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(21, 17, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 1, 52, '2022-05-05 13:31:42', '2022-05-07 13:37:27'),
(20, 16, 3, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 51, '2022-05-05 13:30:10', '2022-05-05 13:30:10'),
(29, 25, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 60, '2022-05-05 15:24:33', '2022-05-05 15:24:33'),
(30, 26, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 61, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(31, 27, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 1, 62, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(32, 28, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 1, 63, '2022-05-05 16:05:42', '2022-05-07 13:10:33');

-- --------------------------------------------------------

--
-- Структура таблицы `client_payments`
--

CREATE TABLE `client_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `converts`
--

CREATE TABLE `converts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `currency_from` int(11) DEFAULT NULL,
  `currency_to` int(11) DEFAULT NULL,
  `currency` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_val` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_val` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int(11) DEFAULT NULL,
  `main_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `main_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `client_id` int(11) DEFAULT '0',
  `stock_id` int(11) DEFAULT '0',
  `sum_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `invoices`
--

INSERT INTO `invoices` (`id`, `stock_id`, `client_id`, `name`, `type`, `sum_id`, `date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(24, 15, 2, 'AA-0000009', 4, 59, '2022-05-05', NULL, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(23, 15, 2, 'AA-0000008', 4, 58, '2022-05-05', NULL, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(22, 15, 2, 'AA-0000007', 4, 57, '2022-05-05', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(21, 15, 2, 'AA-0000006', 4, 56, '2022-05-07', NULL, '2022-05-05 15:16:38', '2022-05-07 08:41:21'),
(20, 15, 2, 'AA-0000005', 4, 55, '2022-05-05', NULL, '2022-05-05 15:05:17', '2022-05-05 15:05:17'),
(19, 15, 2, 'AA-0000004', 4, 54, '2022-05-05', NULL, '2022-05-05 13:55:44', '2022-05-05 13:55:44'),
(18, 15, 2, 'AA-0000003', 4, 53, '2022-05-05', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(17, 15, 2, 'AA-0000002', 4, 52, '2022-05-07', NULL, '2022-05-05 13:31:42', '2022-05-07 13:37:27'),
(16, 16, 3, 'AA-0000001', 4, 51, '2022-05-05', NULL, '2022-05-05 13:30:10', '2022-05-05 13:30:10'),
(25, 15, 2, 'AA-0000010', 4, 60, '2022-05-05', NULL, '2022-05-05 15:24:33', '2022-05-05 15:24:33'),
(26, 15, 2, 'AA-0000011', 4, 61, '2022-05-05', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(27, 15, 2, 'AA-0000012', 4, 62, '2022-05-05', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(28, 15, 2, 'AA-0000013', 4, 63, '2022-05-07', NULL, '2022-05-05 16:05:42', '2022-05-07 13:10:33');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`id`, `type_id`, `brand_id`, `name`, `version`, `description`, `created_at`, `updated_at`) VALUES
(660, 5, 36, 'A536 (A53) 128gb White', 'Yillik', NULL, '2022-04-20 11:42:57', '2022-04-20 11:42:57'),
(659, 5, 36, 'A536 (A53) 128gb Black', 'Yillik', NULL, '2022-04-20 11:21:11', '2022-04-20 11:42:57'),
(658, 5, 36, 'A525 4+128gb violet', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(657, 5, 36, 'A525 4+128gb blue', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(656, 5, 36, 'A525 4+128gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(654, 5, 36, 'A127 64 blue', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(655, 5, 36, 'A127 64 red', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(652, 5, 36, 'A022 red', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(653, 5, 36, 'A127 64 black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(650, 5, 36, 'A022 black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(651, 5, 36, 'A022 blue', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(649, 5, 36, 'M127 32gb green', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(648, 5, 36, 'M127 32gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(647, 5, 36, 'A127 64 red + (Original chexol)', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(646, 5, 36, 'A127 64 blue + (Original chexol)', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(645, 5, 36, 'A127 64 black + (Original chexol)', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(644, 5, 36, 'A037 64gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(643, 5, 36, 'A037 32gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(641, 5, 36, 'A035 32gb red', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(642, 5, 36, 'A035 64gb red', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(640, 5, 36, 'A035 32gb blue', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(638, 5, 36, 'A032 32gb blue', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(639, 5, 36, 'A035 32gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(637, 5, 36, 'A032 32gb black', 'Yillik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(636, 5, 36, 'G990 (S21 FE) 5G 8+128gb Graphite', 'S seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(635, 6, 35, 'Pad 5 Pro 6+256gb black CN', 'Planshet', NULL, '2022-04-13 13:11:31', '2022-04-13 13:14:22'),
(633, 6, 35, 'Pad 5 6+128gb gray EU', 'Planshet', NULL, '2022-04-13 13:11:31', '2022-04-13 13:14:33'),
(634, 6, 35, 'Pad 5 Pro 6+128gb black CN', 'Planshet', NULL, '2022-04-13 13:11:31', '2022-04-13 13:14:42'),
(632, 6, 35, 'Pad 5 6+128gb black CN', 'Planshet', NULL, '2022-04-13 13:11:31', '2022-04-13 13:14:52'),
(631, 5, 36, 'A525 8+256gb blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(630, 5, 36, 'A525 8+256gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(628, 5, 36, 'A525 6+128gb Blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(629, 5, 36, 'A525 8+128gb Black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(627, 5, 36, 'A525 4+128gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(626, 5, 36, 'A525 4+128gb White oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(625, 5, 36, 'A525 4+128gb Blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(624, 5, 36, 'A325 64gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(623, 5, 36, 'A325 64gb Blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(622, 5, 36, 'A325 6+128gb white oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(620, 5, 36, 'A325 6+128gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(621, 5, 36, 'A325 6+128gb blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(619, 5, 36, 'A325 4+128gb blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(618, 5, 36, 'A226 5G 64gb Mint Arabic oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(617, 5, 36, 'A226 5G 128gb Gray Arabic oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(616, 5, 36, 'A225 64gb white oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(615, 5, 36, 'A225 4+128gb green oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(614, 5, 36, 'A127 4+64gb white oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(612, 5, 36, 'A127 4+64gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(613, 5, 36, 'A127 4+64gb blue oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(611, 5, 36, 'A127 4+128gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(610, 5, 36, 'A037 64gb black oylik', 'Oylik', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(609, 5, 36, 'M526 8+128gb 5G Blue Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(608, 5, 36, 'M526 8+128gb 5G Black Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(607, 5, 36, 'M325 6+128gb black Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(606, 5, 36, 'M325 6+128GB 5G blue Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(605, 5, 36, 'M325 6+128GB 5G black Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(604, 5, 36, 'M225 4+128gb black Arabic', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(603, 5, 36, 'M21 4+64gb blue Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(601, 5, 36, 'M12 4+64gb white Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(602, 5, 36, 'M21 4+64gb black Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(600, 5, 36, 'M12 4+64gb blue Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(599, 5, 36, 'M12 4+64gb black Indian', 'M seria', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(598, 5, 35, 'Note 10 Pro 8+128gb Gray Indonesia', 'Indz', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(596, 5, 35, 'Redmi 9i 4+64GB blue Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(597, 5, 35, 'Note 10 Pro 8+128gb Black Indonesia', 'Indz', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(594, 5, 35, 'Redmi 9A 2+32gb black Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(595, 5, 35, 'Redmi 9A 2+32gb blue Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(593, 5, 35, 'Note 10T 4+64GB 5G Green Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(592, 5, 35, 'Note 10T 4+64GB 5G Blue Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(591, 5, 35, 'Note 10S 6+128GB Black Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(590, 5, 35, 'Note 10 Pro 8+128gb Dark Nebula Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(589, 5, 35, 'Note 10 Pro 8+128gb Bronze Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(588, 5, 35, 'Note 10 Pro 8+128gb Black Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(587, 5, 35, 'Note 10 Pro 6+128gb Dark Nebula Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(586, 5, 35, 'Note 10 Pro 6+128gb Bronze Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(585, 5, 35, 'Note 10 Pro 6+128gb Black Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(584, 5, 35, 'Note 10 4+64GB Green Indian', 'India', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(583, 4, 25, 'inoi 247 black', 'INOI', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(582, 5, 35, 'Redmi 9C 4+128gb purple EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(581, 5, 35, 'Redmi 9C 4+128gb green EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(580, 5, 35, 'Redmi 9C 4+128gb blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(579, 5, 35, 'Redmi 9A 2+32gb EU green', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(578, 5, 35, 'Redmi 9A 2+32gb EU gray', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(577, 5, 35, 'Redmi 9A 2+32gb EU blue', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(576, 5, 35, 'Redmi 10 6+128gb gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(575, 5, 35, 'Redmi 10 4+128gb white EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(574, 5, 35, 'Poco X4 Pro 6+128 Black EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(573, 5, 35, 'Poco X3 Pro 6+128gb blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(572, 5, 35, 'Poco X3 Pro 6+128gb black EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(571, 5, 35, 'Poco F3 6+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(570, 5, 35, 'Poco F3 6+128GB Black EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(569, 5, 35, 'Note 11S 8+128GB White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(568, 5, 35, 'Note 11S 8+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(567, 5, 35, 'Note 11S 6+64GB White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(565, 5, 35, 'Note 11S 6+64GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(566, 5, 35, 'Note 11S 6+64GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(564, 5, 35, 'Note 11S 6+128GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(563, 5, 35, 'Note 11S 6+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(562, 5, 35, 'Note 11 Pro 5G 8+128gb White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(560, 5, 35, 'Note 11 Pro 5G 8+128gb Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(561, 5, 35, 'Note 11 Pro 5G 8+128gb Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(559, 5, 35, 'Note 11 Pro 5G 6+64gb Grey EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(558, 5, 35, 'Note 11 Pro 5G 6+64gb Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(557, 5, 35, 'Note 11 Pro 5G 6+128gb White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(556, 5, 35, 'Note 11 Pro 5G 6+128gb Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(554, 5, 35, 'Note 11 Pro 4G 8+128gb Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(555, 5, 35, 'Note 11 Pro 4G 8+128gb White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(552, 5, 35, 'Note 11 Pro 4G 6+128gb White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(553, 5, 35, 'Note 11 Pro 4G 8+128gb Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(551, 5, 35, 'Note 11 Pro 4G 6+128gb Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(550, 5, 35, 'Note 11 6+128GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(549, 5, 35, 'Note 11 6+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(548, 5, 35, 'Note 11 4+128GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(547, 5, 35, 'Note 11 4+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(546, 5, 35, 'Note 10S 8+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(545, 5, 35, 'Note 10S 6+64GB White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(544, 5, 35, 'Note 10S 6+64GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(543, 5, 35, 'Note 10S 6+64GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(542, 5, 35, 'Note 10S 6+128GB White EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(541, 5, 35, 'Note 10S 6+128GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(540, 5, 35, 'Note 10S 6+128GB Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(539, 5, 35, 'Note 10 pro 8+128gb EU Gray', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(538, 5, 35, 'Note 10 pro 8+128gb EU Bronze', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(537, 5, 35, 'Note 10 pro 8+128gb EU Blue', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(536, 5, 35, 'Note 10 Pro 6+64gb EU black', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(535, 5, 35, 'Note 10 Pro 6+128gb Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(534, 5, 35, 'Note 10 5G 4+64GB Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(532, 5, 35, 'Mi 12X 5G 8+128G Purple EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(533, 5, 35, 'Mi 12X 5G 8+256G Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(531, 5, 35, 'Mi 12X 5G 8+128G Gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(530, 5, 35, 'Mi 11T 8+128GB 5G white EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(529, 5, 35, 'Mi 11 lite NE/8+128GB 5G Green EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(528, 5, 35, 'Mi 11 Lite NE 6+128GB 5G Blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(527, 5, 35, 'Mi 11 Lite 8+128GB 5G Black EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(526, 5, 35, 'Mi 11 Lite 6+128GB 5G Black EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(525, 5, 35, 'Redmi 10 4+64 gray EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(523, 5, 35, 'Redmi 9A 4+64gb Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(524, 5, 35, 'Redmi 10 4+64 blue EU', 'Global', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(522, 5, 35, 'Redmi 9A 4+64gb Blue CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(521, 5, 35, 'Redmi 9A 4+64gb Black CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(520, 5, 35, 'Redmi 9 4+128GB Gray CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(519, 5, 35, 'Redmi 9 4+128GB Black CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(518, 5, 35, 'Note 9 4+128GB Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(516, 5, 35, 'Note 11 6+128GB Blue CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(517, 5, 35, 'Note 11 6+128GB White CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(515, 5, 35, 'Note 11 6+128GB Black CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(514, 5, 35, 'Note 11 4+128GB White CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(512, 5, 35, 'Note 11 4+128GB Black CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(513, 5, 35, 'Note 11 4+128GB Blue CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(511, 5, 35, 'Note 10 Pro 8+128GB 5G Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(510, 5, 35, 'Note 10 Pro 6+128gb Grey CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(508, 5, 35, 'Note 10 8+256GB 5G Grey CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(509, 5, 35, 'Note 10 8+256GB 5G Silver CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(507, 5, 35, 'Note 10 8+256GB 5G Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(506, 5, 35, 'Note 10 8+128GB 5G Grey CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(505, 5, 35, 'Note 10 8+128GB 5G Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(504, 5, 35, 'Note 10 6+128GB 5G Grey CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(503, 5, 35, 'Note 10 4+128GB 5G Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(502, 5, 35, 'Note 10 4+128GB 5G Gray CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(500, 5, 35, 'Note 10 Pro 8+256gb 5G Green CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(501, 5, 35, 'Note 10 4+128GB 5G Blue CN', 'China', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(499, 4, 34, 'nobby 230 black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(498, 4, 33, 'M370 blue', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(497, 4, 33, 'C3592 silver', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(496, 4, 25, 'inoi 242 blue', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(495, 4, 25, 'Inoi 118 red', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(494, 4, 32, 'Gusto 1', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(493, 4, 27, 'N6300 DS black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(492, 4, 27, 'N215 DS black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(491, 4, 27, 'N130 DS black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(490, 4, 31, 'E1', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(489, 4, 25, 'inoi 244 blue', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(488, 4, 25, 'inoi 101 black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(487, 4, 30, 'X3', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(486, 4, 30, 'V5', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(485, 4, 30, 'M5', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(484, 4, 29, '4009', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(483, 4, 28, 'Sicco S1277', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(482, 4, 28, 'Sicco S1276', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(481, 4, 28, 'Sicco S1272 black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(480, 4, 28, 'SICCO S6700 BK', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(479, 4, 27, 'N3310 BLUE 2 SIM G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(478, 4, 27, 'N2720 black G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(477, 4, 27, 'N220 black G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(476, 4, 27, 'N216 black G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(475, 4, 27, 'N210 black G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(474, 4, 27, 'N150 bk New G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(473, 4, 27, 'N125 black G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(472, 4, 27, 'N105 black 2 sim G', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(471, 5, 26, 'I Phone 13 Pro Max 128GB Gold VCA', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(470, 4, 25, 'inoi 103 bk', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(469, 4, 25, 'S1272 Black', '-', NULL, '2022-04-13 13:11:31', '2022-04-13 13:11:31'),
(661, 5, 36, 'A037 32gb white', 'Yillik', NULL, '2022-05-05 13:46:33', '2022-05-05 13:46:33'),
(662, 5, 36, 'A325 64gb Black', 'Yillik', NULL, '2022-05-05 13:48:39', '2022-05-05 13:48:39'),
(663, 5, 36, 'A336 5G 6+128gb Black', 'Yillik', NULL, '2022-05-05 13:49:05', '2022-05-05 13:49:05'),
(664, 5, 36, 'A336 5G 6+128gb Light blue', 'Yillik', NULL, '2022-05-05 13:49:25', '2022-05-05 13:49:25'),
(665, 5, 36, 'G780 (S20 FE) 8+128gb blue Arabic', 'S seria', NULL, '2022-05-05 13:55:26', '2022-05-05 13:55:26'),
(666, 6, 36, 'T225 Tab A7 lite 32gb gray', 'Yillik', NULL, '2022-05-05 15:04:43', '2022-05-05 15:04:43'),
(667, 5, 36, 'A135 32gb black oylik', 'Oylik', NULL, '2022-05-05 15:06:14', '2022-05-05 15:09:07'),
(668, 5, 36, 'A135 32gb blue oylik', 'Oylik', NULL, '2022-05-05 15:06:56', '2022-05-05 15:09:25'),
(669, 5, 36, 'A135 4+128gb black oylik', 'Oylik', NULL, '2022-05-05 15:10:11', '2022-05-05 15:10:11'),
(670, 5, 36, 'A135 4+128gb blue oylik', 'Oylik', NULL, '2022-05-05 15:10:25', '2022-05-05 15:10:25'),
(671, 5, 36, 'A135 4+64gb black oylik', 'Oylik', NULL, '2022-05-05 15:10:36', '2022-05-05 15:10:36'),
(672, 5, 36, 'A226 5G 64gb Black oylik', 'Oylik', NULL, '2022-05-05 15:11:34', '2022-05-05 15:11:34'),
(673, 5, 36, 'A235 4+64gb black oylik', 'Oylik', NULL, '2022-05-05 15:13:29', '2022-05-05 15:13:29'),
(674, 5, 36, 'M325 4+64gb black indian', 'M seria', NULL, '2022-05-05 15:18:20', '2022-05-05 15:18:20'),
(675, 5, 35, 'Note 10 4+128GB 5G Gray EU', 'Global', NULL, '2022-05-05 15:27:33', '2022-05-05 15:27:33'),
(676, 5, 35, 'Note 11 4+64GB Gray EU', 'Global', NULL, '2022-05-05 15:28:55', '2022-05-05 15:28:55'),
(677, 5, 35, 'Note 11S 8+128GB Gray EU', 'Global', NULL, '2022-05-05 15:29:38', '2022-05-05 15:29:38'),
(678, 5, 35, 'Redmi 9C 4+128gb gray EU', 'Global', NULL, '2022-05-05 15:30:32', '2022-05-05 15:30:32'),
(679, 5, 35, 'Note 10 4+128GB 5G Silver CN', 'China', NULL, '2022-05-05 16:02:09', '2022-05-05 16:02:09');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(311, '2022_01_12_123810_create_stock_payments_table', 2),
(300, '2022_01_14_172856_create_transfers_table', 1),
(301, '2022_01_14_193541_create_client_payments_table', 1),
(302, '2022_01_20_122908_create_price_types_table', 1),
(303, '2022_01_31_151237_create_converts_table', 1),
(304, '2022_02_12_161148_create_client_operations_table', 1),
(305, '2022_02_12_193817_create_stock_operations_table', 1),
(306, '2022_02_15_125503_create_tests_table', 1),
(307, '2022_02_28_175636_create_sums_table', 1),
(313, '2022_04_11_102507_create_permission_tables', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 5),
(8, 'App\\Models\\User', 8),
(9, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `order_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `discount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text COLLATE utf8mb4_unicode_ci,
  `products_price` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_type` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `date_agreement` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_agreement` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_payment` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_agreement_month` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `every_days` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `text`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5, 'Ruxsatlar ro\'yhati', 'role-list', 'web', '2022-04-11 07:52:05', '2022-04-11 09:27:59'),
(2, 'Ruxsat yaratish', 'role-create', 'web', '2022-04-11 07:52:05', '2022-04-11 09:28:11'),
(3, 'Ruxsat o\'zgartirish', 'role-edit', 'web', '2022-04-11 07:52:05', '2022-04-11 09:28:27'),
(4, 'Ruxsat o\'chirish', 'role-delete', 'web', '2022-04-11 07:52:05', '2022-04-11 09:28:40'),
(1, 'Asosiy Panel', 'dashboard', 'web', '2022-04-11 07:50:05', '2022-04-11 07:50:05'),
(7, 'Ruxsatlar ro\'yhati', 'permisssion-list', 'web', '2022-04-11 08:54:34', '2022-04-11 08:54:34'),
(8, 'Xodimlar', 'user-list', 'web', '2022-04-11 08:55:45', '2022-04-11 08:55:45'),
(9, 'Ombor Punkti', 'stock', 'web', '2022-04-11 09:18:29', '2022-04-11 09:18:29'),
(10, 'Omborlar', 'stocks', 'web', '2022-04-11 09:18:52', '2022-04-11 09:18:52'),
(11, 'Ombor To\'lov', 'stock_payments', 'web', '2022-04-11 09:19:09', '2022-04-11 09:19:09'),
(12, 'Valyuta ayirboshlash', 'converts', 'web', '2022-04-11 09:19:17', '2022-04-11 09:19:17'),
(13, 'Narx turi', 'price_types', 'web', '2022-04-11 09:19:31', '2022-04-11 09:19:31'),
(14, 'Mahsulotlar', 'products', 'web', '2022-04-11 09:19:38', '2022-04-11 09:19:38'),
(15, 'Model', 'model', 'web', '2022-04-11 09:19:51', '2022-04-11 09:19:51'),
(16, 'Tur / Brend', 'brands', 'web', '2022-04-11 09:20:00', '2022-04-11 09:20:00'),
(17, 'Mijozlar', 'clients', 'web', '2022-04-11 09:20:19', '2022-04-11 09:20:19'),
(18, 'Savdo', 'trade', 'web', '2022-04-11 09:20:40', '2022-04-11 09:20:40'),
(19, 'Naqd savdo', 'trade_cash', 'web', '2022-04-11 09:21:18', '2022-04-11 09:21:18'),
(20, 'Nasiya', 'trade_loan', 'web', '2022-04-11 09:21:38', '2022-04-11 09:21:38'),
(21, 'Muddatli to\'lov', 'trade_installment', 'web', '2022-04-11 09:21:46', '2022-04-11 09:21:46'),
(22, 'Kirim', 'trade_income', 'web', '2022-04-11 09:21:54', '2022-04-11 09:21:54'),
(23, 'Mahsulot qaytishi', 'trade_return', 'web', '2022-04-11 09:22:02', '2022-04-11 09:22:02'),
(24, 'Mahsulot o\'tkazma', 'trade_transfer', 'web', '2022-04-11 09:22:15', '2022-04-11 09:22:15'),
(25, 'Valyuta farqi', 'currency_differences', 'web', '2022-04-11 09:22:30', '2022-04-11 09:22:30');

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `price_types`
--

CREATE TABLE `price_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `price_types`
--

INSERT INTO `price_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Malika', '2022-04-13 11:47:40', '2022-04-13 11:47:40'),
(3, 'Viloyat', '2022-04-13 11:47:55', '2022-04-13 11:47:55');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_acc_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `mark_id` int(11) DEFAULT NULL,
  `imei` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sell_price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `stock_acc_id`, `stock_id`, `user_id`, `shipment_id`, `invoice_id`, `mark_id`, `imei`, `price`, `bonus`, `expense`, `cost`, `sell_price`, `stock_price`, `order_id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1230, 16, 15, 9, 382, 21, 624, 'Код-tPjF1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1229, 16, 15, 9, 382, 21, 624, 'Код-YngE1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1228, 16, 15, 9, 382, 21, 624, 'Код-3gKU1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1227, 16, 15, 9, 382, 21, 624, 'Код-56ju1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1202, 16, 15, 9, 379, 21, 673, 'Код-Es8l1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1201, 16, 15, 9, 379, 21, 673, 'Код-b8yc1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1200, 16, 15, 9, 379, 21, 673, 'Код-g2k21651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(1199, 16, 15, 9, 379, 21, 673, 'Код-YXw41651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:26'),
(709, 16, 15, 8, 270, 20, 666, 'Код-kCib1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(708, 16, 15, 8, 270, 20, 666, 'Код-mH4b1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(707, 16, 15, 8, 270, 20, 666, 'Код-7UQQ1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(706, 16, 15, 8, 270, 20, 666, 'Код-Ngke1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(705, 16, 15, 8, 270, 20, 666, 'Код-NJwZ1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(704, 16, 15, 8, 270, 20, 666, 'Код-Rv3I1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(703, 16, 15, 8, 270, 20, 666, 'Код-cKPu1651755917', '155.94', NULL, '0', '155.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:05:17', '2022-05-07 13:37:26'),
(702, 16, 15, 8, 269, 19, 665, 'Код-rod51651751744', '431', NULL, '0', '431', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:55:44', '2022-05-07 13:37:26'),
(701, 16, 15, 8, 269, 19, 665, 'Код-3uNn1651751744', '431', NULL, '0', '431', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:55:44', '2022-05-07 13:37:26'),
(700, 16, 15, 8, 269, 19, 665, 'Код-CqNl1651751744', '431', NULL, '0', '431', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:55:44', '2022-05-07 13:37:26'),
(699, 16, 15, 8, 269, 19, 665, 'Код-RNNN1651751744', '431', NULL, '0', '431', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:55:44', '2022-05-07 13:37:26'),
(698, 16, 15, 8, 269, 19, 665, 'Код-aO1p1651751744', '431', NULL, '0', '431', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:55:44', '2022-05-07 13:37:26'),
(697, 16, 15, 8, 268, 18, 649, 'Код-A7Cy1651751683', '160.76', NULL, '0', '160.76', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(696, 16, 15, 8, 267, 18, 648, 'Код-Z8Xd1651751683', '160.76', NULL, '0', '160.76', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(695, 16, 15, 8, 266, 18, 660, 'Код-lp2V1651751683', '381.1', NULL, '0', '381.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(694, 16, 15, 8, 265, 18, 664, 'Код-JCTU1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(693, 16, 15, 8, 265, 18, 664, 'Код-Ncrx1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(692, 16, 15, 8, 265, 18, 664, 'Код-H6z71651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(691, 16, 15, 8, 265, 18, 664, 'Код-1yA11651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(690, 16, 15, 8, 265, 18, 664, 'Код-9KjE1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(689, 16, 15, 8, 264, 18, 663, 'Код-pSAz1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(688, 16, 15, 8, 264, 18, 663, 'Код-VudM1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(687, 16, 15, 8, 264, 18, 663, 'Код-HXPe1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(686, 16, 15, 8, 264, 18, 663, 'Код-bl6t1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(685, 16, 15, 8, 264, 18, 663, 'Код-Ixif1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(684, 16, 15, 8, 264, 18, 663, 'Код-Bxal1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(683, 16, 15, 8, 264, 18, 663, 'Код-VVgT1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(682, 16, 15, 8, 264, 18, 663, 'Код-C1Em1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(681, 16, 15, 8, 264, 18, 663, 'Код-5SgJ1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(680, 16, 15, 8, 264, 18, 663, 'Код-EgFw1651751683', '333.94', NULL, '0', '333.94', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(679, 16, 15, 8, 263, 18, 662, 'Код-uvrS1651751683', '242.39', NULL, '0', '242.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(678, 16, 15, 8, 263, 18, 662, 'Код-yJKA1651751683', '242.39', NULL, '0', '242.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(677, 16, 15, 8, 263, 18, 662, 'Код-zJuS1651751683', '242.39', NULL, '0', '242.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(676, 16, 15, 8, 263, 18, 662, 'Код-uHdt1651751683', '242.39', NULL, '0', '242.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(675, 16, 15, 8, 263, 18, 662, 'Код-AD4m1651751683', '242.39', NULL, '0', '242.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(674, 16, 15, 8, 262, 18, 653, 'Код-Xcvp1651751683', '177', NULL, '0', '177', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(673, 16, 15, 8, 262, 18, 653, 'Код-XJnT1651751683', '177', NULL, '0', '177', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(672, 16, 15, 8, 262, 18, 653, 'Код-DEBg1651751683', '177', NULL, '0', '177', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(671, 16, 15, 8, 261, 18, 661, 'Код-vC121651751683', '147', NULL, '0', '147', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(670, 16, 15, 8, 260, 18, 642, 'Код-iL3l1651751683', '155', NULL, '0', '155', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(669, 16, 15, 8, 260, 18, 642, 'Код-Z7R71651751683', '155', NULL, '0', '155', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(668, 16, 15, 8, 260, 18, 642, 'Код-YafG1651751683', '155', NULL, '0', '155', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(667, 16, 15, 8, 259, 18, 641, 'Код-sH811651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(666, 16, 15, 8, 259, 18, 641, 'Код-3TH31651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(665, 16, 15, 8, 259, 18, 641, 'Код-tMlx1651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(664, 16, 15, 8, 259, 18, 641, 'Код-wqDZ1651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(663, 16, 15, 8, 259, 18, 641, 'Код-XXr31651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(662, 16, 15, 8, 259, 18, 641, 'Код-Vm9D1651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(660, 16, 15, 8, 258, 18, 640, 'Код-CbWF1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(659, 16, 15, 8, 258, 18, 640, 'Код-ZE0M1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(658, 16, 15, 8, 258, 18, 640, 'Код-d3UK1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(657, 16, 15, 8, 258, 18, 640, 'Код-1oGw1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(656, 16, 15, 8, 258, 18, 640, 'Код-Cklw1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(655, 16, 15, 8, 258, 18, 640, 'Код-nDkB1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(654, 16, 15, 8, 258, 18, 640, 'Код-Sjj11651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(653, 16, 15, 8, 258, 18, 640, 'Код-XUC41651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(652, 16, 15, 8, 258, 18, 640, 'Код-9Fq01651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(651, 16, 15, 8, 258, 18, 640, 'Код-sQCy1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(650, 16, 15, 8, 258, 18, 640, 'Код-jUzS1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(649, 16, 15, 8, 258, 18, 640, 'Код-C9z01651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(648, 16, 15, 8, 258, 18, 640, 'Код-x2qZ1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(647, 16, 15, 8, 258, 18, 640, 'Код-r3IA1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(646, 16, 15, 8, 258, 18, 640, 'Код-Sou61651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(645, 16, 15, 8, 258, 18, 640, 'Код-7hh71651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(644, 16, 15, 8, 258, 18, 640, 'Код-uDet1651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(643, 16, 15, 8, 258, 18, 640, 'Код-ODc61651751683', '138.33', NULL, '0', '138.33', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(642, 16, 15, 8, 257, 18, 639, 'Код-H6Al1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(641, 16, 15, 8, 257, 18, 639, 'Код-1Y861651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(640, 16, 15, 8, 257, 18, 639, 'Код-BZo91651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(639, 16, 15, 8, 257, 18, 639, 'Код-aQvK1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(638, 16, 15, 8, 257, 18, 639, 'Код-Qttm1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(637, 16, 15, 8, 257, 18, 639, 'Код-Npmz1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(636, 16, 15, 8, 257, 18, 639, 'Код-v8Gi1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(635, 16, 15, 8, 257, 18, 639, 'Код-DHbO1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(634, 16, 15, 8, 257, 18, 639, 'Код-iHvU1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(633, 16, 15, 8, 257, 18, 639, 'Код-hRoL1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(632, 16, 15, 8, 257, 18, 639, 'Код-EZMo1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(631, 16, 15, 8, 257, 18, 639, 'Код-Mp5K1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(630, 16, 15, 8, 257, 18, 639, 'Код-gKNn1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(629, 16, 15, 8, 257, 18, 639, 'Код-ozW11651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(628, 16, 15, 8, 257, 18, 639, 'Код-2mL51651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(627, 16, 15, 8, 257, 18, 639, 'Код-b29S1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(626, 16, 15, 8, 257, 18, 639, 'Код-7TmO1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(625, 16, 15, 8, 257, 18, 639, 'Код-camL1651751683', '138.39', NULL, '0', '138.39', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(624, 16, 15, 8, 256, 18, 638, 'Код-YAHb1651751683', '106', NULL, '0', '106', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(623, 16, 15, 8, 256, 18, 638, 'Код-yrMW1651751683', '106', NULL, '0', '106', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(622, 16, 15, 8, 255, 18, 637, 'Код-UIVk1651751683', '109.5', NULL, '0', '109.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(621, 16, 15, 8, 255, 18, 637, 'Код-2LLr1651751683', '109.5', NULL, '0', '109.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(620, 16, 15, 8, 255, 18, 637, 'Код-8l2a1651751683', '109.5', NULL, '0', '109.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(619, 16, 15, 8, 255, 18, 637, 'Код-yOF11651751683', '109.5', NULL, '0', '109.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(618, 16, 15, 8, 254, 18, 651, 'Код-sbkC1651751683', '116.75', NULL, '0', '116.75', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(617, 16, 15, 8, 254, 18, 651, 'Код-MHiY1651751683', '116.75', NULL, '0', '116.75', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(616, 16, 15, 8, 253, 18, 650, 'Код-mC2K1651751683', '116', NULL, '0', '116', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(615, 16, 15, 8, 253, 18, 650, 'Код-ALZM1651751683', '116', NULL, '0', '116', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(614, 16, 15, 8, 253, 18, 650, 'Код-iINm1651751683', '116', NULL, '0', '116', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(613, 16, 15, 8, 253, 18, 650, 'Код-h4FE1651751683', '116', NULL, '0', '116', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:26'),
(1362, 16, 15, 9, 427, 17, 485, 'Код-osdq1651750919', '10', NULL, '0', '10', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1361, 16, 15, 9, 426, 17, 484, 'Код-voM31651750302', '80', NULL, '0', '80', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1360, 16, 15, 9, 425, 17, 486, 'Код-NVRw1651750919', '17.99', NULL, '0', '17.99', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1359, 16, 15, 9, 424, 17, 487, 'Код-zLWC1651750919', '20.6', NULL, '0', '20.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1358, 16, 15, 9, 423, 17, 494, 'Код-Psfv1651750919', '43', NULL, '0', '43', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1357, 16, 15, 9, 422, 17, 470, 'Код-COAr1651750919', '12.2', NULL, '0', '12.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1356, 16, 15, 9, 421, 17, 495, 'Код-7Ret1651750919', '17', NULL, '0', '17', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1355, 16, 15, 9, 420, 17, 496, 'Код-J4bT1651750919', '14', NULL, '0', '14', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1354, 16, 15, 9, 419, 17, 489, 'Код-e9tb1651750919', '19.8', NULL, '0', '19.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1353, 16, 15, 9, 418, 17, 583, 'Код-e0un1651750919', '27', NULL, '0', '27', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1351, 16, 15, 9, 417, 17, 469, 'Код-Yp1l1651750919', '14.5', NULL, '0', '14.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1350, 16, 15, 9, 416, 17, 497, 'Код-ei7G1651750919', '34.5', NULL, '0', '34.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1349, 16, 15, 9, 415, 17, 498, 'Код-8FGL1651750919', '41.5', NULL, '0', '41.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1348, 16, 15, 9, 414, 17, 490, 'Код-3hxj1651750919', '10', NULL, '0', '10', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1347, 16, 15, 9, 413, 17, 499, 'Код-fnjo1651750919', '31', NULL, '0', '31', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1346, 16, 15, 9, 412, 17, 472, 'Код-WP771651750919', '11.13', NULL, '0', '11.13', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1345, 16, 15, 9, 412, 17, 472, 'Код-MDlx1651750919', '11.13', NULL, '0', '11.13', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1344, 16, 15, 9, 412, 17, 472, 'Код-RrDP1651750919', '11.13', NULL, '0', '11.13', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1343, 16, 15, 9, 412, 17, 472, 'Код-olVO1651750919', '11.13', NULL, '0', '11.13', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1342, 16, 15, 9, 411, 17, 491, 'Код-EfRL1651750919', '31.5', NULL, '0', '31.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1341, 16, 15, 9, 410, 17, 474, 'Код-scug1651750919', '15.5', NULL, '0', '15.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1340, 16, 15, 9, 410, 17, 474, 'Код-wTyq1651750919', '15.5', NULL, '0', '15.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1339, 16, 15, 9, 409, 17, 475, 'Код-HSmT1651750919', '15.5', NULL, '0', '15.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1338, 16, 15, 9, 408, 17, 492, 'Код-QL1d1651750919', '16.5', NULL, '0', '16.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1337, 16, 15, 9, 407, 17, 476, 'Код-zwpx1651750919', '18', NULL, '0', '18', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1336, 16, 15, 9, 406, 17, 478, 'Код-RXOR1651750919', '24.5', NULL, '0', '24.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1335, 16, 15, 9, 406, 17, 478, 'Код-ibQf1651750919', '24.5', NULL, '0', '24.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1334, 16, 15, 9, 406, 17, 478, 'Код-ACS11651750919', '24.5', NULL, '0', '24.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1333, 16, 15, 9, 405, 17, 479, 'Код-TEKl1651750919', '19', NULL, '0', '19', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1331, 16, 15, 9, 404, 17, 493, 'Код-grGk1651750919', '20', NULL, '0', '20', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1332, 16, 15, 9, 405, 17, 479, 'Код-iO3W1651750919', '19', NULL, '0', '19', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(661, 16, 15, 8, 259, 18, 641, 'Код-zI1g1651751683', '138.71', NULL, '0', '138.71', NULL, NULL, NULL, NULL, NULL, '2022-05-05 13:54:43', '2022-05-07 13:37:27'),
(1352, 16, 15, 9, 417, 17, 469, 'Код-ewpq1651750919', '14.5', NULL, '0', '14.5', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(1204, 16, 15, 9, 379, 21, 673, 'Код-KZyA1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1205, 16, 15, 9, 379, 21, 673, 'Код-O1OY1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1206, 16, 15, 9, 379, 21, 673, 'Код-j4ap1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1207, 16, 15, 9, 379, 21, 673, 'Код-zbyw1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1208, 16, 15, 9, 380, 21, 620, 'Код-Dxs91651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1209, 16, 15, 9, 380, 21, 620, 'Код-NS2z1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1210, 16, 15, 9, 380, 21, 620, 'Код-Dw011651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1211, 16, 15, 9, 380, 21, 620, 'Код-LkzX1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1212, 16, 15, 9, 380, 21, 620, 'Код-q4lr1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1213, 16, 15, 9, 380, 21, 620, 'Код-cYwM1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1214, 16, 15, 9, 380, 21, 620, 'Код-8KGA1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1215, 16, 15, 9, 380, 21, 620, 'Код-93bk1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1216, 16, 15, 9, 380, 21, 620, 'Код-ALX31651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1217, 16, 15, 9, 380, 21, 620, 'Код-kgXW1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1218, 16, 15, 9, 380, 21, 620, 'Код-9Q4T1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1219, 16, 15, 9, 380, 21, 620, 'Код-PYMk1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1220, 16, 15, 9, 380, 21, 620, 'Код-KMRL1651756598', '243.48', NULL, '0', '243.48', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1221, 16, 15, 9, 381, 21, 621, 'Код-OEPq1651756598', '249.2', NULL, '0', '249.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1222, 16, 15, 9, 381, 21, 621, 'Код-BC1O1651756598', '249.2', NULL, '0', '249.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1223, 16, 15, 9, 381, 21, 621, 'Код-duoY1651756598', '249.2', NULL, '0', '249.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1224, 16, 15, 9, 381, 21, 621, 'Код-xYXD1651756598', '249.2', NULL, '0', '249.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1225, 16, 15, 9, 381, 21, 621, 'Код-nv0w1651756598', '249.2', NULL, '0', '249.2', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1226, 16, 15, 9, 382, 21, 624, 'Код-FK4w1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1234, 16, 15, 9, 383, 21, 623, 'Код-KhIQ1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(818, 16, 15, 8, 290, 22, 601, 'Код-Mslp1651756892', '152.1', NULL, '0', '152.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(819, 16, 15, 8, 290, 22, 601, 'Код-7caW1651756892', '152.1', NULL, '0', '152.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(820, 16, 15, 8, 291, 22, 602, 'Код-4UBU1651756892', '181.1', NULL, '0', '181.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(821, 16, 15, 8, 292, 22, 603, 'Код-IGPd1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(822, 16, 15, 8, 292, 22, 603, 'Код-kDx41651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(823, 16, 15, 8, 292, 22, 603, 'Код-ajJU1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(824, 16, 15, 8, 292, 22, 603, 'Код-IKWf1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(825, 16, 15, 8, 292, 22, 603, 'Код-NEfw1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(826, 16, 15, 8, 292, 22, 603, 'Код-y9Nt1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(827, 16, 15, 8, 292, 22, 603, 'Код-5FSt1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(828, 16, 15, 8, 292, 22, 603, 'Код-gxud1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(829, 16, 15, 8, 292, 22, 603, 'Код-HGNc1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(830, 16, 15, 8, 292, 22, 603, 'Код-EoZy1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(831, 16, 15, 8, 292, 22, 603, 'Код-1bOZ1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(832, 16, 15, 8, 292, 22, 603, 'Код-ENoO1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(833, 16, 15, 8, 292, 22, 603, 'Код-5hjh1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(834, 16, 15, 8, 292, 22, 603, 'Код-RZ281651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(835, 16, 15, 8, 292, 22, 603, 'Код-oiF71651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(836, 16, 15, 8, 292, 22, 603, 'Код-QOaf1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(837, 16, 15, 8, 292, 22, 603, 'Код-VZoz1651756892', '182.21', NULL, '0', '182.21', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(838, 16, 15, 8, 293, 22, 604, 'Код-GQXI1651756892', '220', NULL, '0', '220', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(839, 16, 15, 8, 293, 22, 604, 'Код-P6Aa1651756892', '220', NULL, '0', '220', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(840, 16, 15, 8, 294, 22, 674, 'Код-sYWl1651756892', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(841, 16, 15, 8, 295, 22, 607, 'Код-bgqE1651756892', '216.1', NULL, '0', '216.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(842, 16, 15, 8, 296, 22, 608, 'Код-yAIe1651756892', '349.6', NULL, '0', '349.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(843, 16, 15, 8, 296, 22, 608, 'Код-2dek1651756892', '349.6', NULL, '0', '349.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(844, 16, 15, 8, 296, 22, 608, 'Код-LIbD1651756892', '349.6', NULL, '0', '349.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:21:32', '2022-05-07 13:37:27'),
(845, 16, 15, 8, 297, 23, 481, 'Код-C1no1651756937', '14.5', NULL, '0', '14.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:22:17', '2022-05-07 13:37:27'),
(846, 16, 15, 8, 297, 23, 481, 'Код-fjlT1651756937', '14.5', NULL, '0', '14.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:22:17', '2022-05-07 13:37:27'),
(847, 16, 15, 8, 298, 23, 483, 'Код-s6as1651756937', '15', NULL, '0', '15', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:22:17', '2022-05-07 13:37:27'),
(848, 16, 15, 8, 299, 23, 480, 'Код-WbYe1651756937', '20.5', NULL, '0', '20.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:22:17', '2022-05-07 13:37:27'),
(849, 16, 15, 8, 300, 24, 633, 'Код-PpAJ1651757055', '345', NULL, '0', '345', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:15', '2022-05-07 13:37:27'),
(850, 16, 15, 8, 301, 24, 634, 'Код-nVt21651757055', '444.6', NULL, '0', '444.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:15', '2022-05-07 13:37:27'),
(851, 16, 15, 8, 301, 24, 634, 'Код-3OWq1651757055', '444.6', NULL, '0', '444.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:15', '2022-05-07 13:37:27'),
(852, 16, 15, 8, 302, 24, 635, 'Код-kXQ81651757055', '494.6', NULL, '0', '494.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:15', '2022-05-07 13:37:27'),
(853, 16, 15, 8, 302, 24, 635, 'Код-LP9j1651757055', '494.6', NULL, '0', '494.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:15', '2022-05-07 13:37:27'),
(854, 16, 15, 8, 303, 25, 598, 'Код-lqM51651757073', '321.1', NULL, '0', '321.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:33', '2022-05-07 13:37:27'),
(855, 16, 15, 8, 303, 25, 598, 'Код-ChAD1651757073', '321.1', NULL, '0', '321.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:33', '2022-05-07 13:37:27'),
(856, 16, 15, 8, 303, 25, 598, 'Код-hyCV1651757073', '321.1', NULL, '0', '321.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:33', '2022-05-07 13:37:27'),
(857, 16, 15, 8, 303, 25, 598, 'Код-Bz181651757073', '321.1', NULL, '0', '321.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:24:33', '2022-05-07 13:37:27'),
(858, 16, 15, 8, 304, 26, 584, 'Код-NnrL1651757182', '197.16', NULL, '0', '197.16', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(859, 16, 15, 8, 304, 26, 584, 'Код-kV1f1651757182', '197.16', NULL, '0', '197.16', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(860, 16, 15, 8, 305, 26, 585, 'Код-Viok1651757182', '245.7', NULL, '0', '245.7', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(861, 16, 15, 8, 305, 26, 585, 'Код-XkIO1651757182', '245.7', NULL, '0', '245.7', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(862, 16, 15, 8, 305, 26, 585, 'Код-aFC01651757182', '245.7', NULL, '0', '245.7', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(863, 16, 15, 8, 305, 26, 585, 'Код-C8n81651757182', '245.7', NULL, '0', '245.7', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(864, 16, 15, 8, 305, 26, 585, 'Код-eu0C1651757182', '245.7', NULL, '0', '245.7', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(865, 16, 15, 8, 306, 26, 588, 'Код-pqQC1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(866, 16, 15, 8, 306, 26, 588, 'Код-UdC11651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(867, 16, 15, 8, 306, 26, 588, 'Код-6r9I1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(868, 16, 15, 8, 306, 26, 588, 'Код-e28A1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(869, 16, 15, 8, 306, 26, 588, 'Код-2fjU1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(870, 16, 15, 8, 306, 26, 588, 'Код-cAVu1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(871, 16, 15, 8, 306, 26, 588, 'Код-ydN11651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(872, 16, 15, 8, 306, 26, 588, 'Код-kmpM1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(873, 16, 15, 8, 306, 26, 588, 'Код-OyJP1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(874, 16, 15, 8, 306, 26, 588, 'Код-YYt71651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(875, 16, 15, 8, 306, 26, 588, 'Код-JpHo1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(876, 16, 15, 8, 306, 26, 588, 'Код-Gm0C1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(877, 16, 15, 8, 306, 26, 588, 'Код-cU6Q1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(878, 16, 15, 8, 306, 26, 588, 'Код-BZ2w1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(879, 16, 15, 8, 306, 26, 588, 'Код-sM3N1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(880, 16, 15, 8, 306, 26, 588, 'Код-tlVg1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(881, 16, 15, 8, 306, 26, 588, 'Код-5cq01651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(882, 16, 15, 8, 306, 26, 588, 'Код-0SRL1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(883, 16, 15, 8, 306, 26, 588, 'Код-vuN01651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(884, 16, 15, 8, 306, 26, 588, 'Код-rlM51651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(885, 16, 15, 8, 306, 26, 588, 'Код-5iOm1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(886, 16, 15, 8, 306, 26, 588, 'Код-fz0S1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(887, 16, 15, 8, 306, 26, 588, 'Код-EOzq1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(888, 16, 15, 8, 306, 26, 588, 'Код-8pO21651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(889, 16, 15, 8, 306, 26, 588, 'Код-WbyN1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(890, 16, 15, 8, 306, 26, 588, 'Код-Y5x71651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(891, 16, 15, 8, 306, 26, 588, 'Код-guf01651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(892, 16, 15, 8, 306, 26, 588, 'Код-xA6N1651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(893, 16, 15, 8, 306, 26, 588, 'Код-Se481651757182', '272.79', NULL, '0', '272.79', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(894, 16, 15, 8, 307, 26, 589, 'Код-JECk1651757182', '274.6', NULL, '0', '274.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(895, 16, 15, 8, 307, 26, 589, 'Код-Ysl51651757182', '274.6', NULL, '0', '274.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(896, 16, 15, 8, 307, 26, 589, 'Код-rcdH1651757182', '274.6', NULL, '0', '274.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(897, 16, 15, 8, 307, 26, 589, 'Код-hFwf1651757182', '274.6', NULL, '0', '274.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(898, 16, 15, 8, 308, 26, 590, 'Код-3Ayx1651757182', '275.1', NULL, '0', '275.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(899, 16, 15, 8, 309, 26, 591, 'Код-WG0c1651757182', '221.6', NULL, '0', '221.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(900, 16, 15, 8, 310, 26, 592, 'Код-hH5p1651757182', '225.5', NULL, '0', '225.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(901, 16, 15, 8, 311, 26, 593, 'Код-pARq1651757182', '225.5', NULL, '0', '225.5', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(902, 16, 15, 8, 312, 26, 594, 'Код-MrxY1651757182', '119.83', NULL, '0', '119.83', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(903, 16, 15, 8, 312, 26, 594, 'Код-fzxn1651757182', '119.83', NULL, '0', '119.83', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(904, 16, 15, 8, 312, 26, 594, 'Код-Ul8F1651757182', '119.83', NULL, '0', '119.83', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(905, 16, 15, 8, 312, 26, 594, 'Код-xpNK1651757182', '119.83', NULL, '0', '119.83', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(906, 16, 15, 8, 313, 26, 595, 'Код-ZDVZ1651757182', '119.1', NULL, '0', '119.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(907, 16, 15, 8, 314, 26, 596, 'Код-6lfm1651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(908, 16, 15, 8, 314, 26, 596, 'Код-6J861651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(909, 16, 15, 8, 314, 26, 596, 'Код-hB2L1651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(910, 16, 15, 8, 314, 26, 596, 'Код-2meB1651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(911, 16, 15, 8, 314, 26, 596, 'Код-BBEG1651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(912, 16, 15, 8, 314, 26, 596, 'Код-XPqY1651757182', '137.6', NULL, '0', '137.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 15:26:22', '2022-05-07 13:37:27'),
(913, 16, 15, 8, 315, 27, 526, 'Код-uZQx1651759227', '260.1', NULL, '0', '260.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(914, 16, 15, 8, 316, 27, 527, 'Код-Wy8G1651759227', '318.34', NULL, '0', '318.34', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(915, 16, 15, 8, 317, 27, 531, 'Код-OamM1651759227', '498.6', NULL, '0', '498.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(916, 16, 15, 8, 318, 27, 532, 'Код-ltFH1651759227', '498.6', NULL, '0', '498.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(917, 16, 15, 8, 318, 27, 532, 'Код-Xyq01651759227', '498.6', NULL, '0', '498.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(918, 16, 15, 8, 319, 27, 675, 'Код-CuGR1651759227', '185.1', NULL, '0', '185.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(919, 16, 15, 8, 320, 27, 535, 'Код-T6rP1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(920, 16, 15, 8, 320, 27, 535, 'Код-guC81651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(921, 16, 15, 8, 320, 27, 535, 'Код-5Yvu1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(922, 16, 15, 8, 320, 27, 535, 'Код-lSyO1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(923, 16, 15, 8, 320, 27, 535, 'Код-lzz51651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(924, 16, 15, 8, 320, 27, 535, 'Код-cp4X1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(925, 16, 15, 8, 320, 27, 535, 'Код-ctzC1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(926, 16, 15, 8, 320, 27, 535, 'Код-TkEU1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(927, 16, 15, 8, 320, 27, 535, 'Код-4gkV1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(928, 16, 15, 8, 320, 27, 535, 'Код-YDP51651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(929, 16, 15, 8, 320, 27, 535, 'Код-MCp61651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(930, 16, 15, 8, 320, 27, 535, 'Код-U2jd1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(931, 16, 15, 8, 320, 27, 535, 'Код-qkGs1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(932, 16, 15, 8, 320, 27, 535, 'Код-lV9a1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(933, 16, 15, 8, 320, 27, 535, 'Код-abAj1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(934, 16, 15, 8, 320, 27, 535, 'Код-qCcl1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(935, 16, 15, 8, 320, 27, 535, 'Код-4oFw1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(936, 16, 15, 8, 320, 27, 535, 'Код-YVGd1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(937, 16, 15, 8, 320, 27, 535, 'Код-CGka1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(938, 16, 15, 8, 320, 27, 535, 'Код-SXsD1651759227', '282.6', NULL, '0', '282.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(939, 16, 15, 8, 321, 27, 536, 'Код-xv6F1651759227', '300.1', NULL, '0', '300.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(940, 16, 15, 8, 322, 27, 537, 'Код-zrNU1651759227', '292.69', NULL, '0', '292.69', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(941, 16, 15, 8, 322, 27, 537, 'Код-7wXq1651759227', '292.69', NULL, '0', '292.69', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(942, 16, 15, 8, 322, 27, 537, 'Код-QFcA1651759227', '292.69', NULL, '0', '292.69', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(943, 16, 15, 8, 323, 27, 538, 'Код-ZwyL1651759227', '319.1', NULL, '0', '319.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(944, 16, 15, 8, 324, 27, 540, 'Код-W3YH1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(945, 16, 15, 8, 324, 27, 540, 'Код-KuBU1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(946, 16, 15, 8, 324, 27, 540, 'Код-vUiQ1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(947, 16, 15, 8, 324, 27, 540, 'Код-9wuf1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(948, 16, 15, 8, 324, 27, 540, 'Код-NvRd1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(949, 16, 15, 8, 324, 27, 540, 'Код-ehNT1651759227', '229.93', NULL, '0', '229.93', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(950, 16, 15, 8, 325, 27, 541, 'Код-6Xyi1651759227', '223.45', NULL, '0', '223.45', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(951, 16, 15, 8, 325, 27, 541, 'Код-GqMa1651759227', '223.45', NULL, '0', '223.45', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(952, 16, 15, 8, 325, 27, 541, 'Код-UMPQ1651759227', '223.45', NULL, '0', '223.45', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(953, 16, 15, 8, 325, 27, 541, 'Код-kl6x1651759227', '223.45', NULL, '0', '223.45', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(954, 16, 15, 8, 326, 27, 542, 'Код-XMAz1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(955, 16, 15, 8, 326, 27, 542, 'Код-DDKG1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(956, 16, 15, 8, 326, 27, 542, 'Код-X8w11651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(957, 16, 15, 8, 326, 27, 542, 'Код-JR281651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(958, 16, 15, 8, 326, 27, 542, 'Код-424f1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(959, 16, 15, 8, 326, 27, 542, 'Код-NLlh1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(960, 16, 15, 8, 326, 27, 542, 'Код-q54e1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(961, 16, 15, 8, 326, 27, 542, 'Код-heJs1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(962, 16, 15, 8, 326, 27, 542, 'Код-E1Zq1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(963, 16, 15, 8, 326, 27, 542, 'Код-KymO1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(964, 16, 15, 8, 326, 27, 542, 'Код-WBSg1651759227', '232.65', NULL, '0', '232.65', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(965, 16, 15, 8, 327, 27, 543, 'Код-zerY1651759227', '217.1', NULL, '0', '217.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(966, 16, 15, 8, 327, 27, 543, 'Код-FBtA1651759227', '217.1', NULL, '0', '217.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(967, 16, 15, 8, 328, 27, 544, 'Код-ocxV1651759227', '209.6', NULL, '0', '209.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(968, 16, 15, 8, 329, 27, 545, 'Код-LtV81651759227', '212.3', NULL, '0', '212.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(969, 16, 15, 8, 329, 27, 545, 'Код-NxAQ1651759227', '212.3', NULL, '0', '212.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(970, 16, 15, 8, 329, 27, 545, 'Код-LyRm1651759227', '212.3', NULL, '0', '212.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(971, 16, 15, 8, 329, 27, 545, 'Код-C3Fm1651759227', '212.3', NULL, '0', '212.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27');
INSERT INTO `products` (`id`, `stock_acc_id`, `stock_id`, `user_id`, `shipment_id`, `invoice_id`, `mark_id`, `imei`, `price`, `bonus`, `expense`, `cost`, `sell_price`, `stock_price`, `order_id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(972, 16, 15, 8, 329, 27, 545, 'Код-ThVr1651759227', '212.3', NULL, '0', '212.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(973, 16, 15, 8, 330, 27, 676, 'Код-4qlG1651759227', '182.1', NULL, '0', '182.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(974, 16, 15, 8, 331, 27, 549, 'Код-RatO1651759227', '204.66', NULL, '0', '204.66', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(975, 16, 15, 8, 332, 27, 558, 'Код-FBxf1651759227', '303.6', NULL, '0', '303.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(976, 16, 15, 8, 332, 27, 558, 'Код-m7ci1651759227', '303.6', NULL, '0', '303.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(977, 16, 15, 8, 333, 27, 565, 'Код-VANl1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(978, 16, 15, 8, 333, 27, 565, 'Код-JQxc1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(979, 16, 15, 8, 333, 27, 565, 'Код-DCMX1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(980, 16, 15, 8, 333, 27, 565, 'Код-rkXi1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(981, 16, 15, 8, 333, 27, 565, 'Код-BQWV1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(982, 16, 15, 8, 333, 27, 565, 'Код-JXGk1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(983, 16, 15, 8, 333, 27, 565, 'Код-oFVX1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(984, 16, 15, 8, 333, 27, 565, 'Код-QoHU1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(985, 16, 15, 8, 333, 27, 565, 'Код-lQ1F1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(986, 16, 15, 8, 333, 27, 565, 'Код-DyrH1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(987, 16, 15, 8, 333, 27, 565, 'Код-VeTA1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(988, 16, 15, 8, 333, 27, 565, 'Код-7SQh1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(989, 16, 15, 8, 334, 27, 566, 'Код-B5pR1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(990, 16, 15, 8, 334, 27, 566, 'Код-iDzd1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(991, 16, 15, 8, 334, 27, 566, 'Код-iaTF1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(992, 16, 15, 8, 334, 27, 566, 'Код-PLCL1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(993, 16, 15, 8, 334, 27, 566, 'Код-p0hP1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(994, 16, 15, 8, 334, 27, 566, 'Код-zsxk1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(995, 16, 15, 8, 334, 27, 566, 'Код-qdT91651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(996, 16, 15, 8, 334, 27, 566, 'Код-QNGo1651759227', '246.1', NULL, '0', '246.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(997, 16, 15, 8, 335, 27, 567, 'Код-ypqr1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(998, 16, 15, 8, 335, 27, 567, 'Код-WtF81651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(999, 16, 15, 8, 335, 27, 567, 'Код-ZTK71651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1000, 16, 15, 8, 335, 27, 567, 'Код-XRqQ1651759227', '247.1', NULL, '0', '247.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1001, 16, 15, 8, 336, 27, 568, 'Код-sG8l1651759227', '263.1', NULL, '0', '263.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1002, 16, 15, 8, 336, 27, 568, 'Код-8iqv1651759227', '263.1', NULL, '0', '263.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1003, 16, 15, 8, 336, 27, 568, 'Код-RE5K1651759227', '263.1', NULL, '0', '263.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1004, 16, 15, 8, 336, 27, 568, 'Код-pnlC1651759227', '263.1', NULL, '0', '263.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1005, 16, 15, 8, 336, 27, 568, 'Код-87Gt1651759227', '263.1', NULL, '0', '263.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1006, 16, 15, 8, 337, 27, 677, 'Код-pGgp1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1007, 16, 15, 8, 337, 27, 677, 'Код-Oh1e1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1008, 16, 15, 8, 337, 27, 677, 'Код-vfuW1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1009, 16, 15, 8, 337, 27, 677, 'Код-3fOF1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1010, 16, 15, 8, 337, 27, 677, 'Код-MXOg1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1011, 16, 15, 8, 337, 27, 677, 'Код-FVWs1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1012, 16, 15, 8, 337, 27, 677, 'Код-8Gc61651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1013, 16, 15, 8, 337, 27, 677, 'Код-jsqb1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1014, 16, 15, 8, 337, 27, 677, 'Код-Inhu1651759227', '255.47', NULL, '0', '255.47', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1015, 16, 15, 8, 338, 27, 569, 'Код-4glS1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1016, 16, 15, 8, 338, 27, 569, 'Код-VMLZ1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1017, 16, 15, 8, 338, 27, 569, 'Код-knha1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1018, 16, 15, 8, 338, 27, 569, 'Код-zUOV1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1019, 16, 15, 8, 338, 27, 569, 'Код-Pxeg1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1020, 16, 15, 8, 338, 27, 569, 'Код-TJMW1651759227', '262.01', NULL, '0', '262.01', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1021, 16, 15, 8, 339, 27, 570, 'Код-1Izv1651759227', '333.1', NULL, '0', '333.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1022, 16, 15, 8, 340, 27, 524, 'Код-SuCY1651759227', '193', NULL, '0', '193', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1023, 16, 15, 8, 341, 27, 525, 'Код-6bfd1651759227', '183.6', NULL, '0', '183.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1024, 16, 15, 8, 341, 27, 525, 'Код-1b8u1651759227', '183.6', NULL, '0', '183.6', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1025, 16, 15, 8, 342, 27, 577, 'Код-AAjI1651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1026, 16, 15, 8, 342, 27, 577, 'Код-INiP1651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1027, 16, 15, 8, 342, 27, 577, 'Код-9qo01651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1028, 16, 15, 8, 343, 27, 578, 'Код-YCxL1651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1029, 16, 15, 8, 343, 27, 578, 'Код-lNut1651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1030, 16, 15, 8, 343, 27, 578, 'Код-osAc1651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1031, 16, 15, 8, 343, 27, 578, 'Код-ZeVA1651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1032, 16, 15, 8, 343, 27, 578, 'Код-4TiH1651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1033, 16, 15, 8, 343, 27, 578, 'Код-VMs71651759227', '108.59', NULL, '0', '108.59', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1034, 16, 15, 8, 344, 27, 579, 'Код-tPbB1651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1035, 16, 15, 8, 344, 27, 579, 'Код-y8YZ1651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1036, 16, 15, 8, 344, 27, 579, 'Код-fPAy1651759227', '116.04', NULL, '0', '116.04', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1037, 16, 15, 8, 345, 27, 580, 'Код-QcIK1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1038, 16, 15, 8, 345, 27, 580, 'Код-Gdzj1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1039, 16, 15, 8, 345, 27, 580, 'Код-6fs01651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1040, 16, 15, 8, 345, 27, 580, 'Код-OpWG1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1041, 16, 15, 8, 345, 27, 580, 'Код-i4eL1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1042, 16, 15, 8, 345, 27, 580, 'Код-YWnZ1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1043, 16, 15, 8, 346, 27, 678, 'Код-1JCD1651759227', '149.3', NULL, '0', '149.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1044, 16, 15, 8, 346, 27, 678, 'Код-H6vd1651759227', '149.3', NULL, '0', '149.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1045, 16, 15, 8, 346, 27, 678, 'Код-jtre1651759227', '149.3', NULL, '0', '149.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1046, 16, 15, 8, 346, 27, 678, 'Код-Y0YN1651759227', '149.3', NULL, '0', '149.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1047, 16, 15, 8, 346, 27, 678, 'Код-fWvK1651759227', '149.3', NULL, '0', '149.3', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1048, 16, 15, 8, 347, 27, 581, 'Код-xgQN1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1049, 16, 15, 8, 347, 27, 581, 'Код-NrKH1651759227', '158.31', NULL, '0', '158.31', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1050, 16, 15, 8, 348, 27, 582, 'Код-4OpZ1651759227', '161.1', NULL, '0', '161.1', NULL, NULL, NULL, NULL, NULL, '2022-05-05 16:00:27', '2022-05-07 13:37:27'),
(1203, 16, 15, 9, 379, 21, 673, 'Код-gtT01651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1231, 16, 15, 9, 382, 21, 624, 'Код-n6qU1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1232, 16, 15, 9, 382, 21, 624, 'Код-qdWs1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1243, 16, 15, 9, 384, 21, 628, 'Код-S9At1651756598', '328.1', NULL, '0', '328.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1242, 16, 15, 9, 383, 21, 623, 'Код-1gAL1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1241, 16, 15, 9, 383, 21, 623, 'Код-zjCx1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1240, 16, 15, 9, 383, 21, 623, 'Код-Ta8G1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1239, 16, 15, 9, 383, 21, 623, 'Код-bV8i1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1238, 16, 15, 9, 383, 21, 623, 'Код-elgP1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1237, 16, 15, 9, 383, 21, 623, 'Код-ltrZ1651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1236, 16, 15, 9, 383, 21, 623, 'Код-TlF41651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1235, 16, 15, 9, 383, 21, 623, 'Код-s4671651756598', '228.1', NULL, '0', '228.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1233, 16, 15, 9, 382, 21, 624, 'Код-mF7L1651756598', '234.1', NULL, '0', '234.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1198, 16, 15, 9, 379, 21, 673, 'Код-sJbI1651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1197, 16, 15, 9, 379, 21, 673, 'Код-XRw01651756598', '215.1', NULL, '0', '215.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1196, 16, 15, 9, 378, 21, 672, 'Код-ioRo1651756598', '196.1', NULL, '0', '196.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1195, 16, 15, 9, 378, 21, 672, 'Код-I48g1651756598', '196.1', NULL, '0', '196.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1194, 16, 15, 9, 377, 21, 617, 'Код-hL3K1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1193, 16, 15, 9, 377, 21, 617, 'Код-fU4B1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1192, 16, 15, 9, 377, 21, 617, 'Код-4jAu1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1191, 16, 15, 9, 377, 21, 617, 'Код-uqgT1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1190, 16, 15, 9, 377, 21, 617, 'Код-86PH1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1189, 16, 15, 9, 377, 21, 617, 'Код-zxda1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1188, 16, 15, 9, 377, 21, 617, 'Код-Des71651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1187, 16, 15, 9, 377, 21, 617, 'Код-W9TV1651756598', '218.73', NULL, '0', '218.73', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1186, 16, 15, 9, 376, 21, 615, 'Код-HFVk1651756598', '221.1', NULL, '0', '221.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1185, 16, 15, 9, 376, 21, 615, 'Код-1y0g1651756598', '221.1', NULL, '0', '221.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1184, 16, 15, 9, 375, 21, 671, 'Код-JujY1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1183, 16, 15, 9, 375, 21, 671, 'Код-tNVY1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1182, 16, 15, 9, 374, 21, 610, 'Код-R1wV1651756598', '161.6', NULL, '0', '161.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1181, 16, 15, 9, 374, 21, 610, 'Код-nBpb1651756598', '161.6', NULL, '0', '161.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1180, 16, 15, 9, 374, 21, 610, 'Код-Dx951651756598', '161.6', NULL, '0', '161.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1179, 16, 15, 9, 374, 21, 610, 'Код-eJ4N1651756598', '161.6', NULL, '0', '161.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1178, 16, 15, 9, 373, 21, 611, 'Код-FTPH1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1177, 16, 15, 9, 373, 21, 611, 'Код-zfLE1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1176, 16, 15, 9, 373, 21, 611, 'Код-Wp8y1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1175, 16, 15, 9, 373, 21, 611, 'Код-dinr1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1174, 16, 15, 9, 373, 21, 611, 'Код-IOHZ1651756598', '180.1', NULL, '0', '180.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1173, 16, 15, 9, 372, 21, 612, 'Код-KZz31651756598', '170.1', NULL, '0', '170.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1172, 16, 15, 9, 372, 21, 612, 'Код-4vZE1651756598', '170.1', NULL, '0', '170.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1171, 16, 15, 9, 371, 21, 614, 'Код-QZfx1651756598', '168.6', NULL, '0', '168.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1170, 16, 15, 9, 370, 21, 667, 'Код-E1dh1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1169, 16, 15, 9, 370, 21, 667, 'Код-uULv1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1168, 16, 15, 9, 370, 21, 667, 'Код-Oi101651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1167, 16, 15, 9, 370, 21, 667, 'Код-lcgj1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1166, 16, 15, 9, 370, 21, 667, 'Код-Gnnr1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1165, 16, 15, 9, 370, 21, 667, 'Код-gvzH1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1164, 16, 15, 9, 369, 21, 668, 'Код-9X7a1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1163, 16, 15, 9, 369, 21, 668, 'Код-Cn8q1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1162, 16, 15, 9, 369, 21, 668, 'Код-jdag1651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1161, 16, 15, 9, 369, 21, 668, 'Код-FuV41651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1160, 16, 15, 9, 369, 21, 668, 'Код-4uI71651756598', '167.1', NULL, '0', '167.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1159, 16, 15, 9, 368, 21, 669, 'Код-7lyA1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1158, 16, 15, 9, 368, 21, 669, 'Код-2vE11651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1157, 16, 15, 9, 368, 21, 669, 'Код-pD121651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1156, 16, 15, 9, 368, 21, 669, 'Код-zxwP1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1155, 16, 15, 9, 368, 21, 669, 'Код-jOzA1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1154, 16, 15, 9, 368, 21, 669, 'Код-ernc1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1153, 16, 15, 9, 368, 21, 669, 'Код-P57l1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1152, 16, 15, 9, 368, 21, 669, 'Код-L91e1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1151, 16, 15, 9, 368, 21, 669, 'Код-8ENi1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1150, 16, 15, 9, 368, 21, 669, 'Код-s6lg1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1149, 16, 15, 9, 368, 21, 669, 'Код-ioOf1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1148, 16, 15, 9, 368, 21, 669, 'Код-uBB41651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1147, 16, 15, 9, 368, 21, 669, 'Код-FXDx1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1146, 16, 15, 9, 368, 21, 669, 'Код-IesT1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1145, 16, 15, 9, 368, 21, 669, 'Код-NyUk1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1144, 16, 15, 9, 368, 21, 669, 'Код-rPZQ1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1143, 16, 15, 9, 368, 21, 669, 'Код-G6zq1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1142, 16, 15, 9, 368, 21, 669, 'Код-Ue611651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1141, 16, 15, 9, 368, 21, 669, 'Код-COhh1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1140, 16, 15, 9, 368, 21, 669, 'Код-mr8x1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1139, 16, 15, 9, 368, 21, 669, 'Код-TfPc1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1138, 16, 15, 9, 368, 21, 669, 'Код-bZWo1651756598', '192.37', NULL, '0', '192.37', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1137, 16, 15, 9, 367, 21, 670, 'Код-T7I01651756598', '192.1', NULL, '0', '192.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27'),
(1330, 16, 15, 9, 403, 28, 520, 'Код-h9GJ1651759542', '170.6', NULL, '0', '170.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1329, 16, 15, 9, 403, 28, 520, 'Код-T2YK1651759542', '170.6', NULL, '0', '170.6', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1328, 16, 15, 9, 402, 28, 519, 'Код-ArO81651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1327, 16, 15, 9, 402, 28, 519, 'Код-hgOa1651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1326, 16, 15, 9, 402, 28, 519, 'Код-zLx41651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1325, 16, 15, 9, 402, 28, 519, 'Код-uwws1651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1324, 16, 15, 9, 402, 28, 519, 'Код-21KV1651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1323, 16, 15, 9, 402, 28, 519, 'Код-AYSv1651759542', '167.91', NULL, '0', '167.91', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1322, 16, 15, 9, 401, 28, 518, 'Код-xVJH1651759542', '182.43', NULL, '0', '182.43', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1321, 16, 15, 9, 400, 28, 517, 'Код-Hdvn1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1320, 16, 15, 9, 400, 28, 517, 'Код-5xmj1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1319, 16, 15, 9, 400, 28, 517, 'Код-0c5v1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1318, 16, 15, 9, 399, 28, 516, 'Код-e7001651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1317, 16, 15, 9, 399, 28, 516, 'Код-iDQt1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1316, 16, 15, 9, 399, 28, 516, 'Код-iigI1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1315, 16, 15, 9, 399, 28, 516, 'Код-1HAd1651759542', '195.44', NULL, '0', '195.44', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1314, 16, 15, 9, 398, 28, 515, 'Код-V9rD1651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1313, 16, 15, 9, 398, 28, 515, 'Код-sJvV1651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1312, 16, 15, 9, 398, 28, 515, 'Код-Q7I71651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1311, 16, 15, 9, 398, 28, 515, 'Код-x7ja1651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1310, 16, 15, 9, 398, 28, 515, 'Код-4B2P1651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1309, 16, 15, 9, 398, 28, 515, 'Код-e0zF1651759542', '187.1', NULL, '0', '187.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1308, 16, 15, 9, 397, 28, 514, 'Код-DT7v1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1307, 16, 15, 9, 397, 28, 514, 'Код-2r5B1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1306, 16, 15, 9, 397, 28, 514, 'Код-sC3W1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1305, 16, 15, 9, 397, 28, 514, 'Код-DP901651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1304, 16, 15, 9, 397, 28, 514, 'Код-0S0m1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1303, 16, 15, 9, 397, 28, 514, 'Код-Fkjv1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1302, 16, 15, 9, 397, 28, 514, 'Код-6Itj1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1301, 16, 15, 9, 397, 28, 514, 'Код-h1Zv1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1300, 16, 15, 9, 397, 28, 514, 'Код-7twb1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1299, 16, 15, 9, 397, 28, 514, 'Код-3TAw1651759542', '181.8', NULL, '0', '181.8', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1298, 16, 15, 9, 396, 28, 513, 'Код-f0JR1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1297, 16, 15, 9, 396, 28, 513, 'Код-vHl11651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1296, 16, 15, 9, 396, 28, 513, 'Код-59PS1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1295, 16, 15, 9, 396, 28, 513, 'Код-3hyL1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1294, 16, 15, 9, 396, 28, 513, 'Код-p8yL1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1293, 16, 15, 9, 396, 28, 513, 'Код-KuTn1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1292, 16, 15, 9, 396, 28, 513, 'Код-5FGd1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1291, 16, 15, 9, 396, 28, 513, 'Код-fRjI1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1290, 16, 15, 9, 396, 28, 513, 'Код-u2gi1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1289, 16, 15, 9, 396, 28, 513, 'Код-TUHt1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1288, 16, 15, 9, 396, 28, 513, 'Код-1kAZ1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1287, 16, 15, 9, 396, 28, 513, 'Код-tXGU1651759542', '179.45', NULL, '0', '179.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1286, 16, 15, 9, 395, 28, 512, 'Код-AEVm1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1285, 16, 15, 9, 395, 28, 512, 'Код-WpXe1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1284, 16, 15, 9, 395, 28, 512, 'Код-wK2f1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1283, 16, 15, 9, 395, 28, 512, 'Код-bYE91651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1282, 16, 15, 9, 395, 28, 512, 'Код-7rM41651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1281, 16, 15, 9, 395, 28, 512, 'Код-xDVc1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1280, 16, 15, 9, 395, 28, 512, 'Код-T73N1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1279, 16, 15, 9, 395, 28, 512, 'Код-WChx1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1278, 16, 15, 9, 395, 28, 512, 'Код-fEXu1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1277, 16, 15, 9, 395, 28, 512, 'Код-BPi61651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1276, 16, 15, 9, 395, 28, 512, 'Код-QUA11651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1275, 16, 15, 9, 395, 28, 512, 'Код-CQzl1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1274, 16, 15, 9, 395, 28, 512, 'Код-jAiW1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1273, 16, 15, 9, 395, 28, 512, 'Код-s8cY1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1272, 16, 15, 9, 395, 28, 512, 'Код-tu9W1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1271, 16, 15, 9, 395, 28, 512, 'Код-f9PB1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1270, 16, 15, 9, 395, 28, 512, 'Код-LOOH1651759542', '178.81', NULL, '0', '178.81', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1269, 16, 15, 9, 394, 28, 500, 'Код-dfED1651759542', '301.39', NULL, '0', '301.39', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1268, 16, 15, 9, 394, 28, 500, 'Код-xpJK1651759542', '301.39', NULL, '0', '301.39', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1267, 16, 15, 9, 393, 28, 511, 'Код-azIv1651759542', '274.1', NULL, '0', '274.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1266, 16, 15, 9, 392, 28, 510, 'Код-k5Ow1651759542', '272.49', NULL, '0', '272.49', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1265, 16, 15, 9, 392, 28, 510, 'Код-T7sC1651759542', '272.49', NULL, '0', '272.49', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1264, 16, 15, 9, 391, 28, 508, 'Код-Crbx1651759542', '241.95', NULL, '0', '241.95', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1263, 16, 15, 9, 391, 28, 508, 'Код-uxL21651759542', '241.95', NULL, '0', '241.95', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1262, 16, 15, 9, 390, 28, 507, 'Код-kiCP1651759542', '241.95', NULL, '0', '241.95', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1261, 16, 15, 9, 390, 28, 507, 'Код-Xzyt1651759542', '241.95', NULL, '0', '241.95', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1260, 16, 15, 9, 389, 28, 505, 'Код-s7201651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1259, 16, 15, 9, 389, 28, 505, 'Код-gWmE1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1258, 16, 15, 9, 389, 28, 505, 'Код-9fk91651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1257, 16, 15, 9, 389, 28, 505, 'Код-RQ6K1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1256, 16, 15, 9, 389, 28, 505, 'Код-pREI1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1255, 16, 15, 9, 389, 28, 505, 'Код-kowT1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1254, 16, 15, 9, 389, 28, 505, 'Код-BTDN1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1253, 16, 15, 9, 389, 28, 505, 'Код-8YL21651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1252, 16, 15, 9, 389, 28, 505, 'Код-6fWp1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1251, 16, 15, 9, 389, 28, 505, 'Код-iv5X1651759542', '224.33', NULL, '0', '224.33', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1250, 16, 15, 9, 388, 28, 504, 'Код-q7mW1651759542', '198.1', NULL, '0', '198.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1249, 16, 15, 9, 387, 28, 679, 'Код-KBUB1651759542', '171.97', NULL, '0', '171.97', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1248, 16, 15, 9, 387, 28, 679, 'Код-B1OD1651759542', '171.97', NULL, '0', '171.97', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1247, 16, 15, 9, 387, 28, 679, 'Код-Y9DI1651759542', '171.97', NULL, '0', '171.97', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1246, 16, 15, 9, 387, 28, 679, 'Код-nDNt1651759542', '171.97', NULL, '0', '171.97', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1245, 16, 15, 9, 386, 28, 503, 'Код-vhcd1651759542', '172.1', NULL, '0', '172.1', NULL, NULL, NULL, NULL, NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(1244, 16, 15, 9, 385, 21, 629, 'Код-hZ9h1651756598', '297.45', NULL, '0', '297.45', NULL, NULL, NULL, NULL, NULL, '2022-05-07 08:41:21', '2022-05-07 13:37:27');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-04-11 07:52:05', '2022-04-11 07:52:05'),
(2, 'Next', 'web', '2022-04-11 08:08:23', '2022-04-11 08:08:23'),
(5, 'Next-next@gmail.com', 'web', '2022-04-11 08:24:22', '2022-04-11 08:24:22'),
(8, 'Abdulloh-azizkhujaagzamkhujayev@gmail.com', 'web', '2022-04-13 11:35:02', '2022-04-13 11:35:02'),
(9, 'Rustam-mannopovr@gmail.com', 'web', '2022-04-20 14:57:41', '2022-04-20 14:57:41');

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 5),
(1, 8),
(1, 9),
(2, 1),
(2, 8),
(2, 9),
(3, 1),
(3, 8),
(3, 9),
(4, 1),
(4, 8),
(4, 9),
(5, 1),
(5, 5),
(5, 8),
(5, 9),
(7, 1),
(7, 8),
(7, 9),
(8, 1),
(8, 5),
(8, 8),
(8, 9),
(9, 5),
(9, 8),
(9, 9),
(10, 5),
(10, 8),
(10, 9),
(11, 5),
(11, 8),
(11, 9),
(12, 5),
(12, 8),
(12, 9),
(13, 5),
(13, 8),
(13, 9),
(14, 5),
(14, 8),
(14, 9),
(15, 5),
(15, 8),
(15, 9),
(16, 5),
(16, 8),
(16, 9),
(17, 5),
(17, 8),
(17, 9),
(18, 5),
(18, 8),
(18, 9),
(19, 5),
(19, 8),
(19, 9),
(20, 5),
(20, 8),
(20, 9),
(21, 5),
(21, 8),
(21, 9),
(22, 5),
(22, 8),
(22, 9),
(23, 5),
(23, 8),
(23, 9),
(24, 5),
(24, 8),
(24, 9),
(25, 5),
(25, 8),
(25, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('d86P7KJJe5OD73RjblIb0EP7ZheMRvh0tGX1np9i', NULL, '34.220.211.161', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6InF3cEp3djIzZHlEWE53SjV6Wk9YaDEyN0FuNG5NUlBmS1Y3cUpETFgiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIwOiJodHRwczovL3N0ZWNobW9iLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1652057947),
('PLMjSj2FTiYwBL6bpdirHv4EAZN6ihvEnC4nwxZq', NULL, '35.166.129.85', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6ImJXYnNFS1JtWXRPWkNLYkVwbTRrYW16TVhTRHBJQ2JhWHAzN1BHMjMiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE5OiJodHRwOi8vc3RlY2htb2IuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1652058054),
('xKU3zZZqp32kbUedkPtoxhrhCGtqF3HqTKLBR5hI', NULL, '35.160.37.169', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6Iko0cWQyUjNIM1k4Z0dqWk02WjM4NERTZDAyNHBPTmRLQVBoZnVEcmMiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIwOiJodHRwczovL3N0ZWNobW9iLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1652058237),
('JjR6kKIuSKNqb2gfLBu7bNBAKovgv5Zv3OrnuGML', NULL, '34.220.131.181', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6ImhOYm1zOXI1T1k5dTFNWUJCeHozemI5UWxXenlIeFEzOFd0RGFMcXQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIwOiJodHRwczovL3N0ZWNobW9iLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1652058804),
('baMj8SIjqRhRKqKo0dQHYzkD5ZozoZQRE9QW78JD', NULL, '54.36.148.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6ImNmQ1h2Qno0cHVKTG44RUhVUnlZOUQxYUlBSzhsd3gySnUyb0U2eUIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI0OiJodHRwczovL3d3dy5zdGVjaG1vYi5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1652061407),
('zrYC2mMSQqT3qy4rTyj61Nr5Lem2vdhKVIL4Pdos', NULL, '84.54.76.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36', 'YTo1OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6IktHUTdnMmxIQVZuc09XOHFPZG4zR2YxYnN4b1ExMHBPVXBjbzNWNkUiO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzg6Imh0dHA6Ly9zdGVjaG1vYi5jb20vdHJhbnNmZXI/ZGF0YV9pZD01Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9zdGVjaG1vYi5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1652083211),
('jf7peYhA0RLht7dpoIe7PsE5UUZEokmX5xO10alc', NULL, '195.158.30.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36', 'YTozOntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6IjhRM3dMd3g4MFI3dkNEcEZqa1ljRzZHTmV4N2tqdXRYTGxtZWh3c08iO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1652101799),
('ENuBtICRevSdmsTA2B7dWj6oCvn1KEVJfTHFr6Kd', NULL, '54.36.148.7', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6IjZGeUVVQU9mcERnWjZ6ZDR1dzFBYnZ0YmF5ZmE4WHNIa0lMYzdBUXIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIwOiJodHRwczovL3N0ZWNobW9iLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1652053108),
('dH6w6MrcJkJPSFp1aae5fuIXdHtumutWtjW0dN0F', NULL, '20.234.0.33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'YTo0OntzOjU6InN0b2NrIjtpOjA7czo2OiJfdG9rZW4iO3M6NDA6IllhNkJncEpWVFBiZkI5Z0ljYlFRaFlPRE1XMlo3Yng3aDVORXFMVHYiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE5OiJodHRwOi8vc3RlY2htb2IuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1652032514),
('bFoHzj1KFimb4Enr67WjvSflMoBfbcqpPu9Gd5hl', 9, '84.54.76.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36', 'YToxMDp7czo1OiJzdG9jayI7czoyOiIxNSI7czo2OiJfdG9rZW4iO3M6NDA6ImVQNHhremRsNVRNV1ZwT2x0bHBJckN4MHhlMm1DS0ZBYjRwWFdmWjkiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vc3RlY2htb2IuY29tL3RyYW5zZmVyP2RhdGFfaWQ9NSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjk7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRhcm1PNmVHN29OaUFTNWlvTzJoMVMuREhScXZHUVozeUUwN1E5QnROMGNjNTM0WmFuQU0vTyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkYXJtTzZlRzdvTmlBUzVpb08yaDFTLkRIUnF2R1FaM3lFMDdROUJ0TjBjYzUzNFphbkFNL08iO3M6NDoiY2FydCI7YTo1MDp7aTo2MDM7YToxOntzOjI6ImlkIjtpOjYwMzt9aTo2NzQ7YToxOntzOjI6ImlkIjtpOjY3NDt9aTo2MDc7YToxOntzOjI6ImlkIjtpOjYwNzt9aTo2MDg7YToxOntzOjI6ImlkIjtpOjYwODt9aTo2MTA7YToxOntzOjI6ImlkIjtpOjYxMDt9aTo2MTE7YToxOntzOjI6ImlkIjtpOjYxMTt9aTo2Njg7YToxOntzOjI6ImlkIjtpOjY2ODt9aTo2Njk7YToxOntzOjI6ImlkIjtpOjY2OTt9aTo2NzE7YToxOntzOjI6ImlkIjtpOjY3MTt9aTo2NzI7YToxOntzOjI6ImlkIjtpOjY3Mjt9aTo2NzM7YToxOntzOjI6ImlkIjtpOjY3Mzt9aTo2MjE7YToxOntzOjI6ImlkIjtpOjYyMTt9aTo2MjQ7YToxOntzOjI6ImlkIjtpOjYyNDt9aTo2MjM7YToxOntzOjI6ImlkIjtpOjYyMzt9aTo2NTA7YToxOntzOjI6ImlkIjtpOjY1MDt9aTo2NTE7YToxOntzOjI6ImlkIjtpOjY1MTt9aTo2Mzc7YToxOntzOjI6ImlkIjtpOjYzNzt9aTo2Mzg7YToxOntzOjI6ImlkIjtpOjYzODt9aTo2Mzk7YToxOntzOjI6ImlkIjtpOjYzOTt9aTo2NDA7YToxOntzOjI6ImlkIjtpOjY0MDt9aTo1MDU7YToxOntzOjI6ImlkIjtpOjUwNTt9aTo1MDg7YToxOntzOjI6ImlkIjtpOjUwODt9aTo1MDA7YToxOntzOjI6ImlkIjtpOjUwMDt9aTo1MTI7YToxOntzOjI6ImlkIjtpOjUxMjt9aTo1MTM7YToxOntzOjI6ImlkIjtpOjUxMzt9aTo1MTQ7YToxOntzOjI6ImlkIjtpOjUxNDt9aTo1MTU7YToxOntzOjI6ImlkIjtpOjUxNTt9aTo1MTY7YToxOntzOjI6ImlkIjtpOjUxNjt9aTo1MTk7YToxOntzOjI6ImlkIjtpOjUxOTt9aTo1MzE7YToxOntzOjI6ImlkIjtpOjUzMTt9aTo1MzU7YToxOntzOjI6ImlkIjtpOjUzNTt9aTo1Mzc7YToxOntzOjI6ImlkIjtpOjUzNzt9aTo1NDA7YToxOntzOjI6ImlkIjtpOjU0MDt9aTo1NDE7YToxOntzOjI6ImlkIjtpOjU0MTt9aTo1NDI7YToxOntzOjI6ImlkIjtpOjU0Mjt9aTo1NDU7YToxOntzOjI6ImlkIjtpOjU0NTt9aTo1NDk7YToxOntzOjI6ImlkIjtpOjU0OTt9aTo1NjU7YToxOntzOjI6ImlkIjtpOjU2NTt9aTo1NjY7YToxOntzOjI6ImlkIjtpOjU2Njt9aTo1Njc7YToxOntzOjI6ImlkIjtpOjU2Nzt9aTo2Nzc7YToxOntzOjI6ImlkIjtpOjY3Nzt9aTo1MjU7YToxOntzOjI6ImlkIjtpOjUyNTt9aTo1Nzg7YToxOntzOjI6ImlkIjtpOjU3ODt9aTo1ODA7YToxOntzOjI6ImlkIjtpOjU4MDt9aTo1ODQ7YToxOntzOjI6ImlkIjtpOjU4NDt9aTo1ODU7YToxOntzOjI6ImlkIjtpOjU4NTt9aTo1ODg7YToxOntzOjI6ImlkIjtpOjU4ODt9aTo1OTE7YToxOntzOjI6ImlkIjtpOjU5MTt9aTo1OTQ7YToxOntzOjI6ImlkIjtpOjU5NDt9aTo1OTg7YToxOntzOjI6ImlkIjtpOjU5ODt9fXM6NzoicHJvZHVjdCI7YTo5NDp7aTo4MjE7YToyOntzOjI6ImlkIjtpOjgyMTtzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjg0MDthOjI6e3M6MjoiaWQiO2k6ODQwO3M6NzoibWFya19pZCI7aTo2NzQ7fWk6ODQxO2E6Mjp7czoyOiJpZCI7aTo4NDE7czo3OiJtYXJrX2lkIjtpOjYwNzt9aTo4NDI7YToyOntzOjI6ImlkIjtpOjg0MjtzOjc6Im1hcmtfaWQiO2k6NjA4O31pOjExODI7YToyOntzOjI6ImlkIjtpOjExODI7czo3OiJtYXJrX2lkIjtpOjYxMDt9aToxMTgxO2E6Mjp7czoyOiJpZCI7aToxMTgxO3M6NzoibWFya19pZCI7aTo2MTA7fWk6MTE3ODthOjI6e3M6MjoiaWQiO2k6MTE3ODtzOjc6Im1hcmtfaWQiO2k6NjExO31pOjExNzc7YToyOntzOjI6ImlkIjtpOjExNzc7czo3OiJtYXJrX2lkIjtpOjYxMTt9aToxMTc2O2E6Mjp7czoyOiJpZCI7aToxMTc2O3M6NzoibWFya19pZCI7aTo2MTE7fWk6MTE3NTthOjI6e3M6MjoiaWQiO2k6MTE3NTtzOjc6Im1hcmtfaWQiO2k6NjExO31pOjExNjQ7YToyOntzOjI6ImlkIjtpOjExNjQ7czo3OiJtYXJrX2lkIjtpOjY2ODt9aToxMTYzO2E6Mjp7czoyOiJpZCI7aToxMTYzO3M6NzoibWFya19pZCI7aTo2Njg7fWk6MTE2MjthOjI6e3M6MjoiaWQiO2k6MTE2MjtzOjc6Im1hcmtfaWQiO2k6NjY4O31pOjExNTk7YToyOntzOjI6ImlkIjtpOjExNTk7czo3OiJtYXJrX2lkIjtpOjY2OTt9aToxMTU4O2E6Mjp7czoyOiJpZCI7aToxMTU4O3M6NzoibWFya19pZCI7aTo2Njk7fWk6MTE4NDthOjI6e3M6MjoiaWQiO2k6MTE4NDtzOjc6Im1hcmtfaWQiO2k6NjcxO31pOjExOTY7YToyOntzOjI6ImlkIjtpOjExOTY7czo3OiJtYXJrX2lkIjtpOjY3Mjt9aToxMjAyO2E6Mjp7czoyOiJpZCI7aToxMjAyO3M6NzoibWFya19pZCI7aTo2NzM7fWk6MTIwMTthOjI6e3M6MjoiaWQiO2k6MTIwMTtzOjc6Im1hcmtfaWQiO2k6NjczO31pOjEyMjE7YToyOntzOjI6ImlkIjtpOjEyMjE7czo3OiJtYXJrX2lkIjtpOjYyMTt9aToxMjMwO2E6Mjp7czoyOiJpZCI7aToxMjMwO3M6NzoibWFya19pZCI7aTo2MjQ7fWk6MTIzNDthOjI6e3M6MjoiaWQiO2k6MTIzNDtzOjc6Im1hcmtfaWQiO2k6NjIzO31pOjEyNDI7YToyOntzOjI6ImlkIjtpOjEyNDI7czo3OiJtYXJrX2lkIjtpOjYyMzt9aTo2MTY7YToyOntzOjI6ImlkIjtpOjYxNjtzOjc6Im1hcmtfaWQiO2k6NjUwO31pOjYxNTthOjI6e3M6MjoiaWQiO2k6NjE1O3M6NzoibWFya19pZCI7aTo2NTA7fWk6NjE0O2E6Mjp7czoyOiJpZCI7aTo2MTQ7czo3OiJtYXJrX2lkIjtpOjY1MDt9aTo2MTM7YToyOntzOjI6ImlkIjtpOjYxMztzOjc6Im1hcmtfaWQiO2k6NjUwO31pOjYxODthOjI6e3M6MjoiaWQiO2k6NjE4O3M6NzoibWFya19pZCI7aTo2NTE7fWk6NjE3O2E6Mjp7czoyOiJpZCI7aTo2MTc7czo3OiJtYXJrX2lkIjtpOjY1MTt9aTo2MjI7YToyOntzOjI6ImlkIjtpOjYyMjtzOjc6Im1hcmtfaWQiO2k6NjM3O31pOjYyMTthOjI6e3M6MjoiaWQiO2k6NjIxO3M6NzoibWFya19pZCI7aTo2Mzc7fWk6NjIwO2E6Mjp7czoyOiJpZCI7aTo2MjA7czo3OiJtYXJrX2lkIjtpOjYzNzt9aTo2MTk7YToyOntzOjI6ImlkIjtpOjYxOTtzOjc6Im1hcmtfaWQiO2k6NjM3O31pOjYyNDthOjI6e3M6MjoiaWQiO2k6NjI0O3M6NzoibWFya19pZCI7aTo2Mzg7fWk6NjQyO2E6Mjp7czoyOiJpZCI7aTo2NDI7czo3OiJtYXJrX2lkIjtpOjYzOTt9aTo2NDE7YToyOntzOjI6ImlkIjtpOjY0MTtzOjc6Im1hcmtfaWQiO2k6NjM5O31pOjY2MDthOjI6e3M6MjoiaWQiO2k6NjYwO3M6NzoibWFya19pZCI7aTo2NDA7fWk6MTI2MDthOjI6e3M6MjoiaWQiO2k6MTI2MDtzOjc6Im1hcmtfaWQiO2k6NTA1O31pOjEyNjQ7YToyOntzOjI6ImlkIjtpOjEyNjQ7czo3OiJtYXJrX2lkIjtpOjUwODt9aToxMjY5O2E6Mjp7czoyOiJpZCI7aToxMjY5O3M6NzoibWFya19pZCI7aTo1MDA7fWk6MTI4NjthOjI6e3M6MjoiaWQiO2k6MTI4NjtzOjc6Im1hcmtfaWQiO2k6NTEyO31pOjEyODU7YToyOntzOjI6ImlkIjtpOjEyODU7czo3OiJtYXJrX2lkIjtpOjUxMjt9aToxMjg0O2E6Mjp7czoyOiJpZCI7aToxMjg0O3M6NzoibWFya19pZCI7aTo1MTI7fWk6MTI5ODthOjI6e3M6MjoiaWQiO2k6MTI5ODtzOjc6Im1hcmtfaWQiO2k6NTEzO31pOjEzMDg7YToyOntzOjI6ImlkIjtpOjEzMDg7czo3OiJtYXJrX2lkIjtpOjUxNDt9aToxMzE0O2E6Mjp7czoyOiJpZCI7aToxMzE0O3M6NzoibWFya19pZCI7aTo1MTU7fWk6MTMxMzthOjI6e3M6MjoiaWQiO2k6MTMxMztzOjc6Im1hcmtfaWQiO2k6NTE1O31pOjEzMTg7YToyOntzOjI6ImlkIjtpOjEzMTg7czo3OiJtYXJrX2lkIjtpOjUxNjt9aToxMzI4O2E6Mjp7czoyOiJpZCI7aToxMzI4O3M6NzoibWFya19pZCI7aTo1MTk7fWk6OTE1O2E6Mjp7czoyOiJpZCI7aTo5MTU7czo3OiJtYXJrX2lkIjtpOjUzMTt9aTo5MTk7YToyOntzOjI6ImlkIjtpOjkxOTtzOjc6Im1hcmtfaWQiO2k6NTM1O31pOjkyMDthOjI6e3M6MjoiaWQiO2k6OTIwO3M6NzoibWFya19pZCI7aTo1MzU7fWk6OTIxO2E6Mjp7czoyOiJpZCI7aTo5MjE7czo3OiJtYXJrX2lkIjtpOjUzNTt9aTo5MjI7YToyOntzOjI6ImlkIjtpOjkyMjtzOjc6Im1hcmtfaWQiO2k6NTM1O31pOjkyMzthOjI6e3M6MjoiaWQiO2k6OTIzO3M6NzoibWFya19pZCI7aTo1MzU7fWk6OTI0O2E6Mjp7czoyOiJpZCI7aTo5MjQ7czo3OiJtYXJrX2lkIjtpOjUzNTt9aTo5NDA7YToyOntzOjI6ImlkIjtpOjk0MDtzOjc6Im1hcmtfaWQiO2k6NTM3O31pOjk0NDthOjI6e3M6MjoiaWQiO2k6OTQ0O3M6NzoibWFya19pZCI7aTo1NDA7fWk6OTQ1O2E6Mjp7czoyOiJpZCI7aTo5NDU7czo3OiJtYXJrX2lkIjtpOjU0MDt9aTo5NTA7YToyOntzOjI6ImlkIjtpOjk1MDtzOjc6Im1hcmtfaWQiO2k6NTQxO31pOjk1NDthOjI6e3M6MjoiaWQiO2k6OTU0O3M6NzoibWFya19pZCI7aTo1NDI7fWk6OTU1O2E6Mjp7czoyOiJpZCI7aTo5NTU7czo3OiJtYXJrX2lkIjtpOjU0Mjt9aTo5NTY7YToyOntzOjI6ImlkIjtpOjk1NjtzOjc6Im1hcmtfaWQiO2k6NTQyO31pOjk2ODthOjI6e3M6MjoiaWQiO2k6OTY4O3M6NzoibWFya19pZCI7aTo1NDU7fWk6OTc0O2E6Mjp7czoyOiJpZCI7aTo5NzQ7czo3OiJtYXJrX2lkIjtpOjU0OTt9aTo5Nzc7YToyOntzOjI6ImlkIjtpOjk3NztzOjc6Im1hcmtfaWQiO2k6NTY1O31pOjk3ODthOjI6e3M6MjoiaWQiO2k6OTc4O3M6NzoibWFya19pZCI7aTo1NjU7fWk6OTc5O2E6Mjp7czoyOiJpZCI7aTo5Nzk7czo3OiJtYXJrX2lkIjtpOjU2NTt9aTo5ODA7YToyOntzOjI6ImlkIjtpOjk4MDtzOjc6Im1hcmtfaWQiO2k6NTY1O31pOjk4MTthOjI6e3M6MjoiaWQiO2k6OTgxO3M6NzoibWFya19pZCI7aTo1NjU7fWk6OTg5O2E6Mjp7czoyOiJpZCI7aTo5ODk7czo3OiJtYXJrX2lkIjtpOjU2Njt9aTo5OTA7YToyOntzOjI6ImlkIjtpOjk5MDtzOjc6Im1hcmtfaWQiO2k6NTY2O31pOjk5NzthOjI6e3M6MjoiaWQiO2k6OTk3O3M6NzoibWFya19pZCI7aTo1Njc7fWk6MTAwNjthOjI6e3M6MjoiaWQiO2k6MTAwNjtzOjc6Im1hcmtfaWQiO2k6Njc3O31pOjEwMDc7YToyOntzOjI6ImlkIjtpOjEwMDc7czo3OiJtYXJrX2lkIjtpOjY3Nzt9aToxMDA4O2E6Mjp7czoyOiJpZCI7aToxMDA4O3M6NzoibWFya19pZCI7aTo2Nzc7fWk6MTAwOTthOjI6e3M6MjoiaWQiO2k6MTAwOTtzOjc6Im1hcmtfaWQiO2k6Njc3O31pOjEwMTA7YToyOntzOjI6ImlkIjtpOjEwMTA7czo3OiJtYXJrX2lkIjtpOjY3Nzt9aToxMDIzO2E6Mjp7czoyOiJpZCI7aToxMDIzO3M6NzoibWFya19pZCI7aTo1MjU7fWk6MTAyODthOjI6e3M6MjoiaWQiO2k6MTAyODtzOjc6Im1hcmtfaWQiO2k6NTc4O31pOjEwMjk7YToyOntzOjI6ImlkIjtpOjEwMjk7czo3OiJtYXJrX2lkIjtpOjU3ODt9aToxMDM3O2E6Mjp7czoyOiJpZCI7aToxMDM3O3M6NzoibWFya19pZCI7aTo1ODA7fWk6MTAzODthOjI6e3M6MjoiaWQiO2k6MTAzODtzOjc6Im1hcmtfaWQiO2k6NTgwO31pOjg1ODthOjI6e3M6MjoiaWQiO2k6ODU4O3M6NzoibWFya19pZCI7aTo1ODQ7fWk6ODYwO2E6Mjp7czoyOiJpZCI7aTo4NjA7czo3OiJtYXJrX2lkIjtpOjU4NTt9aTo4NjE7YToyOntzOjI6ImlkIjtpOjg2MTtzOjc6Im1hcmtfaWQiO2k6NTg1O31pOjg2MjthOjI6e3M6MjoiaWQiO2k6ODYyO3M6NzoibWFya19pZCI7aTo1ODU7fWk6ODY1O2E6Mjp7czoyOiJpZCI7aTo4NjU7czo3OiJtYXJrX2lkIjtpOjU4ODt9aTo4NjY7YToyOntzOjI6ImlkIjtpOjg2NjtzOjc6Im1hcmtfaWQiO2k6NTg4O31pOjg5OTthOjI6e3M6MjoiaWQiO2k6ODk5O3M6NzoibWFya19pZCI7aTo1OTE7fWk6OTAyO2E6Mjp7czoyOiJpZCI7aTo5MDI7czo3OiJtYXJrX2lkIjtpOjU5NDt9aTo5MDM7YToyOntzOjI6ImlkIjtpOjkwMztzOjc6Im1hcmtfaWQiO2k6NTk0O31pOjg1NDthOjI6e3M6MjoiaWQiO2k6ODU0O3M6NzoibWFya19pZCI7aTo1OTg7fWk6ODU1O2E6Mjp7czoyOiJpZCI7aTo4NTU7czo3OiJtYXJrX2lkIjtpOjU5ODt9fXM6MTE6Im9sZF9pbnZvaWNlIjtpOjE7fQ==', 1652017124),
('Mn65mKVpjAQh6ylmeHhzf7dPiPJpSPLcDDay7hZJ', 9, '84.54.76.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36', 'YToxMDp7czo1OiJzdG9jayI7aToxNTtzOjY6Il90b2tlbiI7czo0MDoiV014ZllEdGtCZWNQVUp5aXdrcUZEVTZwODROZnVTWUVPTGZwU0dvcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9zdGVjaG1vYi5jb20vdHJhbnNmZXI/ZGF0YV9pZD0iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkYXJtTzZlRzdvTmlBUzVpb08yaDFTLkRIUnF2R1FaM3lFMDdROUJ0TjBjYzUzNFphbkFNL08iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGFybU82ZUc3b05pQVM1aW9PMmgxUy5ESFJxdkdRWjN5RTA3UTlCdE4wY2M1MzRaYW5BTS9PIjtzOjEwOiJjb3VudF9kYXRhIjtpOjEzODtzOjQ6ImNhcnQiO2E6NDp7aTo2NzQ7YToxOntzOjI6ImlkIjtpOjY3NDt9aTo2MDM7YToxOntzOjI6ImlkIjtpOjYwMzt9aTo2MDc7YToxOntzOjI6ImlkIjtpOjYwNzt9aTo2MDg7YToxOntzOjI6ImlkIjtpOjYwODt9fXM6NzoicHJvZHVjdCI7YToxNzp7aTo4NDA7YToyOntzOjI6ImlkIjtpOjg0MDtzOjc6Im1hcmtfaWQiO2k6Njc0O31pOjgyMzthOjI6e3M6MjoiaWQiO2k6ODIzO3M6NzoibWFya19pZCI7aTo2MDM7fWk6ODI0O2E6Mjp7czoyOiJpZCI7aTo4MjQ7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4MjU7YToyOntzOjI6ImlkIjtpOjgyNTtzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjgyNjthOjI6e3M6MjoiaWQiO2k6ODI2O3M6NzoibWFya19pZCI7aTo2MDM7fWk6ODI3O2E6Mjp7czoyOiJpZCI7aTo4Mjc7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4Mjg7YToyOntzOjI6ImlkIjtpOjgyODtzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjgyOTthOjI6e3M6MjoiaWQiO2k6ODI5O3M6NzoibWFya19pZCI7aTo2MDM7fWk6ODMwO2E6Mjp7czoyOiJpZCI7aTo4MzA7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4MzE7YToyOntzOjI6ImlkIjtpOjgzMTtzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjgzMjthOjI6e3M6MjoiaWQiO2k6ODMyO3M6NzoibWFya19pZCI7aTo2MDM7fWk6ODMzO2E6Mjp7czoyOiJpZCI7aTo4MzM7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4MzQ7YToyOntzOjI6ImlkIjtpOjgzNDtzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjgzNTthOjI6e3M6MjoiaWQiO2k6ODM1O3M6NzoibWFya19pZCI7aTo2MDM7fWk6ODM2O2E6Mjp7czoyOiJpZCI7aTo4MzY7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4Mzc7YToyOntzOjI6ImlkIjtpOjgzNztzOjc6Im1hcmtfaWQiO2k6NjAzO31pOjg0MTthOjI6e3M6MjoiaWQiO2k6ODQxO3M6NzoibWFya19pZCI7aTo2MDc7fX19', 1652008519),
('9ODlxJlqBZquJdRHgtmJkLzp31zicEcR8ejrijfg', 8, '213.230.74.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.41 Safari/537.36 Edg/101.0.1210.32', 'YToxNzp7czo1OiJzdG9jayI7czoyOiIxNSI7czo2OiJfdG9rZW4iO3M6NDA6ImdXZlpaMGFma3owU0pvWUlnVDhsdWwxTlJhSHh6ckxTN0U1bzNmdGIiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRXWUlHajBlSGMwS3E0alVCWlRuMkouZkJIOGNvUEk4UnNLeDkvTktQSGVIdFk1TDlHZkp6VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly9zdGVjaG1vYi5jb20vZXhwb3J0X3Byb2R1Y3RzP2JyYW5kPSZlbmQ9Jm5hbWU9JnN0YXJ0PSZzdG9ja19pZD0xNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFdZSUdqMGVIYzBLcTRqVUJaVG4ySi5mQkg4Y29QSThSc0t4OS9OS1BIZUh0WTVMOUdmSnpXIjtzOjQ6ImNhcnQiO2E6NTA6e2k6NjAzO2E6MTp7czoyOiJpZCI7aTo2MDM7fWk6Njc0O2E6MTp7czoyOiJpZCI7aTo2NzQ7fWk6NjA3O2E6MTp7czoyOiJpZCI7aTo2MDc7fWk6NjA4O2E6MTp7czoyOiJpZCI7aTo2MDg7fWk6NjEwO2E6MTp7czoyOiJpZCI7aTo2MTA7fWk6NjExO2E6MTp7czoyOiJpZCI7aTo2MTE7fWk6NjY4O2E6MTp7czoyOiJpZCI7aTo2Njg7fWk6NjY5O2E6MTp7czoyOiJpZCI7aTo2Njk7fWk6NjcxO2E6MTp7czoyOiJpZCI7aTo2NzE7fWk6NjcyO2E6MTp7czoyOiJpZCI7aTo2NzI7fWk6NjczO2E6MTp7czoyOiJpZCI7aTo2NzM7fWk6NjIxO2E6MTp7czoyOiJpZCI7aTo2MjE7fWk6NjI0O2E6MTp7czoyOiJpZCI7aTo2MjQ7fWk6NjIzO2E6MTp7czoyOiJpZCI7aTo2MjM7fWk6NjUwO2E6MTp7czoyOiJpZCI7aTo2NTA7fWk6NjUxO2E6MTp7czoyOiJpZCI7aTo2NTE7fWk6NjM3O2E6MTp7czoyOiJpZCI7aTo2Mzc7fWk6NjM4O2E6MTp7czoyOiJpZCI7aTo2Mzg7fWk6NjM5O2E6MTp7czoyOiJpZCI7aTo2Mzk7fWk6NjQwO2E6MTp7czoyOiJpZCI7aTo2NDA7fWk6NTA1O2E6MTp7czoyOiJpZCI7aTo1MDU7fWk6NTA4O2E6MTp7czoyOiJpZCI7aTo1MDg7fWk6NTAwO2E6MTp7czoyOiJpZCI7aTo1MDA7fWk6NTEyO2E6MTp7czoyOiJpZCI7aTo1MTI7fWk6NTEzO2E6MTp7czoyOiJpZCI7aTo1MTM7fWk6NTE0O2E6MTp7czoyOiJpZCI7aTo1MTQ7fWk6NTE1O2E6MTp7czoyOiJpZCI7aTo1MTU7fWk6NTE2O2E6MTp7czoyOiJpZCI7aTo1MTY7fWk6NTE5O2E6MTp7czoyOiJpZCI7aTo1MTk7fWk6NTMxO2E6MTp7czoyOiJpZCI7aTo1MzE7fWk6NTM1O2E6MTp7czoyOiJpZCI7aTo1MzU7fWk6NTM3O2E6MTp7czoyOiJpZCI7aTo1Mzc7fWk6NTQwO2E6MTp7czoyOiJpZCI7aTo1NDA7fWk6NTQxO2E6MTp7czoyOiJpZCI7aTo1NDE7fWk6NTQyO2E6MTp7czoyOiJpZCI7aTo1NDI7fWk6NTQ1O2E6MTp7czoyOiJpZCI7aTo1NDU7fWk6NTQ5O2E6MTp7czoyOiJpZCI7aTo1NDk7fWk6NTY1O2E6MTp7czoyOiJpZCI7aTo1NjU7fWk6NTY2O2E6MTp7czoyOiJpZCI7aTo1NjY7fWk6NTY3O2E6MTp7czoyOiJpZCI7aTo1Njc7fWk6Njc3O2E6MTp7czoyOiJpZCI7aTo2Nzc7fWk6NTI1O2E6MTp7czoyOiJpZCI7aTo1MjU7fWk6NTc4O2E6MTp7czoyOiJpZCI7aTo1Nzg7fWk6NTgwO2E6MTp7czoyOiJpZCI7aTo1ODA7fWk6NTg0O2E6MTp7czoyOiJpZCI7aTo1ODQ7fWk6NTg1O2E6MTp7czoyOiJpZCI7aTo1ODU7fWk6NTg4O2E6MTp7czoyOiJpZCI7aTo1ODg7fWk6NTkxO2E6MTp7czoyOiJpZCI7aTo1OTE7fWk6NTk0O2E6MTp7czoyOiJpZCI7aTo1OTQ7fWk6NTk4O2E6MTp7czoyOiJpZCI7aTo1OTg7fX1zOjc6InByb2R1Y3QiO2E6OTQ6e2k6ODIxO2E6Mjp7czoyOiJpZCI7aTo4MjE7czo3OiJtYXJrX2lkIjtpOjYwMzt9aTo4NDA7YToyOntzOjI6ImlkIjtpOjg0MDtzOjc6Im1hcmtfaWQiO2k6Njc0O31pOjg0MTthOjI6e3M6MjoiaWQiO2k6ODQxO3M6NzoibWFya19pZCI7aTo2MDc7fWk6ODQyO2E6Mjp7czoyOiJpZCI7aTo4NDI7czo3OiJtYXJrX2lkIjtpOjYwODt9aToxMTgyO2E6Mjp7czoyOiJpZCI7aToxMTgyO3M6NzoibWFya19pZCI7aTo2MTA7fWk6MTE4MTthOjI6e3M6MjoiaWQiO2k6MTE4MTtzOjc6Im1hcmtfaWQiO2k6NjEwO31pOjExNzg7YToyOntzOjI6ImlkIjtpOjExNzg7czo3OiJtYXJrX2lkIjtpOjYxMTt9aToxMTc3O2E6Mjp7czoyOiJpZCI7aToxMTc3O3M6NzoibWFya19pZCI7aTo2MTE7fWk6MTE3NjthOjI6e3M6MjoiaWQiO2k6MTE3NjtzOjc6Im1hcmtfaWQiO2k6NjExO31pOjExNzU7YToyOntzOjI6ImlkIjtpOjExNzU7czo3OiJtYXJrX2lkIjtpOjYxMTt9aToxMTY0O2E6Mjp7czoyOiJpZCI7aToxMTY0O3M6NzoibWFya19pZCI7aTo2Njg7fWk6MTE2MzthOjI6e3M6MjoiaWQiO2k6MTE2MztzOjc6Im1hcmtfaWQiO2k6NjY4O31pOjExNjI7YToyOntzOjI6ImlkIjtpOjExNjI7czo3OiJtYXJrX2lkIjtpOjY2ODt9aToxMTU5O2E6Mjp7czoyOiJpZCI7aToxMTU5O3M6NzoibWFya19pZCI7aTo2Njk7fWk6MTE1ODthOjI6e3M6MjoiaWQiO2k6MTE1ODtzOjc6Im1hcmtfaWQiO2k6NjY5O31pOjExODQ7YToyOntzOjI6ImlkIjtpOjExODQ7czo3OiJtYXJrX2lkIjtpOjY3MTt9aToxMTk2O2E6Mjp7czoyOiJpZCI7aToxMTk2O3M6NzoibWFya19pZCI7aTo2NzI7fWk6MTIwMjthOjI6e3M6MjoiaWQiO2k6MTIwMjtzOjc6Im1hcmtfaWQiO2k6NjczO31pOjEyMDE7YToyOntzOjI6ImlkIjtpOjEyMDE7czo3OiJtYXJrX2lkIjtpOjY3Mzt9aToxMjIxO2E6Mjp7czoyOiJpZCI7aToxMjIxO3M6NzoibWFya19pZCI7aTo2MjE7fWk6MTIzMDthOjI6e3M6MjoiaWQiO2k6MTIzMDtzOjc6Im1hcmtfaWQiO2k6NjI0O31pOjEyMzQ7YToyOntzOjI6ImlkIjtpOjEyMzQ7czo3OiJtYXJrX2lkIjtpOjYyMzt9aToxMjQyO2E6Mjp7czoyOiJpZCI7aToxMjQyO3M6NzoibWFya19pZCI7aTo2MjM7fWk6NjE2O2E6Mjp7czoyOiJpZCI7aTo2MTY7czo3OiJtYXJrX2lkIjtpOjY1MDt9aTo2MTU7YToyOntzOjI6ImlkIjtpOjYxNTtzOjc6Im1hcmtfaWQiO2k6NjUwO31pOjYxNDthOjI6e3M6MjoiaWQiO2k6NjE0O3M6NzoibWFya19pZCI7aTo2NTA7fWk6NjEzO2E6Mjp7czoyOiJpZCI7aTo2MTM7czo3OiJtYXJrX2lkIjtpOjY1MDt9aTo2MTg7YToyOntzOjI6ImlkIjtpOjYxODtzOjc6Im1hcmtfaWQiO2k6NjUxO31pOjYxNzthOjI6e3M6MjoiaWQiO2k6NjE3O3M6NzoibWFya19pZCI7aTo2NTE7fWk6NjIyO2E6Mjp7czoyOiJpZCI7aTo2MjI7czo3OiJtYXJrX2lkIjtpOjYzNzt9aTo2MjE7YToyOntzOjI6ImlkIjtpOjYyMTtzOjc6Im1hcmtfaWQiO2k6NjM3O31pOjYyMDthOjI6e3M6MjoiaWQiO2k6NjIwO3M6NzoibWFya19pZCI7aTo2Mzc7fWk6NjE5O2E6Mjp7czoyOiJpZCI7aTo2MTk7czo3OiJtYXJrX2lkIjtpOjYzNzt9aTo2MjQ7YToyOntzOjI6ImlkIjtpOjYyNDtzOjc6Im1hcmtfaWQiO2k6NjM4O31pOjY0MjthOjI6e3M6MjoiaWQiO2k6NjQyO3M6NzoibWFya19pZCI7aTo2Mzk7fWk6NjQxO2E6Mjp7czoyOiJpZCI7aTo2NDE7czo3OiJtYXJrX2lkIjtpOjYzOTt9aTo2NjA7YToyOntzOjI6ImlkIjtpOjY2MDtzOjc6Im1hcmtfaWQiO2k6NjQwO31pOjEyNjA7YToyOntzOjI6ImlkIjtpOjEyNjA7czo3OiJtYXJrX2lkIjtpOjUwNTt9aToxMjY0O2E6Mjp7czoyOiJpZCI7aToxMjY0O3M6NzoibWFya19pZCI7aTo1MDg7fWk6MTI2OTthOjI6e3M6MjoiaWQiO2k6MTI2OTtzOjc6Im1hcmtfaWQiO2k6NTAwO31pOjEyODY7YToyOntzOjI6ImlkIjtpOjEyODY7czo3OiJtYXJrX2lkIjtpOjUxMjt9aToxMjg1O2E6Mjp7czoyOiJpZCI7aToxMjg1O3M6NzoibWFya19pZCI7aTo1MTI7fWk6MTI4NDthOjI6e3M6MjoiaWQiO2k6MTI4NDtzOjc6Im1hcmtfaWQiO2k6NTEyO31pOjEyOTg7YToyOntzOjI6ImlkIjtpOjEyOTg7czo3OiJtYXJrX2lkIjtpOjUxMzt9aToxMzA4O2E6Mjp7czoyOiJpZCI7aToxMzA4O3M6NzoibWFya19pZCI7aTo1MTQ7fWk6MTMxNDthOjI6e3M6MjoiaWQiO2k6MTMxNDtzOjc6Im1hcmtfaWQiO2k6NTE1O31pOjEzMTM7YToyOntzOjI6ImlkIjtpOjEzMTM7czo3OiJtYXJrX2lkIjtpOjUxNTt9aToxMzE4O2E6Mjp7czoyOiJpZCI7aToxMzE4O3M6NzoibWFya19pZCI7aTo1MTY7fWk6MTMyODthOjI6e3M6MjoiaWQiO2k6MTMyODtzOjc6Im1hcmtfaWQiO2k6NTE5O31pOjkxNTthOjI6e3M6MjoiaWQiO2k6OTE1O3M6NzoibWFya19pZCI7aTo1MzE7fWk6OTE5O2E6Mjp7czoyOiJpZCI7aTo5MTk7czo3OiJtYXJrX2lkIjtpOjUzNTt9aTo5MjA7YToyOntzOjI6ImlkIjtpOjkyMDtzOjc6Im1hcmtfaWQiO2k6NTM1O31pOjkyMTthOjI6e3M6MjoiaWQiO2k6OTIxO3M6NzoibWFya19pZCI7aTo1MzU7fWk6OTIyO2E6Mjp7czoyOiJpZCI7aTo5MjI7czo3OiJtYXJrX2lkIjtpOjUzNTt9aTo5MjM7YToyOntzOjI6ImlkIjtpOjkyMztzOjc6Im1hcmtfaWQiO2k6NTM1O31pOjkyNDthOjI6e3M6MjoiaWQiO2k6OTI0O3M6NzoibWFya19pZCI7aTo1MzU7fWk6OTQwO2E6Mjp7czoyOiJpZCI7aTo5NDA7czo3OiJtYXJrX2lkIjtpOjUzNzt9aTo5NDQ7YToyOntzOjI6ImlkIjtpOjk0NDtzOjc6Im1hcmtfaWQiO2k6NTQwO31pOjk0NTthOjI6e3M6MjoiaWQiO2k6OTQ1O3M6NzoibWFya19pZCI7aTo1NDA7fWk6OTUwO2E6Mjp7czoyOiJpZCI7aTo5NTA7czo3OiJtYXJrX2lkIjtpOjU0MTt9aTo5NTQ7YToyOntzOjI6ImlkIjtpOjk1NDtzOjc6Im1hcmtfaWQiO2k6NTQyO31pOjk1NTthOjI6e3M6MjoiaWQiO2k6OTU1O3M6NzoibWFya19pZCI7aTo1NDI7fWk6OTU2O2E6Mjp7czoyOiJpZCI7aTo5NTY7czo3OiJtYXJrX2lkIjtpOjU0Mjt9aTo5Njg7YToyOntzOjI6ImlkIjtpOjk2ODtzOjc6Im1hcmtfaWQiO2k6NTQ1O31pOjk3NDthOjI6e3M6MjoiaWQiO2k6OTc0O3M6NzoibWFya19pZCI7aTo1NDk7fWk6OTc3O2E6Mjp7czoyOiJpZCI7aTo5Nzc7czo3OiJtYXJrX2lkIjtpOjU2NTt9aTo5Nzg7YToyOntzOjI6ImlkIjtpOjk3ODtzOjc6Im1hcmtfaWQiO2k6NTY1O31pOjk3OTthOjI6e3M6MjoiaWQiO2k6OTc5O3M6NzoibWFya19pZCI7aTo1NjU7fWk6OTgwO2E6Mjp7czoyOiJpZCI7aTo5ODA7czo3OiJtYXJrX2lkIjtpOjU2NTt9aTo5ODE7YToyOntzOjI6ImlkIjtpOjk4MTtzOjc6Im1hcmtfaWQiO2k6NTY1O31pOjk4OTthOjI6e3M6MjoiaWQiO2k6OTg5O3M6NzoibWFya19pZCI7aTo1NjY7fWk6OTkwO2E6Mjp7czoyOiJpZCI7aTo5OTA7czo3OiJtYXJrX2lkIjtpOjU2Njt9aTo5OTc7YToyOntzOjI6ImlkIjtpOjk5NztzOjc6Im1hcmtfaWQiO2k6NTY3O31pOjEwMDY7YToyOntzOjI6ImlkIjtpOjEwMDY7czo3OiJtYXJrX2lkIjtpOjY3Nzt9aToxMDA3O2E6Mjp7czoyOiJpZCI7aToxMDA3O3M6NzoibWFya19pZCI7aTo2Nzc7fWk6MTAwODthOjI6e3M6MjoiaWQiO2k6MTAwODtzOjc6Im1hcmtfaWQiO2k6Njc3O31pOjEwMDk7YToyOntzOjI6ImlkIjtpOjEwMDk7czo3OiJtYXJrX2lkIjtpOjY3Nzt9aToxMDEwO2E6Mjp7czoyOiJpZCI7aToxMDEwO3M6NzoibWFya19pZCI7aTo2Nzc7fWk6MTAyMzthOjI6e3M6MjoiaWQiO2k6MTAyMztzOjc6Im1hcmtfaWQiO2k6NTI1O31pOjEwMjg7YToyOntzOjI6ImlkIjtpOjEwMjg7czo3OiJtYXJrX2lkIjtpOjU3ODt9aToxMDI5O2E6Mjp7czoyOiJpZCI7aToxMDI5O3M6NzoibWFya19pZCI7aTo1Nzg7fWk6MTAzNzthOjI6e3M6MjoiaWQiO2k6MTAzNztzOjc6Im1hcmtfaWQiO2k6NTgwO31pOjEwMzg7YToyOntzOjI6ImlkIjtpOjEwMzg7czo3OiJtYXJrX2lkIjtpOjU4MDt9aTo4NTg7YToyOntzOjI6ImlkIjtpOjg1ODtzOjc6Im1hcmtfaWQiO2k6NTg0O31pOjg2MDthOjI6e3M6MjoiaWQiO2k6ODYwO3M6NzoibWFya19pZCI7aTo1ODU7fWk6ODYxO2E6Mjp7czoyOiJpZCI7aTo4NjE7czo3OiJtYXJrX2lkIjtpOjU4NTt9aTo4NjI7YToyOntzOjI6ImlkIjtpOjg2MjtzOjc6Im1hcmtfaWQiO2k6NTg1O31pOjg2NTthOjI6e3M6MjoiaWQiO2k6ODY1O3M6NzoibWFya19pZCI7aTo1ODg7fWk6ODY2O2E6Mjp7czoyOiJpZCI7aTo4NjY7czo3OiJtYXJrX2lkIjtpOjU4ODt9aTo4OTk7YToyOntzOjI6ImlkIjtpOjg5OTtzOjc6Im1hcmtfaWQiO2k6NTkxO31pOjkwMjthOjI6e3M6MjoiaWQiO2k6OTAyO3M6NzoibWFya19pZCI7aTo1OTQ7fWk6OTAzO2E6Mjp7czoyOiJpZCI7aTo5MDM7czo3OiJtYXJrX2lkIjtpOjU5NDt9aTo4NTQ7YToyOntzOjI6ImlkIjtpOjg1NDtzOjc6Im1hcmtfaWQiO2k6NTk4O31pOjg1NTthOjI6e3M6MjoiaWQiO2k6ODU1O3M6NzoibWFya19pZCI7aTo1OTg7fX1zOjExOiJvbGRfaW52b2ljZSI7aToxO3M6MTA6ImNvdW50X2RhdGEiO2k6MTM4O3M6ODoic3RvY2tfaWQiO3M6MjoiMTUiO3M6NToiYnJhbmQiO047czo0OiJuYW1lIjtOO3M6NToic3RhcnQiO047czozOiJlbmQiO047czo3OiJyZXNpZHVlIjtOO30=', 1652016122);

-- --------------------------------------------------------

--
-- Структура таблицы `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mark_id` int(11) DEFAULT NULL,
  `quantity` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `shipments`
--

INSERT INTO `shipments` (`id`, `invoice_id`, `client_id`, `mark_id`, `quantity`, `price`, `cost`, `note`, `created_at`, `updated_at`) VALUES
(382, 21, 2, 624, '8', '234.1', '234.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(381, 21, 2, 621, '5', '249.2', '249.2', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(380, 21, 2, 620, '13', '243.48', '243.48', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(379, 21, 2, 673, '11', '215.1', '215.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(378, 21, 2, 672, '2', '196.1', '196.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(377, 21, 2, 617, '8', '218.73', '218.73', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(270, 20, 2, 666, '7', '155.94', '155.94', NULL, '2022-05-05 15:05:17', '2022-05-05 15:05:17'),
(269, 19, 2, 665, '5', '431', '431', NULL, '2022-05-05 13:55:44', '2022-05-05 13:55:44'),
(268, 18, 2, 649, '1', '160.76', '160.76', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(267, 18, 2, 648, '1', '160.76', '160.76', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(266, 18, 2, 660, '1', '381.1', '381.1', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(265, 18, 2, 664, '5', '333.94', '333.94', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(264, 18, 2, 663, '10', '333.94', '333.94', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(263, 18, 2, 662, '5', '242.39', '242.39', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(262, 18, 2, 653, '3', '177', '177', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(261, 18, 2, 661, '1', '147', '147', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(260, 18, 2, 642, '3', '155', '155', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(259, 18, 2, 641, '7', '138.71', '138.71', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(258, 18, 2, 640, '18', '138.33', '138.33', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(257, 18, 2, 639, '18', '138.39', '138.39', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(256, 18, 2, 638, '2', '106', '106', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(255, 18, 2, 637, '4', '109.5', '109.5', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(254, 18, 2, 651, '2', '116.75', '116.75', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(253, 18, 2, 650, '4', '116', '116', NULL, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(427, 17, 2, 485, '1', '10', '10', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(426, 17, 2, 484, '1', '80', '80', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(425, 17, 2, 486, '1', '17.99', '17.99', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(424, 17, 2, 487, '1', '20.6', '20.6', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(423, 17, 2, 494, '1', '43', '43', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(422, 17, 2, 470, '1', '12.2', '12.2', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(421, 17, 2, 495, '1', '17', '17', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(420, 17, 2, 496, '1', '14', '14', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(419, 17, 2, 489, '1', '19.8', '19.8', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(418, 17, 2, 583, '1', '27', '27', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(417, 17, 2, 469, '2', '14.5', '14.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(416, 17, 2, 497, '1', '34.5', '34.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(415, 17, 2, 498, '1', '41.5', '41.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(414, 17, 2, 490, '1', '10', '10', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(413, 17, 2, 499, '1', '31', '31', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(411, 17, 2, 491, '1', '31.5', '31.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(412, 17, 2, 472, '4', '11.13', '11.13', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(410, 17, 2, 474, '2', '15.5', '15.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(409, 17, 2, 475, '1', '15.5', '15.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(408, 17, 2, 492, '1', '16.5', '16.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(407, 17, 2, 476, '1', '18', '18', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(406, 17, 2, 478, '3', '24.5', '24.5', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(405, 17, 2, 479, '2', '19', '19', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(404, 17, 2, 493, '1', '20', '20', NULL, '2022-05-07 13:37:27', '2022-05-07 13:37:27'),
(376, 21, 2, 615, '2', '221.1', '221.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(375, 21, 2, 671, '2', '180.1', '180.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(374, 21, 2, 610, '4', '161.6', '161.6', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(373, 21, 2, 611, '5', '180.1', '180.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(372, 21, 2, 612, '2', '170.1', '170.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(371, 21, 2, 614, '1', '168.6', '168.6', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(370, 21, 2, 667, '6', '167.1', '167.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(369, 21, 2, 668, '5', '167.1', '167.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(368, 21, 2, 669, '22', '192.37', '192.37', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(367, 21, 2, 670, '1', '192.1', '192.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(290, 22, 2, 601, '2', '152.1', '152.1', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(291, 22, 2, 602, '1', '181.1', '181.1', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(292, 22, 2, 603, '17', '182.21', '182.21', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(293, 22, 2, 604, '2', '220', '220', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(294, 22, 2, 674, '1', '187.1', '187.1', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(295, 22, 2, 607, '1', '216.1', '216.1', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(296, 22, 2, 608, '3', '349.6', '349.6', NULL, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(297, 23, 2, 481, '2', '14.5', '14.5', NULL, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(298, 23, 2, 483, '1', '15', '15', NULL, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(299, 23, 2, 480, '1', '20.5', '20.5', NULL, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(300, 24, 2, 633, '1', '345', '345', NULL, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(301, 24, 2, 634, '2', '444.6', '444.6', NULL, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(302, 24, 2, 635, '2', '494.6', '494.6', NULL, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(303, 25, 2, 598, '4', '321.1', '321.1', NULL, '2022-05-05 15:24:33', '2022-05-05 15:24:33'),
(304, 26, 2, 584, '2', '197.16', '197.16', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(305, 26, 2, 585, '5', '245.7', '245.7', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(306, 26, 2, 588, '29', '272.79', '272.79', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(307, 26, 2, 589, '4', '274.6', '274.6', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(308, 26, 2, 590, '1', '275.1', '275.1', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(309, 26, 2, 591, '1', '221.6', '221.6', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(310, 26, 2, 592, '1', '225.5', '225.5', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(311, 26, 2, 593, '1', '225.5', '225.5', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(312, 26, 2, 594, '4', '119.83', '119.83', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(313, 26, 2, 595, '1', '119.1', '119.1', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(314, 26, 2, 596, '6', '137.6', '137.6', NULL, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(315, 27, 2, 526, '1', '260.1', '260.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(316, 27, 2, 527, '1', '318.34', '318.34', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(317, 27, 2, 531, '1', '498.6', '498.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(318, 27, 2, 532, '2', '498.6', '498.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(319, 27, 2, 675, '1', '185.1', '185.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(320, 27, 2, 535, '20', '282.6', '282.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(321, 27, 2, 536, '1', '300.1', '300.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(322, 27, 2, 537, '3', '292.69', '292.69', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(323, 27, 2, 538, '1', '319.1', '319.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(324, 27, 2, 540, '6', '229.93', '229.93', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(325, 27, 2, 541, '4', '223.45', '223.45', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(326, 27, 2, 542, '11', '232.65', '232.65', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(327, 27, 2, 543, '2', '217.1', '217.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(328, 27, 2, 544, '1', '209.6', '209.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(329, 27, 2, 545, '5', '212.3', '212.3', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(330, 27, 2, 676, '1', '182.1', '182.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(331, 27, 2, 549, '1', '204.66', '204.66', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(332, 27, 2, 558, '2', '303.6', '303.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(333, 27, 2, 565, '12', '247.1', '247.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(334, 27, 2, 566, '8', '246.1', '246.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(335, 27, 2, 567, '4', '247.1', '247.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(336, 27, 2, 568, '5', '263.1', '263.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(337, 27, 2, 677, '9', '255.47', '255.47', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(338, 27, 2, 569, '6', '262.01', '262.01', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(339, 27, 2, 570, '1', '333.1', '333.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(340, 27, 2, 524, '1', '193', '193', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(341, 27, 2, 525, '2', '183.6', '183.6', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(342, 27, 2, 577, '3', '116.04', '116.04', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(343, 27, 2, 578, '6', '108.59', '108.59', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(344, 27, 2, 579, '3', '116.04', '116.04', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(345, 27, 2, 580, '6', '158.31', '158.31', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(346, 27, 2, 678, '5', '149.3', '149.3', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(347, 27, 2, 581, '2', '158.31', '158.31', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(348, 27, 2, 582, '1', '161.1', '161.1', NULL, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(400, 28, 2, 517, '3', '195.44', '195.44', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(399, 28, 2, 516, '4', '195.44', '195.44', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(398, 28, 2, 515, '6', '187.1', '187.1', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(397, 28, 2, 514, '10', '181.8', '181.8', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(396, 28, 2, 513, '12', '179.45', '179.45', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(395, 28, 2, 512, '17', '178.81', '178.81', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(394, 28, 2, 500, '2', '301.39', '301.39', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(393, 28, 2, 511, '1', '274.1', '274.1', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(392, 28, 2, 510, '2', '272.49', '272.49', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(391, 28, 2, 508, '2', '241.95', '241.95', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(390, 28, 2, 507, '2', '241.95', '241.95', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(389, 28, 2, 505, '10', '224.33', '224.33', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(388, 28, 2, 504, '1', '198.1', '198.1', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(387, 28, 2, 679, '4', '171.97', '171.97', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(386, 28, 2, 503, '1', '172.1', '172.1', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(383, 21, 2, 623, '9', '228.1', '228.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(384, 21, 2, 628, '1', '328.1', '328.1', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(385, 21, 2, 629, '1', '297.45', '297.45', NULL, '2022-05-07 08:41:21', '2022-05-07 08:41:21'),
(401, 28, 2, 518, '1', '182.43', '182.43', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(402, 28, 2, 519, '6', '167.91', '167.91', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33'),
(403, 28, 2, 520, '2', '170.6', '170.6', NULL, '2022-05-07 13:10:33', '2022-05-07 13:10:33');

-- --------------------------------------------------------

--
-- Структура таблицы `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `user_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_type_id` int(11) DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int(11) DEFAULT NULL,
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stocks`
--

INSERT INTO `stocks` (`id`, `stock_id`, `user_id`, `price_type_id`, `name`, `main_currency_id`, `second_currency_id`, `address`, `created_at`, `updated_at`) VALUES
(4, NULL, '8', 2, 'Malika Next', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:53:43', '2022-04-13 11:53:43'),
(3, NULL, '8', 2, 'Malika A33', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:49:10', '2022-04-13 11:52:46'),
(5, NULL, '8', 2, 'Malika Iphone', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:55:20', '2022-04-13 11:55:20'),
(6, NULL, '8', 2, 'Malika Barsa', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:57:24', '2022-04-13 11:57:24'),
(7, NULL, '8', 2, 'Malika Hp', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:58:52', '2022-04-13 11:58:52'),
(8, NULL, '8', 2, 'Malika Mi', 1, '1|2', 'Shayxontoxur', '2022-04-13 11:59:38', '2022-04-13 11:59:38'),
(9, NULL, '8', 2, 'Malika Samsung', 1, '1|2', 'Shayxontoxur', '2022-04-13 12:00:10', '2022-04-13 12:00:10'),
(10, NULL, '8', 2, 'Malika FPS', 1, '1|2', 'Shayxontoxur', '2022-04-13 12:00:33', '2022-04-13 12:00:33'),
(11, NULL, '8', 2, 'Malika Kenwood', 1, '1|2', 'Shayxontoxur', '2022-04-13 12:02:53', '2022-04-13 12:02:53'),
(12, NULL, '8', 3, 'Abu Sahiy R99', 1, '1|2', 'Abu sahiy', '2022-04-13 12:05:51', '2022-04-13 12:05:51'),
(13, NULL, '8', 2, 'Ofis Azizxo\'ja', 1, '1|2', 'Ofis Azizxo\'ja', '2022-04-13 12:07:14', '2022-04-13 12:07:33'),
(14, NULL, '8', 3, 'Ofis Ulug\'bek', 1, '1|2', 'Ofis Ulug\'bek', '2022-04-13 12:08:07', '2022-04-13 12:08:07'),
(15, NULL, '8', 3, 'Sof Balans', 1, '1|2', 'Balans', '2022-04-13 12:09:10', '2022-04-13 12:09:10'),
(16, NULL, '8|9', 3, 'Sklad: Yo\'l', 1, '1|2', 'Yo\'l', '2022-04-20 11:14:36', '2022-04-20 15:11:32');

-- --------------------------------------------------------

--
-- Структура таблицы `stock_marks`
--

CREATE TABLE `stock_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `price_type_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `price` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `stock_operations`
--

CREATE TABLE `stock_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `convert_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `client_payment_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `stock_payment_id` int(11) DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_id` int(11) DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `stock_operations`
--

INSERT INTO `stock_operations` (`id`, `user_id`, `invoice_id`, `convert_id`, `stock_id`, `client_payment_id`, `client_id`, `stock_payment_id`, `date`, `operation`, `sum_currency_id`, `sum_id`, `type`, `created_at`, `updated_at`) VALUES
(38, 8, 25, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 60, 1, '2022-05-05 15:24:33', '2022-05-05 15:24:33'),
(37, 8, 24, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 59, 1, '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(36, 8, 23, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 58, 1, '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(35, 8, 22, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 57, 1, '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(34, 9, 21, NULL, 15, NULL, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 56, 1, '2022-05-05 15:16:38', '2022-05-07 08:41:21'),
(33, 8, 20, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 55, 1, '2022-05-05 15:05:17', '2022-05-05 15:05:17'),
(32, 8, 19, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 54, 1, '2022-05-05 13:55:44', '2022-05-05 13:55:44'),
(31, 8, 18, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 53, 1, '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(30, 9, 17, NULL, 15, NULL, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 52, 1, '2022-05-05 13:31:42', '2022-05-07 13:37:27'),
(29, 8, 16, NULL, 16, NULL, 3, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 51, 1, '2022-05-05 13:30:10', '2022-05-05 13:37:26'),
(39, 8, 26, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 61, 1, '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(40, 8, 27, NULL, 15, NULL, 2, NULL, '2022-05-05', 'Mahsulot(kirim)', 1, 62, 1, '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(41, 9, 28, NULL, 15, NULL, 2, NULL, '2022-05-07', 'Mahsulot(kirim)', 1, 63, 1, '2022-05-05 16:05:42', '2022-05-07 13:10:33');

-- --------------------------------------------------------

--
-- Структура таблицы `stock_payments`
--

CREATE TABLE `stock_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_from` int(11) DEFAULT NULL,
  `stock_to` int(11) DEFAULT NULL,
  `sum_id` int(11) DEFAULT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sums`
--

CREATE TABLE `sums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sum_currency_id` int(11) DEFAULT NULL,
  `sum_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_pay_get` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_currency_pay_will` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_currency_id` int(11) DEFAULT NULL,
  `main_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `main_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `second_currency_id` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_pay` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_currency_rate` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sums`
--

INSERT INTO `sums` (`id`, `sum_currency_id`, `sum_currency_pay`, `sum_currency_pay_get`, `sum_currency_pay_will`, `discount`, `main_currency_id`, `main_currency_pay`, `main_currency_rate`, `second_currency_id`, `second_currency_pay`, `second_currency_rate`, `created_at`, `updated_at`) VALUES
(60, 1, '1284.4', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:24:33', '2022-05-05 15:24:33'),
(59, 1, '2223.4', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:24:15', '2022-05-05 15:24:15'),
(58, 1, '64.5', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:22:17', '2022-05-05 15:22:17'),
(57, 1, '5474.87', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:21:32', '2022-05-05 15:21:32'),
(56, 1, '22591.07', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:16:38', '2022-05-07 08:41:21'),
(55, 1, '1091.58', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:05:17', '2022-05-05 15:05:17'),
(54, 1, '2155', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:55:44', '2022-05-05 13:55:44'),
(53, 1, '15366.1', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:54:43', '2022-05-05 13:54:43'),
(52, 1, '696.11', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:31:42', '2022-05-07 13:37:27'),
(51, 1, '0', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:30:10', '2022-05-05 13:37:26'),
(50, 1, '0', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:27:19', '2022-05-05 13:27:19'),
(49, 1, '0', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 13:23:46', '2022-05-05 13:23:46'),
(61, 1, '13003.85', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 15:26:22', '2022-05-05 15:26:22'),
(62, 1, '32464.75', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 16:00:27', '2022-05-05 16:00:27'),
(63, 1, '16723.98', '0', NULL, NULL, 1, '0', '1', '1|2', '0|0', '1|11050', '2022-05-05 16:05:42', '2022-05-07 13:10:33');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_from` int(11) DEFAULT NULL,
  `stock_to` int(11) DEFAULT NULL,
  `marks` text COLLATE utf8mb4_unicode_ci,
  `products` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `transfers`
--

INSERT INTO `transfers` (`id`, `date`, `name`, `stock_from`, `stock_to`, `marks`, `products`, `note`, `status`, `created_at`, `updated_at`) VALUES
(5, '2022-05-08', 'MiFsjxWcgl', 15, 12, '603,674,607,608,610,611,668,669,671,672,673,621,624,623,650,651,637,638,639,640,505,508,500,512,513,514,515,516,519,531,535,537,540,541,542,545,549,565,566,567,677,525,578,580,584,585,588,591,594,598', '821|840|841|842|1182,1181|1178,1177,1176,1175|1164,1163,1162|1159,1158|1184|1196|1202,1201|1221|1230|1234,1242|616,615,614,613|618,617|622,621,620,619|624|642,641|660|1260|1264|1269|1286,1285,1284|1298|1308|1314,1313|1318|1328|915|919,920,921,922,923,924|940|944,945|950|954,955,956|968|974|977,978,979,980,981|989,990|997|1006,1007,1008,1009,1010|1023|1028,1029|1037,1038|858|860,861,862|865,866|899|902,903|854,855', NULL, 0, '2022-05-08 15:15:22', '2022-05-08 15:15:22');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Telefon va gadjetlar', '2022-04-04 06:52:33', '2022-04-13 12:22:09'),
(5, 'SMARTFONLAR', '2022-04-13 12:58:39', '2022-04-13 12:58:39'),
(4, 'KNOBKA TEL', '2022-04-13 12:58:33', '2022-04-13 12:58:33'),
(6, 'PLANSHETLAR', '2022-04-13 12:58:46', '2022-04-13 12:58:46'),
(7, 'PLANSHET', '2022-04-13 13:11:31', '2022-04-13 13:11:31');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `name` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(199) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `stock_id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(7, NULL, 'stechmob.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj', 'KsenofontMaidanov+1s5e@mail.ru', NULL, NULL, '$2y$10$UtEJZQx1gS9kjaLFl8xUHuoHLKb7op3OehhmtjuXTCcKQUtEgypJa', NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:04:33', '2022-04-13 10:04:33'),
(6, NULL, 'stechmob.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj', 'chubenkodaniiaz+1ge2@mail.ru', NULL, NULL, '$2y$10$QjVJ/tK./vrj0iSFjWT5EuypizUHHM78D0fEd0ksbpRr8yVhFWsm2', NULL, NULL, NULL, NULL, NULL, '2022-04-12 19:06:52', '2022-04-12 19:06:52'),
(8, 16, 'Abdulloh', 'azizkhujaagzamkhujayev@gmail.com', NULL, NULL, '$2y$10$WYIGj0eHc0Kq4jUBZTn2J.fBH8coPI8RsKx9/NKPHeHtY5L9GfJzW', NULL, NULL, 'nVfL3krEURnXqxsfmNr39maQv4UGPxO6R9Da9r1Jj3En8hxLR1079DnIZels', NULL, NULL, '2022-04-13 11:35:02', '2022-04-20 11:14:36'),
(9, 16, 'Rustam', 'mannopovr@gmail.com', NULL, NULL, '$2y$10$armO6eG7oNiAS5ioO2h1S.DHRqvGQZ3yE07Q9BtN0cc534ZanAM/O', NULL, NULL, NULL, NULL, NULL, '2022-04-20 14:57:41', '2022-04-20 14:57:41');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cashboxes`
--
ALTER TABLE `cashboxes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_operations`
--
ALTER TABLE `client_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_operations_invoice_id_foreign` (`invoice_id`),
  ADD KEY `client_operations_client_id_foreign` (`client_id`),
  ADD KEY `client_operations_client_payment_id_foreign` (`client_payment_id`);

--
-- Индексы таблицы `client_payments`
--
ALTER TABLE `client_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_payments_stock_id_foreign` (`stock_id`),
  ADD KEY `client_payments_client_id_foreign` (`client_id`);

--
-- Индексы таблицы `converts`
--
ALTER TABLE `converts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_stock_id_foreign` (`stock_id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marks_type_id_foreign` (`type_id`),
  ADD KEY `marks_brand_id_foreign` (`brand_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_stock_id_foreign` (`stock_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_invoice_id_foreign` (`invoice_id`);

--
-- Индексы таблицы `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_client_id_foreign` (`client_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `price_types`
--
ALTER TABLE `price_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_stock_id_foreign` (`stock_id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_shipment_id_foreign` (`shipment_id`),
  ADD KEY `products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `products_mark_id_foreign` (`mark_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `shipments_client_id_foreign` (`client_id`),
  ADD KEY `shipments_mark_id_foreign` (`mark_id`);

--
-- Индексы таблицы `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stock_marks`
--
ALTER TABLE `stock_marks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stock_operations`
--
ALTER TABLE `stock_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_operations_user_id_foreign` (`user_id`),
  ADD KEY `stock_operations_invoice_id_foreign` (`invoice_id`),
  ADD KEY `stock_operations_convert_id_foreign` (`convert_id`),
  ADD KEY `stock_operations_stock_id_foreign` (`stock_id`),
  ADD KEY `stock_operations_client_payment_id_foreign` (`client_payment_id`),
  ADD KEY `stock_operations_client_id_foreign` (`client_id`),
  ADD KEY `stock_operations_stock_payment_id_foreign` (`stock_payment_id`);

--
-- Индексы таблицы `stock_payments`
--
ALTER TABLE `stock_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_payments_stock_from_foreign` (`stock_from`);

--
-- Индексы таблицы `sums`
--
ALTER TABLE `sums`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `cashboxes`
--
ALTER TABLE `cashboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `client_operations`
--
ALTER TABLE `client_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `client_payments`
--
ALTER TABLE `client_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `converts`
--
ALTER TABLE `converts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `price_types`
--
ALTER TABLE `price_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1363;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;

--
-- AUTO_INCREMENT для таблицы `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `stock_marks`
--
ALTER TABLE `stock_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT для таблицы `stock_operations`
--
ALTER TABLE `stock_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `stock_payments`
--
ALTER TABLE `stock_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sums`
--
ALTER TABLE `sums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
