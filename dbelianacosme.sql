-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2022 a las 16:30:28
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbelianacosme`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agent_has_client`
--

CREATE TABLE `agent_has_client` (
  `id_agent` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `agent_has_client`
--

INSERT INTO `agent_has_client` (`id_agent`, `id_client`, `id_wallet`) VALUES
(3, 6, 1),
(3, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agent_has_supervisor`
--

CREATE TABLE `agent_has_supervisor` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user_agent` int(11) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `base` double(8,2) DEFAULT 0.00,
  `id_wallet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `agent_has_supervisor`
--

INSERT INTO `agent_has_supervisor` (`id`, `id_user_agent`, `id_supervisor`, `created_at`, `base`, `id_wallet`) VALUES
(1, 3, 2, NULL, 190000.00, 1),
(2, 4, 5, '2022-12-03 19:01:53', 0.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_wallet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `close_day`
--

CREATE TABLE `close_day` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `base_before` double(8,2) DEFAULT NULL,
  `from_number` double(8,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countrys`
--

CREATE TABLE `countrys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `countrys`
--

INSERT INTO `countrys` (`id`, `name`) VALUES
(1, 'Mauritania'),
(2, 'Samoa'),
(3, 'Sweden');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit`
--

CREATE TABLE `credit` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount_neto` double(8,2) DEFAULT 0.00,
  `order_list` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL,
  `utility` double(8,2) DEFAULT NULL,
  `status` enum('close','inprogress') COLLATE utf8mb4_unicode_ci DEFAULT 'inprogress',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `credit`
--

INSERT INTO `credit` (`id`, `amount_neto`, `order_list`, `id_user`, `id_agent`, `payment_number`, `utility`, `status`, `created_at`, `updated_at`) VALUES
(1, 4567.00, 1, 6, 3, 19, 0.30, 'inprogress', '2022-12-03 18:56:32', NULL),
(2, 4567.00, 2, 7, 3, 11, 0.20, 'inprogress', '2022-12-03 18:57:08', NULL),
(3, 6.00, 3, 7, 3, 1, 0.20, 'inprogress', '2022-12-03 18:57:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_bill`
--

CREATE TABLE `list_bill` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '	',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list_bill`
--

INSERT INTO `list_bill` (`id`, `name`) VALUES
(1, 'Combustible'),
(2, 'Comida'),
(3, 'Transporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_12_03_000000_create_agent_has_supervisor_table', 1),
(2, '2017_12_03_000001_create_users_table', 1),
(3, '2017_12_03_000002_create_credit_table', 1),
(4, '2017_12_03_000003_create_agent_has_client_table', 1),
(5, '2017_12_03_000004_create_password_resets_table', 1),
(6, '2017_12_03_000005_create_route_table', 1),
(7, '2017_12_03_000006_create_migrations_table', 1),
(8, '2017_12_03_000007_create_summary_table', 1),
(9, '2017_12_03_000008_create_countrys_table', 1),
(10, '2017_12_03_000009_create_not_pay_table', 1),
(11, '2017_12_03_000010_create_users_has_route_table', 1),
(12, '2017_12_03_000011_create_payment_number_table', 1),
(13, '2017_12_03_000012_create_close_day_table', 1),
(14, '2017_12_03_000013_create_bills_table', 1),
(15, '2017_12_03_000014_create_list_bill_table', 1),
(16, '2017_12_03_000015_create_wallet_table', 1),
(17, '2022_12_03_144641_create_audits_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `not_pay`
--

CREATE TABLE `not_pay` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_credit` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_number`
--

CREATE TABLE `payment_number` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` int(11) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `selected` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `payment_number`
--

INSERT INTO `payment_number` (`id`, `name`, `id_agent`, `selected`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, NULL),
(6, 6, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL),
(9, 9, NULL, NULL),
(10, 10, NULL, NULL),
(11, 11, NULL, NULL),
(12, 12, NULL, NULL),
(13, 13, NULL, NULL),
(14, 14, NULL, NULL),
(15, 15, NULL, NULL),
(16, 16, NULL, NULL),
(17, 17, NULL, NULL),
(18, 18, NULL, NULL),
(19, 19, NULL, NULL),
(20, 20, NULL, NULL),
(21, 21, NULL, NULL),
(22, 22, NULL, NULL),
(23, 23, NULL, NULL),
(24, 24, NULL, NULL),
(25, 25, NULL, NULL),
(26, 26, NULL, NULL),
(27, 27, NULL, NULL),
(28, 28, NULL, NULL),
(29, 29, NULL, NULL),
(30, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `route`
--

CREATE TABLE `route` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `summary`
--

CREATE TABLE `summary` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `id_agent` int(11) DEFAULT NULL,
  `id_credit` int(11) DEFAULT NULL,
  `number_index` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `summary`
--

INSERT INTO `summary` (`id`, `amount`, `id_agent`, `id_credit`, `number_index`, `created_at`, `updated_at`) VALUES
(1, 432.00, 3, 1, 1, '2022-12-03 19:00:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_user` enum('enabled','disabled') COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('user','agent','supervisor','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('bad','good') COLLATE utf8mb4_unicode_ci DEFAULT 'good',
  `lng` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `active_user`, `remember_token`, `level`, `last_name`, `address`, `province`, `phone`, `nit`, `status`, `lng`, `lat`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@admin.com', '$2y$10$zr//tR.iE/3VDw2F7yrFZ.0nxG3n4K5dxxbE1jUy3C27Q05etdzdC', 'enabled', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL),
(2, 'Supervisor', 'supervisor@supervisor.com', '$2y$10$cxKuT1moO3nBLzdifQk6mucFJufZ74Gyv9lOauVQ.VqSuqTYd/03S', 'enabled', NULL, 'supervisor', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL),
(3, 'Agente', 'agente@agente.com', '$2y$10$HwqZTz15j50qIxlvF/EBGO/IxeOPQtzvyorHsTGFMO9MvMEfHrVIe', 'enabled', NULL, 'agent', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, NULL),
(4, 'eli cosme aspi', 'userelianacosme', '$2y$10$StQs5R01Nhsvu3yCKHikF.VvZ0/XUyiUcklDNeGci2ondlVZLMbVG', 'enabled', NULL, 'agent', NULL, 'la paz', NULL, NULL, NULL, 'good', NULL, NULL, 'Mauritania', NULL, '2022-12-03 19:04:18'),
(5, 'eli cosme aspi', 'userelianacosmeaspi', '$2y$10$lpgQtp5re.MNQYdLVqRbpua0gwCNdtrpRCKIOjjRQU4doqafmLEK6', 'enabled', NULL, 'supervisor', NULL, NULL, NULL, NULL, NULL, 'good', NULL, NULL, NULL, NULL, '2022-12-03 19:02:13'),
(6, 'ELIANA', '13731534', 'HaxgK', 'enabled', NULL, 'user', 'COSME ASPI', 'LA PAZ EL ALTO', 'TILTA', '78891715', '13731534', 'good', NULL, NULL, NULL, NULL, NULL),
(7, 'TATIANA', '123456', '9gSIy', 'enabled', NULL, 'user', 'SESE', 'LA PAZ EL ALTO', 'BOLOS', '78891715', '123456', 'good', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_has_route`
--

CREATE TABLE `users_has_route` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `agent_has_supervisor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wallet`
--

CREATE TABLE `wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wallet`
--

INSERT INTO `wallet` (`id`, `name`, `created_at`, `country`, `address`) VALUES
(1, 'Caja principal', NULL, 1, 'Madrid'),
(2, 'eliana cosme aspi', '2022-12-03 18:55:12', 1, 'la paz'),
(3, 'cajero', '2022-12-03 19:03:52', 1, 'tololo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agent_has_supervisor`
--
ALTER TABLE `agent_has_supervisor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `close_day`
--
ALTER TABLE `close_day`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `countrys`
--
ALTER TABLE `countrys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `list_bill`
--
ALTER TABLE `list_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `not_pay`
--
ALTER TABLE `not_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payment_number`
--
ALTER TABLE `payment_number`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `summary`
--
ALTER TABLE `summary`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_has_route`
--
ALTER TABLE `users_has_route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_users_has_route_agent_has_supervisor1_idx` (`agent_has_supervisor_id`),
  ADD KEY `fk_users_has_route_route1_idx` (`route_id`);

--
-- Indices de la tabla `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agent_has_supervisor`
--
ALTER TABLE `agent_has_supervisor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `close_day`
--
ALTER TABLE `close_day`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countrys`
--
ALTER TABLE `countrys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `credit`
--
ALTER TABLE `credit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `list_bill`
--
ALTER TABLE `list_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '	', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `not_pay`
--
ALTER TABLE `not_pay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_number`
--
ALTER TABLE `payment_number`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `route`
--
ALTER TABLE `route`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `summary`
--
ALTER TABLE `summary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users_has_route`
--
ALTER TABLE `users_has_route`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
