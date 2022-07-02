-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.27 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Linux
-- HeidiSQL Sürüm:               11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- tablo yapısı dökülüyor arac_takip.arac_marka
CREATE TABLE IF NOT EXISTS `arac_marka` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `arac_marka` char(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.arac_marka: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `arac_marka` DISABLE KEYS */;
REPLACE INTO `arac_marka` (`id`, `arac_marka`, `created_at`, `updated_at`) VALUES
	(1, 'bmw', '2022-07-02 05:43:45', '2022-07-02 08:43:57'),
	(2, 'audi', '2022-07-02 08:43:56', '2022-07-02 08:43:57');
/*!40000 ALTER TABLE `arac_marka` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.arac_model
CREATE TABLE IF NOT EXISTS `arac_model` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marka_id` int NOT NULL,
  `model` char(50) NOT NULL DEFAULT '',
  `segment` char(10) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.arac_model: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `arac_model` DISABLE KEYS */;
REPLACE INTO `arac_model` (`id`, `marka_id`, `model`, `segment`, `created_at`, `updated_at`) VALUES
	(1, 1, 'BMW 2 Serisi Gran Coupé M', 'D', '2022-07-02 08:50:34', '2022-07-02 08:50:35'),
	(2, 1, 'BMW 3 Serisi Touring M', 'D', '2022-07-02 08:52:11', '2022-07-02 08:52:11'),
	(3, 2, 'Audi A3 Sportback', 'D', '2022-07-02 08:52:37', '2022-07-02 08:52:37'),
	(4, 2, 'A8', 'D', '2022-07-02 08:53:06', '2022-07-02 08:53:06');
/*!40000 ALTER TABLE `arac_model` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.failed_jobs: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.migrations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_07_02_053638_create_arac_markas_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.musteri
CREATE TABLE IF NOT EXISTS `musteri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `musteri_adi` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.musteri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `musteri` DISABLE KEYS */;
REPLACE INTO `musteri` (`id`, `musteri_adi`, `created_at`, `updated_at`) VALUES
	(1, '%Oakland%', NULL, NULL),
	(2, 'aa', '2022-07-02 07:25:54', '2022-07-02 07:25:54'),
	(3, 'aaa', '2022-07-02 07:26:07', '2022-07-02 07:26:07'),
	(4, 'xx', '2022-07-02 07:31:14', '2022-07-02 07:31:14'),
	(5, 'asd', '2022-07-02 07:44:10', '2022-07-02 07:44:10');
/*!40000 ALTER TABLE `musteri` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.password_resets: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.personal_access_tokens: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.tamir
CREATE TABLE IF NOT EXISTS `tamir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marka_id` int NOT NULL,
  `model_id` int NOT NULL,
  `musteri_id` int NOT NULL,
  `tamir_turu_id` int NOT NULL,
  `tamir_yeri_id` int NOT NULL,
  `tamir_tarihi` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.tamir: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tamir` DISABLE KEYS */;
REPLACE INTO `tamir` (`id`, `marka_id`, `model_id`, `musteri_id`, `tamir_turu_id`, `tamir_yeri_id`, `tamir_tarihi`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 3, 1, 1, '2022-07-03 00:00:00', '2022-07-02 07:29:19', '2022-07-02 07:29:19'),
	(2, 1, 2, 2, 1, 1, '2022-07-15 00:00:00', '2022-07-02 07:30:15', '2022-07-02 07:30:15'),
	(3, 2, 4, 4, 2, 1, '2022-07-15 00:00:00', '2022-09-02 07:31:14', '2022-07-02 07:31:14'),
	(4, 1, 1, 5, 1, 2, '2022-07-08 19:30:00', '2022-10-02 07:44:10', '2022-07-02 07:44:10');
/*!40000 ALTER TABLE `tamir` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.tamir_relationship
CREATE TABLE IF NOT EXISTS `tamir_relationship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamir_yeri_id` int NOT NULL,
  `tamir_turu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.tamir_relationship: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tamir_relationship` DISABLE KEYS */;
REPLACE INTO `tamir_relationship` (`id`, `tamir_yeri_id`, `tamir_turu_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, '2022-07-02 09:30:13', '2022-07-02 09:30:13'),
	(2, 1, 1, '2022-07-02 09:30:20', '2022-07-02 09:30:20'),
	(3, 2, 1, '2022-07-02 09:30:24', '2022-07-02 09:30:25');
/*!40000 ALTER TABLE `tamir_relationship` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.tamir_turu
CREATE TABLE IF NOT EXISTS `tamir_turu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamir_turu` varchar(50) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.tamir_turu: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tamir_turu` DISABLE KEYS */;
REPLACE INTO `tamir_turu` (`id`, `tamir_turu`, `created_at`, `updated_at`) VALUES
	(1, 'boya', '2022-07-02 09:23:11', '2022-07-02 09:23:12'),
	(2, 'motor', '2022-07-02 09:23:29', '2022-07-02 09:23:30');
/*!40000 ALTER TABLE `tamir_turu` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.tamir_yeri
CREATE TABLE IF NOT EXISTS `tamir_yeri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamir_yeri` varchar(50) NOT NULL,
  `aylik_kapasite` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- arac_takip.tamir_yeri: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `tamir_yeri` DISABLE KEYS */;
REPLACE INTO `tamir_yeri` (`id`, `tamir_yeri`, `aylik_kapasite`, `created_at`, `updated_at`) VALUES
	(1, 'gebze', 10, '2022-07-02 09:23:40', '2022-07-02 09:23:42'),
	(2, 'tuzla', 20, '2022-07-02 09:23:46', '2022-07-02 09:23:47');
/*!40000 ALTER TABLE `tamir_yeri` ENABLE KEYS */;

-- tablo yapısı dökülüyor arac_takip.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- arac_takip.users: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'test@test.com', NULL, '$2y$10$CB.AkXXyP1g5dpH2T3bGOe/tS5rtAfEh21ZpUMBCTF0e4EIH3LXJi', NULL, '2022-07-02 05:42:48', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
