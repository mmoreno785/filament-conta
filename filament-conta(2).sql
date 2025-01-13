-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2025 a las 23:01:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `filament-conta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `sitio` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id`, `cliente_id`, `sitio`, `usuario`, `clave`, `link`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 1, 'IESS', '1711042422', '1711042422', 'www.iess.gob.ec', 'Clave de Empleador IESS', '2024-12-24 22:06:48', '2024-12-24 22:06:48'),
(2, 2, 'IESS', '1400480784', 'lancelot', 'www.iess.gob.ec', 'Clave de Empleador IESS', '2024-12-24 22:11:20', '2024-12-24 22:11:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1736284254),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1736284254;', 1736284254),
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1736342300),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1736342300;', 1736342300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantons`
--

CREATE TABLE `cantons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provinciaId` bigint(20) UNSIGNED NOT NULL,
  `canton` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cantons`
--

INSERT INTO `cantons` (`id`, `provinciaId`, `canton`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cuenca', '2024-12-02 20:58:19', '2024-12-02 20:58:19'),
(2, 1, 'Gualaceo', '2024-12-02 22:50:12', '2024-12-02 22:50:12'),
(3, 1, 'Sigsig', '2024-12-02 22:55:44', '2024-12-02 22:55:44'),
(4, 2, 'Morona', '2024-12-03 01:31:04', '2024-12-03 01:31:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos`
--

CREATE TABLE `catalogos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogos`
--

INSERT INTO `catalogos` (`id`, `codigo`, `descripcion`, `precio`, `created_at`, `updated_at`) VALUES
(1, 'OFI', 'Oficios Varios', 2, '2024-12-24 22:24:31', '2024-12-24 22:24:31'),
(2, 'ENT', 'Aviso de Entrada IESS', 2.5, '2024-12-24 22:41:18', '2024-12-24 22:41:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ruc` varchar(255) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `provinciaId` bigint(20) UNSIGNED NOT NULL,
  `cantonId` bigint(20) UNSIGNED NOT NULL,
  `parroquiaId` bigint(20) UNSIGNED NOT NULL,
  `sectorHogar` varchar(255) NOT NULL,
  `sectorNegocio` varchar(255) NOT NULL,
  `direccionHogar` varchar(255) NOT NULL,
  `direccionNegocio` varchar(255) NOT NULL,
  `coordenadasHogar` varchar(255) NOT NULL,
  `coordenadasNegocio` varchar(255) NOT NULL,
  `imgHogar` varchar(255) NOT NULL,
  `imgNegocio` varchar(255) NOT NULL,
  `tipoId` bigint(20) UNSIGNED NOT NULL,
  `regimenId` bigint(20) UNSIGNED NOT NULL,
  `declaracionId` bigint(20) UNSIGNED NOT NULL,
  `usuarioId` bigint(20) UNSIGNED NOT NULL,
  `obligado` tinyint(1) NOT NULL COMMENT 'Obligado a llevar contabilidad',
  `agente` tinyint(1) NOT NULL COMMENT 'Agente de retención',
  `gran` tinyint(1) NOT NULL COMMENT 'Gran contribuyente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `ruc`, `empresa`, `nombres`, `apellidos`, `email`, `telefono`, `celular`, `provinciaId`, `cantonId`, `parroquiaId`, `sectorHogar`, `sectorNegocio`, `direccionHogar`, `direccionNegocio`, `coordenadasHogar`, `coordenadasNegocio`, `imgHogar`, `imgNegocio`, `tipoId`, `regimenId`, `declaracionId`, `usuarioId`, `obligado`, `agente`, `gran`, `created_at`, `updated_at`) VALUES
(1, '1711042422001', 'Servicios Informáticos Nicole', 'Diego David', 'Dueñas López', 'ddd_diego@hotmail.com', '072702392', '0982567956', 2, 4, 2, 'Los Canelos', 'Los Canelos', 'Don Bosco y Pastaza', 'Don Bosco y Pastaza', '1.7, 2.8', '1.7,2.8', 'img1', 'img2', 1, 2, 1, 1, 0, 0, 0, '2024-12-18 02:22:02', '2024-12-18 21:48:20'),
(2, '1400480784001', 'M&M Sistemas', 'Mesias Eduardo', 'Moreno Orellana', 'mmoreno785@gmail.com', '072525290', '0994762331', 2, 4, 2, 'La Barranca', 'Amazonas', 'Entrada Vecinal y Rosario Rivadeneira SN', 'Juan de Salinas y 24 de Mayo SN', '12.72', '12.71', '[\"01JH19NR5KN1PTA5BF2GR9GDSH.png\"]', 'im3', 1, 2, 1, 1, 0, 0, 0, '2024-12-20 02:39:38', '2025-01-08 02:10:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `declaracions`
--

CREATE TABLE `declaracions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `declaracion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `declaracions`
--

INSERT INTO `declaracions` (`id`, `declaracion`, `created_at`, `updated_at`) VALUES
(1, 'Mensual', '2024-12-17 22:40:13', '2024-12-17 22:40:13'),
(2, 'Trimestral', '2024-12-17 22:40:31', '2024-12-17 22:40:31'),
(3, 'Cuatrimestral', '2024-12-24 21:07:03', '2024-12-24 21:07:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '0001_01_01_000000_create_users_table', 1),
(23, '0001_01_01_000001_create_cache_table', 1),
(24, '0001_01_01_000002_create_jobs_table', 1),
(25, '2024_11_29_204629_create_provincias_table', 1),
(26, '2024_11_29_204630_create_cantons_table', 1),
(27, '2024_11_29_204630_create_declaracions_table', 1),
(28, '2024_11_29_204630_create_parroquias_table', 1),
(29, '2024_11_29_204630_create_regimens_table', 1),
(30, '2024_11_29_204630_create_tipos_table', 1),
(31, '2024_11_29_204631_create_clientes_table', 1),
(32, '2024_11_29_204655_create_catalogos_table', 1),
(33, '2024_11_29_204656_create_tramites_table', 1),
(34, '2024_11_29_220132_create_accesos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquias`
--

CREATE TABLE `parroquias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantonId` bigint(20) UNSIGNED NOT NULL,
  `provinciaId` bigint(20) UNSIGNED NOT NULL,
  `parroquia` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parroquias`
--

INSERT INTO `parroquias` (`id`, `cantonId`, `provinciaId`, `parroquia`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Cuenca', '2024-12-03 01:30:11', '2024-12-03 01:30:11'),
(2, 4, 2, 'Macas', '2024-12-03 01:32:17', '2024-12-03 01:32:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `provincia`, `created_at`, `updated_at`) VALUES
(1, 'Azuay', '2024-12-02 20:53:11', '2024-12-02 20:53:11'),
(2, 'Morona Santiago', '2024-12-03 01:30:46', '2024-12-03 01:30:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimens`
--

CREATE TABLE `regimens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regimen` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `regimens`
--

INSERT INTO `regimens` (`id`, `regimen`, `created_at`, `updated_at`) VALUES
(1, 'RIMPE Negocio Popular', '2024-12-17 21:47:04', '2024-12-17 21:47:04'),
(2, 'RIMPE Emprendedor', '2024-12-17 22:30:36', '2024-12-17 22:30:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aE3U5UtwErwwhHUs5QIBfHHoE8IDxRQX97OLabY5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUFVzdmZwTllGWDBpWHFWbTB0dFpDVkZBdUQ0WUNMZ1VmM2ExSEw5ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi90cmFtaXRlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkZERta3lWRXVkeG5LUFhDcllxb09CLk5qN20xTWJGTEw3bzgwcXJZNlgzNEZuTmZqNXNtVHUiO30=', 1736373053);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 'Persona Natural', '2024-12-17 21:41:33', '2024-12-17 21:41:33'),
(2, 'Sociedades', '2024-12-17 21:41:53', '2024-12-17 21:41:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramites`
--

CREATE TABLE `tramites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `catalogo_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unitario` double NOT NULL,
  `total` double NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tramites`
--

INSERT INTO `tramites` (`id`, `cliente_id`, `usuario_id`, `fecha`, `catalogo_id`, `cantidad`, `unitario`, `total`, `observacion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2024-12-24', 1, 3, 2.5, 7.5, 'oficios varios', 0, '2024-12-25 00:11:09', '2024-12-25 00:11:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mesias Moreno', 'mmoreno785@gmail.com', NULL, '$2y$12$dDmkyVEudxnKPXCrYqoOB.Nj7m1MbFLL7o80qrY6X34FnNfj5smTu', NULL, '2024-12-02 20:52:21', '2024-12-02 20:52:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accesos_idcliente_foreign` (`cliente_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cantons`
--
ALTER TABLE `cantons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cantons_provinciaid_foreign` (`provinciaId`);

--
-- Indices de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_provinciaid_foreign` (`provinciaId`),
  ADD KEY `clientes_cantonid_foreign` (`cantonId`),
  ADD KEY `clientes_parroquiaid_foreign` (`parroquiaId`),
  ADD KEY `clientes_tipoid_foreign` (`tipoId`),
  ADD KEY `clientes_regimenid_foreign` (`regimenId`),
  ADD KEY `clientes_declaracionid_foreign` (`declaracionId`),
  ADD KEY `clientes_usuarioid_foreign` (`usuarioId`);

--
-- Indices de la tabla `declaracions`
--
ALTER TABLE `declaracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parroquias_idcanton_foreign` (`cantonId`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regimens`
--
ALTER TABLE `regimens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tramites_clienteid_foreign` (`cliente_id`),
  ADD KEY `tramites_usuarioid_foreign` (`usuario_id`),
  ADD KEY `tramites_catalogoid_foreign` (`catalogo_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cantons`
--
ALTER TABLE `cantons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `declaracions`
--
ALTER TABLE `declaracions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `parroquias`
--
ALTER TABLE `parroquias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `regimens`
--
ALTER TABLE `regimens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tramites`
--
ALTER TABLE `tramites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_idcliente_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `cantons`
--
ALTER TABLE `cantons`
  ADD CONSTRAINT `cantons_provinciaid_foreign` FOREIGN KEY (`provinciaId`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_cantonid_foreign` FOREIGN KEY (`cantonId`) REFERENCES `cantons` (`id`),
  ADD CONSTRAINT `clientes_declaracionid_foreign` FOREIGN KEY (`declaracionId`) REFERENCES `declaracions` (`id`),
  ADD CONSTRAINT `clientes_parroquiaid_foreign` FOREIGN KEY (`parroquiaId`) REFERENCES `parroquias` (`id`),
  ADD CONSTRAINT `clientes_provinciaid_foreign` FOREIGN KEY (`provinciaId`) REFERENCES `provincias` (`id`),
  ADD CONSTRAINT `clientes_regimenid_foreign` FOREIGN KEY (`regimenId`) REFERENCES `regimens` (`id`),
  ADD CONSTRAINT `clientes_tipoid_foreign` FOREIGN KEY (`tipoId`) REFERENCES `tipos` (`id`),
  ADD CONSTRAINT `clientes_usuarioid_foreign` FOREIGN KEY (`usuarioId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `parroquias`
--
ALTER TABLE `parroquias`
  ADD CONSTRAINT `parroquias_idcanton_foreign` FOREIGN KEY (`cantonId`) REFERENCES `cantons` (`id`);

--
-- Filtros para la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD CONSTRAINT `tramites_catalogoid_foreign` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogos` (`id`),
  ADD CONSTRAINT `tramites_clienteid_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `tramites_usuarioid_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
