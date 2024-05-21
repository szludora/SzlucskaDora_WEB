-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Máj 21. 18:08
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vizsga`
--
CREATE DATABASE IF NOT EXISTS `vizsga` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vizsga`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_21_140428_create_temas_table', 1),
(6, '2024_05_21_141122_create_szavaks_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szavaks`
--

CREATE TABLE IF NOT EXISTS `szavaks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `temaId` bigint(20) UNSIGNED NOT NULL,
  `angol` varchar(255) NOT NULL,
  `magyar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `szavaks_temaid_foreign` (`temaId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `szavaks`
--

INSERT INTO `szavaks` (`id`, `temaId`, `angol`, `magyar`, `created_at`, `updated_at`) VALUES
(1, 2, 'Aut.', 'Enim.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(2, 10, 'Nam.', 'Ab.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(3, 10, 'Ex.', 'Nam.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(4, 5, 'Aut.', 'Enim.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(5, 3, 'Et.', 'Quas.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(6, 7, 'Quo.', 'Ad.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(7, 10, 'Esse.', 'Nemo.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(8, 4, 'Vero.', 'Unde.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(9, 6, 'Hic.', 'Fuga.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(10, 3, 'Quas.', 'Quas.', '2024-05-21 13:40:43', '2024-05-21 13:40:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `temas`
--

CREATE TABLE IF NOT EXISTS `temas` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `temanev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `temas`
--

INSERT INTO `temas` (`id`, `temanev`, `created_at`, `updated_at`) VALUES
(1, 'Explicabo.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(2, 'Quisquam.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(3, 'Non qui.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(4, 'In aut.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(5, 'Officia.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(6, 'Molestias.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(7, 'Ipsa et.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(8, 'Et animi.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(9, 'Voluptas.', '2024-05-21 13:40:43', '2024-05-21 13:40:43'),
(10, 'Quod.', '2024-05-21 13:40:43', '2024-05-21 13:40:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `szavaks`
--
ALTER TABLE `szavaks`
  ADD CONSTRAINT `szavaks_temaid_foreign` FOREIGN KEY (`temaId`) REFERENCES `temas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
