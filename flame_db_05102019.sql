-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2019 at 03:20 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flame_db`
--
CREATE DATABASE IF NOT EXISTS `flame_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `flame_db`;

-- --------------------------------------------------------

--
-- Table structure for table `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '2019-04-12 06:53:35', '2019-04-12 06:53:35'),
(2, 1, '::1', '2019-04-22 07:10:42', '2019-04-22 07:10:42'),
(3, 1, '::1', '2019-04-22 07:12:31', '2019-04-22 07:12:31'),
(4, 1, '::1', '2019-04-28 15:23:40', '2019-04-28 15:23:40'),
(5, 1, '::1', '2019-04-29 10:14:48', '2019-04-29 10:14:48'),
(6, 1, '::1', '2019-05-08 06:27:16', '2019-05-08 06:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Admin', 'Person', 'admin', 'admin@domain.tld', '$2y$10$ErxYgJLVGCyBPQZV0ZPA4eI49MkRQdFliRvtYBmfU7cLYwjux3AoS', NULL, '$2y$10$JZN6EHNEGIDU4QlnMjk0ou2OZIwcbY7PeIRxA.gP3gWgKgjQCMQFW', NULL, '', 1, 2, NULL, '2019-05-08 06:27:15', '2019-04-12 06:51:03', '2019-05-08 06:27:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2019-04-12 06:51:03', '2019-04-12 06:51:03', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2019-04-12 06:51:03', '2019-04-12 06:51:03'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2019-04-12 06:51:03', '2019-04-12 06:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '::1', 0, NULL, 0, NULL, 0, NULL),
(2, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `benfreke_menumanager_menus`
--

CREATE TABLE `benfreke_menumanager_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `link_target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `enabled` int(11) NOT NULL DEFAULT '1',
  `parameters` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `query_string` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `benfreke_menumanager_menus`
--

INSERT INTO `benfreke_menumanager_menus` (`id`, `parent_id`, `title`, `description`, `url`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`, `is_external`, `link_target`, `enabled`, `parameters`, `query_string`) VALUES
(1, NULL, 'Main menu', '', NULL, 1, 12, 0, '2019-04-12 08:41:41', '2019-04-12 08:44:12', 0, '_self', 1, '', ''),
(2, 1, 'Home', '', 'homepage', 2, 3, 1, '2019-04-12 08:42:25', '2019-04-12 08:44:16', 0, '_self', 1, '', ''),
(3, 1, 'Products', '', 'products', 4, 5, 1, '2019-04-12 08:42:49', '2019-05-07 07:42:40', 0, '_self', 1, '', ''),
(4, 1, 'About us', '', '/about-us', 6, 7, 1, '2019-04-12 08:43:12', '2019-04-12 08:44:21', 1, '_self', 1, '', ''),
(5, 1, 'Press', '', 'blog', 8, 9, 1, '2019-04-12 08:43:29', '2019-05-07 07:43:01', 0, '_self', 1, '', ''),
(6, 1, 'Contact', '', '/contact', 10, 11, 1, '2019-04-12 08:43:45', '2019-04-12 08:44:23', 1, '_self', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_ordersshopaholic_shipping_restrictions`
--

CREATE TABLE `lovata_ordersshopaholic_shipping_restrictions` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restriction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `property` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_ordersshopaholic_shipping_restrictions_link`
--

CREATE TABLE `lovata_ordersshopaholic_shipping_restrictions_link` (
  `shipping_type_id` int(10) UNSIGNED NOT NULL,
  `shipping_restriction_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_addition_properties`
--

CREATE TABLE `lovata_orders_shopaholic_addition_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'input',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_orders_shopaholic_addition_properties`
--

INSERT INTO `lovata_orders_shopaholic_addition_properties` (`id`, `active`, `name`, `slug`, `code`, `description`, `type`, `settings`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'lovata.toolbox::lang.field.email', 'email', 'email', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.field.user\"}', 1, '2019-04-12 07:00:32', '2019-04-12 07:00:32'),
(2, 1, 'lovata.ordersshopaholic::lang.field.name', 'name', 'name', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.field.user\"}', 2, '2019-04-12 07:00:32', '2019-04-12 07:00:32'),
(3, 1, 'lovata.ordersshopaholic::lang.field.last_name', 'last_name', 'last_name', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.field.user\"}', 3, '2019-04-12 07:00:32', '2019-04-12 07:00:32'),
(4, 1, 'lovata.toolbox::lang.field.phone', 'phone', 'phone', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.field.user\"}', 4, '2019-04-12 07:00:32', '2019-04-12 07:00:32'),
(5, 1, 'lovata.toolbox::lang.field.country', 'billing_country', 'billing_country', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 5, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(6, 1, 'lovata.toolbox::lang.field.state', 'billing_state', 'billing_state', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 6, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(7, 1, 'lovata.toolbox::lang.field.city', 'billing_city', 'billing_city', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 7, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(8, 1, 'lovata.toolbox::lang.field.street', 'billing_street', 'billing_street', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 8, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(9, 1, 'lovata.toolbox::lang.field.house', 'billing_house', 'billing_house', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 9, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(10, 1, 'lovata.toolbox::lang.field.flat', 'billing_flat', 'billing_flat', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 10, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(11, 1, 'lovata.toolbox::lang.field.address1', 'billing_address1', 'billing_address1', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 11, '2019-04-12 07:00:34', '2019-04-12 07:00:34'),
(12, 1, 'lovata.toolbox::lang.field.address2', 'billing_address2', 'billing_address2', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 12, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(13, 1, 'lovata.toolbox::lang.field.postcode', 'billing_postcode', 'billing_postcode', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.billing_address\"}', 13, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(14, 1, 'lovata.toolbox::lang.field.country', 'shipping_country', 'shipping_country', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 14, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(15, 1, 'lovata.toolbox::lang.field.state', 'shipping_state', 'shipping_state', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 15, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(16, 1, 'lovata.toolbox::lang.field.city', 'shipping_city', 'shipping_city', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 16, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(17, 1, 'lovata.toolbox::lang.field.street', 'shipping_street', 'shipping_street', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 17, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(18, 1, 'lovata.toolbox::lang.field.house', 'shipping_house', 'shipping_house', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 18, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(19, 1, 'lovata.toolbox::lang.field.flat', 'shipping_flat', 'shipping_flat', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 19, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(20, 1, 'lovata.toolbox::lang.field.address1', 'shipping_address1', 'shipping_address1', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 20, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(21, 1, 'lovata.toolbox::lang.field.address2', 'shipping_address2', 'shipping_address2', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 21, '2019-04-12 07:00:35', '2019-04-12 07:00:35'),
(22, 1, 'lovata.toolbox::lang.field.postcode', 'shipping_postcode', 'shipping_postcode', NULL, 'input', '{\"tab\":\"lovata.ordersshopaholic::lang.tab.shipping_address\"}', 22, '2019-04-12 07:00:35', '2019-04-12 07:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_carts`
--

CREATE TABLE `lovata_orders_shopaholic_carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_type_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci,
  `property` text COLLATE utf8mb4_unicode_ci,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `billing_address` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_cart_positions`
--

CREATE TABLE `lovata_orders_shopaholic_cart_positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LovataShopaholicModelsOffer',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `property` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_orders`
--

CREATE TABLE `lovata_orders_shopaholic_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_price` decimal(15,2) DEFAULT NULL,
  `shipping_type_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `property` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_data` text COLLATE utf8mb4_unicode_ci,
  `payment_response` text COLLATE utf8mb4_unicode_ci,
  `payment_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `shipping_tax_percent` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_order_positions`
--

CREATE TABLE `lovata_orders_shopaholic_order_positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `old_price` decimal(15,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_percent` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_order_promo_mechanism`
--

CREATE TABLE `lovata_orders_shopaholic_order_promo_mechanism` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `mechanism_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `discount_value` double(8,2) UNSIGNED NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_discount` tinyint(1) NOT NULL DEFAULT '0',
  `property` text COLLATE utf8mb4_unicode_ci,
  `element_id` int(10) UNSIGNED DEFAULT NULL,
  `element_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `element_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_payment_methods`
--

CREATE TABLE `lovata_orders_shopaholic_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cancel_status_id` int(11) DEFAULT '0',
  `fail_status_id` int(11) DEFAULT '0',
  `send_purchase_request` tinyint(1) NOT NULL DEFAULT '0',
  `gateway_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_property` text COLLATE utf8mb4_unicode_ci,
  `before_status_id` int(11) DEFAULT '0',
  `after_status_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_position_properties`
--

CREATE TABLE `lovata_orders_shopaholic_position_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'input',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_promo_mechanism`
--

CREATE TABLE `lovata_orders_shopaholic_promo_mechanism` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `discount_value` double(8,2) UNSIGNED NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_discount` tinyint(1) NOT NULL DEFAULT '0',
  `property` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_shipping_types`
--

CREATE TABLE `lovata_orders_shopaholic_shipping_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `property` text COLLATE utf8mb4_unicode_ci,
  `api_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_statuses`
--

CREATE TABLE `lovata_orders_shopaholic_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_user_show` tinyint(1) NOT NULL DEFAULT '0',
  `user_status_id` int(11) DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_orders_shopaholic_statuses`
--

INSERT INTO `lovata_orders_shopaholic_statuses` (`id`, `name`, `code`, `sort_order`, `created_at`, `updated_at`, `is_user_show`, `user_status_id`, `preview_text`) VALUES
(1, 'New', 'new', 1, '2019-04-12 07:00:32', '2019-04-12 07:00:32', 0, NULL, NULL),
(2, 'In progress', 'in_progress', 2, '2019-04-12 07:00:32', '2019-04-12 07:00:32', 0, NULL, NULL),
(3, 'Complete', 'complete', 3, '2019-04-12 07:00:32', '2019-04-12 07:00:32', 0, NULL, NULL),
(4, 'Canceled', 'canceled', 4, '2019-04-12 07:00:32', '2019-04-12 07:00:32', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_tasks`
--

CREATE TABLE `lovata_orders_shopaholic_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `mail_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `manager_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_orders_shopaholic_user_addresses`
--

CREATE TABLE `lovata_orders_shopaholic_user_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_additional_categories`
--

CREATE TABLE `lovata_shopaholic_additional_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_additional_categories`
--

INSERT INTO `lovata_shopaholic_additional_categories` (`category_id`, `product_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_brands`
--

CREATE TABLE `lovata_shopaholic_brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `search_synonym` text COLLATE utf8mb4_unicode_ci,
  `search_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_brands`
--

INSERT INTO `lovata_shopaholic_brands` (`id`, `active`, `name`, `slug`, `code`, `external_id`, `preview_text`, `description`, `sort_order`, `created_at`, `updated_at`, `search_synonym`, `search_content`) VALUES
(1, 1, 'MELAMINE Essentials', 'melamine-essentials', '', '', '', '', 1, '2019-04-12 10:48:02', '2019-04-12 10:48:02', '', NULL),
(2, 1, 'flamefield-brand', 'flamefield-brand', '', '', '', '', 2, '2019-04-23 10:54:46', '2019-04-23 10:54:46', '', NULL),
(3, 1, 'melamine', 'melamine', '', '', '', '', 3, '2019-04-23 11:06:50', '2019-04-23 11:06:50', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_categories`
--

CREATE TABLE `lovata_shopaholic_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(10) UNSIGNED DEFAULT NULL,
  `nest_right` int(10) UNSIGNED DEFAULT NULL,
  `nest_depth` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `search_synonym` text COLLATE utf8mb4_unicode_ci,
  `search_content` text COLLATE utf8mb4_unicode_ci,
  `featured_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_categories`
--

INSERT INTO `lovata_shopaholic_categories` (`id`, `active`, `name`, `slug`, `code`, `external_id`, `preview_text`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`, `search_synonym`, `search_content`, `featured_size`) VALUES
(1, 1, 'pri-mel MELAMINE TABLEWARE', 'pri-mel-melamine-tableware', '', '', '', '', NULL, 1, 4, 0, '2019-04-12 09:28:02', '2019-05-08 06:36:33', '', NULL, 'small'),
(2, 1, 'ACRYLIC DRINKWARE', 'acrylic-drinkware', '', '', '', '', NULL, 5, 6, 0, '2019-04-12 09:28:55', '2019-05-08 06:36:56', '', NULL, 'small'),
(3, 1, 'POLYCARBONATE DRINKWARE', 'polycarbonate-drinkware', '', '', '', '', NULL, 7, 8, 0, '2019-04-12 10:00:11', '2019-05-08 06:37:12', '', NULL, 'big'),
(4, 1, 'CAMPER SMILES', 'camper-smiles', '', '', '', '', NULL, 9, 10, 0, '2019-04-12 10:01:08', '2019-05-08 06:37:23', '', NULL, 'small'),
(5, 1, 'ACCESSORIES', 'accessories', '', '', '', '', NULL, 11, 12, 0, '2019-04-12 10:01:39', '2019-05-08 06:37:32', '', NULL, 'small'),
(6, 1, 'test', 'test', '', '', '', '', 1, 2, 3, 1, '2019-04-29 10:27:12', '2019-04-29 10:27:23', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_currency`
--

CREATE TABLE `lovata_shopaholic_currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_currency`
--

INSERT INTO `lovata_shopaholic_currency` (`id`, `active`, `is_default`, `name`, `code`, `symbol`, `rate`, `external_id`, `sort_order`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'USD', 'USD', '$', '1.00', NULL, 1, NULL, '2019-04-12 06:54:22', '2019-04-12 06:54:22');

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_offers`
--

CREATE TABLE `lovata_shopaholic_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_prices`
--

CREATE TABLE `lovata_shopaholic_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `old_price` decimal(15,2) DEFAULT NULL,
  `price_type_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_price_types`
--

CREATE TABLE `lovata_shopaholic_price_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_products`
--

CREATE TABLE `lovata_shopaholic_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `search_synonym` text COLLATE utf8mb4_unicode_ci,
  `search_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_products`
--

INSERT INTO `lovata_shopaholic_products` (`id`, `active`, `name`, `slug`, `brand_id`, `category_id`, `external_id`, `code`, `preview_text`, `description`, `deleted_at`, `created_at`, `updated_at`, `search_synonym`, `search_content`) VALUES
(1, 1, 'Product sample', 'product-sample', 1, 1, '', '', 'kjcakljcljasjllckklcslkjcskackljjckljlclkcklaklckl', '<p>kjcakljcljasjllckklcslkjcskackljjckljlclkcklaklcklkjcakljcljasjllckklcslkjcskackljjckljlclkcklaklckl</p>', NULL, '2019-04-29 14:26:09', '2019-04-29 14:26:09', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_promo_block`
--

CREATE TABLE `lovata_shopaholic_promo_block` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_begin` datetime NOT NULL,
  `date_end` datetime DEFAULT NULL,
  `preview_text` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lovata_shopaholic_promo_block`
--

INSERT INTO `lovata_shopaholic_promo_block` (`id`, `active`, `hidden`, `name`, `slug`, `type`, `code`, `date_begin`, `date_end`, `preview_text`, `description`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'PRI-MEL PREMIUM PLUS RANGE', 'pri-mel-premium-plus-range', 'promo_block', '', '2019-04-12 12:43:05', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.', '', 1, '2019-04-12 10:43:11', '2019-04-22 09:00:48'),
(2, 1, 0, 'pri-mel  Premium Range', 'pri-mel-premium-range', 'promo_block', '', '2019-04-16 11:03:06', '2019-04-23 11:03:14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis elit et dolor eleifend condimentummauris...', '', 2, '2019-04-22 09:03:39', '2019-04-22 09:03:39'),
(3, 1, 0, 'POLYCARBONATE DRINKWARE', 'polycarbonate-drinkware', 'promo_block', '', '2019-04-16 11:05:06', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis elit et dolor eleifend condimentummauris...', '', 3, '2019-04-22 09:05:09', '2019-04-22 09:05:09'),
(4, 1, 0, 'Childrens\'s range', 'childrenss-range', 'promo_block', '', '2019-04-16 11:08:08', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis elit et dolor eleifend condimentummauris...', '', 4, '2019-04-22 09:08:22', '2019-04-22 09:08:22'),
(5, 1, 0, 'Lorem ipsum', 'lorem-ipsum', 'promo_block', '', '2019-04-16 11:12:21', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis elit et dolor eleifend condimentummauris...', '', 5, '2019-04-22 09:12:40', '2019-04-22 09:12:40'),
(6, 1, 0, 'Lorem ipsum dolor', 'lorem-ipsum-dolor', 'promo_block', '', '2019-04-17 11:12:55', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis elit et dolor eleifend condimentummauris...', '', 6, '2019-04-22 09:13:15', '2019-04-22 09:13:15'),
(7, 1, 0, 'Duo facete similique ei', 'duo-facete-similique-ei', 'promo_block', '', '2019-04-23 11:13:40', NULL, 'Ad has iuvaret eligendi vituperata, duis impetus eos ne, aliquam omittantur eu eam. Ne duo elit populo delectus', '', 7, '2019-04-22 09:14:06', '2019-04-22 09:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_promo_block_relation`
--

CREATE TABLE `lovata_shopaholic_promo_block_relation` (
  `promo_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_taxes`
--

CREATE TABLE `lovata_shopaholic_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `percent` decimal(8,2) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_to_shipping_price` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_tax_category_link`
--

CREATE TABLE `lovata_shopaholic_tax_category_link` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_tax_country_link`
--

CREATE TABLE `lovata_shopaholic_tax_country_link` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_tax_product_link`
--

CREATE TABLE `lovata_shopaholic_tax_product_link` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lovata_shopaholic_tax_state_link`
--

CREATE TABLE `lovata_shopaholic_tax_state_link` (
  `tax_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2013_10_01_000001_Db_Backend_Users', 2),
(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3);

-- --------------------------------------------------------

--
-- Table structure for table `peterhegman_slickslider_slide_shows`
--

CREATE TABLE `peterhegman_slickslider_slide_shows` (
  `id` int(10) UNSIGNED NOT NULL,
  `slide_show_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slide_show_content` text COLLATE utf8mb4_unicode_ci,
  `autoplay` tinyint(1) DEFAULT NULL,
  `accessibility` tinyint(1) DEFAULT NULL,
  `adaptive_height` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `prev_arrow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_arrow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_mode` tinyint(1) DEFAULT NULL,
  `center_padding` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_ease` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dots` tinyint(1) DEFAULT NULL,
  `dots_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `draggable` tinyint(1) DEFAULT NULL,
  `fade` tinyint(1) DEFAULT NULL,
  `focus_on_select` tinyint(1) DEFAULT NULL,
  `easing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edge_friction` double DEFAULT NULL,
  `infinite` tinyint(1) DEFAULT NULL,
  `initial_slide` int(11) DEFAULT NULL,
  `lazy_load` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pause_on_focus` tinyint(1) DEFAULT NULL,
  `pause_on_hover` tinyint(1) DEFAULT NULL,
  `pause_on_dots_hover` tinyint(1) DEFAULT NULL,
  `responsive` text COLLATE utf8mb4_unicode_ci,
  `rows` int(11) DEFAULT NULL,
  `slides_per_row` int(11) DEFAULT NULL,
  `slides_to_show` int(11) DEFAULT NULL,
  `slides_to_scroll` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `swipe` tinyint(1) DEFAULT NULL,
  `touch_move` tinyint(1) DEFAULT NULL,
  `touch_threshold` int(11) DEFAULT NULL,
  `use_css` tinyint(1) DEFAULT NULL,
  `use_transform` tinyint(1) DEFAULT NULL,
  `vertical` tinyint(1) DEFAULT NULL,
  `vertical_swiping` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `wait_for_animate` tinyint(1) DEFAULT NULL,
  `z_index` int(11) DEFAULT NULL,
  `slide_show_height` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_jquery` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peterhegman_slickslider_slide_shows`
--

INSERT INTO `peterhegman_slickslider_slide_shows` (`id`, `slide_show_title`, `slide_show_content`, `autoplay`, `accessibility`, `adaptive_height`, `autoplay_speed`, `arrows`, `prev_arrow`, `next_arrow`, `center_mode`, `center_padding`, `css_ease`, `dots`, `dots_class`, `draggable`, `fade`, `focus_on_select`, `easing`, `edge_friction`, `infinite`, `initial_slide`, `lazy_load`, `pause_on_focus`, `pause_on_hover`, `pause_on_dots_hover`, `responsive`, `rows`, `slides_per_row`, `slides_to_show`, `slides_to_scroll`, `speed`, `swipe`, `touch_move`, `touch_threshold`, `use_css`, `use_transform`, `vertical`, `vertical_swiping`, `rtl`, `wait_for_animate`, `z_index`, `slide_show_height`, `include_jquery`) VALUES
(1, 'Homepage - Slider', '[{\"slide_image\":\"\\/Note-Heroblock.jpg\",\"slide_title\":\"\",\"slide_link\":\"\",\"slide_description\":\"4PK BELLA\\r\\nGOBLET\\r\\n0.4OL\\/14OZ\",\"image_position\":\"50\",\"image_horizontal_position\":\"25\"},{\"slide_image\":\"\\/new_statesman_events.jpg\",\"slide_title\":\"\",\"slide_link\":\"\",\"slide_description\":\"4PK BELLA\\r\\nGOBLET\\r\\n0.4OL\\/14OZ\",\"image_position\":\"50\",\"image_horizontal_position\":\"25\"}]', 0, 1, 0, 3000, 1, '<button type=\"button\" class=\"slick-prev\">Previous</button>', '<button type=\"button\" class=\"slick-next\">Next</button>', 0, '50px', 'ease', 0, NULL, 1, 0, 0, 'linear', 0.15, 1, 0, 'ondemand', 1, 1, 1, '[]', 1, 1, 1, 1, 300, 1, 1, 5, 1, 1, 0, 0, 0, 1, 1000, '500px', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2019-04-28 15:27:02', '2019-04-28 15:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`, `metadata`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\r\n\r\nYou can edit this content by selecting **Blog** from the administration back-end menu.\r\n\r\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2019-04-28 15:27:02', 1, '2019-04-28 15:27:02', '2019-04-28 15:32:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function getDirName() on null in C:\\www\\flamefd-dev\\modules\\cms\\controllers\\Index.php:410\nStack trace:\n#0 C:\\www\\flamefd-dev\\modules\\cms\\controllers\\Index.php(160): Cms\\Controllers\\Index->validateRequestTheme()\n#1 [internal function]: Cms\\Controllers\\Index->onSave()\n#2 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(621): call_user_func_array(Array, Array)\n#3 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(471): Backend\\Classes\\Controller->runAjaxHandler(\'onSave\')\n#4 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(268): Backend\\Classes\\Controller->execAjaxHandlers()\n#5 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#6 [internal function]: Backend\\Classes\\BackendController->run(\'cms\')\n#7 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#8 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#10 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#11 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#12 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#15 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#18 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#35 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#44 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#45 {main}', NULL, '2019-04-12 08:39:35', '2019-04-12 08:39:35'),
(2, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"punctuation\" of value \":\" in \"C:\\www\\flamefd-dev/plugins/lovata/shopaholic/components/categorylist/default.htm\" at line 6. in C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php:222\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(112): Twig\\ExpressionParser->parsePrimaryExpression()\n#1 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(65): Twig\\ExpressionParser->getPrimary()\n#2 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#3 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#4 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(569): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#5 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(601): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#6 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#7 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(382): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\www\\\\flamefd-...\', NULL)\n#8 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1089): Twig\\Environment->loadTemplate(\'C:\\\\www\\\\flamefd-...\')\n#9 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#10 C:\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#11 C:\\www\\flamefd-dev\\storage\\cms\\twig\\8a\\8a335b38871dccaa159b4d6c412428e9b809ca2fd6ff0e0c09f00338a4a578f3.php(47): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#12 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_a3535cc0f474dd9d92376dcfe0ac63e75f6f71df06aa078d6efcb00764e8c4e5->doDisplay(Array, Array)\n#13 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#14 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#15 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#16 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#17 C:\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#18 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#44 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}', NULL, '2019-04-12 09:47:05', '2019-04-12 09:47:05'),
(3, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"punctuation\" of value \":\" in \"C:\\www\\flamefd-dev/plugins/lovata/shopaholic/components/categorylist/default.htm\" at line 2. in C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php:222\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(112): Twig\\ExpressionParser->parsePrimaryExpression()\n#1 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(65): Twig\\ExpressionParser->getPrimary()\n#2 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#3 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#4 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(569): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#5 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(601): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#6 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#7 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(382): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\www\\\\flamefd-...\', NULL)\n#8 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1089): Twig\\Environment->loadTemplate(\'C:\\\\www\\\\flamefd-...\')\n#9 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#10 C:\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#11 C:\\www\\flamefd-dev\\storage\\cms\\twig\\8a\\8a335b38871dccaa159b4d6c412428e9b809ca2fd6ff0e0c09f00338a4a578f3.php(47): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#12 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_a3535cc0f474dd9d92376dcfe0ac63e75f6f71df06aa078d6efcb00764e8c4e5->doDisplay(Array, Array)\n#13 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#14 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#15 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#16 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#17 C:\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#18 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#44 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}', NULL, '2019-04-12 09:48:01', '2019-04-12 09:48:01'),
(4, 'error', 'Twig\\Error\\SyntaxError: Unexpected token \"punctuation\" of value \":\" in \"C:\\www\\flamefd-dev/plugins/lovata/shopaholic/components/categorylist/default.htm\" at line 3. in C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php:222\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(112): Twig\\ExpressionParser->parsePrimaryExpression()\n#1 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\ExpressionParser.php(65): Twig\\ExpressionParser->getPrimary()\n#2 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#3 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#4 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(569): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#5 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(601): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#6 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#7 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(382): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\www\\\\flamefd-...\', NULL)\n#8 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1089): Twig\\Environment->loadTemplate(\'C:\\\\www\\\\flamefd-...\')\n#9 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#10 C:\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#11 C:\\www\\flamefd-dev\\storage\\cms\\twig\\8a\\8a335b38871dccaa159b4d6c412428e9b809ca2fd6ff0e0c09f00338a4a578f3.php(47): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#12 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_a3535cc0f474dd9d92376dcfe0ac63e75f6f71df06aa078d6efcb00764e8c4e5->doDisplay(Array, Array)\n#13 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#14 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#15 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#16 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#17 C:\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#18 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#44 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}', NULL, '2019-04-12 09:48:19', '2019-04-12 09:48:19'),
(5, 'error', 'RuntimeException: Failed to write cache file \"C:\\www\\flamefd-dev\\storage/cms/twig/fb/fb811a6235743401def969e1bd10b6e6085150541ff0d3c94a5743fd5d897beb.php\". in C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Cache\\FilesystemCache.php:80\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(409): Twig\\Cache\\FilesystemCache->write(\'C:\\\\www\\\\flamefd-...\', \'<?php\\n\\nuse Twig...\')\n#1 C:\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Environment.php(382): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\www\\\\flamefd-...\', NULL)\n#2 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(423): Twig\\Environment->loadTemplate(\'C:\\\\www\\\\flamefd-...\')\n#3 C:\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'storage/app/upl...\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'storage/app/upl...\')\n#6 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#7 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#11 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#41 {main}', NULL, '2019-04-12 11:54:15', '2019-04-12 11:54:15');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(6, 'error', 'ErrorException: Object of class Illuminate\\Routing\\UrlGenerator could not be converted to string in /opt/lampp/htdocs/flamefd-dev/storage/cms/twig/04/0488d9260e6b59bc8075f3edd6c6ccb28d8924bc2431bde38e50dbf4474f3bc5.php:52\nStack trace:\n#0 /opt/lampp/htdocs/flamefd-dev/storage/cms/twig/04/0488d9260e6b59bc8075f3edd6c6ccb28d8924bc2431bde38e50dbf4474f3bc5.php(52): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(4096, \'Object of class...\', \'/opt/lampp/htdo...\', 52, Array)\n#1 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(379): __TwigTemplate_37111e95e40df43303852c497ad7bc08c5bf219c9bcb1f9a5ef13675877acdd2->doDisplay(Array, Array)\n#2 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#3 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(364): Twig\\Template->display(Array)\n#4 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(1090): Twig\\Template->render(Array)\n#5 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'blogPosts::defa...\', Array, false)\n#6 /opt/lampp/htdocs/flamefd-dev/modules/cms/twig/Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'blogPosts\', Array)\n#7 /opt/lampp/htdocs/flamefd-dev/storage/cms/twig/63/63e38f632a0fecffe3c6ee0300984a009adb3d5c46cf1e692307126d0ace0cf4.php(39): Cms\\Twig\\Extension->componentFunction(\'blogPosts\', Array)\n#8 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(379): __TwigTemplate_fbf5e45a127b1f3b0c6b2ecc3112dd7d9cc3ca5ba98c7286c5c686e6c7bfcc55->doDisplay(Array, Array)\n#9 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#10 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(364): Twig\\Template->display(Array)\n#11 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(424): Twig\\Template->render(Array)\n#12 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#13 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'blog\')\n#14 [internal function]: Cms\\Classes\\CmsController->run(\'blog\')\n#15 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#16 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#17 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#18 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#19 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#20 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#38 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#39 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#40 /opt/lampp/htdocs/flamefd-dev/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#41 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#42 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#49 /opt/lampp/htdocs/flamefd-dev/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#50 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Object of class Illuminate\\Routing\\UrlGenerator could not be converted to string\") in \"/opt/lampp/htdocs/flamefd-dev/plugins/rainlab/blog/components/posts/default.htm\" at line 7. in /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php:393\nStack trace:\n#0 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(364): Twig\\Template->display(Array)\n#2 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(1090): Twig\\Template->render(Array)\n#3 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'blogPosts::defa...\', Array, false)\n#4 /opt/lampp/htdocs/flamefd-dev/modules/cms/twig/Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'blogPosts\', Array)\n#5 /opt/lampp/htdocs/flamefd-dev/storage/cms/twig/63/63e38f632a0fecffe3c6ee0300984a009adb3d5c46cf1e692307126d0ace0cf4.php(39): Cms\\Twig\\Extension->componentFunction(\'blogPosts\', Array)\n#6 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(379): __TwigTemplate_fbf5e45a127b1f3b0c6b2ecc3112dd7d9cc3ca5ba98c7286c5c686e6c7bfcc55->doDisplay(Array, Array)\n#7 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#8 /opt/lampp/htdocs/flamefd-dev/vendor/twig/twig/src/Template.php(364): Twig\\Template->display(Array)\n#9 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(424): Twig\\Template->render(Array)\n#10 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#11 /opt/lampp/htdocs/flamefd-dev/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'blog\')\n#12 [internal function]: Cms\\Classes\\CmsController->run(\'blog\')\n#13 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#14 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#15 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#16 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#17 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#18 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#37 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#38 /opt/lampp/htdocs/flamefd-dev/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#39 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#40 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /opt/lampp/htdocs/flamefd-dev/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /opt/lampp/htdocs/flamefd-dev/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2019-04-28 15:35:30', '2019-04-28 15:35:30'),
(7, 'error', 'Cms\\Classes\\CmsException: The partial \'category/category-list\' is not found. in E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php:1032\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'category/catego...\', Array, true)\n#1 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\bb\\bb81f08ab7cc067e3411dd6ac8bb8d70084958c2c86ef58427dd62423820d84e.php(36): Cms\\Twig\\Extension->partialFunction(\'category/catego...\', Array, true)\n#2 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_dd81d4f9d2cd9b61ac82e7d7ac8ec8158e9cfd5961a11dfe804cd2c01680998d->doDisplay(Array, Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#5 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#7 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#8 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\f4\\f40d389c90e7339ac06de67330e5c28a12d52c1f82ce5e973f88360882f1c47e.php(49): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_17f6edf4b09feffa4ef9d80ff9ca7dced1e3f164ccfebfb0b69536de60fe8956->doDisplay(Array, Array)\n#10 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#13 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#14 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#15 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#16 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#17 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#18 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#19 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#20 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"The partial \'category/category-list\' is not found.\") in \"E:\\wamp64\\www\\flamefd-dev/plugins/lovata/shopaholic/components/categorylist/default.htm\" at line 1. in E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php:393\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#2 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#4 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#5 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\f4\\f40d389c90e7339ac06de67330e5c28a12d52c1f82ce5e973f88360882f1c47e.php(49): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_17f6edf4b09feffa4ef9d80ff9ca7dced1e3f164ccfebfb0b69536de60fe8956->doDisplay(Array, Array)\n#7 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#8 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#10 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#11 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#12 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#13 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#16 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#17 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#18 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2019-04-29 10:13:29', '2019-04-29 10:13:29'),
(8, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to undefined method Lovata\\Shopaholic\\Classes\\Store\\CategoryListStore::get() in E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\shopaholic\\classes\\collection\\CategoryCollection.php:26\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php(1681): Lovata\\Shopaholic\\Classes\\Collection\\CategoryCollection->tree()\n#1 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\eb\\ebc3f8e209537a465e2fd163f8b2ce200a550f005e68bcff26a636c1d52656da.php(35): twig_get_attribute(Object(Twig\\Environment), Object(Twig\\Source), Object(Lovata\\Shopaholic\\Classes\\Collection\\CategoryCollection), \'tree\', Array, \'method\')\n#2 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_95a1b76131f16b40c1716c73f9a7eb4c1a7c4da846c61b2a93736b49a6e8ec97->doDisplay(Array, Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#5 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'category/catego...\', Array, true)\n#7 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\bb\\bb81f08ab7cc067e3411dd6ac8bb8d70084958c2c86ef58427dd62423820d84e.php(36): Cms\\Twig\\Extension->partialFunction(\'category/catego...\', Array, true)\n#8 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_dd81d4f9d2cd9b61ac82e7d7ac8ec8158e9cfd5961a11dfe804cd2c01680998d->doDisplay(Array, Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#10 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'CategoryList::d...\', Array, false)\n#13 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'CategoryList\', Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(39): Cms\\Twig\\Extension->componentFunction(\'CategoryList\', Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#17 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#18 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#19 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#20 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#21 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#55 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#56 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#57 {main}', NULL, '2019-04-29 14:06:26', '2019-04-29 14:06:26');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(9, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Type error: Too few arguments to function Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection::sort(), 0 passed in E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php on line 1681 and exactly 1 expected in E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\shopaholic\\classes\\collection\\ProductCollection.php:61\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php(1681): Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection->sort()\n#1 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\8d\\8d8067563b4f837285b9794f00088789aaf875ec5ff387fdf7e44330141839cd.php(40): twig_get_attribute(Object(Twig\\Environment), Object(Twig\\Source), Object(Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection), \'sort\', Array, \'method\')\n#2 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_3cda5e78e01beaf6ff77d67551577699b2acfa5e7f79f1e7cc74833885152f18->doDisplay(Array, Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#4 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#5 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'product/product...\', Array, true)\n#7 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a0\\a0332961d40dd04f607df87ec8f912177a3d1ba496ffd789c9852a6c7f7b51a7.php(36): Cms\\Twig\\Extension->partialFunction(\'product/product...\', Array, true)\n#8 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_f1b3908762d9cede556101c889c07851eebe4c6dc30a543d10b28b1537788a87->doDisplay(Array, Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#10 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'ProductList::de...\', Array, false)\n#13 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'ProductList\', Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(48): Cms\\Twig\\Extension->componentFunction(\'ProductList\', Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#17 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#18 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#19 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#20 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#21 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#55 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#56 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#57 {main}', NULL, '2019-04-29 14:35:40', '2019-04-29 14:35:40'),
(10, 'error', 'BadMethodCallException: Call to undefined method October\\Rain\\Database\\QueryBuilder::all() in E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php:2483\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1286): Illuminate\\Database\\Query\\Builder->__call(\'all\', Array)\n#1 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(178): Illuminate\\Database\\Eloquent\\Builder->__call(\'all\', Array)\n#2 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\shopaholic\\classes\\store\\product\\ActiveListStore.php(25): October\\Rain\\Database\\Builder->__call(\'all\', Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\classes\\store\\AbstractStore.php(40): Lovata\\Shopaholic\\Classes\\Store\\Product\\ActiveListStore->getIDListFromDB()\n#4 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\classes\\store\\AbstractStoreWithoutParam.php(23): Lovata\\Toolbox\\Classes\\Store\\AbstractStore->getIDList()\n#5 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\shopaholic\\classes\\collection\\ProductCollection.php(74): Lovata\\Toolbox\\Classes\\Store\\AbstractStoreWithoutParam->get()\n#6 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php(1681): Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection->active()\n#7 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\8d\\8d8067563b4f837285b9794f00088789aaf875ec5ff387fdf7e44330141839cd.php(40): twig_get_attribute(Object(Twig\\Environment), Object(Twig\\Source), Object(Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection), \'active\', Array, \'method\')\n#8 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_3cda5e78e01beaf6ff77d67551577699b2acfa5e7f79f1e7cc74833885152f18->doDisplay(Array, Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#10 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'product/product...\', Array, true)\n#13 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a0\\a0332961d40dd04f607df87ec8f912177a3d1ba496ffd789c9852a6c7f7b51a7.php(36): Cms\\Twig\\Extension->partialFunction(\'product/product...\', Array, true)\n#14 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_f1b3908762d9cede556101c889c07851eebe4c6dc30a543d10b28b1537788a87->doDisplay(Array, Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#17 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#18 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'ProductList::de...\', Array, false)\n#19 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'ProductList\', Array)\n#20 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(48): Cms\\Twig\\Extension->componentFunction(\'ProductList\', Array)\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#24 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#25 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#26 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#27 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#53 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#57 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#60 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#61 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#62 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#63 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Call to undefined method October\\Rain\\Database\\QueryBuilder::all()\") in \"E:\\wamp64\\www\\flamefd-dev/themes/flamefield/partials/product/product-list.htm\" at line 3. in E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php:393\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#2 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'product/product...\', Array, true)\n#4 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a0\\a0332961d40dd04f607df87ec8f912177a3d1ba496ffd789c9852a6c7f7b51a7.php(36): Cms\\Twig\\Extension->partialFunction(\'product/product...\', Array, true)\n#5 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_f1b3908762d9cede556101c889c07851eebe4c6dc30a543d10b28b1537788a87->doDisplay(Array, Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#7 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#8 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'ProductList::de...\', Array, false)\n#10 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'ProductList\', Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(48): Cms\\Twig\\Extension->componentFunction(\'ProductList\', Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#13 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#17 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#18 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#19 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#20 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}', NULL, '2019-04-29 14:38:32', '2019-04-29 14:38:32');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(11, 'error', 'Exception: Serialization of \'Closure\' is not allowed in E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php:65\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(65): serialize(Array)\n#1 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\FileStore.php(119): Illuminate\\Cache\\FileStore->put(\'Lovata\\\\Shopahol...\', Array, 0)\n#2 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\Repository.php(303): Illuminate\\Cache\\FileStore->forever(\'Lovata\\\\Shopahol...\', Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Halcyon\\MemoryRepository.php(103): Illuminate\\Cache\\Repository->forever(\'Lovata\\\\Shopahol...\', Array)\n#4 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cache\\CacheManager.php(304): October\\Rain\\Halcyon\\MemoryRepository->forever(\'Lovata\\\\Shopahol...\', Array)\n#5 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(221): Illuminate\\Cache\\CacheManager->__call(\'forever\', Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\vendor\\kharanenka\\laravel-cache-helper\\src\\Kharanenka\\Helper\\CCache.php(97): Illuminate\\Support\\Facades\\Facade::__callStatic(\'forever\', Array)\n#7 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\classes\\store\\AbstractStore.php(70): Kharanenka\\Helper\\CCache::forever(Array, \'Lovata\\\\Shopahol...\', Array)\n#8 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\classes\\store\\AbstractStore.php(41): Lovata\\Toolbox\\Classes\\Store\\AbstractStore->saveIDList(Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\toolbox\\classes\\store\\AbstractStoreWithoutParam.php(23): Lovata\\Toolbox\\Classes\\Store\\AbstractStore->getIDList()\n#10 E:\\wamp64\\www\\flamefd-dev\\plugins\\lovata\\shopaholic\\classes\\collection\\ProductCollection.php(74): Lovata\\Toolbox\\Classes\\Store\\AbstractStoreWithoutParam->get()\n#11 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Extension\\CoreExtension.php(1681): Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection->active()\n#12 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\8d\\8d8067563b4f837285b9794f00088789aaf875ec5ff387fdf7e44330141839cd.php(40): twig_get_attribute(Object(Twig\\Environment), Object(Twig\\Source), Object(Lovata\\Shopaholic\\Classes\\Collection\\ProductCollection), \'active\', Array, \'method\')\n#13 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_3cda5e78e01beaf6ff77d67551577699b2acfa5e7f79f1e7cc74833885152f18->doDisplay(Array, Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#17 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'product/product...\', Array, true)\n#18 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a0\\a0332961d40dd04f607df87ec8f912177a3d1ba496ffd789c9852a6c7f7b51a7.php(36): Cms\\Twig\\Extension->partialFunction(\'product/product...\', Array, true)\n#19 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_f1b3908762d9cede556101c889c07851eebe4c6dc30a543d10b28b1537788a87->doDisplay(Array, Array)\n#20 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#22 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#23 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'ProductList::de...\', Array, false)\n#24 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'ProductList\', Array)\n#25 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(48): Cms\\Twig\\Extension->componentFunction(\'ProductList\', Array)\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#29 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#30 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#31 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#32 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#55 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#56 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#57 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#58 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#59 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#60 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#61 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#62 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#65 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#66 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#67 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#68 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"Serialization of \'Closure\' is not allowed\") in \"E:\\wamp64\\www\\flamefd-dev/themes/flamefield/partials/product/product-list.htm\" at line 3. in E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php:393\nStack trace:\n#0 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#2 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#3 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(102): Cms\\Classes\\Controller->renderPartial(\'product/product...\', Array, true)\n#4 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a0\\a0332961d40dd04f607df87ec8f912177a3d1ba496ffd789c9852a6c7f7b51a7.php(36): Cms\\Twig\\Extension->partialFunction(\'product/product...\', Array, true)\n#5 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_f1b3908762d9cede556101c889c07851eebe4c6dc30a543d10b28b1537788a87->doDisplay(Array, Array)\n#6 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#7 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#8 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1090): Twig\\Template->render(Array)\n#9 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(1219): Cms\\Classes\\Controller->renderPartial(\'ProductList::de...\', Array, false)\n#10 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\twig\\Extension.php(124): Cms\\Classes\\Controller->renderComponent(\'ProductList\', Array)\n#11 E:\\wamp64\\www\\flamefd-dev\\storage\\cms\\twig\\a9\\a944b25df2ffd7668909edc3fda95aa85cb8680b499791ca2bd4b9ed3697cf41.php(48): Cms\\Twig\\Extension->componentFunction(\'ProductList\', Array)\n#12 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(379): __TwigTemplate_ddbf9bc82ba9ebb5fc8bd0abd1ee8dcd12f648e5e409e064b21f3bac35bcd17b->doDisplay(Array, Array)\n#13 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(356): Twig\\Template->displayWithErrorHandling(Array, Array)\n#14 E:\\wamp64\\www\\flamefd-dev\\vendor\\twig\\twig\\src\\Template.php(364): Twig\\Template->display(Array)\n#15 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(424): Twig\\Template->render(Array)\n#16 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\Controller.php(224): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#17 E:\\wamp64\\www\\flamefd-dev\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'products\')\n#18 [internal function]: Cms\\Classes\\CmsController->run(\'products\')\n#19 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#20 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#21 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#22 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#23 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#24 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#42 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#43 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#44 E:\\wamp64\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 E:\\wamp64\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 E:\\wamp64\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}', NULL, '2019-04-29 14:38:42', '2019-04-29 14:38:42');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(12, 'error', 'PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist in C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php:77\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php(77): PDO->prepare(\'select count(*)...\', Array)\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(326): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select count(*)...\')\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select count(*)...\', Array)\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#4 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#5 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#6 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#10 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#11 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#12 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#13 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#14 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#15 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#16 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#17 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#18 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#19 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#20 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#21 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#22 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#23 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#24 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#25 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#26 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#27 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#28 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#56 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#58 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#59 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#66 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#67 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#68 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#69 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist in C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php:79\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(326): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select count(*)...\')\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select count(*)...\', Array)\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#4 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#5 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#10 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#11 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#12 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#13 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#14 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#15 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#16 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#17 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#18 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#19 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#20 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#21 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#22 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#23 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#24 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#25 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#26 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#27 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#28 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#29 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#56 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#58 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#59 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#66 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#67 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#68 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist (SQL: select count(*) as aggregate from `wollson_generalpages_`) in C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:664\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#5 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#6 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#7 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#9 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#10 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#11 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#12 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#13 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#14 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#15 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#16 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#17 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#18 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#19 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#20 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#21 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#22 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#23 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#24 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#25 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#26 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#27 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#56 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#58 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#59 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#66 {main}', NULL, '2019-05-07 07:50:23', '2019-05-07 07:50:23');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(13, 'error', 'PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist in C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php:77\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php(77): PDO->prepare(\'select count(*)...\', Array)\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(326): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select count(*)...\')\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select count(*)...\', Array)\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#4 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#5 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#6 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#7 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#10 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#11 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#12 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#13 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#14 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#15 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#16 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#17 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#18 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#19 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#20 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#21 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#22 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#23 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#24 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#25 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#26 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#27 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#28 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#29 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#30 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#56 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#58 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#59 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#66 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#67 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#68 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#69 {main}\n\nNext Doctrine\\DBAL\\Driver\\PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist in C:\\www\\flamefd-dev\\vendor\\doctrine\\dbal\\lib\\Doctrine\\DBAL\\Driver\\PDOConnection.php:79\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(326): Doctrine\\DBAL\\Driver\\PDOConnection->prepare(\'select count(*)...\')\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(657): Illuminate\\Database\\Connection->Illuminate\\Database\\{closure}(\'select count(*)...\', Array)\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#4 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#5 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#6 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#7 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#9 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#10 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#11 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#12 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#13 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#14 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#15 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#16 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#17 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#18 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#19 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#20 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#21 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#22 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#23 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#24 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#25 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#26 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#27 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#28 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#29 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#56 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#58 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#59 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#66 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#67 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#68 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'flame_db.wollson_generalpages_\' doesn\'t exist (SQL: select count(*) as aggregate from `wollson_generalpages_`) in C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:664\nStack trace:\n#0 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(624): Illuminate\\Database\\Connection->runQueryCallback(\'select count(*)...\', Array, Object(Closure))\n#1 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(333): Illuminate\\Database\\Connection->run(\'select count(*)...\', Array, Object(Closure))\n#2 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1719): Illuminate\\Database\\Connection->select(\'select count(*)...\', Array, true)\n#3 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1704): Illuminate\\Database\\Query\\Builder->runSelect()\n#4 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(122): Illuminate\\Database\\Query\\Builder->get(Array)\n#5 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\QueryBuilder.php(92): October\\Rain\\Database\\QueryBuilder->getDuplicateCached(Array)\n#6 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1804): October\\Rain\\Database\\QueryBuilder->get()\n#7 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1777): Illuminate\\Database\\Query\\Builder->runPaginationCountQuery(Array)\n#8 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Database\\Builder.php(126): Illuminate\\Database\\Query\\Builder->getCountForPagination()\n#9 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(589): October\\Rain\\Database\\Builder->paginate(20, 1)\n#10 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(249): Backend\\Widgets\\Lists->getRecords()\n#11 C:\\www\\flamefd-dev\\modules\\backend\\widgets\\Lists.php(237): Backend\\Widgets\\Lists->prepareVars()\n#12 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\listcontroller\\partials\\_container.htm(9): Backend\\Widgets\\Lists->render()\n#13 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#14 C:\\www\\flamefd-dev\\modules\\backend\\classes\\ControllerBehavior.php(143): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#15 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(97): Backend\\Classes\\ControllerBehavior->makeFileContents(\'C:\\\\www\\\\flamefd-...\', Array)\n#16 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(393): Backend\\Classes\\ControllerBehavior->makePartial(\'_container.htm\', Array)\n#17 C:\\www\\flamefd-dev\\modules\\backend\\behaviors\\ListController.php(380): Backend\\Behaviors\\ListController->listMakePartial(\'container\', Array)\n#18 [internal function]: Backend\\Behaviors\\ListController->listRender()\n#19 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#20 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'listRender\', Array)\n#21 C:\\www\\flamefd-dev\\plugins\\wollson\\generalpages\\controllers\\generalpages\\index.htm(1): Backend\\Classes\\Controller->__call(\'listRender\', Array)\n#22 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(247): include(\'C:\\\\www\\\\flamefd-...\')\n#23 C:\\www\\flamefd-dev\\modules\\system\\traits\\ViewMaker.php(109): Backend\\Classes\\Controller->makeFileContents(\'C:\\\\www\\\\flamefd-...\')\n#24 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(412): Backend\\Classes\\Controller->makeView(\'index\')\n#25 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(286): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#26 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#27 [internal function]: Backend\\Classes\\BackendController->run(\'/wollson/genera...\')\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#53 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#55 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#56 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#57 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#58 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#59 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#62 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#63 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#64 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#65 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#66 {main}', NULL, '2019-05-07 07:52:05', '2019-05-07 07:52:05'),
(14, 'error', 'October\\Rain\\Exception\\SystemException: The table with name wollson_generalpages_ doesn\'t exist in C:\\www\\flamefd-dev\\plugins\\rainlab\\builder\\classes\\DatabaseTableModel.php:77\nStack trace:\n#0 C:\\www\\flamefd-dev\\plugins\\rainlab\\builder\\behaviors\\IndexDatabaseTableOperations.php(164): RainLab\\Builder\\Classes\\DatabaseTableModel->load(\'wollson_general...\')\n#1 C:\\www\\flamefd-dev\\plugins\\rainlab\\builder\\behaviors\\IndexDatabaseTableOperations.php(52): RainLab\\Builder\\Behaviors\\IndexDatabaseTableOperations->loadOrCreateBaseModel(\'wollson_general...\')\n#2 [internal function]: RainLab\\Builder\\Behaviors\\IndexDatabaseTableOperations->onDatabaseTableValidateAndShowPopup()\n#3 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(409): call_user_func_array(Array, Array)\n#4 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(192): Backend\\Classes\\Controller->extendableCall(\'onDatabaseTable...\', Array)\n#5 [internal function]: Backend\\Classes\\Controller->__call(\'onDatabaseTable...\', Array)\n#6 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(621): call_user_func_array(Array, Array)\n#7 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(471): Backend\\Classes\\Controller->runAjaxHandler(\'onDatabaseTable...\')\n#8 C:\\www\\flamefd-dev\\modules\\backend\\classes\\Controller.php(268): Backend\\Classes\\Controller->execAjaxHandlers()\n#9 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(161): Backend\\Classes\\Controller->run(\'index\', Array)\n#10 [internal function]: Backend\\Classes\\BackendController->run(\'rainlab/builder\')\n#11 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#12 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#13 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Backend\\Classes\\BackendController), \'run\')\n#14 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#15 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#16 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\www\\flamefd-dev\\modules\\backend\\classes\\BackendController.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(131): Backend\\Classes\\BackendController->Backend\\Classes\\{closure}(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(66): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\www\\flamefd-dev\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 C:\\www\\flamefd-dev\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 C:\\www\\flamefd-dev\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 {main}', NULL, '2019-05-07 08:07:22', '2019-05-07 08:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(9, '5cbd861d83572518744507.png', 'tableware-categories.png', 131385, 'image/png', NULL, NULL, 'preview_image', '1', 'Lovata\\Shopaholic\\Models\\Category', 1, 9, '2019-04-22 07:15:09', '2019-04-22 07:15:11'),
(10, '5cbd862da32ec971022481.png', 'drinkware-cat.png', 52483, 'image/png', NULL, NULL, 'preview_image', '2', 'Lovata\\Shopaholic\\Models\\Category', 1, 10, '2019-04-22 07:15:25', '2019-04-22 07:15:28'),
(11, '5cbd863d28393081441144.png', 'polycarbonate-drinkware-cat.png', 71917, 'image/png', NULL, NULL, 'preview_image', '3', 'Lovata\\Shopaholic\\Models\\Category', 1, 11, '2019-04-22 07:15:41', '2019-04-22 07:15:43'),
(12, '5cbd864d48066470983564.png', 'camper-smiles-cat.png', 72525, 'image/png', NULL, NULL, 'preview_image', '4', 'Lovata\\Shopaholic\\Models\\Category', 1, 12, '2019-04-22 07:15:57', '2019-04-22 07:15:58'),
(13, '5cbd865d29d0b093445848.png', 'accesoriess-cat.png', 77058, 'image/png', NULL, NULL, 'preview_image', '5', 'Lovata\\Shopaholic\\Models\\Category', 1, 13, '2019-04-22 07:16:13', '2019-04-22 07:16:14'),
(14, '5cbd9ea79df53279034926.png', 'priducts-list-1.png', 74836, 'image/png', NULL, NULL, 'preview_image', '1', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 14, '2019-04-22 08:59:51', '2019-04-22 08:59:54'),
(15, '5cbd9f8af3413234130112.png', 'priducts-list-2.png', 28754, 'image/png', NULL, NULL, 'preview_image', '2', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 15, '2019-04-22 09:03:39', '2019-04-22 09:03:39'),
(16, '5cbd9fdc2ef26728276443.png', 'priducts-list-3.png', 33105, 'image/png', NULL, NULL, 'preview_image', '3', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 16, '2019-04-22 09:05:00', '2019-04-22 09:05:09'),
(17, '5cbda0a4d542a446254558.png', 'priducts-list-4.png', 66700, 'image/png', NULL, NULL, 'preview_image', '4', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 17, '2019-04-22 09:08:20', '2019-04-22 09:08:22'),
(18, '5cbda1a41dae0040124886.png', 'priducts-list-2.png', 28754, 'image/png', NULL, NULL, 'preview_image', '5', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 18, '2019-04-22 09:12:36', '2019-04-22 09:12:40'),
(19, '5cbda1c96da03719449708.png', 'priducts-list-1.png', 74836, 'image/png', NULL, NULL, 'preview_image', '6', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 19, '2019-04-22 09:13:13', '2019-04-22 09:13:15'),
(20, '5cbda1fc673e3427282922.png', 'priducts-list-4.png', 66700, 'image/png', NULL, NULL, 'preview_image', '7', 'Lovata\\Shopaholic\\Models\\PromoBlock', 1, 20, '2019-04-22 09:14:04', '2019-04-22 09:14:06'),
(21, '5cbf0adbb5844452406520.png', 'brand-logo.png', 5341, 'image/png', NULL, NULL, 'preview_image', '1', 'Lovata\\Shopaholic\\Models\\Brand', 1, 21, '2019-04-23 10:53:47', '2019-04-23 10:53:50'),
(22, '5cbf0b137ffb5459308207.png', 'brand-logo-1.png', 8517, 'image/png', NULL, NULL, 'preview_image', '2', 'Lovata\\Shopaholic\\Models\\Brand', 1, 22, '2019-04-23 10:54:43', '2019-04-23 10:54:46'),
(23, '5cbf0de92789e054264848.png', 'brand-logo.png', 5341, 'image/png', NULL, NULL, 'preview_image', '3', 'Lovata\\Shopaholic\\Models\\Brand', 1, 23, '2019-04-23 11:06:49', '2019-04-23 11:06:50'),
(24, '5cc5e394c83f5459560098.jpg', 'latest-computer-desktop-wallpaper-widescreen-hd-images-collection-of-on-for-mobile-.jpg', 416950, 'image/jpeg', NULL, NULL, 'featured_images', '1', 'RainLab\\Blog\\Models\\Post', 1, 24, '2019-04-28 15:32:04', '2019-04-28 15:32:10'),
(25, '5cc7256a7bcb1279075969.jpg', 'new-product-logo.jpg', 151816, 'image/jpeg', NULL, NULL, 'preview_image', '1', 'Lovata\\Shopaholic\\Models\\Product', 1, 25, '2019-04-29 14:25:14', '2019-04-29 14:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2019-04-12 06:51:03', '2019-04-12 06:51:03'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2019-04-12 06:51:03', '2019-04-12 06:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1557308521'),
(3, 'system', 'core', 'build', '447');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2019-04-12 06:51:02'),
(2, 'Lovata.Toolbox', 'comment', '1.0.0', 'Initialize plugin.', '2019-04-12 06:54:18'),
(3, 'Lovata.Toolbox', 'comment', '1.1.0', 'Add diff, unshift, push, getNearestNext, getNearestPrev methods to ElementCollection class, add ComponentSubmitForm class', '2019-04-12 06:54:18'),
(4, 'Lovata.Toolbox', 'comment', '1.2.0', 'Add integration with Translate plugin', '2019-04-12 06:54:18'),
(5, 'Lovata.Toolbox', 'comment', '1.3.0', 'Adding afterCreate model event handling for additional cache cleaning', '2019-04-12 06:54:18'),
(6, 'Lovata.Toolbox', 'comment', '1.3.1', 'Restore getOldFormData() method in ComponentSubmitForm class', '2019-04-12 06:54:18'),
(7, 'Lovata.Toolbox', 'comment', '1.3.2', 'Fix lang path for the default properties tab in CommonProperty class', '2019-04-12 06:54:18'),
(8, 'Lovata.Toolbox', 'comment', '1.3.3', 'Fix path to field name with error in getErrorMessage() method', '2019-04-12 06:54:18'),
(9, 'Lovata.Toolbox', 'comment', '1.4.0', 'Add PageHelper class', '2019-04-12 06:54:18'),
(10, 'Lovata.Toolbox', 'comment', '1.4.1', 'Fix processing of positive results in ComponentSubmitForm::getResponseModeAjax() method, if flash_on enabled', '2019-04-12 06:54:18'),
(11, 'Lovata.Toolbox', 'comment', '1.5.0', 'Add TraitInitActiveLang trait', '2019-04-12 06:54:18'),
(12, 'Lovata.Toolbox', 'comment', '1.6.0', 'Add SendMailHelper class, Add CommonSettings model', '2019-04-12 06:54:18'),
(13, 'Lovata.Toolbox', 'comment', '1.7.0', 'Add UserStorage classes. Add classes for integration with Lovata.Buddies and RainLab.User plugins', '2019-04-12 06:54:18'),
(14, 'Lovata.Toolbox', 'comment', '1.8.0', 'Added translation into French. Thanks for contribution philmarc.', '2019-04-12 06:54:18'),
(15, 'Lovata.Toolbox', 'comment', '1.9.0', 'Add TraitCached. Update vendor packages.', '2019-04-12 06:54:18'),
(16, 'Lovata.Toolbox', 'comment', '1.9.1', 'Remove force boot and register plugins in CommonTest class', '2019-04-12 06:54:18'),
(17, 'Lovata.Toolbox', 'comment', '1.10.0', 'Add PriceHelperTrait. Move PriceHelper class from Shopaholic plugin. Add set(), applySorting() methods to ElementCollection class. Add abstract store classes.', '2019-04-12 06:54:18'),
(18, 'Lovata.Toolbox', 'comment', '1.10.1', 'Fix ItemStorage class. Clone item objects form storage.', '2019-04-12 06:54:18'),
(19, 'Lovata.Toolbox', 'comment', '1.10.2', 'Fix ItemStorage class. Added cloning of *Item object before saving it to storage.', '2019-04-12 06:54:18'),
(20, 'Lovata.Toolbox', 'comment', '1.11.0', 'Added saving of arrays to class properties of *Store class objects after receiving array from cache.', '2019-04-12 06:54:18'),
(21, 'Lovata.Toolbox', 'comment', '1.12.0', 'Add PageHelper::getPageNameList() method.', '2019-04-12 06:54:18'),
(22, 'Lovata.Toolbox', 'comment', '1.12.1', 'Update of vendor packages', '2019-04-12 06:54:18'),
(23, 'Lovata.Toolbox', 'comment', '1.12.2', 'Update of php-pagination vendor packages', '2019-04-12 06:54:18'),
(24, 'Lovata.Toolbox', 'comment', '1.13.0', 'Added type returned by methods in AbstractStore * classes', '2019-04-12 06:54:18'),
(25, 'Lovata.Toolbox', 'comment', '1.14.0', 'Add Countable interface in ElementCollection class', '2019-04-12 06:54:18'),
(26, 'Lovata.Toolbox', 'comment', '1.14.1', 'Added natsort() for property value variants.', '2019-04-12 06:54:18'),
(27, 'Lovata.Toolbox', 'comment', '1.15.0', 'Added AbstractBackendColumnHandler, AbstractBackendFieldHandler, AbstractBackendMenuHandler, AbstractExtendRelationConfigHandler, AbstractModelRelationHandler classes.', '2019-04-12 06:54:18'),
(28, 'Lovata.Toolbox', 'comment', '1.16.0', 'Add package information to composer.json. Thanks for contribution pikanji.', '2019-04-12 06:54:18'),
(29, 'Lovata.Toolbox', 'comment', '1.17.0', 'Added processing of \"limit\" parameter for the pagination component.', '2019-04-12 06:54:18'),
(30, 'Lovata.Toolbox', 'comment', '1.18.0', 'Added AbstractImportModel class.', '2019-04-12 06:54:18'),
(31, 'Lovata.Toolbox', 'comment', '1.19.0', 'Added supported property types: number, rich editor, single checkbox, switch, balloon selector, tag list, radio.', '2019-04-12 06:54:18'),
(32, 'Lovata.Toolbox', 'comment', '1.20.0', 'Added Japanese language. Thanks for contribution pikanji.', '2019-04-12 06:54:18'),
(33, 'Lovata.Toolbox', 'comment', '1.20.1', 'Fixed deletion of old images for improt from CSV file.', '2019-04-12 06:54:18'),
(34, 'Lovata.Toolbox', 'comment', '1.21.0', 'Added support translatable slug in ElementPage class. Added German language. Thanks for contribution Gerald.', '2019-04-12 06:54:18'),
(35, 'Lovata.Toolbox', 'comment', '1.21.1', 'Removed Iterator interface from ElementCollection class. Added IteratorAggregate interface to ElementCollection class.', '2019-04-12 06:54:18'),
(36, 'Lovata.Toolbox', 'comment', '1.22.0', 'Replace array_intersect function with array_intersect_key in ElementCollection class.', '2019-04-12 06:54:18'),
(37, 'Lovata.Toolbox', 'comment', '1.23.0', 'Added copy() method to ElementCollection class. Added choice twig function.', '2019-04-12 06:54:18'),
(38, 'Lovata.Shopaholic', 'script', '1.0.0', 'create_table_categories.php', '2019-04-12 06:54:18'),
(39, 'Lovata.Shopaholic', 'script', '1.0.0', 'create_table_products.php', '2019-04-12 06:54:18'),
(40, 'Lovata.Shopaholic', 'script', '1.0.0', 'create_table_offers.php', '2019-04-12 06:54:19'),
(41, 'Lovata.Shopaholic', 'script', '1.0.0', 'create_table_brands.php', '2019-04-12 06:54:19'),
(42, 'Lovata.Shopaholic', 'comment', '1.0.0', 'Initialize plugin.', '2019-04-12 06:54:19'),
(43, 'Lovata.Shopaholic', 'comment', '1.1.0', 'Add integration with \"Popularity for Shopaholic\" and \"Tags for Shopaholic\" plugins', '2019-04-12 06:54:19'),
(44, 'Lovata.Shopaholic', 'comment', '1.2.0', 'preview_image, images fields in item classes returns \\System\\Models\\File class objects. Add integration with \"Reviews for Shopaholic\" plugin', '2019-04-12 06:54:19'),
(45, 'Lovata.Shopaholic', 'comment', '1.2.1', 'Remove php short tags from offers/update.htm', '2019-04-12 06:54:19'),
(46, 'Lovata.Shopaholic', 'comment', '1.2.2', 'Add additional cache cleaning after category reordering', '2019-04-12 06:54:19'),
(47, 'Lovata.Shopaholic', 'comment', '1.2.3', 'Adding additional cache cleaning for the sorted list of brands, after the creation of a new brand. Requires Toolbox plugin version 1.3.0 and later.', '2019-04-12 06:54:19'),
(48, 'Lovata.Shopaholic', 'comment', '1.3.0', 'Add menu types for integration with the StaticPage plugin. Add getPageUrl() method to the CategoryItem class. Requires Toolbox plugin version 1.4.0 and later. Thanks for contribution Alvaro Cánepa.', '2019-04-12 06:54:19'),
(49, 'Lovata.Shopaholic', 'comment', '1.3.1', 'Fix: processing of the \"nesting\" flag for the menu type \"catalog\"', '2019-04-12 06:54:19'),
(50, 'Lovata.Shopaholic', 'comment', '1.4.0', 'Replace code of product sorting by popularity and rating from Shopaholic to extension plugins. Add event \"shopaholic.sorting.get.list\" for custom sorting of products. Add integration with \"Related products for Shopaholic\" and \"Accessories for Shopaholic\" plugins', '2019-04-12 06:54:19'),
(51, 'Lovata.Shopaholic', 'comment', '1.4.1', 'Update annotations for \"Reviews for Shopaholic\" plugin. Fix $dates array in Product model. Thanks for contribution Alexander Shapoval.', '2019-04-12 06:54:19'),
(52, 'Lovata.Shopaholic', 'comment', '1.5.0', 'Add integration with \"Search for Shopaholic\",\"Sphinx for Shopaholic\" plugins', '2019-04-12 06:54:19'),
(53, 'Lovata.Shopaholic', 'comment', '1.6.0', 'Add integration with \"Compare for Shopaholic\"', '2019-04-12 06:54:19'),
(54, 'Lovata.Shopaholic', 'comment', '1.7.0', 'Added translation into French. Thanks for contribution philmarc.', '2019-04-12 06:54:19'),
(55, 'Lovata.Shopaholic', 'comment', '1.8.0', 'Add integration with \"Viewed products for Shopaholic\" plugin', '2019-04-12 06:54:19'),
(56, 'Lovata.Shopaholic', 'script', '1.9.0', 'seeder_price_format.php', '2019-04-12 06:54:21'),
(57, 'Lovata.Shopaholic', 'comment', '1.9.0', 'Add PriceHelperTrait, TraitCached in models. Add active() method to CategoryCollection class. Move PriceHelper class from Shopaholic plugin to Toolbox plugin. Add new store classes. Refactoring *Store, *Item, *Collection classes. Requires Toolbox plugin version 1.10.0 and later.', '2019-04-12 06:54:21'),
(58, 'Lovata.Shopaholic', 'script', '1.10.0', 'create_table_additional_categories.php', '2019-04-12 06:54:21'),
(59, 'Lovata.Shopaholic', 'comment', '1.10.0', 'Adding relation between Product model and additional categories. Adding ability to get list of products by category ID list, by the parent category ID.', '2019-04-12 06:54:21'),
(60, 'Lovata.Shopaholic', 'comment', '1.11.0', 'Adding getPageUrl() method to ProductItem, BrandItem classes.', '2019-04-12 06:54:21'),
(61, 'Lovata.Shopaholic', 'comment', '1.11.1', 'Adding \"field.additional_category\" value to lang files. Fixed displaying \"additional categories\" field only for update/preview forms.', '2019-04-12 06:54:21'),
(62, 'Lovata.Shopaholic', 'comment', '1.11.2', 'Fix work with *Store classes in *Handler classes.', '2019-04-12 06:54:21'),
(63, 'Lovata.Shopaholic', 'comment', '1.11.3', 'Fix error in ProductCollection class, if product list by category is empty.', '2019-04-12 06:54:21'),
(64, 'Lovata.Shopaholic', 'comment', '1.12.0', 'Added type returned by methods in AbstractStore * classes', '2019-04-12 06:54:21'),
(65, 'Lovata.Shopaholic', 'script', '1.13.0', 'create_table_promo_block.php', '2019-04-12 06:54:21'),
(66, 'Lovata.Shopaholic', 'script', '1.13.0', 'create_table_promo_block_relation.php', '2019-04-12 06:54:21'),
(67, 'Lovata.Shopaholic', 'comment', '1.13.0', 'Added PromoBlock model. Promo blocks are sections of content that you can place throughout your eCommerce website and advertise products, offers, discounts, campaigns, and other activity. Added PromoBlockData, PromoBlockPage, PromoBlockList components. Added PromoBlockItem, PromoBlockCollection classes.', '2019-04-12 06:54:21'),
(68, 'Lovata.Shopaholic', 'comment', '1.13.1', 'Added annotations for integration with Coupons for Shopaholic, Discounts for Shopaholic, Campaigns for Shopaholic plugins.', '2019-04-12 06:54:21'),
(69, 'Lovata.Shopaholic', 'comment', '1.14.0', 'Added \"additional_category\" field to ProductItem class.', '2019-04-12 06:54:21'),
(70, 'Lovata.Shopaholic', 'comment', '1.14.1', 'Remove vendor folder from plugin.', '2019-04-12 06:54:21'),
(71, 'Lovata.Shopaholic', 'comment', '1.15.0', 'Added import product, offers, categories, brands from CSV file in backend. Requires Toolbox plugin version 1.18.0 and later', '2019-04-12 06:54:21'),
(72, 'Lovata.Shopaholic', 'comment', '1.16.0', 'Added block with description about import of product/offer properties from CSV file.', '2019-04-12 06:54:21'),
(73, 'Lovata.Shopaholic', 'comment', '1.16.1', 'Added annotations of filterByDiscount(), filterByQuantity() methods to OfferCollection class.', '2019-04-12 06:54:21'),
(74, 'Lovata.Shopaholic', 'comment', '1.17.0', 'Added Japanese language. Thanks for contribution pikanji.', '2019-04-12 06:54:21'),
(75, 'Lovata.Shopaholic', 'comment', '1.18.0', 'Added German language. Thanks for contribution Gerald.', '2019-04-12 06:54:21'),
(76, 'Lovata.Shopaholic', 'comment', '1.19.0', 'Added translatable slug in Product, Brand, Category, PromoBlock models.', '2019-04-12 06:54:21'),
(77, 'Lovata.Shopaholic', 'comment', '1.19.1', 'Fixed permissions for promo block menu item. Thanks for contribution Andreas Kosmowicz.', '2019-04-12 06:54:21'),
(78, 'Lovata.Shopaholic', 'comment', '1.20.0', 'Added Slovak language. Thanks for contribution vosco88.', '2019-04-12 06:54:21'),
(79, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_taxes.php', '2019-04-12 06:54:21'),
(80, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_tax_category_relation.php', '2019-04-12 06:54:21'),
(81, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_tax_product_relation.php', '2019-04-12 06:54:22'),
(82, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_tax_country_relation.php', '2019-04-12 06:54:22'),
(83, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_tax_state_relation.php', '2019-04-12 06:54:22'),
(84, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_currency.php', '2019-04-12 06:54:22'),
(85, 'Lovata.Shopaholic', 'script', '1.21.0', 'seeder_create_default_currency.php', '2019-04-12 06:54:22'),
(86, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_price_types.php', '2019-04-12 06:54:22'),
(87, 'Lovata.Shopaholic', 'script', '1.21.0', 'create_table_prices.php', '2019-04-12 06:54:23'),
(88, 'Lovata.Shopaholic', 'script', '1.21.0', 'update_table_users_add_currency_field.php', '2019-04-12 06:54:23'),
(89, 'Lovata.Shopaholic', 'script', '1.21.0', 'seeder_transfer_offer_prices.php', '2019-04-12 06:54:23'),
(90, 'Lovata.Shopaholic', 'script', '1.21.0', 'update_table_offers_remove_price_field.php', '2019-04-12 06:54:23'),
(91, 'Lovata.Shopaholic', 'comment', '1.21.0', 'Added multicurrency. Added taxes. Added price types. Added shopaholic:check.table.integrity artisan command.', '2019-04-12 06:54:23'),
(92, 'Lovata.Shopaholic', 'comment', '1.21.1', 'Fixed labels for tax settings.', '2019-04-12 06:54:23'),
(93, 'Lovata.Shopaholic', 'comment', '1.21.2', 'Fix error with saving offer without prices.', '2019-04-12 06:54:23'),
(94, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2019-04-12 06:57:03'),
(95, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2019-04-12 06:57:03'),
(96, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2019-04-12 06:57:03'),
(97, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2019-04-12 06:57:03'),
(98, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2019-04-12 06:57:03'),
(99, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2019-04-12 06:57:03'),
(100, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2019-04-12 06:57:03'),
(101, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2019-04-12 06:57:03'),
(102, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2019-04-12 06:57:03'),
(103, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2019-04-12 06:57:03'),
(104, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2019-04-12 06:57:03'),
(105, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2019-04-12 06:57:03'),
(106, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2019-04-12 06:57:03'),
(107, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2019-04-12 06:57:03'),
(108, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2019-04-12 06:57:03'),
(109, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2019-04-12 06:57:03'),
(110, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2019-04-12 06:57:03'),
(111, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2019-04-12 06:57:03'),
(112, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2019-04-12 06:57:03'),
(113, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2019-04-12 06:57:03'),
(114, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2019-04-12 06:57:03'),
(115, 'RainLab.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2019-04-12 06:57:03'),
(116, 'RainLab.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2019-04-12 06:57:03'),
(117, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_cart.php', '2019-04-12 07:00:31'),
(118, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_cart_element.php', '2019-04-12 07:00:31'),
(119, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_offer_order.php', '2019-04-12 07:00:31'),
(120, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_order.php', '2019-04-12 07:00:31'),
(121, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_payment_method.php', '2019-04-12 07:00:31'),
(122, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_shipping_type.php', '2019-04-12 07:00:32'),
(123, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'table_create_status.php', '2019-04-12 07:00:32'),
(124, 'Lovata.OrdersShopaholic', 'script', '1.0.0', 'seeder_default_status.php', '2019-04-12 07:00:32'),
(125, 'Lovata.OrdersShopaholic', 'comment', '1.0.0', 'Initialize plugin.', '2019-04-12 07:00:32'),
(126, 'Lovata.OrdersShopaholic', 'comment', '1.0.1', 'Fix permission tab label in config', '2019-04-12 07:00:32'),
(127, 'Lovata.OrdersShopaholic', 'comment', '1.0.2', 'Remove php short tags from orders/_price_block.htm', '2019-04-12 07:00:32'),
(128, 'Lovata.OrdersShopaholic', 'script', '1.0.3', 'seeder_update_order_secret_key.php', '2019-04-12 07:00:32'),
(129, 'Lovata.OrdersShopaholic', 'comment', '1.0.3', 'Change method for generation secret_key field in Order model', '2019-04-12 07:00:32'),
(130, 'Lovata.OrdersShopaholic', 'comment', '1.0.4', 'Adding additional cache cleaning for the sorted list of payment methods and shipping types, after the creation of a new element. Requires Toolbox plugin version 1.3.0 and later.', '2019-04-12 07:00:32'),
(131, 'Lovata.OrdersShopaholic', 'comment', '1.0.5', '$casts property is replaced with $jsonable property in the Order model', '2019-04-12 07:00:32'),
(132, 'Lovata.OrdersShopaholic', 'comment', '1.1.0', 'The \"rewrite\" and \"increase\" flags are removed from the method of updating the quantity of items in the cart', '2019-04-12 07:00:32'),
(133, 'Lovata.OrdersShopaholic', 'script', '1.2.0', 'table_create_addition_properties.php', '2019-04-12 07:00:32'),
(134, 'Lovata.OrdersShopaholic', 'script', '1.2.0', 'seeder_default_order_properties.php', '2019-04-12 07:00:32'),
(135, 'Lovata.OrdersShopaholic', 'comment', '1.2.0', 'Add additional properties for Order model. Add settings for validation the email field as required.', '2019-04-12 07:00:32'),
(136, 'Lovata.OrdersShopaholic', 'comment', '1.2.1', 'Remove php short tags from orders/_price_block.htm', '2019-04-12 07:00:32'),
(137, 'Lovata.OrdersShopaholic', 'script', '1.3.0', 'table_update_shipping_type_add_price_field.php', '2019-04-12 07:00:32'),
(138, 'Lovata.OrdersShopaholic', 'comment', '1.3.0', 'Add \"price\" field in ShippingType model', '2019-04-12 07:00:32'),
(139, 'Lovata.OrdersShopaholic', 'comment', '1.3.1', 'Added check for isNested flag when expanding forms', '2019-04-12 07:00:32'),
(140, 'Lovata.OrdersShopaholic', 'comment', '1.4.0', 'Add integration with RainLab.User plugin. Added sending emails to the user and managers after the order was created. Add events \"shopaholic.order.created\", \"shopaholic.order.created.user.template.data\", \"shopaholic.order.created.manager.template.data\". Requires Toolbox plugin version 1.7.0 and later.', '2019-04-12 07:00:32'),
(141, 'Lovata.OrdersShopaholic', 'comment', '1.5.0', 'Update logic for new version of CResult class. Requires Toolbox plugin version 1.9.1 and later.', '2019-04-12 07:00:32'),
(142, 'Lovata.OrdersShopaholic', 'script', '1.6.0', 'table_update_status_add_is_user_show_field.php', '2019-04-12 07:00:33'),
(143, 'Lovata.OrdersShopaholic', 'script', '1.6.0', 'table_create_order_positions.php', '2019-04-12 07:00:33'),
(144, 'Lovata.OrdersShopaholic', 'script', '1.6.0', 'table_create_cart_positions.php', '2019-04-12 07:00:33'),
(145, 'Lovata.OrdersShopaholic', 'script', '1.6.0', 'table_create_order_position_addition_properties.php', '2019-04-12 07:00:33'),
(146, 'Lovata.OrdersShopaholic', 'script', '1.6.0', 'table_update_orders_remove_total_price_field.php', '2019-04-12 07:00:33'),
(147, 'Lovata.OrdersShopaholic', 'comment', '1.6.0', 'Add classes: OrderCollection, OrderPositionCollection, StatusCollection,  OrderItem, OrderPositionItem, StatusItem. Add StatusList component. Adding the ability to create custom properties for order positions. Adding the ability to attach users with orders. Adding the ability to create/update order positions in backend. Add filter order list (backend) by payment method, shipping type, created_at/update_at fields. Add \"hasMany\" relation in User model with Order model. Add \"user_list\" property in User model. Add \"order\" in UserItem class. Refactoring CartProcessor, OrderProcessor classes. Rename classes: CartElementCollection => CartPositionCollection, CartElementItem => CartPositionItem. Requires Toolbox plugin version 1.10.0 and later.', '2019-04-12 07:00:33'),
(148, 'Lovata.OrdersShopaholic', 'comment', '1.6.1', 'Fix error in OrderPage::get() method.', '2019-04-12 07:00:33'),
(149, 'Lovata.OrdersShopaholic', 'comment', '1.6.2', 'Fix error in OfferOrderPositionProcessor class.', '2019-04-12 07:00:33'),
(150, 'Lovata.OrdersShopaholic', 'comment', '1.6.3', 'Fix work with *Store classes in *Handler classes', '2019-04-12 07:00:33'),
(151, 'Lovata.OrdersShopaholic', 'script', '1.6.4', 'seeder_fix_position_type_value.php', '2019-04-12 07:00:33'),
(152, 'Lovata.OrdersShopaholic', 'comment', '1.6.4', 'Fix position type default value', '2019-04-12 07:00:33'),
(153, 'Lovata.OrdersShopaholic', 'script', '1.7.0', 'table_update_payment_method_add_gateway_field.php', '2019-04-12 07:00:34'),
(154, 'Lovata.OrdersShopaholic', 'script', '1.7.0', 'table_update_orders_add_payment_data_fields.php', '2019-04-12 07:00:34'),
(155, 'Lovata.OrdersShopaholic', 'comment', '1.7.0', 'Improved integration with payment systems. Adds of shipping price filling from shipping type object, if shipping_price field value from request is empty.', '2019-04-12 07:00:34'),
(156, 'Lovata.OrdersShopaholic', 'script', '1.8.0', 'table_update_orders_add_payment_token_field.php', '2019-04-12 07:00:34'),
(157, 'Lovata.OrdersShopaholic', 'comment', '1.8.0', 'Add payment_token field to Order model', '2019-04-12 07:00:34'),
(158, 'Lovata.OrdersShopaholic', 'comment', '1.9.0', 'Added type returned by methods in AbstractStore * classes.', '2019-04-12 07:00:34'),
(159, 'Lovata.OrdersShopaholic', 'comment', '1.9.1', 'Adds secret_key field to OrderItem object.', '2019-04-12 07:00:34'),
(160, 'Lovata.OrdersShopaholic', 'comment', '1.10.0', 'Add Validation trait to Order model.', '2019-04-12 07:00:34'),
(161, 'Lovata.OrdersShopaholic', 'comment', '1.10.1', 'Remove links on lang file of Buddies plugin.', '2019-04-12 07:00:34'),
(162, 'Lovata.OrdersShopaholic', 'comment', '1.10.2', 'Fixed labels in ShippingType controller breadcrumbs.', '2019-04-12 07:00:34'),
(163, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_create_promo_mechanism.php', '2019-04-12 07:00:34'),
(164, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_create_order_promo_mechanism.php', '2019-04-12 07:00:34'),
(165, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_create_user_addresses.php', '2019-04-12 07:00:34'),
(166, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'seeder_address_order_properties.php', '2019-04-12 07:00:35'),
(167, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_update_orders_add_currency_field.php', '2019-04-12 07:00:35'),
(168, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_update_orders_add_manager_id_field.php', '2019-04-12 07:00:35'),
(169, 'Lovata.OrdersShopaholic', 'script', '1.11.0', 'table_create_tasks.php', '2019-04-12 07:00:35'),
(170, 'Lovata.OrdersShopaholic', 'comment', '1.11.0', 'Added PromoMechanism model. Added of opportunity to change price of order positions, shipping price, order total price, using promo mechanisms. Added user addresses. Added tasks with relation with orders, users.', '2019-04-12 07:00:35'),
(171, 'Lovata.OrdersShopaholic', 'comment', '1.11.1', 'Added annotations for integration with Coupons for Shopaholic, Discounts for Shopaholic, Campaigns for Shopaholic plugins.', '2019-04-12 07:00:36'),
(172, 'Lovata.OrdersShopaholic', 'comment', '1.11.2', 'Fixed the logic of getting custom field values of the saved user address when creating an order.', '2019-04-12 07:00:36'),
(173, 'Lovata.OrdersShopaholic', 'comment', '1.11.3', 'Fixed update of price data before sending an order to the payment gateway', '2019-04-12 07:00:36'),
(174, 'Lovata.OrdersShopaholic', 'comment', '1.11.4', 'Fixed creation of an order position via add() method.', '2019-04-12 07:00:36'),
(175, 'Lovata.OrdersShopaholic', 'comment', '1.12.0', 'Added supported types of order properties: number, rich editor, single checkbox, switch, balloon selector, tag list, radio.', '2019-04-12 07:00:36'),
(176, 'Lovata.OrdersShopaholic', 'comment', '1.12.1', 'Fixed logic for calculating old total price of order position without discounts.', '2019-04-12 07:00:36'),
(177, 'Lovata.OrdersShopaholic', 'comment', '1.13.0', 'Added Japanese language. Thanks for contribution pikanji.', '2019-04-12 07:00:36'),
(178, 'Lovata.OrdersShopaholic', 'comment', '1.14.0', 'Added getCurrency() method in Cart component. Improved parameter generation for redirecting to order page in MakeOrder component. Added shipping_type_id parameter processing in onAdd, onUpdate, onRemove methods (Cart component)', '2019-04-12 07:00:36'),
(179, 'Lovata.OrdersShopaholic', 'script', '1.14.1', 'table_update_tasks_change_description_type.php', '2019-04-12 07:00:36'),
(180, 'Lovata.OrdersShopaholic', 'comment', '1.14.1', 'Changed type of \"description\" field in task table.', '2019-04-12 07:00:36'),
(181, 'Lovata.OrdersShopaholic', 'comment', '1.14.2', 'Fixed link to cancel button in backend (OrderPosition controller)', '2019-04-12 07:00:36'),
(182, 'Lovata.OrdersShopaholic', 'comment', '1.14.3', 'Fixed OrderProcessor::EVENT_GET_SHIPPING_PRICE event. Thanks for contribution GitLog.', '2019-04-12 07:00:36'),
(183, 'Lovata.OrdersShopaholic', 'comment', '1.15.0', 'Added German language. Thanks for contribution Gerald.', '2019-04-12 07:00:36'),
(184, 'Lovata.OrdersShopaholic', 'comment', '1.16.0', 'Added checking addresses for uniqueness before creating a new user address or order.', '2019-04-12 07:00:36'),
(185, 'Lovata.OrdersShopaholic', 'comment', '1.17.0', 'Added shopaholic.shipping_type.get_price event. The event allows you to dynamically change the shipping price.', '2019-04-12 07:00:36'),
(186, 'Lovata.OrdersShopaholic', 'comment', '1.18.0', 'Added calculate_per_unit setting parameter in PromoMechanism model.', '2019-04-12 07:00:36'),
(187, 'Lovata.OrdersShopaholic', 'script', '1.19.0', 'table_update_taxes_add_applied_to_shipping_price.php', '2019-04-12 07:00:36'),
(188, 'Lovata.OrdersShopaholic', 'script', '1.19.0', 'table_update_order_positions_add_tax_percent_field.php', '2019-04-12 07:00:36'),
(189, 'Lovata.OrdersShopaholic', 'script', '1.19.0', 'table_update_orders_add_currency_id_field.php', '2019-04-12 07:00:37'),
(190, 'Lovata.OrdersShopaholic', 'script', '1.19.0', 'table_update_orders_add_shipping_tax_percent_field.php', '2019-04-12 07:00:37'),
(191, 'Lovata.OrdersShopaholic', 'comment', '1.19.0', '!!! Added Taxes. Added multicyrrency. Requires Shopaholic plugin version 1.21.0 and later.', '2019-04-12 07:00:37'),
(192, 'Lovata.OrdersShopaholic', 'script', '1.20.0', 'table_update_shipping_types_add_method_and_property_fields.php', '2019-04-12 07:00:37'),
(193, 'Lovata.OrdersShopaholic', 'script', '1.20.0', 'table_update_carts_add_fields.php', '2019-04-12 07:00:37'),
(194, 'Lovata.OrdersShopaholic', 'script', '1.20.0', 'table_create_shipping_restrictions_table.php', '2019-04-12 07:00:37'),
(195, 'Lovata.OrdersShopaholic', 'script', '1.20.0', 'table_create_shipping_restrictions_link_table.php', '2019-04-12 07:00:37'),
(196, 'Lovata.OrdersShopaholic', 'comment', '1.20.0', 'Added ability to add multiple identical offers, but with different set of properties. Added ability to delete cart positions by ID. Added ability to create integration with API of delivery services. Added property fields in ShippingType model. Added ability to create restrictions for shipping types.  Added restrictions of shipping types by position total price. Added email, user_data, shipping_address, billing_address, shipping_type_id, payment_method_id, property fields in Cart model. Thanks for contribution Tsagan Noniev and Rubium Web.', '2019-04-12 07:00:37'),
(197, 'Lovata.OrdersShopaholic', 'script', '1.21.0', 'table_update_cart_positions_add_deleted_field.php', '2019-04-12 07:00:37'),
(198, 'Lovata.OrdersShopaholic', 'comment', '1.21.0', 'Added onRestore method to Cart component.', '2019-04-12 07:00:37'),
(199, 'Lovata.OmnipayShopaholic', 'comment', '1.0.0', 'Initialize plugin.', '2019-04-12 07:01:08'),
(200, 'Lovata.OmnipayShopaholic', 'comment', '1.0.1', 'Fix settings in plugin.yaml', '2019-04-12 07:01:08'),
(201, 'Lovata.OmnipayShopaholic', 'comment', '1.1.0', 'Update logic for price field of Order model. Requires Toolbox plugin version 1.10.0 and later.', '2019-04-12 07:01:08'),
(202, 'Lovata.OmnipayShopaholic', 'comment', '1.1.1', 'Fix: Saving gateway parameter values as string values of arrays.', '2019-04-12 07:01:08'),
(203, 'Lovata.OmnipayShopaholic', 'comment', '1.2.0', '!!!Improved integration with payment gateways. Request to payment gateway is automatically send after order was created. Remove getPaymentGateway() method from OrderPage component. Requires Orders for Shopaholic plugin version 1.7.0 and later.', '2019-04-12 07:01:08'),
(204, 'Lovata.OmnipayShopaholic', 'comment', '1.3.0', 'Added processing of \"return\", \"cancel\" URLs. Added new events.', '2019-04-12 07:01:08'),
(205, 'Lovata.OmnipayShopaholic', 'comment', '1.4.0', 'Updated payment gateway data, after adding taxes in main plugin.', '2019-04-12 07:01:08'),
(206, 'Lovata.SphinxShopaholic', 'script', '1.0.0', 'update_table_brand.php', '2019-04-12 07:01:49'),
(207, 'Lovata.SphinxShopaholic', 'script', '1.0.0', 'update_table_product.php', '2019-04-12 07:01:49'),
(208, 'Lovata.SphinxShopaholic', 'script', '1.0.0', 'update_table_category.php', '2019-04-12 07:01:49'),
(209, 'Lovata.SphinxShopaholic', 'script', '1.0.0', 'update_table_tag.php', '2019-04-12 07:01:49'),
(210, 'Lovata.SphinxShopaholic', 'comment', '1.0.0', 'Initialize plugin.', '2019-04-12 07:01:49'),
(211, 'Lovata.SphinxShopaholic', 'comment', '1.0.1', 'Fixed checking the extension of form fields in backend.', '2019-04-12 07:01:49'),
(212, 'PeterHegman.SlickSlider', 'comment', '1.0.1', 'Initialize plugin.', '2019-04-12 07:06:02'),
(213, 'PeterHegman.SlickSlider', 'script', '1.0.2', 'builder_table_create_peterhegman_slickslider_slide_shows.php', '2019-04-12 07:06:02'),
(214, 'PeterHegman.SlickSlider', 'comment', '1.0.2', 'Created table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(215, 'PeterHegman.SlickSlider', 'script', '1.0.3', 'builder_table_update_peterhegman_slickslider_slide_shows.php', '2019-04-12 07:06:02'),
(216, 'PeterHegman.SlickSlider', 'comment', '1.0.3', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(217, 'PeterHegman.SlickSlider', 'script', '1.0.4', 'builder_table_update_peterhegman_slickslider_slide_shows_2.php', '2019-04-12 07:06:02'),
(218, 'PeterHegman.SlickSlider', 'comment', '1.0.4', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(219, 'PeterHegman.SlickSlider', 'script', '1.0.5', 'builder_table_update_peterhegman_slickslider_slide_shows_3.php', '2019-04-12 07:06:02'),
(220, 'PeterHegman.SlickSlider', 'comment', '1.0.5', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(221, 'PeterHegman.SlickSlider', 'script', '1.0.6', 'builder_table_update_peterhegman_slickslider_slide_shows_4.php', '2019-04-12 07:06:02'),
(222, 'PeterHegman.SlickSlider', 'comment', '1.0.6', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(223, 'PeterHegman.SlickSlider', 'script', '1.0.7', 'builder_table_update_peterhegman_slickslider_slide_shows_5.php', '2019-04-12 07:06:02'),
(224, 'PeterHegman.SlickSlider', 'comment', '1.0.7', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(225, 'PeterHegman.SlickSlider', 'script', '1.0.8', 'builder_table_update_peterhegman_slickslider_slide_shows_6.php', '2019-04-12 07:06:02'),
(226, 'PeterHegman.SlickSlider', 'comment', '1.0.8', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(227, 'PeterHegman.SlickSlider', 'script', '1.0.9', 'builder_table_update_peterhegman_slickslider_slide_shows_7.php', '2019-04-12 07:06:02'),
(228, 'PeterHegman.SlickSlider', 'comment', '1.0.9', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:02'),
(229, 'PeterHegman.SlickSlider', 'script', '1.0.10', 'builder_table_update_peterhegman_slickslider_slide_shows_8.php', '2019-04-12 07:06:03'),
(230, 'PeterHegman.SlickSlider', 'comment', '1.0.10', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:03'),
(231, 'PeterHegman.SlickSlider', 'script', '1.0.11', 'builder_table_update_peterhegman_slickslider_slide_shows_9.php', '2019-04-12 07:06:03'),
(232, 'PeterHegman.SlickSlider', 'comment', '1.0.11', 'Updated table peterhegman_slickslider_slide_shows', '2019-04-12 07:06:03'),
(233, 'PeterHegman.SlickSlider', 'script', '1.0.12', 'builder_table_update_peterhegman_slickslider_slide_shows_10.php', '2019-04-12 07:06:03'),
(234, 'PeterHegman.SlickSlider', 'comment', '1.0.12', 'Updated table peterhegman_slickslider_slide_shows. Added slide link feature. Added option to include or not include jQuery. Added horizontal image position option', '2019-04-12 07:06:03'),
(235, 'PeterHegman.SlickSlider', 'comment', '1.0.13', 'New permissions added allowing administrators to prevent users from editing settings of slide shows or adding and deleting slide shows. Global settings added.', '2019-04-12 07:06:03'),
(236, 'PeterHegman.SlickSlider', 'comment', '1.0.14', 'Update makes it possible to include the slider component within the static-pages plugin by Rainlab', '2019-04-12 07:06:03'),
(237, 'PeterHegman.SlickSlider', 'comment', '1.1.1', 'Updating `json` columns to `text` to fix error for users using MySQL below 5.7', '2019-04-12 07:06:03'),
(238, 'PeterHegman.SlickSlider', 'comment', '1.1.2', 'Adding support for rainlab.translate. Thanks to Tony Raoul. Fixed error when updating to PHP 7.2', '2019-04-12 07:06:03'),
(239, 'BenFreke.MenuManager', 'script', '1.0.1', 'create_menus_table.php', '2019-04-12 08:41:12'),
(240, 'BenFreke.MenuManager', 'comment', '1.0.1', 'First version of MenuManager', '2019-04-12 08:41:12'),
(241, 'BenFreke.MenuManager', 'comment', '1.0.2', 'Added active state to menu; Added ability to select active menu item; Added controllable depth to component', '2019-04-12 08:41:12'),
(242, 'BenFreke.MenuManager', 'comment', '1.0.3', 'Made it possible for menu items to not link anywhere; Put a check in so the active node must be a child of the parentNode', '2019-04-12 08:41:12'),
(243, 'BenFreke.MenuManager', 'comment', '1.0.4', 'Fixed bug where re-ordering stopped working', '2019-04-12 08:41:12'),
(244, 'BenFreke.MenuManager', 'comment', '1.0.5', 'Moved link creation code into the model in preparation for external links; Brought list item class creation into the model; Fixed typo with default menu class', '2019-04-12 08:41:12'),
(245, 'BenFreke.MenuManager', 'comment', '1.0.6', 'Removed NestedSetModel, thanks @daftspunk', '2019-04-12 08:41:12'),
(246, 'BenFreke.MenuManager', 'script', '1.1.0', 'add_is_external_field.php', '2019-04-12 08:41:12'),
(247, 'BenFreke.MenuManager', 'script', '1.1.0', 'add_link_target_field.php', '2019-04-12 08:41:12'),
(248, 'BenFreke.MenuManager', 'comment', '1.1.0', 'Added ability to link to external sites. Thanks @adisos', '2019-04-12 08:41:12'),
(249, 'BenFreke.MenuManager', 'script', '1.1.1', 'add_enabled_parameters_query_fields_1.php', '2019-04-12 08:41:12'),
(250, 'BenFreke.MenuManager', 'script', '1.1.1', 'add_enabled_parameters_query_fields_2.php', '2019-04-12 08:41:12'),
(251, 'BenFreke.MenuManager', 'script', '1.1.1', 'add_enabled_parameters_query_fields_3.php', '2019-04-12 08:41:12'),
(252, 'BenFreke.MenuManager', 'comment', '1.1.1', 'Added ability to enable/disable individual menu links; Added ability for url parameters & query string; Fixed issue of \"getLinkHref()\" pulling through full page url with parameters rather than the ACTUAL page url', '2019-04-12 08:41:12'),
(253, 'BenFreke.MenuManager', 'comment', '1.1.2', 'Reformatted code for better maintainability and better practises', '2019-04-12 08:41:12'),
(254, 'BenFreke.MenuManager', 'comment', '1.1.3', 'Fixed bug that prevented multiple components displaying', '2019-04-12 08:41:12'),
(255, 'BenFreke.MenuManager', 'comment', '1.2.0', 'Fixed validation and fields bug; Added list classes', '2019-04-12 08:41:12'),
(256, 'BenFreke.MenuManager', 'comment', '1.3.0', 'Added translation ability thanks to @alxy', '2019-04-12 08:41:12'),
(257, 'BenFreke.MenuManager', 'comment', '1.3.1', 'JSON validation of parameters added; Correct active menu now being set based on parameters; PR sent by @whsol, thanks!', '2019-04-12 08:41:12'),
(258, 'BenFreke.MenuManager', 'comment', '1.3.2', 'Fix for param check that is breaking active node lookup. Thanks @alxy', '2019-04-12 08:41:12'),
(259, 'BenFreke.MenuManager', 'comment', '1.3.3', 'Fix for JSON comment having single quotes. Thanks @adisos', '2019-04-12 08:41:12'),
(260, 'BenFreke.MenuManager', 'comment', '1.3.4', 'Fix for JSON validation not firing', '2019-04-12 08:41:12'),
(261, 'BenFreke.MenuManager', 'script', '1.4.0', 'fix_menu_table.php', '2019-04-12 08:41:13'),
(262, 'BenFreke.MenuManager', 'comment', '1.4.0', 'Fix for POST operations. PR by @matissjanis, TR translations (@mahony0) and permission registration (@nnmer)', '2019-04-12 08:41:13'),
(263, 'BenFreke.MenuManager', 'comment', '1.4.1', 'Fixed bug caused by deleting needed method of Menu class. Thanks @MatissJA', '2019-04-12 08:41:13'),
(264, 'BenFreke.MenuManager', 'comment', '1.4.2', 'Fixed bug with URLs not saving correctly', '2019-04-12 08:41:13'),
(265, 'BenFreke.MenuManager', 'comment', '1.4.3', 'Fixed bug where getBaseFileName method was moved to a different object', '2019-04-12 08:41:13'),
(266, 'BenFreke.MenuManager', 'comment', '1.4.4', 'Fixed bug with incorrect labels. Thanks @ribsousa', '2019-04-12 08:41:13'),
(267, 'BenFreke.MenuManager', 'comment', '1.4.5', 'Fixed bug where getBaseFileName method was moved to a different object', '2019-04-12 08:41:13'),
(268, 'BenFreke.MenuManager', 'comment', '1.4.6', 'Merged PRs that fix bug with plugin not working with stable release', '2019-04-12 08:41:13'),
(269, 'BenFreke.MenuManager', 'comment', '1.4.7', 'Merged PR to fix syntax errors with fresh install of 1.4.6. Thanks @devlifeX', '2019-04-12 08:41:13'),
(270, 'BenFreke.MenuManager', 'comment', '1.4.8', 'Merged PR to fix re-order errors. Thanks @CptMeatball', '2019-04-12 08:41:13'),
(271, 'BenFreke.MenuManager', 'comment', '1.5.0', 'Fixed bugs preventing postgres and sqlite support', '2019-04-12 08:41:13'),
(272, 'BenFreke.MenuManager', 'comment', '1.5.1', 'Added homepage to plugin information. Thanks @gergo85', '2019-04-12 08:41:13'),
(273, 'BenFreke.MenuManager', 'comment', '1.5.2', 'Added French translation. Thanks @Glitchbone', '2019-04-12 08:41:13'),
(274, 'BenFreke.MenuManager', 'comment', '1.5.2', 'Added code of conduct', '2019-04-12 08:41:13'),
(275, 'BenFreke.MenuManager', 'comment', '1.5.3', 'Added ability to delete menus. Thanks @osmanzeki', '2019-04-12 08:41:13'),
(276, 'Lovata.Shopaholic', 'script', '1.21.3', 'builder_table_update_lovata_shopaholic_categories.php', '2019-04-12 10:03:16'),
(277, 'Lovata.Shopaholic', 'comment', '1.21.3', 'Updated table lovata_shopaholic_categories', '2019-04-12 10:03:16'),
(278, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2019-04-28 15:27:01'),
(279, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2019-04-28 15:27:02'),
(280, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2019-04-28 15:27:02'),
(281, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2019-04-28 15:27:02'),
(282, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2019-04-28 15:27:02'),
(283, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2019-04-28 15:27:02'),
(284, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2019-04-28 15:27:02'),
(285, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2019-04-28 15:27:02'),
(286, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2019-04-28 15:27:02'),
(287, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2019-04-28 15:27:03'),
(288, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2019-04-28 15:27:03'),
(289, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2019-04-28 15:27:03'),
(290, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2019-04-28 15:27:03'),
(291, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2019-04-28 15:27:03'),
(292, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2019-04-28 15:27:03'),
(293, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2019-04-28 15:27:03'),
(294, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2019-04-28 15:27:03'),
(295, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2019-04-28 15:27:03'),
(296, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2019-04-28 15:27:03'),
(297, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2019-04-28 15:27:03'),
(298, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2019-04-28 15:27:03'),
(299, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2019-04-28 15:27:03'),
(300, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2019-04-28 15:27:04'),
(301, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2019-04-28 15:27:04'),
(302, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2019-04-28 15:27:04'),
(303, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2019-04-28 15:27:04'),
(304, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2019-04-28 15:27:04'),
(305, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2019-04-28 15:27:04'),
(306, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2019-04-28 15:27:04'),
(307, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2019-04-28 15:27:04'),
(308, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2019-04-28 15:27:04'),
(309, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2019-04-28 15:27:04'),
(310, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2019-04-28 15:27:04'),
(311, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2019-04-28 15:27:05'),
(312, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2019-04-28 15:27:05'),
(313, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2019-04-28 15:27:05'),
(314, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2019-04-28 15:27:05'),
(315, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2019-04-28 15:27:05'),
(316, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2019-04-28 15:27:05'),
(317, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2019-04-28 15:27:05'),
(318, 'RainLab.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2019-04-28 15:27:05'),
(319, 'RainLab.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2019-04-28 15:27:05'),
(320, 'RainLab.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2019-04-28 15:27:05'),
(321, 'RainLab.Blog', 'script', '1.3.0', 'posts_add_metadata.php', '2019-04-28 15:27:06'),
(322, 'RainLab.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2019-04-28 15:27:06'),
(323, 'RainLab.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2019-04-28 15:27:06'),
(324, 'Wollson.GeneralPages', 'comment', '1.0.1', 'Initialize plugin.', '2019-05-07 08:06:20'),
(325, 'Wollson.GeneralPages', 'script', '1.0.2', 'builder_table_create_wollson_generalpages_.php', '2019-05-07 08:09:05'),
(326, 'Wollson.GeneralPages', 'comment', '1.0.2', 'Created table wollson_generalpages_', '2019-05-07 08:09:05'),
(327, 'Wollson.GeneralPages', 'script', '1.0.3', 'builder_table_update_wollson_generalpages_.php', '2019-05-07 08:09:05'),
(328, 'Wollson.GeneralPages', 'comment', '1.0.3', 'Updated table wollson_generalpages_', '2019-05-07 08:09:05'),
(329, 'Wollson.GeneralPages', 'script', '1.0.4', 'builder_table_update_wollson_generalpages__2.php', '2019-05-07 08:09:05'),
(330, 'Wollson.GeneralPages', 'comment', '1.0.4', 'Updated table wollson_generalpages_', '2019-05-07 08:09:05'),
(331, 'Wollson.GeneralPages', 'script', '1.0.5', 'builder_table_update_wollson_generalpages__3.php', '2019-05-07 08:09:05'),
(332, 'Wollson.GeneralPages', 'comment', '1.0.5', 'Updated table wollson_generalpages_', '2019-05-07 08:09:05'),
(333, 'Wollson.GeneralPages', 'script', '1.0.6', 'builder_table_update_wollson_generalpages__4.php', '2019-05-07 08:09:05'),
(334, 'Wollson.GeneralPages', 'comment', '1.0.6', 'Updated table wollson_generalpages_', '2019-05-07 08:09:05'),
(335, 'Wollson.GeneralPages', 'script', '1.0.7', 'builder_table_create_wollson_generalpages__2.php', '2019-05-07 08:09:37'),
(336, 'Wollson.GeneralPages', 'comment', '1.0.7', 'Created table wollson_generalpages_', '2019-05-07 08:09:37'),
(337, 'Wollson.GeneralPages', 'script', '1.0.8', 'builder_table_update_wollson_generalpages__5.php', '2019-05-07 08:10:24'),
(338, 'Wollson.GeneralPages', 'comment', '1.0.8', 'Updated table wollson_generalpages_', '2019-05-07 08:10:24'),
(339, 'Wollson.GeneralPages', 'script', '1.0.9', 'builder_table_update_wollson_generalpages__6.php', '2019-05-07 08:11:22'),
(340, 'Wollson.GeneralPages', 'comment', '1.0.9', 'Updated table wollson_generalpages_', '2019-05-07 08:11:22'),
(341, 'Wollson.Widgets', 'comment', '1.0.1', 'Initialize plugin.', '2019-05-08 06:27:15'),
(342, 'Wollson.Widgets', 'script', '1.0.2', 'builder_table_create_wollson_widgets_.php', '2019-05-08 06:27:15'),
(343, 'Wollson.Widgets', 'comment', '1.0.2', 'Created table wollson_widgets_', '2019-05-08 06:27:15'),
(344, 'Wollson.Widgets', 'script', '1.0.3', 'builder_table_create_wollson_widgets_regions.php', '2019-05-08 06:27:15'),
(345, 'Wollson.Widgets', 'comment', '1.0.3', 'Created table wollson_widgets_regions', '2019-05-08 06:27:15'),
(346, 'Wollson.Widgets', 'script', '1.0.4', 'builder_table_update_wollson_widgets_regions.php', '2019-05-08 06:27:15'),
(347, 'Wollson.Widgets', 'comment', '1.0.4', 'Updated table wollson_widgets_regions', '2019-05-08 06:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2019-04-12 06:51:02', 0, 0),
(2, 'Lovata.Toolbox', '1.23.0', '2019-04-12 06:54:18', 0, 0),
(3, 'Lovata.Shopaholic', '1.21.3', '2019-04-12 10:03:16', 0, 0),
(4, 'RainLab.Builder', '1.0.23', '2019-04-12 06:57:03', 0, 0),
(5, 'Lovata.OrdersShopaholic', '1.21.0', '2019-04-12 07:00:37', 0, 0),
(6, 'Lovata.OmnipayShopaholic', '1.4.0', '2019-04-12 07:01:08', 0, 0),
(7, 'Lovata.SphinxShopaholic', '1.0.1', '2019-04-12 07:01:49', 0, 0),
(8, 'PeterHegman.SlickSlider', '1.1.2', '2019-04-12 07:06:03', 0, 0),
(9, 'BenFreke.MenuManager', '1.5.3', '2019-04-12 08:41:13', 0, 0),
(10, 'RainLab.Blog', '1.3.1', '2019-04-28 15:27:06', 0, 0),
(11, 'Wollson.GeneralPages', '1.0.9', '2019-05-07 08:11:22', 0, 0),
(12, 'Wollson.Widgets', '1.0.4', '2019-05-08 06:27:15', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'lovata_toolbox_settings', '{\"decimals\":null,\"dec_point\":null,\"thousands_sep\":null}'),
(2, 'lovata_shopaholic_settings', '{\"check_offer_active\":\"1\",\"price_include_tax\":\"0\"}');

-- --------------------------------------------------------

--
-- Table structure for table `wollson_generalpages_`
--

CREATE TABLE `wollson_generalpages_` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wollson_generalpages_`
--

INSERT INTO `wollson_generalpages_` (`id`, `content`, `name`, `section_type`, `descriptions`) VALUES
(1, '[{\"section_name\":\"test 1\",\"section_content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est. Aenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.<\\/p>\\r\\n\",\"section_type\":\"left\",\"image\":\"\\/flame-color-glasses.png\"},{\"section_name\":\"test 2\",\"section_content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est. Aenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.<\\/p>\\r\\n\",\"section_type\":\"right\",\"image\":\"\\/new_statesman_events.jpg\"},{\"section_name\":\"test 3\",\"section_content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est. Aenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.<\\/p>\\r\\n\",\"section_type\":\"left\",\"image\":\"\\/flame-color-glasses.png\"},{\"section_name\":\"test 4\",\"section_content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est. Aenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.<\\/p>\\r\\n\",\"section_type\":\"right\",\"image\":\"\\/new_statesman_events.jpg\"},{\"section_name\":\"test 5\",\"section_content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est. Aenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.<\\/p>\\r\\n\",\"section_type\":\"left\",\"image\":\"\\/flame-color-glasses.png\"}]', 'About Us', NULL, '[{\"desc_name\":\"Our Story\",\"desc_content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est.\\r\\n\\r\\nAenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.\"},{\"desc_name\":\"Our Portfolio\",\"desc_content\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum justo est, nec sagittis velit euismod nec. Suspendisse eu imperdiet leo. Sed rutrum pretium turpis nec faucibus. Nulla facilisi. Pellentesque facilisis porta nibh, quis tempus ex suscipit quis. In sollicitudin luctus iaculis. Nulla a quam mollis, hendrerit lectus in, viverra est.\\r\\n\\r\\nAenean eget consectetur arcu. Nullam eu interdum tortor, a hendrerit tellus. Donec porttitor massa sit amet purus commodo, eget sollicitudin diam euismod. Nulla facilisi. Morbi eu dui sapien. Curabitur nec lacinia magna, a convallis libero. Nam consequat purus at hendrerit sollicitudin. Quisque sed ipsum quis mi blandit volutpat. Phasellus pharetra ipsum sed est scelerisque, vel ultricies lectus faucibus. Vivamus id felis at turpis varius tincidunt.\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `wollson_widgets_`
--

CREATE TABLE `wollson_widgets_` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wollson_widgets_regions`
--

CREATE TABLE `wollson_widgets_regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Indexes for table `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indexes for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indexes for table `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Indexes for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indexes for table `benfreke_menumanager_menus`
--
ALTER TABLE `benfreke_menumanager_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `benfreke_menumanager_menus_parent_id_index` (`parent_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indexes for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Indexes for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `lovata_ordersshopaholic_shipping_restrictions`
--
ALTER TABLE `lovata_ordersshopaholic_shipping_restrictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_ordersshopaholic_shipping_restrictions_code_index` (`code`),
  ADD KEY `lovata_ordersshopaholic_shipping_restrictions_restriction_index` (`restriction`);

--
-- Indexes for table `lovata_ordersshopaholic_shipping_restrictions_link`
--
ALTER TABLE `lovata_ordersshopaholic_shipping_restrictions_link`
  ADD PRIMARY KEY (`shipping_type_id`,`shipping_restriction_id`);

--
-- Indexes for table `lovata_orders_shopaholic_addition_properties`
--
ALTER TABLE `lovata_orders_shopaholic_addition_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_addition_properties_name_index` (`name`),
  ADD KEY `lovata_orders_shopaholic_addition_properties_slug_index` (`slug`),
  ADD KEY `lovata_orders_shopaholic_addition_properties_code_index` (`code`),
  ADD KEY `lovata_orders_shopaholic_addition_properties_sort_order_index` (`sort_order`);

--
-- Indexes for table `lovata_orders_shopaholic_carts`
--
ALTER TABLE `lovata_orders_shopaholic_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_carts_user_id_index` (`user_id`);

--
-- Indexes for table `lovata_orders_shopaholic_cart_positions`
--
ALTER TABLE `lovata_orders_shopaholic_cart_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_cart_positions_cart_id_index` (`cart_id`);

--
-- Indexes for table `lovata_orders_shopaholic_orders`
--
ALTER TABLE `lovata_orders_shopaholic_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_orders_user_id_index` (`user_id`),
  ADD KEY `lovata_orders_shopaholic_orders_status_id_index` (`status_id`),
  ADD KEY `lovata_orders_shopaholic_orders_order_number_index` (`order_number`),
  ADD KEY `lovata_orders_shopaholic_orders_shipping_type_id_index` (`shipping_type_id`),
  ADD KEY `lovata_orders_shopaholic_orders_payment_method_id_index` (`payment_method_id`),
  ADD KEY `lovata_orders_shopaholic_orders_currency_id_index` (`currency_id`);

--
-- Indexes for table `lovata_orders_shopaholic_order_positions`
--
ALTER TABLE `lovata_orders_shopaholic_order_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_order_positions_item_id_index` (`item_id`),
  ADD KEY `lovata_orders_shopaholic_order_positions_item_type_index` (`item_type`);

--
-- Indexes for table `lovata_orders_shopaholic_order_promo_mechanism`
--
ALTER TABLE `lovata_orders_shopaholic_order_promo_mechanism`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lovata_orders_shopaholic_payment_methods`
--
ALTER TABLE `lovata_orders_shopaholic_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_payment_methods_code_index` (`code`);

--
-- Indexes for table `lovata_orders_shopaholic_position_properties`
--
ALTER TABLE `lovata_orders_shopaholic_position_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_position_properties_name_index` (`name`),
  ADD KEY `lovata_orders_shopaholic_position_properties_slug_index` (`slug`),
  ADD KEY `lovata_orders_shopaholic_position_properties_code_index` (`code`),
  ADD KEY `lovata_orders_shopaholic_position_properties_sort_order_index` (`sort_order`);

--
-- Indexes for table `lovata_orders_shopaholic_promo_mechanism`
--
ALTER TABLE `lovata_orders_shopaholic_promo_mechanism`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lovata_orders_shopaholic_shipping_types`
--
ALTER TABLE `lovata_orders_shopaholic_shipping_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_shipping_types_code_index` (`code`),
  ADD KEY `lovata_orders_shopaholic_shipping_types_sort_order_index` (`sort_order`);

--
-- Indexes for table `lovata_orders_shopaholic_statuses`
--
ALTER TABLE `lovata_orders_shopaholic_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_statuses_code_index` (`code`),
  ADD KEY `lovata_orders_shopaholic_statuses_sort_order_index` (`sort_order`);

--
-- Indexes for table `lovata_orders_shopaholic_tasks`
--
ALTER TABLE `lovata_orders_shopaholic_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_tasks_status_index` (`status`),
  ADD KEY `lovata_orders_shopaholic_tasks_order_id_index` (`order_id`),
  ADD KEY `lovata_orders_shopaholic_tasks_user_id_index` (`user_id`),
  ADD KEY `lovata_orders_shopaholic_tasks_manager_id_index` (`manager_id`),
  ADD KEY `lovata_orders_shopaholic_tasks_author_id_index` (`author_id`);

--
-- Indexes for table `lovata_orders_shopaholic_user_addresses`
--
ALTER TABLE `lovata_orders_shopaholic_user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_orders_shopaholic_user_addresses_user_id_index` (`user_id`),
  ADD KEY `lovata_orders_shopaholic_user_addresses_type_index` (`type`);

--
-- Indexes for table `lovata_shopaholic_additional_categories`
--
ALTER TABLE `lovata_shopaholic_additional_categories`
  ADD PRIMARY KEY (`category_id`,`product_id`);

--
-- Indexes for table `lovata_shopaholic_brands`
--
ALTER TABLE `lovata_shopaholic_brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lovata_shopaholic_brands_slug_unique` (`slug`),
  ADD KEY `lovata_shopaholic_brands_name_index` (`name`),
  ADD KEY `lovata_shopaholic_brands_slug_index` (`slug`),
  ADD KEY `lovata_shopaholic_brands_code_index` (`code`),
  ADD KEY `lovata_shopaholic_brands_external_id_index` (`external_id`);

--
-- Indexes for table `lovata_shopaholic_categories`
--
ALTER TABLE `lovata_shopaholic_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lovata_shopaholic_categories_slug_unique` (`slug`),
  ADD KEY `lovata_shopaholic_categories_name_index` (`name`),
  ADD KEY `lovata_shopaholic_categories_slug_index` (`slug`),
  ADD KEY `lovata_shopaholic_categories_code_index` (`code`),
  ADD KEY `lovata_shopaholic_categories_external_id_index` (`external_id`);

--
-- Indexes for table `lovata_shopaholic_currency`
--
ALTER TABLE `lovata_shopaholic_currency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lovata_shopaholic_currency_code_unique` (`code`),
  ADD KEY `lovata_shopaholic_currency_code_index` (`code`),
  ADD KEY `lovata_shopaholic_currency_external_id_index` (`external_id`);

--
-- Indexes for table `lovata_shopaholic_offers`
--
ALTER TABLE `lovata_shopaholic_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_shopaholic_offers_name_index` (`name`),
  ADD KEY `lovata_shopaholic_offers_code_index` (`code`),
  ADD KEY `lovata_shopaholic_offers_external_id_index` (`external_id`),
  ADD KEY `lovata_shopaholic_offers_product_id_index` (`product_id`),
  ADD KEY `lovata_shopaholic_offers_quantity_index` (`quantity`);

--
-- Indexes for table `lovata_shopaholic_prices`
--
ALTER TABLE `lovata_shopaholic_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_shopaholic_prices_item_id_index` (`item_id`),
  ADD KEY `lovata_shopaholic_prices_item_type_index` (`item_type`),
  ADD KEY `lovata_shopaholic_prices_price_index` (`price`),
  ADD KEY `lovata_shopaholic_prices_old_price_index` (`old_price`),
  ADD KEY `lovata_shopaholic_prices_price_type_id_index` (`price_type_id`);

--
-- Indexes for table `lovata_shopaholic_price_types`
--
ALTER TABLE `lovata_shopaholic_price_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_shopaholic_price_types_code_index` (`code`),
  ADD KEY `lovata_shopaholic_price_types_external_id_index` (`external_id`);

--
-- Indexes for table `lovata_shopaholic_products`
--
ALTER TABLE `lovata_shopaholic_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lovata_shopaholic_products_slug_unique` (`slug`),
  ADD KEY `lovata_shopaholic_products_name_index` (`name`),
  ADD KEY `lovata_shopaholic_products_slug_index` (`slug`),
  ADD KEY `lovata_shopaholic_products_code_index` (`code`),
  ADD KEY `lovata_shopaholic_products_external_id_index` (`external_id`),
  ADD KEY `lovata_shopaholic_products_brand_id_index` (`brand_id`),
  ADD KEY `lovata_shopaholic_products_category_id_index` (`category_id`);

--
-- Indexes for table `lovata_shopaholic_promo_block`
--
ALTER TABLE `lovata_shopaholic_promo_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lovata_shopaholic_promo_block_slug_unique` (`slug`),
  ADD KEY `lovata_shopaholic_promo_block_name_index` (`name`),
  ADD KEY `lovata_shopaholic_promo_block_slug_index` (`slug`),
  ADD KEY `lovata_shopaholic_promo_block_code_index` (`code`);

--
-- Indexes for table `lovata_shopaholic_promo_block_relation`
--
ALTER TABLE `lovata_shopaholic_promo_block_relation`
  ADD PRIMARY KEY (`promo_id`,`product_id`);

--
-- Indexes for table `lovata_shopaholic_taxes`
--
ALTER TABLE `lovata_shopaholic_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lovata_shopaholic_tax_category_link`
--
ALTER TABLE `lovata_shopaholic_tax_category_link`
  ADD PRIMARY KEY (`category_id`,`tax_id`);

--
-- Indexes for table `lovata_shopaholic_tax_country_link`
--
ALTER TABLE `lovata_shopaholic_tax_country_link`
  ADD PRIMARY KEY (`country_id`,`tax_id`);

--
-- Indexes for table `lovata_shopaholic_tax_product_link`
--
ALTER TABLE `lovata_shopaholic_tax_product_link`
  ADD PRIMARY KEY (`product_id`,`tax_id`);

--
-- Indexes for table `lovata_shopaholic_tax_state_link`
--
ALTER TABLE `lovata_shopaholic_tax_state_link`
  ADD PRIMARY KEY (`state_id`,`tax_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peterhegman_slickslider_slide_shows`
--
ALTER TABLE `peterhegman_slickslider_slide_shows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Indexes for table `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indexes for table `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indexes for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indexes for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indexes for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indexes for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Indexes for table `wollson_generalpages_`
--
ALTER TABLE `wollson_generalpages_`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wollson_widgets_`
--
ALTER TABLE `wollson_widgets_`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wollson_widgets_regions`
--
ALTER TABLE `wollson_widgets_regions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `benfreke_menumanager_menus`
--
ALTER TABLE `benfreke_menumanager_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_ordersshopaholic_shipping_restrictions`
--
ALTER TABLE `lovata_ordersshopaholic_shipping_restrictions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_addition_properties`
--
ALTER TABLE `lovata_orders_shopaholic_addition_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_carts`
--
ALTER TABLE `lovata_orders_shopaholic_carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_cart_positions`
--
ALTER TABLE `lovata_orders_shopaholic_cart_positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_orders`
--
ALTER TABLE `lovata_orders_shopaholic_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_order_positions`
--
ALTER TABLE `lovata_orders_shopaholic_order_positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_order_promo_mechanism`
--
ALTER TABLE `lovata_orders_shopaholic_order_promo_mechanism`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_payment_methods`
--
ALTER TABLE `lovata_orders_shopaholic_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_position_properties`
--
ALTER TABLE `lovata_orders_shopaholic_position_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_promo_mechanism`
--
ALTER TABLE `lovata_orders_shopaholic_promo_mechanism`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_shipping_types`
--
ALTER TABLE `lovata_orders_shopaholic_shipping_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_statuses`
--
ALTER TABLE `lovata_orders_shopaholic_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_tasks`
--
ALTER TABLE `lovata_orders_shopaholic_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_orders_shopaholic_user_addresses`
--
ALTER TABLE `lovata_orders_shopaholic_user_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_brands`
--
ALTER TABLE `lovata_shopaholic_brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_categories`
--
ALTER TABLE `lovata_shopaholic_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_currency`
--
ALTER TABLE `lovata_shopaholic_currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_offers`
--
ALTER TABLE `lovata_shopaholic_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_prices`
--
ALTER TABLE `lovata_shopaholic_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_price_types`
--
ALTER TABLE `lovata_shopaholic_price_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_products`
--
ALTER TABLE `lovata_shopaholic_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_promo_block`
--
ALTER TABLE `lovata_shopaholic_promo_block`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lovata_shopaholic_taxes`
--
ALTER TABLE `lovata_shopaholic_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `peterhegman_slickslider_slide_shows`
--
ALTER TABLE `peterhegman_slickslider_slide_shows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wollson_generalpages_`
--
ALTER TABLE `wollson_generalpages_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wollson_widgets_`
--
ALTER TABLE `wollson_widgets_`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wollson_widgets_regions`
--
ALTER TABLE `wollson_widgets_regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
