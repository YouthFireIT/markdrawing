-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 19, 2021 at 10:54 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markdrawing`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Super Admin' COMMENT 'Admin|Super Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone_no`, `avatar`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@dailydeal.com.bd', '$2y$10$I1v21qOGKUAY.KfV4Njif.ObqDgt68dCS2kUTu/L4QTJuyR.JIbVi', '01856866618', NULL, 'Super Admin', '2020-01-06 00:33:01', '2020-01-06 00:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `name_bd`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', NULL, 'a:2:{i:0;s:7:\"primary\";i:1;s:6:\"mobile\";}', '2020-01-21 04:54:31', '2020-03-07 18:28:13'),
(4, 'Need Help', 'হেল্প লাইন', 'a:1:{i:0;s:12:\"footer_right\";}', '2020-01-21 05:43:55', '2020-01-22 04:43:52'),
(5, 'Footer Menu', 'ফুটার মেনু', 'a:3:{i:0;s:7:\"primary\";i:1;s:12:\"footer_right\";i:2;s:11:\"footer_left\";}', '2020-01-21 23:47:35', '2020-12-15 05:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_items`
--

CREATE TABLE `admin_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` bigint(20) UNSIGNED NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `label_bd`, `link`, `parent`, `sort`, `class`, `menu`, `depth`, `created_at`, `updated_at`) VALUES
(2, 'About', 'আমাদের সম্পর্কে', 'page/about-us', 0, 1, NULL, 1, 0, '2020-01-21 04:54:58', '2020-06-29 13:23:36'),
(3, 'Home', 'হোম', '#', 0, 0, NULL, 4, 0, '2020-01-21 06:17:04', '2020-01-21 23:43:00'),
(4, 'About Us', 'আমাদের সম্পর্কে', '#', 0, 1, NULL, 4, 0, '2020-01-21 06:53:58', '2020-01-21 23:44:03'),
(5, 'AMBAR', 'প্রাইভেসী পলিসি', 'http://dailydeal.com.bd/product/categoryAll/66', 0, 0, NULL, 5, 0, '2020-01-21 23:49:40', '2020-12-15 05:06:31'),
(6, 'Refund Policy', 'রিফান্ড পলিসি', '#', 0, 1, NULL, 5, 0, '2020-01-21 23:50:07', '2020-07-11 22:26:36'),
(8, 'Contact Us', 'যোগাযোগ করুন', '#', 4, 2, NULL, 4, 1, '2020-01-22 04:52:50', '2020-01-22 04:53:34'),
(10, 'Shop', NULL, 'products', 0, 0, NULL, 1, 0, '2020-03-07 18:17:24', '2020-03-08 03:24:50'),
(16, 'Our Products', NULL, '#', 0, 3, NULL, 4, 0, '2020-07-11 22:25:19', '2020-07-11 22:25:19'),
(17, 'Our Services', NULL, '#', 0, 4, NULL, 4, 0, '2020-07-11 22:25:36', '2020-07-11 22:25:36'),
(18, 'Customer Support', NULL, '#', 0, 2, NULL, 5, 0, '2020-07-11 22:26:36', '2020-07-11 22:26:36'),
(19, 'Help Center', NULL, '#', 0, 3, NULL, 5, 0, '2020-07-11 22:27:01', '2020-07-11 22:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Size', 'a:4:{i:0;s:1:\"S\";i:1;s:1:\"L\";i:2;s:2:\"XL\";i:3;s:3:\"XXL\";}', '2019-11-29 21:49:49', '2019-12-21 00:55:31'),
(2, 'Color', 'a:8:{i:0;s:3:\"Red\";i:1;s:5:\"Black\";i:2;s:4:\"Gree\";i:3;s:6:\"Yellow\";i:4;s:4:\"Gray\";i:5;s:8:\"Sky Blue\";i:6;s:4:\"Blue\";i:7;s:5:\"Green\";}', '2019-11-29 21:49:49', '2019-11-29 22:28:23'),
(4, 'Weight', 'a:7:{i:0;s:4:\"50ml\";i:1;s:5:\"100ml\";i:2;s:5:\"250ml\";i:3;s:5:\"500ml\";i:4;s:2:\"1L\";i:5;s:4:\"500g\";i:6;s:3:\"1kg\";}', '2019-11-30 05:26:33', '2019-11-30 05:26:33'),
(5, 'Color 2', 'a:3:{i:0;s:5:\"White\";i:1;s:5:\"Green\";i:2;s:5:\"Black\";}', '2019-12-21 06:05:41', '2019-12-21 06:05:41'),
(6, 'Color 3', 'a:3:{i:0;s:5:\"GREEN\";i:1;s:4:\" RED\";i:2;s:5:\" BLUE\";}', '2020-01-09 22:59:08', '2020-01-09 22:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_sets`
--

CREATE TABLE `attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_sets`
--

INSERT INTO `attribute_sets` (`id`, `name`, `attribute_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Pant', 'a:2:{i:0;s:1:\"2\";i:1;s:1:\"1\";}', NULL, '2019-11-30 04:48:22', '2019-12-15 08:20:39'),
(5, 'Attribute Set', 'a:3:{i:0;s:1:\"2\";i:1;s:1:\"1\";i:2;s:1:\"4\";}', NULL, '2019-12-15 08:24:00', '2019-12-20 21:58:10');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `title_bd`, `url`, `image`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 'Shop and Save Big', 'ওমরা', 'https://zamzamtravelsbd.com/', '1607802222.png', 'shop_save', '2020-01-06 02:59:12', '2020-12-12 13:43:42'),
(2, 'The Payment Methods We Allow', 'পেমেন্ট পদ্ধতি আমরা সাপোর্ট করি', '#', '1587376228.png', 'payment_method', '2020-01-06 03:04:38', '2020-04-20 03:50:28'),
(3, 'Under Big Slider 1st Image', 'Under Big Slider 1st Image', 'https://zamzamtravelsbd.com/', '1607704534.png', 'u_b_s_1', '2020-06-20 15:54:30', '2020-12-11 10:35:34'),
(4, 'Under Big Slider 2nd Image', 'Under Big Slider 2nd Image', 'https://zamzamtravelsbd.com/', '1607704252.png', 'u_b_s_2', '2020-06-20 15:55:31', '2020-12-11 10:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `name_bd`, `description`, `image`, `created_at`, `updated_at`) VALUES
(12, 'Arbian Pure', NULL, NULL, '1607702875.png', '2020-12-11 10:07:55', '2020-12-11 10:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `attributes_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_options` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL,
  `shipping_cost` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_bd`, `description`, `image`, `thumbnail`, `parent_id`, `slug`, `created_at`, `updated_at`) VALUES
(41, 'AJWA', NULL, 'Breakfast', '1607702714.png', '1607702714t.png', NULL, 'breakfast', '2020-06-19 07:05:15', '2020-12-11 10:05:14'),
(65, 'MABROOM', NULL, NULL, '1607754594.png', '1607754594t.png', NULL, 'mabroom', '2020-12-12 00:29:54', '2020-12-12 00:29:54'),
(66, 'AMBAR', NULL, 'AMBAR', '1607792458.jpeg', '1607792458t.jpeg', NULL, 'ambar', '2020-12-12 00:39:08', '2020-12-12 11:00:58'),
(67, 'MAJDOOL', NULL, NULL, '1607755677.png', '1607755677t.png', NULL, 'majdool', '2020-12-12 00:47:57', '2020-12-12 00:47:57'),
(68, 'SUGAEI', NULL, NULL, '1607755762.png', '1607755762t.png', NULL, 'sugaei', '2020-12-12 00:49:22', '2020-12-12 00:49:22'),
(69, 'SAFAWI', NULL, NULL, '1607755831.png', '1607755831t.png', NULL, 'safawi', '2020-12-12 00:50:31', '2020-12-12 00:50:32'),
(70, 'SUKKARI', NULL, NULL, '1607755894.png', '1607755895t.png', NULL, 'sukkari', '2020-12-12 00:51:35', '2020-12-12 00:51:35'),
(71, 'MOSROOK', NULL, 'MOSROOK', '1607799809.png', '1607799809t.png', NULL, 'mosrook', '2020-12-12 13:03:29', '2020-12-12 13:03:29'),
(72, 'WITHOUT SEED', NULL, 'WITHOUT SEED', '1607801826.png', '1607801827t.png', NULL, 'without-seed', '2020-12-12 13:37:07', '2020-12-12 13:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 1, '2019-12-29 05:54:41', '2019-12-29 05:54:41'),
(2, 'Dhaka (outside)', 2, '2019-12-29 05:54:50', '2019-12-29 05:54:50'),
(3, 'Chittagong', 3, '2019-12-29 05:55:21', '2019-12-29 05:55:21'),
(4, 'Chittagong (outside)', 4, '2019-12-29 05:55:29', '2019-12-29 05:55:29'),
(5, 'Rajshahi', 5, '2019-12-29 05:55:41', '2019-12-29 05:55:41'),
(6, 'Rajshahi (outside)', 6, '2019-12-29 05:55:49', '2019-12-29 05:55:49'),
(7, 'Khulna', 7, '2019-12-29 05:58:11', '2019-12-29 05:58:11'),
(8, 'Khulna (outside)', 8, '2019-12-29 05:58:17', '2019-12-29 05:58:17');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exclusive_categories` int(11) NOT NULL,
  `products_accessories` int(11) NOT NULL,
  `happy_customer` int(11) NOT NULL,
  `automatic` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `exclusive_categories`, `products_accessories`, `happy_customer`, `automatic`, `created_at`, `updated_at`) VALUES
(1, 50, 4500, 800, 1, NULL, '2020-12-11 10:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `csses`
--

CREATE TABLE `csses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `csses`
--

INSERT INTO `csses` (`id`, `body`, `menu`, `heading`, `created_at`, `updated_at`) VALUES
(1, 'Roboto-Regular', 'Roboto-Regular', 'Roboto-Regular', NULL, '2020-01-27 03:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_bd` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `question_bd`, `answer`, `answer_bd`, `created_at`, `updated_at`) VALUES
(3, 'What is Condition Branch / Non Condition Branch?', 'প্রশ্ন : কন্ডিশন ব্রাঞ্চ /নন কন্ডিশন ব্রাঞ্চ কি ?', 'In the branches of courier companies, where you make financial transactions, you will be able to receive your parcel by paying the price. These are called condition branches. In the branches where there is no financial transaction, you will have to pay the whole money in advance and accept the parcel. This type of branch is non-conditional. Generally, upazila level brunches are non-conditional branches.', 'কুরিয়ার কোম্পানি গুলোর যেসব শাখায় আর্থিক লেনদেন হয়ে থাকে ,সেসব শাখায় আপনি মূল্য পরিশোধ করে আপনার পার্সেল গ্রহণ করতে পারবেন ।এগুলোকে কন্ডিশন ব্রাঞ্চ বলে ।   যেসব শাখায় আর্থিক লেনদেন হয় না,সেসব শাখায় আপনাকে পুরো টাকা অগ্রিম প্রদান করে পার্সেল গ্রহণ করতে হবে ।এই ধরণের ব্রাঞ্চ নন -কন্ডিশনাল ।   সাধারণত উপজেলা পর্যায়ের ব্রাঞ্চ গুলো নন -কন্ডিশনাল ব্রাঞ্চ হয়ে থাকে ।', '2020-01-05 04:07:02', '2020-01-12 06:42:17'),
(4, 'I have :)', 'প্রশ্ন :  আমি ১০০ টাকা বিকাশ করেছি, কিন্তু কন্ডিশন এ ১০০ টাকা যোগ করে পাঠানো হয়েছে, কেন?', 'We', 'আপনার অসুবিধার জন্য আমরা আন্তরিক ভাবে দুঃখিত ।এটি সাধারণত প্রোডাক্ট পাঠানোর সময় কন্ডিশন এমাউন্ট ভুল লেখার কারণে হয় ।আমরা সর্বোচ্চ চেষ্টা করি এ ধরণের ভুল এড়িয়ে চলার । তারপর ও যদি এ ধরণের কিছু ঘটে ,সাধারণত যে আমউন্টটি লেখা থাকে ,সেটি পরিশোধ করেই আপনাকে পণ্যটি সংগ্রহ করতে হবে ।', '2020-01-05 04:07:53', '2020-12-12 13:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `font_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `font_location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fonts`
--

INSERT INTO `fonts` (`id`, `font_name`, `font_location`, `status`, `created_at`, `updated_at`) VALUES
(13, 'deadpack', 'assets/fonts/deadpack.ttf', 0, '2020-01-26 04:04:56', '2020-01-28 22:22:20'),
(14, 'Roboto-Italic', 'assets/fonts/Roboto-Italic.ttf', 0, '2020-01-26 04:05:36', '2020-01-28 22:22:24'),
(16, 'deadpack2-demo', 'assets/fonts/deadpack2-demo.ttf', 0, '2020-01-26 04:15:21', '2020-01-28 22:22:28'),
(17, 'Roboto-Regular', 'assets/fonts/Roboto-Regular.ttf', 1, '2020-01-27 03:12:46', '2020-01-27 03:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_colors`
--

CREATE TABLE `frontend_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `primary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tertiary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quaternary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fifth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_colors`
--

INSERT INTO `frontend_colors` (`id`, `primary`, `secondary`, `tertiary`, `quaternary`, `fifth`, `body`, `created_at`, `updated_at`) VALUES
(1, '#ff1500', '#3d3c38', '#38a35f', '#202323', '#3d3c38', '#f8f9fc', NULL, '2020-12-12 13:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE `generals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number_bd` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thisisfunction` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `logo`, `about`, `about_bd`, `copyright`, `copyright_bd`, `phone_number`, `phone_number_bd`, `address`, `address_bd`, `email`, `website`, `meta_name`, `meta_description`, `facebook`, `twitter`, `linkedin`, `google`, `default_language`, `thisisfunction`, `created_at`, `updated_at`) VALUES
(1, '1611052122l.png', 'Ad ipsum molestiae', 'Qui neque sunt quis', 'Ut tempore repudian', 'Officiis temporibus', '+1 (301) 249-4071', '+1 (551) 604-5085', 'Doloremque obcaecati', 'Esse aut distinctio', 'dicocelafe@mailinator.com', 'Willow Ortiz', 'Carly Bradshaw', 'Judah Butler', 'Eos reiciendis dese', 'Vel est esse labor', 'Dolor nisi dicta mol', 'Enim quasi non inven', 'en', 1, '2019-11-15 12:10:23', '2021-01-19 04:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `name_bd`, `route`, `menu_location`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'হোম', '/', 'main_menu', '2019-11-14 08:26:24', '2020-01-13 03:34:48'),
(2, 'Shop', 'শপ', '/products', 'main_menu', '2019-11-14 08:31:59', '2020-01-13 03:35:23'),
(3, 'About Us', 'আমাদের সম্পর্কে', '/page/about-us', 'know_us', '2019-11-14 08:26:24', '2020-01-17 06:04:59'),
(4, 'Help Line', 'হেল্প লাইন', '/page/help-line', 'need_help', '2019-11-14 08:26:24', '2020-01-13 03:34:48'),
(6, 'Menu 1', 'Menu', '/menu11', 'know_us', '2020-01-17 03:45:17', '2020-01-17 03:45:40'),
(7, 'Help menu 13', 'Help menu Bangla', 'help-menu3', 'need_help', '2020-01-17 03:46:05', '2020-01-17 03:46:22');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_07_063533_create_categories_table', 1),
(5, '2019_11_07_063841_create_brands_table', 1),
(6, '2019_11_07_063949_create_products_table', 1),
(8, '2019_11_07_072341_create_product_images_table', 1),
(9, '2019_11_14_134918_create_menus_table', 2),
(11, '2019_11_15_112434_create_sliders_table', 3),
(12, '2019_11_15_133449_create_generals_table', 4),
(13, '2019_11_30_025022_create_attributes_table', 5),
(14, '2019_11_30_025606_create_attribute_sets_table', 5),
(15, '2019_12_22_102436_create_reviews_table', 6),
(17, '2014_10_12_000000_create_users_table', 7),
(25, '2019_12_28_081246_create_carts_table', 10),
(26, '2019_12_29_092920_create_shippings_table', 11),
(27, '2019_12_26_103758_create_cities_table', 12),
(28, '2019_12_28_081109_create_orders_table', 10),
(30, '2020_01_02_034802_create_wishlists_table', 13),
(33, '2020_01_03_110640_create_offers_table', 14),
(34, '2020_01_04_112015_create_ppage_banners_table', 15),
(35, '2020_01_05_042920_create_popular_product_sliders_table', 15),
(37, '2020_01_05_050407_create_popular_product_slider_images_table', 16),
(38, '2020_01_05_094234_create_faqs_table', 17),
(39, '2020_01_05_110956_create_testimonial_lefts_table', 18),
(40, '2020_01_05_112338_create_testimonials_table', 19),
(41, '2019_11_07_064038_create_admins_table', 20),
(43, '2020_01_06_081858_create_banners_table', 21),
(44, '2020_01_06_104932_create_mobile_payments_table', 22),
(45, '2020_01_16_061700_create_switches_table', 23),
(46, '2020_01_16_081856_create_section_switches_table', 24),
(48, '2020_01_16_095624_create_counters_table', 25),
(50, '2020_01_16_111412_create_pages_table', 26),
(51, '2017_08_11_073824_create_menus_wp_table', 27),
(52, '2017_08_11_074006_create_menu_items_wp_table', 27),
(53, '2020_01_25_065332_create_frontend_colors_table', 28),
(54, '2020_01_25_112422_create_fonts_table', 29),
(55, '2020_01_26_120804_create_csses_table', 30),
(57, '2020_03_20_060522_create_vendors_table', 31),
(58, '2020_03_21_094054_create_shops_table', 32),
(59, '2020_04_11_083018_create_transactions_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_payments`
--

CREATE TABLE `mobile_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trxid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_payments`
--

INSERT INTO `mobile_payments` (`id`, `order_id`, `phone_number`, `trxid`, `payment_method`, `created_at`, `updated_at`) VALUES
(4, 41, '01711008438', 'safdgsofhksjdf343', 'rocket', '2020-01-06 06:45:02', '2020-01-06 06:45:02'),
(5, 34, '01795365429', 'safdgsofhksjdf343', 'rocket', '2020-01-06 06:45:02', '2020-01-06 06:45:02'),
(6, 43, '01795365429', 'fsdfdsfsdgfg', 'bkash', '2020-01-11 03:15:19', '2020-01-11 03:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `continue` tinyint(4) DEFAULT '0',
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name`, `slug`, `product_id`, `start`, `end`, `continue`, `rate`, `created_at`, `updated_at`) VALUES
(7, 'Flash Deals', 'flash-deals-1', '85', '2020-12-28', '2020-12-31', NULL, '5%', '2020-01-04 00:53:18', '2020-12-30 02:57:42'),
(8, 'Women Day Special', 'women-day-special', 'Null', '2020-12-28', '2020-12-31', NULL, NULL, '2020-01-04 00:55:25', '2020-12-28 03:25:59'),
(9, 'Women Day Special Final', 'women-day-special-2', '', '2020-12-28', '2020-12-29', NULL, '3%', '2020-01-04 00:55:46', '2020-12-30 05:34:22'),
(10, 'NEW ARRIVALS', 'new-arrivals', '44,81,87,90,94,96,102,95,83', '2020-12-30', '2021-02-28', NULL, NULL, '2020-01-05 00:54:00', '2021-01-10 03:19:16'),
(12, 'new test', 'new-test', '', '2020-12-29', '2020-12-31', NULL, '10%', '2020-12-29 03:44:12', '2021-01-10 03:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id_buy` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_options` text COLLATE utf8mb4_unicode_ci,
  `product_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carts_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `message` text COLLATE utf8mb4_unicode_ci,
  `amount` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_info` text COLLATE utf8mb4_unicode_ci,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `vendor_id_buy`, `product_id`, `vendor_id`, `product_title`, `product_image`, `attribute_options`, `product_quantity`, `ip_address`, `carts_id`, `name`, `phone`, `email`, `city_name`, `shipping_address`, `message`, `amount`, `price`, `shipping_cost`, `status`, `currency`, `is_completed`, `payment_method`, `delivery_status`, `courier_info`, `tracking_id`, `transaction_id`, `created_at`, `updated_at`) VALUES
(19, NULL, NULL, NULL, NULL, 'Asian plus Fabric Trolley Bag', '15835981391.jpg', NULL, '2', '::1', NULL, 'MD. NAZMUL KHALID', '0759666044', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', NULL, '346', '100', '80', 'Processing', NULL, 0, 'Online Payment', NULL, NULL, '2349345306', '5e86dbfd5f918', '2020-04-03 00:47:25', '2020-04-03 00:47:25'),
(20, NULL, NULL, NULL, NULL, 'Cosmetics Packaging Travel Bottle Set - Pink', '15835981381.jpg', NULL, '2', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', NULL, '346', '86', '80', 'Processing', NULL, 0, 'Online Payment', NULL, NULL, '2349345306', '5e86dbfd5f918', '2020-04-03 00:47:25', '2020-04-03 00:47:25'),
(21, NULL, NULL, NULL, NULL, 'Asian plus Fabric Trolley Bag', '15835981391.jpg', '', '2', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'Message for order 1 product asian pus fabric', '660', '100', '80', 'Processing', NULL, 0, 'Online Payment', NULL, NULL, '2349345306', '5e880ef7ece84', '2020-04-03 22:37:12', '2020-04-03 22:37:12'),
(22, NULL, NULL, NULL, NULL, 'Product after attribute update', '15835963381.jpg', NULL, '2', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'message for order 2 prodcut product after attribute update', '660', '400', '80', 'Processing', NULL, 0, 'Online Payment', NULL, NULL, '2349345306', '5e880ef7ece84', '2020-04-03 22:37:12', '2020-04-03 22:37:12'),
(23, NULL, NULL, NULL, NULL, 'Cosmetics Packaging Travel Bottle Set - Pink', '15835981381.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'Give me white product', '123', '43', '80', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345306', '5e8810832143d', '2020-04-03 22:43:47', '2020-04-03 22:43:47'),
(24, NULL, NULL, NULL, NULL, 'Asian plus Fabric Trolley Bag', '15835981391.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', NULL, '130', '50', '80', 'Processing', NULL, 0, 'Online Payment', 'Out for Delivery', NULL, '2349345306', '5e8817fee221e', '2020-04-03 23:15:42', '2020-04-04 23:57:10'),
(25, NULL, NULL, NULL, NULL, 'Men Half Sleeve T-Shirt', '15835981271.jpg', 'a:2:{i:0;s:1:\"M\";i:1;s:5:\"Green\";}', '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'Send the green product', '733', '400', '80', 'Processing', NULL, 0, 'Online Payment', 'Out for Delivery', NULL, '2349345306', '5e882da901757', '2020-04-04 00:48:09', '2020-04-04 23:58:17'),
(26, NULL, NULL, NULL, NULL, 'Cosmetics Packaging Travel Bottle Set - Pink', '15835981381.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'Send original product', '733', '43', '80', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345306', '5e882da901757', '2020-04-04 00:48:09', '2020-04-04 00:48:09'),
(27, NULL, NULL, NULL, NULL, 'Asian plus Fabric Trolley Bag', '15835981391.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', 'send black bag', '733', '50', '80', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345306', '5e882da901757', '2020-04-04 00:48:09', '2020-04-04 00:48:09'),
(29, NULL, NULL, NULL, 5, 'Product vendor K23', '15848693331.png', NULL, '2', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka', 'Test Shipping Address', NULL, '3500', '300', '50', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345333', '5ea9298871d92', '2020-04-29 01:15:20', '2020-04-29 01:15:20'),
(30, NULL, NULL, NULL, NULL, 'Gents Casual Hoodie', '15835981391.jpg', NULL, '3', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka', 'Test Shipping Address', NULL, '3500', '3150', '50', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345334', '5ea9298871d92', '2020-04-29 01:15:20', '2020-04-29 01:15:20'),
(32, NULL, NULL, NULL, NULL, 'weekly deals product 2', '15922118131.jpg', NULL, '3', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka', 'Test Shipping Address', NULL, '2250', '1200', '50', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345336', '5ef093c22f0c1', '2020-06-22 05:19:30', '2020-06-22 05:19:30'),
(33, NULL, NULL, NULL, NULL, 'weekly deals product', '15921329091.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'technonazmul@gmail.com', 'Dhaka', 'Test Shipping Address', NULL, '2250', '1000', '50', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345337', '5ef093c22f0c1', '2020-06-22 05:19:30', '2020-06-22 05:19:30'),
(37, NULL, NULL, NULL, NULL, 'weekly deals product', '15921329091.jpg', NULL, '1', '::1', NULL, 'MD. NAZMUL KHALID', '01795365429', 'mdkhalidmtb@gmail.com', 'Dhaka (outside)', 'Test Shipping Address', NULL, '1080', '1000', '80', 'Processing', NULL, 0, 'Online Payment', 'Cancelled', 'sundorbon', '2349345341', '5ef827295f0ec', '2020-06-27 23:14:17', '2020-07-22 14:11:06'),
(38, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', '15925741431.jpg', NULL, '1', '202.181.4.6', NULL, 'rabbi', '01670038737', 'rabbi@rabbi.com', 'Dhaka', 'rabbi', NULL, '300', '250', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Delivered', 'rabbi courier', '2349345342', '5f17f27f5a1bd', '2020-07-22 13:02:07', '2020-07-22 13:09:06'),
(41, NULL, NULL, NULL, NULL, 'Bangladeshi Tank', '15947491931.jpg', NULL, '2', '103.126.112.163', NULL, 'Obayedul Islam Rabbi', '+8801670038737', 'obayedulislamrabbi@gmail.com', 'Dhaka', 'Alambug New Jurain', 'try', '4050', '4000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Delivered', NULL, '2349345345', '5f32e2332a490', '2020-08-11 23:23:47', '2020-08-12 20:47:02'),
(42, NULL, NULL, NULL, NULL, 'weekly deals product', '15921329091.jpg', NULL, '1', '88.198.58.29', NULL, 'Obayedul Islam Rabbi', '+8801670038737', 'obayedulislamrabbi@gmail.com', 'Dhaka', 'Alambug New Jurain', NULL, '1050', '1000', '50', 'Canceled', NULL, 0, 'Online Payment', NULL, NULL, '2349345346', '5f43918d8c843', '2020-08-24 04:08:13', '2020-08-24 04:08:13'),
(43, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', '15925741431.jpg', NULL, '2', '88.198.58.29', NULL, 'fdsfsa;jkl', 'sdlkfjskl', 'sklsdfj@gmail.com', 'Dhaka', '456 sdfkshdfkl', NULL, '550', '500', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345347', '5f5751c6acbbc', '2020-09-08 03:41:26', '2020-09-08 03:41:26'),
(44, NULL, NULL, NULL, NULL, 'Dan Cake Vanilla Muffin', '15925746131.jpg', NULL, '3', '88.198.58.29', NULL, 'Abul Kabul', '01711420420', 'abulkabul123@gmail.com', 'Dhaka', 'sumona palace', NULL, '5790', '540', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345348', '5f5a1af13b4d6', '2020-09-10 06:24:17', '2020-09-10 06:24:17'),
(45, NULL, NULL, NULL, NULL, 'weekly deals product', '15921329091.jpg', NULL, '2', '88.198.58.29', NULL, 'Abul Kabul', '01711420420', 'abulkabul123@gmail.com', 'Dhaka', 'sumona palace', NULL, '5790', '4200', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345349', '5f5a1af13b4d6', '2020-09-10 06:24:17', '2020-09-10 06:24:17'),
(46, NULL, NULL, NULL, NULL, 'Tiffany Crunch \'N\' Cream Hazelnut Wafers', '15925746971.jpg', NULL, '1', '88.198.58.29', NULL, 'Abul Kabul', '01711420420', 'abulkabul123@gmail.com', 'Dhaka', 'sumona palace', NULL, '5790', '0', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345350', '5f5a1af13b4d6', '2020-09-10 06:24:17', '2020-09-10 06:24:17'),
(47, NULL, NULL, NULL, NULL, 'weekly deals product', '15921329091.jpg', NULL, '1', '88.198.58.29', NULL, 'Abul Kabul', '01711420420', 'abulkabul123@gmail.com', 'Dhaka', 'sumona palace', NULL, '5790', '1000', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345351', '5f5a1af13b4d6', '2020-09-10 06:24:17', '2020-09-10 06:24:17'),
(48, 47, NULL, NULL, NULL, 'weekly deals product 2', NULL, NULL, '2', '193.176.84.247', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Nikunja-2', 'disr  disr', '850', '800', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345352', '5fcc7a6fdc2e0', '2020-12-06 00:30:07', '2020-12-06 00:30:07'),
(49, 47, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '2', '193.176.84.247', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur-10', 'this is my favourite products', '550', '500', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345353', '5fcc7bf5646c6', '2020-12-06 00:36:37', '2020-12-06 00:36:37'),
(50, 47, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '2', '193.176.84.200', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mipur', 'kldhfkjbg', '550', '500', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345354', '5fccaef443f07', '2020-12-06 04:14:12', '2020-12-06 04:14:12'),
(51, 47, NULL, NULL, NULL, 'Drinking water', NULL, NULL, '2', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur-10', 'this is water', '3150', '100', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345355', '5fcdbe776f685', '2020-12-06 23:32:39', '2020-12-06 23:32:39'),
(52, 47, NULL, NULL, NULL, 'Baby Products For Baby', NULL, NULL, '3', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur-10', 'this is dano', '3150', '3000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345356', '5fcdbe776f685', '2020-12-06 23:32:39', '2020-12-06 23:32:39'),
(53, 47, NULL, NULL, NULL, 'Regular White Bread', NULL, NULL, '2', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur-10', 'I need some bread', '500', '150', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345357', '5fcdbf0433385', '2020-12-06 23:35:00', '2020-12-06 23:35:00'),
(54, 47, NULL, NULL, NULL, 'Cocola Chocolate Wafer Roll Jar', NULL, NULL, '5', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur-10', 'I like cocola', '500', '300', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345358', '5fcdbf0433385', '2020-12-06 23:35:00', '2020-12-06 23:35:00'),
(55, 47, NULL, NULL, NULL, 'Kit Kat Chocolate', NULL, NULL, '2', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Nikunja-2', NULL, '2280', '400', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345359', '5fcdbf8619dfc', '2020-12-06 23:37:10', '2020-12-06 23:37:10'),
(56, 47, NULL, NULL, NULL, 'Fruits juice for your energy booster', NULL, NULL, '3', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Nikunja-2', NULL, '2280', '1500', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345360', '5fcdbf8619dfc', '2020-12-06 23:37:10', '2020-12-06 23:37:10'),
(57, 47, NULL, NULL, NULL, 'Tiffany Crunch \'n\' Cream Orange Wafers', NULL, NULL, '3', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Nikunja-2', NULL, '2280', '330', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345361', '5fcdbf8619dfc', '2020-12-06 23:37:10', '2020-12-06 23:37:10'),
(58, 47, NULL, NULL, NULL, 'Real energy boster for you', NULL, NULL, '42', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur -10', NULL, '33250', '31200', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345362', '5fcdc15a53cf8', '2020-12-06 23:44:58', '2020-12-06 23:44:58'),
(59, 47, NULL, NULL, NULL, 'Kit Kat Chocolate', NULL, NULL, '10', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur -10', NULL, '33250', '2000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345363', '5fcdc15a53cf8', '2020-12-06 23:44:58', '2020-12-06 23:44:58'),
(60, 47, NULL, NULL, NULL, 'weekly deals product', NULL, NULL, '4', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur 10', NULL, '4700', '4000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345364', '5fcde4e5b7b35', '2020-12-07 02:16:37', '2020-12-07 02:16:37'),
(61, 47, NULL, NULL, NULL, 'Drinking water', NULL, NULL, '1', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur 10', NULL, '4700', '50', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345365', '5fcde4e5b7b35', '2020-12-07 02:16:37', '2020-12-07 02:16:37'),
(62, 47, NULL, NULL, NULL, 'Kit Kat Chocolate', NULL, NULL, '3', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur 10', NULL, '4700', '600', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345366', '5fcde4e5b7b35', '2020-12-07 02:16:37', '2020-12-07 02:16:37'),
(63, 47, NULL, NULL, NULL, 'weekly deals product', NULL, NULL, '11', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur', NULL, '11250', '11000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345367', '5fcde8a737fca', '2020-12-07 02:32:39', '2020-12-07 02:32:39'),
(64, 47, NULL, NULL, NULL, 'Real energy boster for you', NULL, NULL, '1', '193.176.84.160', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'Mirpur', NULL, '11250', '200', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345368', '5fcde8a737fca', '2020-12-07 02:32:39', '2020-12-07 02:32:39'),
(65, 47, NULL, NULL, NULL, 'weekly deals product', NULL, NULL, '1', '103.112.53.22', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'tftvfv', NULL, '1050', '1000', '50', 'Processing', NULL, 0, 'Online Payment', 'Processing', NULL, '2349345369', '5fcefebbc1e17', '2020-12-07 22:19:07', '2020-12-07 22:19:07'),
(70, NULL, NULL, NULL, NULL, 'weekly deals product 2', NULL, NULL, '2', '193.176.84.150', NULL, 'Mohammad Farhad', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '950', '800', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345374', '5fcf4f09710af', '2020-12-08 04:01:45', '2020-12-08 04:01:45'),
(71, NULL, NULL, NULL, NULL, 'Drinking water', NULL, NULL, '2', '193.176.84.150', NULL, 'Mohammad Farhad', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '950', '100', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345375', '5fcf4f09710af', '2020-12-08 04:01:45', '2020-12-08 04:01:45'),
(75, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '1', '103.112.53.22', NULL, 'test test', '01991235471', 'test5@gmail.com', 'Dhaka', 'tezt', NULL, '300', '250', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345379', '5fcf6a7dbc742', '2020-12-08 05:58:53', '2020-12-08 05:58:53'),
(76, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '2', '103.112.53.22', NULL, 'test test', '01991235471', 'test5@gmail.com', 'Dhaka', 'tezt', NULL, '550', '500', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345380', '5fcf6aa5e57eb', '2020-12-08 05:59:33', '2020-12-08 05:59:33'),
(77, NULL, NULL, NULL, NULL, 'Tiffany Crunch \'n\' Cream Orange Wafers', NULL, NULL, '1', '103.112.53.22', NULL, 'test test', '01991235471', 'test5@gmail.com', 'Dhaka', 'tezt', NULL, '160', '110', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345381', '5fcf6b0290f13', '2020-12-08 06:01:06', '2020-12-08 06:01:06'),
(78, NULL, NULL, NULL, NULL, 'Kit Kat Chocolate', NULL, NULL, '1', '103.126.112.159', NULL, 'Obayedul Islam Rabbi', '+8801670038737', 'noorsoftsinfo@gmail.com', 'Dhaka', '56-57', NULL, '250', '200', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345382', '5fcfc51065af3', '2020-12-08 12:25:20', '2020-12-08 12:25:20'),
(79, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '1', '103.126.112.159', NULL, 'Obayedul Islam Rabbi', '+8801670038737', 'obayedulislamrabbi@gmail.com', 'Dhaka', 'Jurain', NULL, '300', '250', '50', 'Pending', NULL, 0, 'Online Payment', NULL, NULL, '2349345383', '5fcfc536d5c9f', '2020-12-08 12:25:58', '2020-12-08 12:25:58'),
(80, NULL, NULL, NULL, NULL, 'Bangladeshi Tank', NULL, NULL, '4', '193.176.84.135', NULL, 'Mohammad Farhad', '+8801839944681', 'farhadamcse12@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '8050', '8000', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345384', '5fd04bf9e1577', '2020-12-08 22:00:57', '2020-12-08 22:00:57'),
(83, 47, NULL, NULL, NULL, 'weekly deals product 2', NULL, NULL, '3', '103.112.53.22', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Chittagong', 'this', NULL, '5280', '1200', '80', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345387', '5fd0c2a2361d9', '2020-12-09 06:27:14', '2020-12-09 06:27:14'),
(84, 47, NULL, NULL, NULL, 'weekly deals product 2', NULL, NULL, '3', '193.176.84.148', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Chittagong', 'this', NULL, '1280', '1200', '80', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345388', '5fd0ea5f45f38', '2020-12-09 09:16:47', '2020-12-09 09:16:47'),
(85, NULL, NULL, NULL, NULL, 'Golden Harvest Frozen Paratha Family Pack', NULL, NULL, '3', '193.176.84.148', NULL, 'Reza Ahmed', '01839944681', 'mohammadfarhad681@gmail.com', 'Dhaka', 'Mirpur 10', NULL, '800', '750', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345389', '5fd0fd16c81b5', '2020-12-09 10:36:38', '2020-12-09 10:36:38'),
(86, NULL, NULL, NULL, NULL, 'Cocola Chocolate Wafer Roll Jar', NULL, NULL, '1', '193.176.84.148', NULL, 'test', '01839944682', 'test4@gmai.net', 'Dhaka', 'hlw', NULL, '6110', '60', '50', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345390', '5fd0fed5c18d1', '2020-12-09 10:44:05', '2020-12-09 10:44:05'),
(87, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '193.176.84.153', NULL, 'farhadamcse@gmail.com', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345391', '5fd3a5a9330cb', '2020-12-11 11:00:25', '2020-12-11 11:00:25'),
(88, NULL, NULL, NULL, NULL, 'AJWA - SUPER PREMIUM - EXTRA LARGE', NULL, NULL, '1', '193.176.84.133', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'hhhhh', NULL, '2.00', '1', '0', 'Successful', NULL, 0, 'online payment', 'Processing', NULL, '2349345392', 'DAI1607752269193132', '2020-12-11 23:54:30', '2020-12-11 23:54:30'),
(89, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '193.176.84.133', NULL, 'Mohammad Farhad', '01735693811', 'farhadamcse@gmail.com', 'Dhaka', 'hhhhh', NULL, '2.00', '1', '0', 'Successful', NULL, 0, 'online payment', 'Processing', NULL, '2349345393', 'DAI1607752269193132', '2020-12-11 23:54:30', '2020-12-11 23:54:30'),
(90, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '01839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345394', '5fe986c7c68cf', '2020-12-28 01:18:31', '2020-12-28 01:18:31'),
(91, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '01839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345395', '5fe986e2a34ac', '2020-12-28 01:18:58', '2020-12-28 01:18:58'),
(92, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '01835465465', 'test@gmail.com', 'Dhaka', 'hrtyrtyrtytr rytr rty rtyr rtyrty r', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345396', '5fe9871446b21', '2020-12-28 01:19:48', '2020-12-28 01:19:48'),
(93, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345397', '5fe989142fa3c', '2020-12-28 01:28:20', '2020-12-28 01:28:20'),
(94, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '450', '450', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345398', '5fe98a889981d', '2020-12-28 01:34:32', '2020-12-28 01:34:32'),
(95, NULL, NULL, NULL, NULL, 'WITHOUT SEED - PREMIUM - MEDIUM', NULL, NULL, '2', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '90', '90', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345399', '5fe98baad34bb', '2020-12-28 01:39:22', '2020-12-28 01:39:22'),
(96, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '655', '45', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345400', '5fe98cde443f4', '2020-12-28 01:44:30', '2020-12-28 01:44:30'),
(97, NULL, NULL, NULL, NULL, 'AJWA - SPECIAL - MEDIUM', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '655', '610', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345401', '5fe98cde443f4', '2020-12-28 01:44:30', '2020-12-28 01:44:30'),
(98, NULL, NULL, NULL, NULL, 'test', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '90', '45', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345402', '5fe98edba50a4', '2020-12-28 01:52:59', '2020-12-28 01:52:59'),
(99, NULL, NULL, NULL, NULL, 'AJWA - REGULAR - SMALL', NULL, NULL, '1', '88.198.58.29', NULL, 'test', '+8801839944681', 'farhadamcse@gmail.com', 'Dhaka', 'Bakolia, Chittagong', NULL, '90', '45', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345403', '5fe98edba50a4', '2020-12-28 01:52:59', '2020-12-28 01:52:59'),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '', NULL, '2021-01-09 23:21:37', '2021-01-09 23:21:37'),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '', NULL, '2021-01-09 23:23:30', '2021-01-09 23:23:30'),
(104, 83, NULL, NULL, NULL, NULL, NULL, 'attrubute', '2', NULL, NULL, 'tareq', '01647167559', 'fitareq@gmail.com', 'dhaka', 'dhaka', 'hello', '200', '100', '80', 'Processing', 'BDT', 0, 'Cash on delivery', 'Processing', 'courier', '2349345408', NULL, '2021-01-10 00:32:12', '2021-01-10 00:32:12'),
(105, 83, NULL, NULL, NULL, NULL, NULL, 'attrubute', '2', NULL, NULL, 'tareq', '01647167559', 'fitareq@gmail.com', 'dhaka', 'dhaka', 'hello', '200', '100', '80', 'Processing', 'BDT', 0, 'Cash on delivery', 'Processing', 'courier', '2349345409', NULL, '2021-01-10 00:33:52', '2021-01-10 00:33:52'),
(106, 83, NULL, NULL, NULL, NULL, NULL, 'attrubute', '2', NULL, NULL, 'tareq', '01647167559', 'fitareq@gmail.com', 'dhaka', 'dhaka', 'hello', '200', '100', '80', 'Processing', 'BDT', 0, 'Cash on delivery', 'Processing', 'courier', '2349345410', NULL, '2021-01-10 00:34:31', '2021-01-10 00:34:31'),
(107, NULL, NULL, NULL, NULL, 'MABROOM - SUPER PREMIUM - EXTRA LARGE', NULL, NULL, '2', '88.198.58.29', NULL, 'MD AB HANNAN NOYON', '01670038737', 'obayedulislamrabbi@gmail.com', 'Dhaka', 'HOUSE-259, NIMAIKASHARI', NULL, '1320', '1320', '0', 'Processing', NULL, 0, 'Cash On Deliver', 'Processing', NULL, '2349345411', '5ffacf2a0f29a', '2021-01-10 03:55:54', '2021-01-10 03:55:54'),
(108, 83, NULL, NULL, NULL, NULL, NULL, '500', '1', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'Dhaka', 'Dhaka', 'kkkk', '500', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345412', NULL, '2021-01-10 05:08:56', '2021-01-10 05:08:56'),
(110, 83, NULL, NULL, NULL, NULL, NULL, '500', '1', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'Dhaka', 'Dhaka', 'hhh', '500', NULL, '80', 'Processing', 'BDT', 0, 'Cash On Delivery', 'Processing', 'courier', '2349345413', NULL, '2021-01-10 05:16:43', '2021-01-10 05:16:43'),
(111, 83, NULL, NULL, NULL, NULL, NULL, '500', '2', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'fff', 'fff', 'cvv', '1000', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345415', NULL, '2021-01-10 05:43:06', '2021-01-10 05:43:06'),
(112, 83, NULL, NULL, NULL, NULL, NULL, '500', '2', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'cf', 'dd', 'cc', '1000', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345416', NULL, '2021-01-10 05:43:55', '2021-01-10 05:43:55'),
(113, 83, NULL, NULL, NULL, NULL, NULL, '500', '3', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'fff', 'dd', 'dd', '1500', NULL, '80', 'Processing', 'BDT', 0, 'Cash On Delivery', 'Processing', 'courier', '2349345417', NULL, '2021-01-10 05:45:02', '2021-01-10 05:45:02'),
(114, 83, NULL, NULL, NULL, NULL, NULL, '500', '3', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'ddx', 'fff', 'ff', '1500', NULL, '80', 'Processing', 'BDT', 0, 'Cash On Delivery', 'Processing', 'courier', '2349345418', NULL, '2021-01-10 05:46:22', '2021-01-10 05:46:22'),
(115, 81, NULL, NULL, NULL, NULL, NULL, '5 KG - 6050 ৳', '1', NULL, NULL, 'shumssunam', '01858085086', 'shumssunam15@gmail.com', 'dhaka', 'shsh', 'kk', '6050', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345419', NULL, '2021-01-10 06:33:12', '2021-01-10 06:33:12'),
(116, 83, NULL, NULL, NULL, NULL, NULL, '500 gm - 330 ৳', '1', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'Dhaka', 'Dhaka', 'givv', '330', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345420', NULL, '2021-01-10 07:20:12', '2021-01-10 07:20:12'),
(117, 81, NULL, NULL, NULL, NULL, NULL, '1 KG - 990 ৳', '1', NULL, NULL, 'shumssunam', '01858085086', 'shumssunam15@gmail.com', 'jdj', 'mh', NULL, '990', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345421', NULL, '2021-01-10 11:55:50', '2021-01-10 11:55:50'),
(118, 81, NULL, NULL, NULL, NULL, NULL, '500 gm - 880 ৳', '2', NULL, NULL, 'shumssunam', '01858085086', 'shumssunam15@gmail.com', 'gr', 'hh', NULL, '1760', NULL, '80', 'Processing', 'BDT', 0, 'Online Payment', 'Processing', 'courier', '2349345422', NULL, '2021-01-10 13:08:26', '2021-01-10 13:08:26'),
(119, 81, NULL, NULL, NULL, NULL, NULL, '1 KG - 1705 ৳', '1', NULL, NULL, 'shumssunam', '01858085086', 'shumssunam15@gmail.com', 'idgh', 'ufhh', 'gdgjj', '1705', NULL, '80', 'Processing', 'BDT', 0, 'Cash On Delivery', 'Processing', 'courier', '2349345423', NULL, '2021-01-11 21:22:59', '2021-01-11 21:22:59'),
(120, 83, NULL, NULL, NULL, NULL, NULL, '500 gm - 550 ৳', '1', NULL, NULL, 'Forhadul Islam', '01647161550', 'fitareq@gmail.com', 'Dhaka', 'Dhaka', NULL, '550', NULL, '80', 'Processing', 'BDT', 0, 'Cash On Delivery', 'Processing', 'courier', '2349345424', NULL, '2021-01-12 04:16:42', '2021-01-12 04:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_bd` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `title_bd`, `content`, `content_bd`, `created_at`, `updated_at`) VALUES
(2, 'About Us update', 'about-us', 'আমাদের সম্পর্কে', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><b><br></b> Vivamus at risus dui. Fusce hendrerit accumsan felis vel molestie. Fusce at erat sit amet risus vehicula efficitur vitae in metus. Praesent finibus in enim in auctor. Nam euismod eleifend sollicitudin. Etiam facilisis a elit eget lacinia. Quisque vulputate, elit maximus dignissim sodales, nibh nunc sollicitudin justo, eu vehicula enim erat et purus. Pellentesque vulputate, ligula ut commodo molestie, elit lectus scelerisque arcu, sit amet consectetur magna nibh at leo. Cras cursus massa ac rhoncus tempus.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean dictum erat ut felis venenatis feugiat. Mauris efficitur arcu quis nibh fringilla elementum. Proin consectetur risus quis elit condimentum laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vulputate laoreet suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat venenatis nulla, sit amet scelerisque elit auctor et. Sed et sapien tincidunt, cursus nunc vitae, elementum turpis.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nam ac condimentum nisi. Morbi non elit consequat, faucibus ex vitae, dignissim ex. Donec sed libero in dui interdum pretium sed eu velit. Sed feugiat magna ut odio cursus, et auctor ante fringilla. Vivamus orci risus, luctus pharetra facilisis et, varius faucibus urna. Suspendisse ut lacus nulla. Vivamus convallis nunc non odio mollis gravida. Mauris placerat mi et luctus volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>', '<p style=\"margin-bottom: 13px; color: rgb(85, 85, 85); font-family: &quot;Siyam Rupali&quot;; font-size: 16px; text-align: justify;\"><b>অর্থহীন লেখা যার মাঝে আছে অনেক কিছু</b>। হ্যাঁ, এই লেখার মাঝেই আছে অনেক কিছু। যদি তুমি মনে করো, এটা তোমার কাজে লাগবে, তাহলে তা লাগবে কাজে। নিজের ভাষায় লেখা দেখতে অভ্যস্ত হও। মনে রাখবে লেখা অর্থহীন হয়, যখন তুমি তাকে অর্থহীন মনে করো; আর লেখা অর্থবোধকতা তৈরি করে, যখন তুমি তাতে অর্থ ঢালো। যেকোনো লেখাই তোমার কাছে অর্থবোধকতা তৈরি করতে পারে, যদি তুমি সেখানে অর্থদ্যোতনা দেখতে পাও। …ছিদ্রান্বেষণ? না, তা হবে কেন?</p><p style=\"margin-bottom: 13px; color: rgb(85, 85, 85); font-family: &quot;Siyam Rupali&quot;; font-size: 16px; text-align: justify;\">যে কথাকে কাজে লাগাতে চাও, তাকে কাজে লাগানোর কথা চিন্তা করার আগে ভাবো, তুমি কি সেই কথার জাদুতে আচ্ছন্ন হয়ে গেছ কিনা। তুমি যদি নিশ্চিত হও যে, তুমি কোনো মোহাচ্ছাদিত আবহে আবিষ্ট হয়ে অন্যের শেখানো বুলি আত্মস্থ করছো না, তাহলে তুমি নির্ভয়ে, নিশ্চিন্তে অগ্রসর হও। তুমি সেই কথাকে জানো, বুঝো, আত্মস্থ করো; মনে রাখবে, যা অনুসরণ করতে চলেছো, তা আগে অনুধাবন করা জরুরি; এখানে কিংকর্তব্যবিমূঢ় হবার কোনো সুযোগ নেই।</p><p style=\"margin-bottom: 13px; color: rgb(85, 85, 85); font-family: &quot;Siyam Rupali&quot;; font-size: 16px; text-align: justify;\">কোনো কথা শোনামাত্রই কি তুমি তা বিশ্বাস করবে? হয়তো বলবে, করবে, হয়তো বলবে “আমি করবো না।” হ্যা, “আমি করবো না” বললেই সবকিছু অস্বীকার করা যায় না, হয়তো তুমি মনের গহীন গভীর থেকে ঠিকই বিশ্বাস করতে শুরু করেছো সেই কথাটি, কিন্তু মুখে অস্বীকার করছো। তাই সচেতন থাকো, তুমি কী ভাবছো— তার প্রতি; সচেতন থাকো, তুমি কি আসলেই বিশ্বাস করতে চলেছো ঐ কথাটি… শুধু এতটুকু বলি, যা-ই বিশ্বাস করো না কেন, আগে যাচাই করে নাও; আর এতে চাই তোমার প্রত্যুৎপন্নমতিত্ব।</p>', '2020-01-16 06:14:07', '2020-03-21 02:32:07'),
(3, 'Privacy Policy', 'privacy-policy', 'প্রাইভেসী পলিসি', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis, velit vel pulvinar dapibus, dolor sem cursus diam, at efficitur magna ex a neque. Fusce sed ex nunc. Phasellus enim velit, aliquam eget elit nec, rutrum euismod tortor. Aenean pellentesque leo mattis mauris tristique, in tempor quam fringilla. Suspendisse quis mi augue. Curabitur ac nunc ac arcu ornare ornare ac id nibh. Morbi ut ex quis sapien bibendum tempor nec a enim. Maecenas mollis leo urna, non gravida nunc placerat at. Quisque sem enim, sodales eget urna nec, ultrices lobortis mi.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nulla facilisi. Praesent feugiat tellus eget ultrices faucibus. Suspendisse vitae nibh a lacus interdum lacinia. Mauris congue dapibus lacus, a tincidunt turpis imperdiet vitae. Nulla pellentesque at quam rutrum mollis. Maecenas sapien libero, efficitur non dolor nec, elementum finibus augue. Vestibulum eget massa nisl. In hac habitasse platea dictumst. Cras diam enim, suscipit scelerisque interdum at, tristique eu eros. Fusce non purus id sapien finibus auctor. Suspendisse potenti. Curabitur eleifend nunc mi, vel molestie enim consectetur eu. Aenean id faucibus neque. Etiam vulputate, risus nec ultrices efficitur, tellus diam tincidunt sapien, eget feugiat erat libero sit amet lorem.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Duis egestas dolor eu lectus condimentum molestie. Nulla id dui massa. Cras eu nulla convallis, lacinia nisl et, fermentum odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras maximus eleifend nunc eget molestie. Sed eget vulputate lectus, at pulvinar arcu. Proin semper leo et risus posuere sagittis. Mauris suscipit ligula sit amet turpis fringilla, in aliquet erat lacinia. Vestibulum congue nec diam in rutrum.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Suspendisse eleifend, ipsum et egestas accumsan, magna urna tincidunt arcu, ut hendrerit nisi lacus id leo. Praesent lacinia libero vel odio pulvinar, sit amet suscipit ex feugiat. In in accumsan nisl. Praesent eget felis ligula. Nullam condimentum sapien sit amet ultrices tempor. Integer dolor tellus, dignissim a magna mattis, cursus ultrices purus. Pellentesque consectetur massa vestibulum, vestibulum mi in, rutrum odio. Nullam viverra nec quam quis viverra. Proin et venenatis sem. Vestibulum non ex nunc. Fusce pretium vitae mi sodales hendrerit. Praesent ut aliquet dolor, et aliquam orci.</p>', '<ol style=\"max-width: 600px; font-family: sans-serif; font-size: 16.0016px;\"><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">প্লাবনের পরে সমস্ত পৃথিবী এক ভাষাতে কথা বলত| সমস্ত মানুষ একই শব্দগুলি ব্যবহার করত|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">সেই লোকেরা পূর্ব দিক থেকে ঘুরতে ঘুরতে শিনিয়র দেশে এসে সমতল ভূমি পেল| তারা সেখানে বসবাস শুরু করল|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">তারা বলল, “আমরা মাটি দিয়ে ইঁট তৈরী করব, তারপর আরও শক্ত করার জন্যে ইঁটগুলো পোড়াব|” তখন মানুষ পাথরের বদলে ইঁট দিয়ে বাড়ী তৈরী করল| আর গাঁথনি শক্ত করার জন্যে সিমেন্টের বদলে আলকাতরা ব্যবহার করল|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">তারা বলল, “এস আমরা আমাদের জন্যে এক বড় শহর বানাই| আর এমন একটি উঁচু স্তম্ভ বানাই যা আকাশ স্পর্শ করবে| তাহলে আমরা বিখ্যাত হব এবং এটা আমাদের এক সঙ্গে ধরে রাখবে| সারা পৃথিবীতে আমরা ছড়িয়ে থাকব না|”</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">সেই শহর আর সেই আকাশস্পর্শী স্তম্ভ দেখতে প্রভু পৃথিবীতে নেমে এলেন| মানুষ কি কি তৈরী করেছে সেসব প্রভু দেখলেন|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">প্রভু বললেন, “সব মানুষ একই ভাষাতে কথা বলছে| আর দেখতে পাচ্ছি য়ে এসব কাজ করার জন্যে তারা ঐক্যবদ্ধ| তারা কি করতে পারে এ তো সবে তার শুরু| শীঘ্রই তারা যা চায় তাই করতে পারবে|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">তাহলে এস আমরা নীচে গিয়ে ওদের এক ভাষাকে নানারকম ভাষা করে দিই| তাহলে তারা পরস্পরকে বুঝতে পারবে না|”</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">সুতরাং প্রভু সমস্ত লোকেদের সারা পৃথিবীতে ছড়িয়ে দিলেন| ফলে মানুষ আর সেই শহর তৈরির কাজ শেষ করতে পারল না|</li><li style=\"margin: 0px 0px 8px; padding: 0px; border: 0px; line-height: 1.34em; max-width: 600px;\">এই সেই স্থান যেখানে প্রভু সমস্ত পৃথিবীর এক ভাষাকে অনেক ভাষাতে বিভ্রান্ত করলেন| তাই এই স্থানটির নাম হলো বাবিল| এইভাবে প্রভু তাঁদের সেই স্থান থেকে পৃথিবীর বিভিন্ন স্থানে ছড়িয়ে দিলেন|</li></ol>', '2020-01-16 23:14:44', '2020-01-16 23:14:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('technonazmul@gmail.com', '$2y$10$j7aSHrmdrqYFnYmsq7gOaOzxfghgJ/dE3TqaI0BlqNPjHtrmzNz1C', '2020-01-31 09:21:59'),
('zamzamtravelsbd@hotmail.com', '$2y$10$SAlF4oxB/IAKv2Q3Twj4MOeAJQeXH3HUAXa9CS7e9Y3xWP8K2Qane', '2021-01-05 23:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `popular_product_sliders`
--

CREATE TABLE `popular_product_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_product_sliders`
--

INSERT INTO `popular_product_sliders` (`id`, `title`, `title_bd`, `url`, `serial`, `created_at`, `updated_at`) VALUES
(19, 'Arabian Date', NULL, 'http://dailydeal.com.bd/', 1, '2020-04-19 06:03:04', '2020-12-12 13:30:35'),
(20, 'Arabic Tasbih', NULL, 'http://dailydeal.com.bd/', 2, '2020-04-19 06:05:14', '2020-12-12 13:31:06'),
(21, 'Fresh Food', NULL, 'http://dailydeal.com.bd/', 3, '2020-04-19 06:10:12', '2020-12-12 13:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `popular_product_slider_images`
--

CREATE TABLE `popular_product_slider_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `popular_product_slider_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_product_slider_images`
--

INSERT INTO `popular_product_slider_images` (`id`, `popular_product_slider_id`, `image`, `created_at`, `updated_at`) VALUES
(62, 19, '1594486713home_banner.png', '2020-07-11 21:58:33', '2020-07-11 21:58:33'),
(69, 21, '1607801565home_banner.png', '2020-12-12 13:32:45', '2020-12-12 13:32:45'),
(70, 20, '1608018091home_banner.png', '2020-12-15 01:41:31', '2020-12-15 01:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `ppage_banners`
--

CREATE TABLE `ppage_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ppage_banners`
--

INSERT INTO `ppage_banners` (`id`, `title`, `url`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Umrah Packages', 'https://zamzamtravelsbd.com/', '1607704181.png', '2020-01-05 03:10:35', '2020-12-12 13:37:54'),
(3, 'Hajj Packages', 'https://zamzamtravelsbd.com/', '1607704198.png', '2020-01-05 03:18:45', '2020-12-12 13:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_bd` text COLLATE utf8mb4_unicode_ci,
  `specifications` text COLLATE utf8mb4_unicode_ci,
  `specifications_bd` text COLLATE utf8mb4_unicode_ci,
  `quantity` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `offer_price` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `featured` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `week_deals` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `onsale` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_add_to_offer` tinyint(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) DEFAULT NULL,
  `toprated` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_set_id` int(10) DEFAULT NULL,
  `attributes_id` text COLLATE utf8mb4_unicode_ci,
  `attribute_options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `admin_id`, `vendor_id`, `title`, `title_bd`, `description`, `description_bd`, `specifications`, `specifications_bd`, `quantity`, `price`, `offer_price`, `status`, `featured`, `week_deals`, `onsale`, `is_add_to_offer`, `offer_id`, `toprated`, `slug`, `sku`, `attribute_set_id`, `attributes_id`, `attribute_options`, `created_at`, `updated_at`) VALUES
(103, 69, NULL, 1, NULL, 'Coby Willis', NULL, 'Mollitia nostrud omn Mollitia nostrud omn Mollitia nostrud omn Mollitia nostrud omn Mollitia nostrud omn', NULL, NULL, NULL, 14, 674, NULL, 1, 1, 0, 0, 0, NULL, 0, 'coby-willis', 'Voluptas in quisquam', NULL, NULL, NULL, '2021-01-19 02:07:48', '2021-01-19 02:18:41'),
(104, 68, NULL, 1, NULL, 'Samantha Green', NULL, '&nbsp;Voluptatem. Omnis no Voluptatem. Omnis no Voluptatem. Omnis no Voluptatem. Omnis no Voluptatem. Omnis no Voluptatem. Omnis no', NULL, NULL, NULL, 622, 96, NULL, 1, 1, 0, 0, 0, NULL, 0, 'samantha-green', 'Ut amet quos assume', NULL, NULL, NULL, '2021-01-19 02:11:32', '2021-01-19 02:18:37'),
(105, 66, NULL, 1, NULL, 'Tasha Mcleod', NULL, 'Ut accusantium lorem Ut accusantium lorem Ut accusantium lorem', NULL, NULL, NULL, 51, 210, NULL, 1, 1, 0, 0, 0, NULL, 0, 'tasha-mcleod', 'Pariatur Quis archi', NULL, NULL, NULL, '2021-01-19 02:12:14', '2021-01-19 02:18:34'),
(106, 66, NULL, 1, NULL, 'Marcia Hardin', NULL, 'Architecto facilis m Architecto facilis m Architecto facilis m <b style=\"background-color: rgb(255, 0, 0);\">Architecto facilis m Architecto facilis m Architecto facilis m</b>', NULL, NULL, NULL, 245, 870, NULL, 1, 1, 0, 0, 0, NULL, 0, 'marcia-hardin', 'Id tenetur quasi rat', NULL, NULL, NULL, '2021-01-19 03:22:50', '2021-01-19 03:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(148, 103, '16110436681.png', '2021-01-19 02:07:48', '2021-01-19 02:07:48'),
(149, 104, '16110438921.png', '2021-01-19 02:11:32', '2021-01-19 02:11:32'),
(150, 105, '16110439341.png', '2021-01-19 02:12:14', '2021-01-19 02:12:14'),
(151, 106, '16110481701.png', '2021-01-19 03:22:50', '2021-01-19 03:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `vendor_id`, `user_name`, `user_email`, `user_message`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 32, NULL, 'user3', 'user1@gmail.com', 'user1 message', 4, 1, '2019-12-22 05:53:01', '2020-03-22 04:40:08'),
(6, 32, NULL, 'Test Review 2', 'testreview1@gmail.com', 'orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 5, 0, '2019-12-22 05:53:01', '2020-03-22 04:39:20'),
(7, 50, 5, 'Review 1', 'reviewforvendor@gmail.com', 'Cool product', 5, 1, '2020-03-23 04:34:05', '2020-03-23 04:34:05'),
(8, 50, 5, 'Nazmul', 'technonazmul@gmail.com', 'This is a test review.', 4, 1, '2020-04-29 04:53:34', '2020-04-29 04:53:34'),
(9, 52, NULL, 'Nazmul', 'technonazmul@gmail.com', 'This is awesome product.', 4, 1, '2020-06-21 17:54:49', '2020-06-21 17:54:49'),
(10, 52, NULL, 'Test', 'test@email.com', 'Test review.', 5, 1, '2020-06-21 19:25:00', '2020-06-21 19:25:00'),
(11, 12, NULL, 'ff', 'ff@gmail.com', 'jjj', 0, 1, '2020-11-02 23:12:50', '2020-11-02 23:12:50'),
(12, 81, NULL, 'Rashed', 'Jabedrashed3@gmail.com', 'Best quality dates and best thing I ever ate', 5, 1, '2020-12-22 05:34:14', '2020-12-22 05:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `section_switches`
--

CREATE TABLE `section_switches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_switches`
--

INSERT INTO `section_switches` (`id`, `name`, `action`, `created_at`, `updated_at`) VALUES
(1, 'home_featured', 1, NULL, '2020-07-11 21:56:22'),
(4, 'shop_save', 1, NULL, '2020-01-16 02:55:14'),
(5, 'home_category', 1, NULL, '2020-01-16 03:01:46'),
(6, 'home_popular_product', 1, NULL, '2020-01-16 03:09:09'),
(7, 'home_slider', 1, NULL, '2020-01-16 03:14:49'),
(8, 'home_testimonial', 0, NULL, '2020-12-11 10:18:22'),
(9, 'home_paymentbanner', 1, NULL, '2020-01-16 03:26:54'),
(10, 'home_counter', 1, NULL, '2020-12-15 05:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inside_dhaka` int(11) NOT NULL,
  `outside_dhaka` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `inside_dhaka`, `outside_dhaka`, `created_at`, `updated_at`) VALUES
(1, 0, 80, NULL, '2019-12-29 03:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `shop_id`, `vendor_id`, `name`, `thumbnail`, `logo`, `phone`, `email`, `location`, `created_at`, `updated_at`) VALUES
(2, '15434647', 4, 'ACI', '1584787436t.jpg', '1584789552l.png', '01795365429', 'myshop1@gmail.com', 'Nobabganj, Dhaka', '2020-03-21 04:43:56', '2020-03-21 05:19:12'),
(3, '15434649', 5, 'Square', '1585470677t.jpg', '1585470677l.png', '01734356453', 'myshop@gmail.com', 'Centre 48 Mohakhali C/A, Dhaka 1212', '2020-03-29 02:31:18', '2020-03-29 03:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `description_bd` text COLLATE utf8mb4_unicode_ci,
  `button_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_reverse` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `title_bd`, `description`, `description_bd`, `button_text`, `button_text_bd`, `button_link`, `background_image`, `slider_image`, `title_color`, `description_color`, `button_color`, `image_reverse`, `created_at`, `updated_at`) VALUES
(16, 'Arabic Tasbih', NULL, 'We provide real Akik Tasbih for our customers. We are committed to quality products.', NULL, 'View Product', NULL, 'http://dailydeal.com.bd/', NULL, '1608018040s.png', NULL, NULL, NULL, 0, '2020-07-13 21:23:19', '2020-12-15 01:40:40'),
(17, '100% Pure Date Arabian.', NULL, 'Get pure date from your store. We provide always quality date to your customers.', NULL, 'View Product', NULL, 'http://dailydeal.com.bd/', NULL, '1594657572s.png', NULL, NULL, NULL, 0, '2020-07-13 21:26:12', '2020-12-12 13:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_bd` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `name_bd`, `comment`, `comment_bd`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Rokanuzzaman', 'রোকনোজ্জামান', 'চমৎকার সব পণ্য - আল্লাহ্‌ বারাকাহ দান করুক', 'চমৎকার সব পণ্য - আল্লাহ্‌ বারাকাহ দান করুক', '1607703462.png', '2020-01-05 05:59:33', '2020-12-11 10:17:42'),
(2, 'Obayedul Islam Rabbi', 'মোঃ ওবায়েদুল ইসলাম রাব্বি', 'দেশে বসেই শত ভাগ ভেজাল মুক্ত সৌদি আরব এর নানা রকম খেজুর পাচ্ছি আলহামদুলিল্লাহ্‌', 'দেশে বসেই শত ভাগ ভেজাল মুক্ত সৌদি আরব এর নানা রকম খেজুর পাচ্ছি আলহামদুলিল্লাহ্‌', '1607703445.png', '2020-01-05 06:05:30', '2020-12-11 10:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_lefts`
--

CREATE TABLE `testimonial_lefts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_bd` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_lefts`
--

INSERT INTO `testimonial_lefts` (`id`, `title`, `title_bd`, `description`, `description_bd`, `created_at`, `updated_at`) VALUES
(1, 'What People Says About Us', 'লোকেরা আমাদের সম্পর্কে কী বলে', 'We believe in product quality and customer services. You can read our customer reviews and what they are thinkging about us.', 'আমরা পণ্যের গুণমান এবং গ্রাহক পরিষেবাগুলিতে বিশ্বাসী। আপনি আমাদের গ্রাহক পর্যালোচনা এবং তারা আমাদের সম্পর্কে কী ভাবছেন তা পড়তে পারেন।', NULL, '2020-01-14 23:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_orders`
--

CREATE TABLE `tmp_orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `product_price` varchar(255) DEFAULT NULL,
  `tmp_uniq_id` varchar(255) DEFAULT NULL,
  `shipping_cost` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_orders`
--

INSERT INTO `tmp_orders` (`id`, `product_id`, `product_quantity`, `product_title`, `product_price`, `tmp_uniq_id`, `shipping_cost`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd45a31482c0', '0', 'Dhaka', '2020-12-11 23:50:41', '2020-12-11 23:50:41'),
(2, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd45a31482c0', '0', 'Dhaka', '2020-12-11 23:50:41', '2020-12-11 23:50:41'),
(3, 84, 1, 'AJWA - SPECIAL - MEDIUM', '610', '5fd45c80dcfcf', '0', 'Dhaka', '2020-12-12 00:00:32', '2020-12-12 00:00:32'),
(4, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd461ef13c6f', '0', 'Dhaka', '2020-12-12 00:23:43', '2020-12-12 00:23:43'),
(5, 85, 5, 'AJWA - REGULAR - SMALL', '5', '5fd4622b75096', NULL, NULL, '2020-12-12 00:24:43', '2020-12-12 00:24:43'),
(6, 84, 1, 'AJWA - SPECIAL - MEDIUM', '610', '5fd4622b75096', NULL, NULL, '2020-12-12 00:24:43', '2020-12-12 00:24:43'),
(7, 85, 5, 'AJWA - REGULAR - SMALL', '5', '5fd462326ce06', NULL, NULL, '2020-12-12 00:24:50', '2020-12-12 00:24:50'),
(8, 84, 1, 'AJWA - SPECIAL - MEDIUM', '610', '5fd462326ce06', NULL, NULL, '2020-12-12 00:24:50', '2020-12-12 00:24:50'),
(9, 85, 5, 'AJWA - REGULAR - SMALL', '5', '5fd4623324726', NULL, NULL, '2020-12-12 00:24:51', '2020-12-12 00:24:51'),
(10, 84, 1, 'AJWA - SPECIAL - MEDIUM', '610', '5fd4623324726', NULL, NULL, '2020-12-12 00:24:51', '2020-12-12 00:24:51'),
(11, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d46c2a6d', NULL, NULL, '2020-12-12 04:36:54', '2020-12-12 04:36:54'),
(12, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d46c2a6d', NULL, NULL, '2020-12-12 04:36:54', '2020-12-12 04:36:54'),
(13, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d49ecd8f', NULL, NULL, '2020-12-12 04:36:57', '2020-12-12 04:36:57'),
(14, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d49ecd8f', NULL, NULL, '2020-12-12 04:36:57', '2020-12-12 04:36:57'),
(15, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d50e7ab1', NULL, NULL, '2020-12-12 04:37:04', '2020-12-12 04:37:04'),
(16, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d50e7ab1', NULL, NULL, '2020-12-12 04:37:04', '2020-12-12 04:37:04'),
(17, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d5203ce2', NULL, NULL, '2020-12-12 04:37:06', '2020-12-12 04:37:06'),
(18, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d5203ce2', NULL, NULL, '2020-12-12 04:37:06', '2020-12-12 04:37:06'),
(19, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d5349e09', NULL, NULL, '2020-12-12 04:37:07', '2020-12-12 04:37:07'),
(20, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d5349e09', NULL, NULL, '2020-12-12 04:37:07', '2020-12-12 04:37:07'),
(21, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d53c6fbc', NULL, NULL, '2020-12-12 04:37:07', '2020-12-12 04:37:07'),
(22, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d53c6fbc', NULL, NULL, '2020-12-12 04:37:07', '2020-12-12 04:37:07'),
(23, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d544b741', NULL, NULL, '2020-12-12 04:37:08', '2020-12-12 04:37:08'),
(24, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d544b741', NULL, NULL, '2020-12-12 04:37:08', '2020-12-12 04:37:08'),
(25, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d54ce219', NULL, NULL, '2020-12-12 04:37:08', '2020-12-12 04:37:08'),
(26, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d54ce219', NULL, NULL, '2020-12-12 04:37:08', '2020-12-12 04:37:08'),
(27, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d55493ae', NULL, NULL, '2020-12-12 04:37:09', '2020-12-12 04:37:09'),
(28, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d55493ae', NULL, NULL, '2020-12-12 04:37:09', '2020-12-12 04:37:09'),
(29, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d571872f', NULL, NULL, '2020-12-12 04:37:11', '2020-12-12 04:37:11'),
(30, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d571872f', NULL, NULL, '2020-12-12 04:37:11', '2020-12-12 04:37:11'),
(31, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d5791341', NULL, NULL, '2020-12-12 04:37:11', '2020-12-12 04:37:11'),
(32, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d5791341', NULL, NULL, '2020-12-12 04:37:11', '2020-12-12 04:37:11'),
(33, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '1', '5fd49d60ecf3e', NULL, NULL, '2020-12-12 04:37:20', '2020-12-12 04:37:20'),
(34, 85, 1, 'AJWA - REGULAR - SMALL', '1', '5fd49d60ecf3e', NULL, NULL, '2020-12-12 04:37:20', '2020-12-12 04:37:20'),
(35, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5fd5884dbba51', '0', 'Dhaka', '2020-12-12 21:19:41', '2020-12-12 21:19:41'),
(36, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd5884dbba51', '0', 'Dhaka', '2020-12-12 21:19:41', '2020-12-12 21:19:41'),
(37, 89, 2, 'MABROOM-SPECIAL-MEDIUM', '1000', '5fd5884dbba51', '0', 'Dhaka', '2020-12-12 21:19:41', '2020-12-12 21:19:41'),
(38, 81, 2, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '2', '5fd58fc7ee0d9', NULL, NULL, '2020-12-12 21:51:35', '2020-12-12 21:51:35'),
(39, 87, 1, 'MABROOM - SUPER PREMIUM - EXTRA LARGE', '660', '5fd58fc7ee0d9', NULL, NULL, '2020-12-12 21:51:35', '2020-12-12 21:51:35'),
(40, 81, 2, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '2', '5fd590572a550', NULL, NULL, '2020-12-12 21:53:59', '2020-12-12 21:53:59'),
(41, 87, 1, 'MABROOM - SUPER PREMIUM - EXTRA LARGE', '660', '5fd590572a550', NULL, NULL, '2020-12-12 21:53:59', '2020-12-12 21:53:59'),
(42, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd598f91a32d', NULL, NULL, '2020-12-12 22:30:49', '2020-12-12 22:30:49'),
(43, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd5993da9bfa', NULL, NULL, '2020-12-12 22:31:57', '2020-12-12 22:31:57'),
(44, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59980208d3', NULL, NULL, '2020-12-12 22:33:04', '2020-12-12 22:33:04'),
(45, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd5999a81de6', NULL, NULL, '2020-12-12 22:33:30', '2020-12-12 22:33:30'),
(46, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59a7a7c46a', NULL, NULL, '2020-12-12 22:37:14', '2020-12-12 22:37:14'),
(47, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59a7debb44', NULL, NULL, '2020-12-12 22:37:17', '2020-12-12 22:37:17'),
(48, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59a90d99a9', NULL, NULL, '2020-12-12 22:37:36', '2020-12-12 22:37:36'),
(49, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59dc8621ef', NULL, NULL, '2020-12-12 22:51:20', '2020-12-12 22:51:20'),
(50, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd59dcd41a0d', NULL, NULL, '2020-12-12 22:51:25', '2020-12-12 22:51:25'),
(51, 87, 1, 'MABROOM - SUPER PREMIUM - EXTRA LARGE', '660', '5fd5e50887ea2', NULL, NULL, '2020-12-13 03:55:20', '2020-12-13 03:55:20'),
(52, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd7617403029', NULL, NULL, '2020-12-14 06:58:28', '2020-12-14 06:58:28'),
(53, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd7617403029', NULL, NULL, '2020-12-14 06:58:28', '2020-12-14 06:58:28'),
(54, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '1320', '5fd7617403029', NULL, NULL, '2020-12-14 06:58:28', '2020-12-14 06:58:28'),
(55, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd762415f62d', '0', 'Dhaka', '2020-12-14 07:01:53', '2020-12-14 07:01:53'),
(56, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd762415f62d', '0', 'Dhaka', '2020-12-14 07:01:53', '2020-12-14 07:01:53'),
(57, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '1320', '5fd762415f62d', '0', 'Dhaka', '2020-12-14 07:01:53', '2020-12-14 07:01:53'),
(58, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd767757e415', '0', 'Dhaka', '2020-12-14 07:24:05', '2020-12-14 07:24:05'),
(59, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd767757e415', '0', 'Dhaka', '2020-12-14 07:24:05', '2020-12-14 07:24:05'),
(60, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '1320', '5fd767757e415', '0', 'Dhaka', '2020-12-14 07:24:05', '2020-12-14 07:24:05'),
(61, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd767db95080', '80', 'Khulna', '2020-12-14 07:25:47', '2020-12-14 07:25:47'),
(62, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd767db95080', '80', 'Khulna', '2020-12-14 07:25:47', '2020-12-14 07:25:47'),
(63, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '1320', '5fd767db95080', '80', 'Khulna', '2020-12-14 07:25:47', '2020-12-14 07:25:47'),
(64, 102, 1, 'WITHOUT SEED - PREMIUM - MEDIUM', '450', '5fd768202aa41', NULL, NULL, '2020-12-14 07:26:56', '2020-12-14 07:26:56'),
(65, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd768202aa41', NULL, NULL, '2020-12-14 07:26:56', '2020-12-14 07:26:56'),
(66, 100, 1, 'AJWA - SPECAL - MEDIUM', '880', '5fd768202aa41', NULL, NULL, '2020-12-14 07:26:56', '2020-12-14 07:26:56'),
(67, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5fd7a252e3eb7', '0', 'Dhaka', '2020-12-14 11:35:14', '2020-12-14 11:35:14'),
(68, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd8819ed5f15', '80', 'Chittagong', '2020-12-15 03:27:58', '2020-12-15 03:27:58'),
(69, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fd8819ed5f15', '80', 'Chittagong', '2020-12-15 03:27:58', '2020-12-15 03:27:58'),
(70, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fd882abec5ba', '80', 'Chittagong', '2020-12-15 03:32:27', '2020-12-15 03:32:27'),
(71, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '1320', '5fd882abec5ba', '80', 'Chittagong', '2020-12-15 03:32:27', '2020-12-15 03:32:27'),
(72, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fddfc8a3c9d6', '80', 'Dhaka (outside)', '2020-12-19 07:13:46', '2020-12-19 07:13:46'),
(73, 101, 1, 'AJWA - REGULAR - SMALL', '660', '5fddfe181f06a', '80', 'Dhaka (outside)', '2020-12-19 07:20:24', '2020-12-19 07:20:24'),
(74, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5fdf31ab1b2c1', NULL, NULL, '2020-12-20 05:12:43', '2020-12-20 05:12:43'),
(75, 94, 1, 'SAFAWI - SUPER PREMIUM - EXTRA LARGE', '440', '5fe07a9317a49', '80', 'Dhaka (outside)', '2020-12-21 04:36:03', '2020-12-21 04:36:03'),
(76, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '2530', '5fe07a9317a49', '80', 'Dhaka (outside)', '2020-12-21 04:36:03', '2020-12-21 04:36:03'),
(77, 85, 1, 'AJWA - REGULAR - SMALL', '450', '5fe07a9317a49', '80', 'Dhaka (outside)', '2020-12-21 04:36:03', '2020-12-21 04:36:03'),
(78, 90, 1, 'AMBAR-SUPER PREMIUM-LARGE', '1870', '5fe07a9317a49', '80', 'Dhaka (outside)', '2020-12-21 04:36:03', '2020-12-21 04:36:03'),
(79, 94, 1, 'SAFAWI - SUPER PREMIUM - EXTRA LARGE', '440', '5fe07ae746821', '80', 'Dhaka (outside)', '2020-12-21 04:37:27', '2020-12-21 04:37:27'),
(80, 99, 1, 'AJWA - SUPER PREMIUM - LARGE', '2530', '5fe07ae746821', '80', 'Dhaka (outside)', '2020-12-21 04:37:27', '2020-12-21 04:37:27'),
(81, 85, 1, 'AJWA - REGULAR - SMALL', '450', '5fe07ae746821', '80', 'Dhaka (outside)', '2020-12-21 04:37:27', '2020-12-21 04:37:27'),
(82, 90, 1, 'AMBAR-SUPER PREMIUM-LARGE', '1870', '5fe07ae746821', '80', 'Dhaka (outside)', '2020-12-21 04:37:27', '2020-12-21 04:37:27'),
(83, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe6178ac11e9', '80', 'Dhaka (outside)', '2020-12-25 10:47:06', '2020-12-25 10:47:06'),
(84, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe61799598e7', '80', 'Dhaka (outside)', '2020-12-25 10:47:21', '2020-12-25 10:47:21'),
(85, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe6179e50aa6', '80', 'Dhaka (outside)', '2020-12-25 10:47:26', '2020-12-25 10:47:26'),
(86, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe617a175df4', '80', 'Dhaka (outside)', '2020-12-25 10:47:29', '2020-12-25 10:47:29'),
(87, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe617a2c8ffa', '80', 'Dhaka (outside)', '2020-12-25 10:47:30', '2020-12-25 10:47:30'),
(88, 91, 1, 'AMBAR- PREMIUM - LARGE/MEDIUM', '720', '5fe6dbd841a3d', '0', 'Dhaka', '2020-12-26 00:44:40', '2020-12-26 00:44:40'),
(89, 83, 1, 'AJWA - PREMIUM - LARGE', '770', '5fe7570715318', '0', 'Dhaka', '2020-12-26 09:30:15', '2020-12-26 09:30:15'),
(90, 88, 1, 'MABROOM-PREMIUM-LARGE/MEDIUM', '610', '5fe9eca0761be', '80', 'Chittagong', '2020-12-28 08:33:04', '2020-12-28 08:33:04'),
(91, 88, 1, 'MABROOM-PREMIUM-LARGE/MEDIUM', '610', '5fe9ed89f0372', '80', 'Chittagong', '2020-12-28 08:36:57', '2020-12-28 08:36:57'),
(92, 104, 1, 'test', '45', '5fe9ed89f0372', '80', 'Chittagong', '2020-12-28 08:36:57', '2020-12-28 08:36:57'),
(93, 88, 1, 'MABROOM-PREMIUM-LARGE/MEDIUM', '610', '5fe9f111ade98', '80', 'Chittagong', '2020-12-28 08:52:01', '2020-12-28 08:52:01'),
(94, 104, 1, 'test', '45', '5fe9f111ade98', '80', 'Chittagong', '2020-12-28 08:52:01', '2020-12-28 08:52:01'),
(95, 85, 1, 'AJWA - REGULAR - SMALL', '45', '5fe9f111ade98', '80', 'Chittagong', '2020-12-28 08:52:01', '2020-12-28 08:52:01'),
(96, 84, 1, 'AJWA - SPECIAL - MEDIUM', '610', '5fe9f111ade98', '80', 'Chittagong', '2020-12-28 08:52:01', '2020-12-28 08:52:01'),
(97, 83, 1, 'AJWA - PREMIUM - LARGE', '770', '5fe9f111ade98', '80', 'Chittagong', '2020-12-28 08:52:01', '2020-12-28 08:52:01'),
(98, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5fee210fa01b0', '80', 'Dhaka (outside)', '2020-12-31 13:05:51', '2020-12-31 13:05:51'),
(99, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5fee2121652fe', '80', 'Dhaka (outside)', '2020-12-31 13:06:09', '2020-12-31 13:06:09'),
(100, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5ff6e2dce0020', '0', 'Dhaka', '2021-01-07 04:30:52', '2021-01-07 04:30:52'),
(101, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5ff6e314d7d3a', '0', 'Dhaka', '2021-01-07 04:31:48', '2021-01-07 04:31:48'),
(102, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5ff6e73391053', '0', 'Dhaka', '2021-01-07 04:49:23', '2021-01-07 04:49:23'),
(103, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5ff6e7de484f8', '0', 'Dhaka', '2021-01-07 04:52:14', '2021-01-07 04:52:14'),
(104, 87, 1, 'MABROOM - SUPER PREMIUM - EXTRA LARGE', '660', '5ff6e7de484f8', '0', 'Dhaka', '2021-01-07 04:52:14', '2021-01-07 04:52:14'),
(105, 83, 1, 'AJWA - PREMIUM - LARGE', '770', '5ffae00e7366a', '0', 'Dhaka', '2021-01-10 05:07:58', '2021-01-10 05:07:58'),
(106, 81, 1, 'AJWA - SUPER PREMIUM - EXTRA LARGE', '880', '5ffae00e7366a', '0', 'Dhaka', '2021-01-10 05:07:58', '2021-01-10 05:07:58'),
(107, 96, 1, 'SUKKARI - PREMIUM - GOLDEN /MEDIUM', '550', '5ffc3ca98df01', NULL, NULL, '2021-01-11 05:55:21', '2021-01-11 05:55:21'),
(108, 83, 1, 'AJWA - PREMIUM - LARGE', '770', '5ffd0db009956', '0', 'Dhaka', '2021-01-11 20:47:12', '2021-01-11 20:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(10) UNSIGNED DEFAULT NULL,
  `comission` int(10) UNSIGNED DEFAULT NULL,
  `balance` int(10) UNSIGNED DEFAULT NULL,
  `shipping_cost` int(11) UNSIGNED DEFAULT NULL,
  `total` int(11) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_id`, `vendor_id`, `product_title`, `product_quantity`, `payment_method`, `product_price`, `comission`, `balance`, `shipping_cost`, `total`, `status`, `withdraw`, `created_at`, `updated_at`) VALUES
(2, '105e940fb412a50', 5, 'Product vendor K23', 2, 'Online Payment', 300, 30, 270, 80, 380, 'Waiting For Clearance', 'Not Withdraw Yet', '2020-04-13 01:07:32', '2020-04-13 01:07:32'),
(3, '105ea9646a2a241', 5, 'Product vendor K23', 2, 'Online Payment', 300, 30, 270, 50, 350, 'Waiting For Clearance', 'Not Withdraw Yet', '2020-04-29 05:26:34', '2020-04-29 05:26:34'),
(4, '105fa0f9ab715ad', 5, 'Product vendor K23', 2, 'Online Payment', 300, 30, 270, 50, 350, 'Waiting For Clearance', 'Not Withdraw Yet', '2020-11-03 00:33:15', '2020-11-03 00:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0 not confirmed 1 man 2 woman ',
  `status` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0 not varified 1 varified 2 banned',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `otp`, `address`, `delivery_phone`, `delivery_address`, `password`, `city_id`, `gender`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(30, 'Isabin Abdulla Rafi', 'isabinabdullarafi11@gmail.com', '01780038328', NULL, NULL, NULL, NULL, '$2y$10$Vcbh0Lf2tj2DDUICqy9nDeArSgeHtdE1615PGCO.DwOs4Vtu9ukDe', NULL, NULL, 1, NULL, 'F9mNy6w7zZuKAVC3Foyt59ReGjuy40HI0p8lycjb3dRDmqJ6tF', '2020-08-22 00:33:19', '2020-08-22 00:35:08'),
(47, 'Mohammad Farhad', 'farhadamcse@gmail.com', '01735693811', NULL, NULL, NULL, NULL, '$2y$10$r.3oqb7tmK1cmuWCiSEE9utS/k5qj7UCBxO8OBjaGYDhTAPRP1Vmu', NULL, NULL, 1, NULL, '53Bm21RIxR6aKeoZYMHpup2CsJjH6jZd6GoWs5xKgSVbRs89hefTsn9Crpqp', '2020-12-06 00:26:45', '2020-12-06 00:27:50'),
(64, 'Obayedul Islam Rabbi', 'obayedulislamrabbi@gmail.com', '01670038737', NULL, NULL, NULL, NULL, '$2y$10$YsK781I5h/6Brh.BtgZOC.u6HFDMG/.PMzN7/OeML1iaQiYGA28gi', 'Dhaka', NULL, 1, NULL, 'Yc2YPBWBim04cya7yzo2PeJAtjKg175wA9kMI22mUf2sWmkoCP7SJnz9DSq4', '2020-12-12 05:05:20', '2020-12-12 05:21:08'),
(65, 'Khaled Saifullah', 'www.munna98@gmail.com', '01716919149', '9923', NULL, NULL, NULL, '$2y$10$ULFbGxrZTtYvwGR8driEKesy9D/gD8jgx/kPzIacjSk5.bZs8695K', NULL, NULL, 1, '2020-12-13 10:00:02', NULL, '2020-12-13 09:58:34', '2020-12-13 10:00:02'),
(66, 'debbrota', 'roydebbrota@gmail.com', '01914468204', NULL, NULL, NULL, NULL, '$2y$10$pAGxPUoAjtgcOOgEQj1wxO8BTDZO2Sg1hniB.2HTdBmnHBPcVINmK', NULL, NULL, 1, NULL, 'CzU9QPjXvVG0u5ZQ8gEZ1A7tzwBUFY7XoZKXm7Vha9nqov2PnS', '2020-12-14 01:17:52', '2020-12-14 01:22:08'),
(67, 'shakil', 'shakilsumy@gmail.com', '01978015579', NULL, NULL, NULL, NULL, '$2y$10$0G.E.gkRxKRBsv8iT4MUHO9to40nemWj/ZR33.kS56HptRK1vBILu', NULL, NULL, 1, NULL, 'jpGUedxqyypcIg8vwsSnIDWWuQxnpFeysRlmlT6UIxujm2xUXdJKg5qCbwHG', '2020-12-14 07:01:17', '2020-12-14 07:01:41'),
(68, 'Md Mizanur Rahman', 'zamzamtravelsbd@hotmail.com', '01733391833', NULL, 'House# 202, Road# 03. Ekota Tower, 3rd Floor, Bank Colony, Nimai Kashari, Siddhirganj, Narayanganj- 1430.', '01733391833', 'House# 202, Road# 03. Ekota Tower, 3rd Floor, Bank Colony, Nimai Kashari, Siddhirganj, Narayanganj- 1430.', '$2y$10$IW2nkHULUAYzWykajW24UOQzyFfFnrOo4J0zgC5U17MQfstke52i6', 'Dhaka', 1, 1, NULL, 'VyCBeKWfyF8CcU8Q1Y6Z9B3nvsCKDHL8q8GgLKEqxcfxvbUK7ByqKck7I3OL', '2020-12-14 11:33:17', '2020-12-19 07:20:07'),
(69, 'Taohidkhan', 'juantaohid66@gmail.com', '01714404818', NULL, NULL, NULL, NULL, '$2y$10$318Zk9.Pt3qxUGyeZO.WkO8n/Nqmklfow15UQ9OICJhIwrK5mQ5sO', NULL, NULL, 1, NULL, 'pasn1qeLHatA8P76cBKSpOkxJDEYRF7ed3BtLw9u8OTymvnivu', '2020-12-22 04:02:57', '2020-12-22 04:03:36'),
(70, 'Md Mithu', 'mdmithu87@gmail.com', '01713177214', '7208', NULL, NULL, NULL, '$2y$10$ENP.4iPai1k18OQEspJV5ew7EwLnIZUFxKQdpiUs6kVuHyWP7zm5q', NULL, NULL, 0, NULL, 'yFdd3oPxZuOHt0RLSItd5a8jflWmtsgpfw8dmDZPycwvxYBfpf', '2020-12-26 09:15:30', '2020-12-26 09:15:30'),
(71, 'Saiful Haque Palash', 'bshl.palash@gmail.com', '01824652524', NULL, '১০৬/ক, কসমিক টাওয়ার ৬ষ্ঠ তলা,(ডি.আর. টাওয়ার এর বিপরীতে), বক্স কালভার্ট রোড়, নয়া পল্টন, ঢাকা ১০০০', '01824652524', '১০৬/ক, কসমিক টাওয়ার ৬ষ্ঠ তলা,(ডি.আর. টাওয়ার এর বিপরীতে), বক্স কালভার্ট রোড়, নয়া পল্টন, ঢাকা ১০০০', '$2y$10$GX8M10u7gSjYS.eupWidW.MbL4xocsfahB0/9XlPhObNChmfX8NnW', 'Dhaka', 1, 1, '2020-12-27 02:44:27', NULL, '2020-12-26 09:30:47', '2020-12-27 02:44:27'),
(72, 'Md Mizanur Rahman', 'dhiyufzamzam@gmail.com', '01733006999', NULL, NULL, NULL, NULL, '$2y$10$E/cBQ9x08XyL/x0.5o5oQuBHofgaSVU94GOQTB3TvKywzAhU.13dW', NULL, NULL, 1, NULL, 'dVVa8eezRJKbwe6WTuCn8T5Bi55nf3xF8aWvgF9HutFpHp6mm7', '2021-01-05 09:50:11', '2021-01-05 09:50:31'),
(77, 't', 'f@gmail.com', '01647161559', '7276', NULL, NULL, NULL, '$2y$10$48BOL5ahaNMI62q0wcfNaeREW5vC3JendcNwGBFL8Y3i1phgAAmuK', NULL, NULL, 0, NULL, 'Hee1RukOBKMAsdtgeiV2eX8ByJb21QfNHOY7LuG2qR2t8sKct6', '2021-01-07 16:38:45', '2021-01-07 16:38:45'),
(80, 'h', 'g@gmail.com', '78945612312', '1307', NULL, NULL, NULL, '$2y$10$obo4g8JPgM8FXpixeR98OOY3SG8RshZcx4Tx6UBAixNSOzw5GWmEm', NULL, NULL, 0, NULL, 'z2wzOrbIRSGF1qLCYqUCU5Z3alxCE9oTBGKsabxDKPDBTCBDom', '2021-01-07 17:38:54', '2021-01-07 17:38:54'),
(81, 'shumssunam', 'shumssunam15@gmail.com', '01858085086', '5570', NULL, NULL, NULL, '$2y$10$BAglsSGDEq/SvGmcDgE2ReikMJkvUJaPW6DqEPSErrtcmVBEfAWwy', NULL, NULL, 0, NULL, 'BH9lcZeUazslyNpLfm42GdfLccpyYCdMN5HXxAzdRspCsU17B1', '2021-01-09 02:53:02', '2021-01-09 02:53:02'),
(82, 'sunam', 's@gmail.com', '01852580866', '6178', NULL, NULL, NULL, '$2y$10$w0C92QQCjFczCwBrOnSX3eiwMIH1/vc7kMzaiayfFElqxA/nQolVS', NULL, NULL, 0, NULL, 'tARH8AGwGERm3c7tRpT7nVgNL2EixPrTC3Ja9vMOg4IMgLBHlJ', '2021-01-09 07:11:02', '2021-01-09 07:11:02'),
(83, 'Forhadul Islam', 'fitareq@gmail.com', '01647161550', '8189', NULL, NULL, NULL, '$2y$10$jb9lIskko3GP98djVb8IZ.4w5fhKpcLf6y25A1Q/PPbr80B.XWZ4i', NULL, NULL, 0, NULL, 'c5b15hSqltnlKruydTdCPypRFNDRyPCe3qY3c3gDkU2RGXOBVO', '2021-01-09 17:21:42', '2021-01-09 17:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `address`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'MD. NAZMUL KHALID 12', 'technonazmul@gmail.com', '017953654291', 'Test Address1', '$2y$10$MLh69SdfPjkH03PgWUR4k.UCzR0tuvIIKEE.xC1u2CIc2Y3zjhlay', '1584779134.jpg', 'zFpDqwcS9eSmy3jO2JZ7jKNBMUleCfQzQ4VEu7TTbu6HNJAvlF', '2020-03-20 05:20:36', '2020-03-21 03:23:54'),
(5, 'Nazmul', 'mdkhalidmtb@gmail.com', '01795365429', 'Nobabgang bazar road, Lalbagh, Dhaka', '$2y$10$293vl0Lkbzewl.LDQidNDu99tTNPt/QdqoT8z36RDUVvciVHwl/Eu', NULL, 'lWBgLB9ygzSlYWKCAaWdUfMGcM1fWaYhlWHR9JREZSZCFUBZNz', '2020-03-21 21:58:34', '2020-03-21 21:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_items_menu_foreign` (`menu`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `csses`
--
ALTER TABLE `csses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_colors`
--
ALTER TABLE `frontend_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generals`
--
ALTER TABLE `generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `popular_product_sliders`
--
ALTER TABLE `popular_product_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popular_product_slider_images`
--
ALTER TABLE `popular_product_slider_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `popular_product_slider_images_popular_product_slider_id_foreign` (`popular_product_slider_id`);

--
-- Indexes for table `ppage_banners`
--
ALTER TABLE `ppage_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_switches`
--
ALTER TABLE `section_switches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_lefts`
--
ALTER TABLE `testimonial_lefts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_orders`
--
ALTER TABLE `tmp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attribute_sets`
--
ALTER TABLE `attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `csses`
--
ALTER TABLE `csses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `frontend_colors`
--
ALTER TABLE `frontend_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `generals`
--
ALTER TABLE `generals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `mobile_payments`
--
ALTER TABLE `mobile_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `popular_product_sliders`
--
ALTER TABLE `popular_product_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `popular_product_slider_images`
--
ALTER TABLE `popular_product_slider_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `ppage_banners`
--
ALTER TABLE `ppage_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `section_switches`
--
ALTER TABLE `section_switches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonial_lefts`
--
ALTER TABLE `testimonial_lefts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tmp_orders`
--
ALTER TABLE `tmp_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD CONSTRAINT `admin_menu_items_menu_foreign` FOREIGN KEY (`menu`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `popular_product_slider_images`
--
ALTER TABLE `popular_product_slider_images`
  ADD CONSTRAINT `popular_product_slider_images_popular_product_slider_id_foreign` FOREIGN KEY (`popular_product_slider_id`) REFERENCES `popular_product_sliders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
