-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2018 at 11:50 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crywan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `paper_width` double(8,2) DEFAULT NULL,
  `paper_height` double(8,2) DEFAULT NULL,
  `top_margin` double(8,2) DEFAULT NULL,
  `left_margin` double(8,2) DEFAULT NULL,
  `row_distance` double(8,2) DEFAULT NULL,
  `col_distance` double(8,2) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.75, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.16, 2, 0, 0, 20, NULL, '2017-12-18 11:13:44', '2017-12-18 11:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.62, 1.00, 8.50, 11.00, 0.50, 0.22, 0.00, 0.14, 3, 0, 0, 30, NULL, '2017-12-18 11:04:39', '2017-12-18 11:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.00, 1.25, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 32, NULL, '2017-12-18 10:55:40', '2017-12-18 10:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.00, 1.00, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 40, NULL, '2017-12-18 10:58:40', '2017-12-18 10:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.50, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.00, 5, 0, 0, 50, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.25, 1.00, 1.25, 0.00, 0.12, 0.00, 0.12, 0.00, 1, 0, 1, NULL, NULL, '2017-12-18 10:51:10', '2017-12-18 10:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(20,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `created_at`, `updated_at`) VALUES
(1, 'Crywan Distillers', 133, NULL, '1234567', 'VAT', NULL, NULL, NULL, 20.00, 1, 'Africa/Nairobi', 1, 'fifo', NULL, 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"disable_discount\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_order_tax\":0}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 1, NULL, 1, 0, 'before', 'null', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', '2018-08-07 21:23:12', '2018-08-20 03:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Mlolongo', 'Mlolongo', 'Kenya', 'Nairobi', 'Nairobi', '00100', 1, 1, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 21:23:12', '2018-08-20 03:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'open', NULL, '0.00', 0, 0, NULL, '2018-08-07 18:56:17', '2018-08-07 18:56:17'),
(2, 1, 1, 'close', '2018-08-10 08:42:23', '4224.00', 0, 0, NULL, '2018-08-07 19:11:20', '2018-08-10 12:42:23'),
(3, 1, 1, 'close', '2018-08-19 23:35:44', '9456.00', 0, 0, NULL, '2018-08-10 12:43:19', '2018-08-20 03:35:44'),
(4, 1, 1, 'open', NULL, '0.00', 0, 0, NULL, '2018-08-20 03:36:47', '2018-08-20 03:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pay_method` enum('cash','card','cheque','bank_transfer','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0.00', 'cash', 'credit', 'initial', NULL, '2018-08-07 18:56:17', '2018-08-07 18:56:17'),
(2, 1, '48.00', 'cash', 'credit', 'sell', 2, '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(3, 1, '0.00', 'cash', 'credit', 'sell', 2, '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(4, 2, '0.00', 'cash', 'credit', 'initial', NULL, '2018-08-07 19:11:20', '2018-08-07 19:11:20'),
(5, 2, '24.00', 'cash', 'credit', 'sell', 3, '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(6, 2, '0.00', 'cash', 'credit', 'sell', 3, '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(7, 2, '24.00', 'cash', 'credit', 'sell', 4, '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(8, 2, '0.00', 'cash', 'credit', 'sell', 4, '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(9, 2, '168.00', 'cash', 'credit', 'sell', 5, '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(10, 2, '0.00', 'cash', 'credit', 'sell', 5, '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(11, 2, '24.00', 'cash', 'credit', 'sell', 7, '2018-08-07 19:38:59', '2018-08-07 19:38:59'),
(12, 2, '0.00', 'cash', 'credit', 'sell', 7, '2018-08-07 19:38:59', '2018-08-07 19:38:59'),
(13, 2, '2400.00', 'cash', 'credit', 'sell', 8, '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(14, 2, '0.00', 'cash', 'credit', 'sell', 8, '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(15, 2, '192.00', 'cash', 'credit', 'sell', 9, '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(16, 2, '0.00', 'cash', 'credit', 'sell', 9, '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(17, 2, '168.00', 'cash', 'credit', 'sell', 10, '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(18, 2, '0.00', 'cash', 'credit', 'sell', 10, '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(19, 2, '24.00', 'cash', 'credit', 'sell', 11, '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(20, 2, '0.00', 'cash', 'credit', 'sell', 11, '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(21, 2, '24.00', 'cash', 'credit', 'sell', 12, '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(22, 2, '0.00', 'cash', 'credit', 'sell', 12, '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(23, 2, '24.00', 'cash', 'credit', 'sell', 13, '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(24, 2, '0.00', 'cash', 'credit', 'sell', 13, '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(25, 2, '24.00', 'cash', 'credit', 'sell', 14, '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(26, 2, '0.00', 'cash', 'credit', 'sell', 14, '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(27, 2, '24.00', 'cash', 'credit', 'sell', 15, '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(28, 2, '0.00', 'cash', 'credit', 'sell', 15, '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(29, 2, '24.00', 'cash', 'credit', 'sell', 16, '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(30, 2, '0.00', 'cash', 'credit', 'sell', 16, '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(31, 2, '48.00', 'cash', 'credit', 'sell', 17, '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(32, 2, '0.00', 'cash', 'credit', 'sell', 17, '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(33, 2, '48.00', 'cash', 'credit', 'sell', 18, '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(34, 2, '0.00', 'cash', 'credit', 'sell', 18, '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(35, 2, '24.00', 'cash', 'credit', 'sell', 19, '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(36, 2, '0.00', 'cash', 'credit', 'sell', 19, '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(37, 2, '24.00', 'cash', 'credit', 'sell', 20, '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(38, 2, '0.00', 'cash', 'credit', 'sell', 20, '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(39, 2, '24.00', 'cash', 'credit', 'sell', 21, '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(40, 2, '0.00', 'cash', 'credit', 'sell', 21, '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(41, 2, '24.00', 'cash', 'credit', 'sell', 22, '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(42, 2, '0.00', 'cash', 'credit', 'sell', 22, '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(43, 2, '24.00', 'cash', 'credit', 'sell', 23, '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(44, 2, '0.00', 'cash', 'credit', 'sell', 23, '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(45, 2, '24.00', 'cash', 'credit', 'sell', 24, '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(46, 2, '0.00', 'cash', 'credit', 'sell', 24, '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(47, 2, '648.00', 'cash', 'credit', 'sell', 26, '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(48, 2, '0.00', 'cash', 'credit', 'sell', 26, '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(49, 2, '24.00', 'cash', 'credit', 'sell', 27, '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(50, 2, '0.00', 'cash', 'credit', 'sell', 27, '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(51, 2, '24.00', 'cash', 'credit', 'sell', 28, '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(52, 2, '0.00', 'cash', 'credit', 'sell', 28, '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(53, 2, '24.00', 'cash', 'credit', 'sell', 29, '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(54, 2, '0.00', 'cash', 'credit', 'sell', 29, '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(55, 2, '24.00', 'cash', 'credit', 'sell', 30, '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(56, 2, '0.00', 'cash', 'credit', 'sell', 30, '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(57, 2, '24.00', 'cash', 'credit', 'sell', 31, '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(58, 2, '0.00', 'cash', 'credit', 'sell', 31, '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(59, 2, '24.00', 'cash', 'credit', 'sell', 32, '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(60, 2, '0.00', 'cash', 'credit', 'sell', 32, '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(61, 2, '24.00', 'cash', 'credit', 'sell', 33, '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(62, 2, '0.00', 'cash', 'credit', 'sell', 33, '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(63, 2, '24.00', 'cash', 'credit', 'sell', 34, '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(64, 2, '0.00', 'cash', 'credit', 'sell', 34, '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(65, 3, '0.00', 'cash', 'credit', 'initial', NULL, '2018-08-10 12:43:19', '2018-08-10 12:43:19'),
(66, 3, '24.00', 'cash', 'credit', 'sell', 36, '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(67, 3, '0.00', 'cash', 'credit', 'sell', 36, '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(68, 3, '24.00', 'cash', 'credit', 'sell', 37, '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(69, 3, '0.00', 'cash', 'credit', 'sell', 37, '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(70, 3, '24.00', 'cash', 'credit', 'sell', 38, '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(71, 3, '0.00', 'cash', 'credit', 'sell', 38, '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(72, 3, '24.00', 'cash', 'credit', 'sell', 39, '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(73, 3, '0.00', 'cash', 'credit', 'sell', 39, '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(74, 3, '24.00', 'cash', 'credit', 'sell', 40, '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(75, 3, '0.00', 'cash', 'credit', 'sell', 40, '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(76, 3, '24.00', 'cash', 'credit', 'sell', 41, '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(77, 3, '0.00', 'cash', 'credit', 'sell', 41, '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(78, 3, '24.00', 'cash', 'credit', 'sell', 42, '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(79, 3, '0.00', 'cash', 'credit', 'sell', 42, '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(80, 3, '24.00', 'cash', 'credit', 'sell', 43, '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(81, 3, '0.00', 'cash', 'credit', 'sell', 43, '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(82, 3, '24.00', 'cash', 'credit', 'sell', 44, '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(83, 3, '0.00', 'cash', 'credit', 'sell', 44, '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(84, 3, '72.00', 'cash', 'credit', 'sell', 45, '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(85, 3, '0.00', 'cash', 'credit', 'sell', 45, '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(86, 3, '24.00', 'cash', 'credit', 'sell', 46, '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(87, 3, '0.00', 'cash', 'credit', 'sell', 46, '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(88, 3, '24.00', 'cash', 'credit', 'sell', 47, '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(89, 3, '0.00', 'cash', 'credit', 'sell', 47, '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(90, 3, '24.00', 'cash', 'credit', 'sell', 48, '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(91, 3, '0.00', 'cash', 'credit', 'sell', 48, '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(92, 3, '24.00', 'cash', 'credit', 'sell', 49, '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(93, 3, '0.00', 'cash', 'credit', 'sell', 49, '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(94, 3, '24.00', 'cash', 'credit', 'sell', 50, '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(95, 3, '0.00', 'cash', 'credit', 'sell', 50, '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(96, 3, '24.00', 'cash', 'credit', 'sell', 51, '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(97, 3, '0.00', 'cash', 'credit', 'sell', 51, '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(98, 3, '24.00', 'cash', 'credit', 'sell', 52, '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(99, 3, '0.00', 'cash', 'credit', 'sell', 52, '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(100, 3, '24.00', 'cash', 'credit', 'sell', 53, '2018-08-20 03:31:29', '2018-08-20 03:31:29'),
(101, 3, '0.00', 'cash', 'credit', 'sell', 53, '2018-08-20 03:31:29', '2018-08-20 03:31:29'),
(102, 3, '8976.00', 'cash', 'credit', 'sell', 54, '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(103, 3, '0.00', 'cash', 'credit', 'sell', 54, '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(104, 4, '0.00', 'cash', 'credit', 'initial', NULL, '2018-08-20 03:36:47', '2018-08-20 03:36:47'),
(105, 4, '13296.00', 'cash', 'credit', 'sell', 55, '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(106, 4, '0.00', 'cash', 'credit', 'sell', 55, '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(107, 4, '160000.00', 'cash', 'credit', 'sell', 58, '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(108, 4, '0.00', 'cash', 'credit', 'sell', 58, '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(109, 4, '1600.00', 'cash', 'credit', 'sell', 59, '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(110, 4, '0.00', 'cash', 'credit', 'sell', 59, '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(111, 4, '1200.00', 'cash', 'credit', 'sell', 60, '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(112, 4, '0.00', 'cash', 'credit', 'sell', 60, '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(113, 4, '1600.00', 'cash', 'credit', 'sell', 61, '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(114, 4, '0.00', 'cash', 'credit', 'sell', 61, '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(115, 4, '48.00', 'cash', 'credit', 'sell', 62, '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(116, 4, '0.00', 'cash', 'credit', 'sell', 62, '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(117, 4, '24.00', 'cash', 'credit', 'sell', 63, '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(118, 4, '0.00', 'cash', 'credit', 'sell', 63, '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(119, 4, '1600.00', 'cash', 'credit', 'sell', 65, '2018-08-20 20:58:08', '2018-08-20 20:58:08'),
(120, 4, '0.00', 'cash', 'credit', 'sell', 65, '2018-08-20 20:58:08', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `created_by`, `is_default`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 21:23:12', '2018-08-09 06:20:20'),
(2, 1, 'customer', NULL, 'Dennis', NULL, 'CO0002', NULL, NULL, NULL, NULL, NULL, '0723096431', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 06:06:36', '2018-08-09 06:06:36'),
(3, 1, 'supplier', 'BtrackGlobal', '1', 'dennis@btrackglobal.com', 'Dennis Kipkogei', NULL, 'Nairobi', 'Nairobi', 'Kenya', NULL, '723096431', NULL, NULL, 3, 'months', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 03:41:20', '2018-08-20 03:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MX', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` enum('classic','elegant') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_sale_description`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `highlight_color`, `footer_text`, `module_info`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', 1, 0, 1, 1, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', '#000000', '<p>www.crywandistillers.com</p>', NULL, 1, 1, 'elegant', NULL, NULL, NULL, '2018-08-07 21:23:12', '2018-08-10 01:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 59, 4, 1, '2018-08-07 21:23:12', '2018-08-20 20:58:08');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_07_10_101913_add_custom_fields_to_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\User'),
(2, 2, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2018-08-07 18:25:13', NULL),
(2, 'direct_sell.access', 'web', '2018-08-07 18:25:13', NULL),
(3, 'product.opening_stock', 'web', '2018-08-07 18:25:14', '2018-08-07 18:25:14'),
(4, 'crud_all_bookings', 'web', '2018-08-07 18:25:15', '2018-08-07 18:25:15'),
(5, 'crud_own_bookings', 'web', '2018-08-07 18:25:15', '2018-08-07 18:25:15'),
(6, 'user.view', 'web', '2018-08-07 18:25:15', NULL),
(7, 'user.create', 'web', '2018-08-07 18:25:15', NULL),
(8, 'user.update', 'web', '2018-08-07 18:25:15', NULL),
(9, 'user.delete', 'web', '2018-08-07 18:25:15', NULL),
(10, 'supplier.view', 'web', '2018-08-07 18:25:15', NULL),
(11, 'supplier.create', 'web', '2018-08-07 18:25:15', NULL),
(12, 'supplier.update', 'web', '2018-08-07 18:25:15', NULL),
(13, 'supplier.delete', 'web', '2018-08-07 18:25:15', NULL),
(14, 'customer.view', 'web', '2018-08-07 18:25:15', NULL),
(15, 'customer.create', 'web', '2018-08-07 18:25:15', NULL),
(16, 'customer.update', 'web', '2018-08-07 18:25:15', NULL),
(17, 'customer.delete', 'web', '2018-08-07 18:25:15', NULL),
(18, 'product.view', 'web', '2018-08-07 18:25:15', NULL),
(19, 'product.create', 'web', '2018-08-07 18:25:15', NULL),
(20, 'product.update', 'web', '2018-08-07 18:25:15', NULL),
(21, 'product.delete', 'web', '2018-08-07 18:25:15', NULL),
(22, 'purchase.view', 'web', '2018-08-07 18:25:15', NULL),
(23, 'purchase.create', 'web', '2018-08-07 18:25:15', NULL),
(24, 'purchase.update', 'web', '2018-08-07 18:25:15', NULL),
(25, 'purchase.delete', 'web', '2018-08-07 18:25:15', NULL),
(26, 'sell.view', 'web', '2018-08-07 18:25:15', NULL),
(27, 'sell.create', 'web', '2018-08-07 18:25:15', NULL),
(28, 'sell.update', 'web', '2018-08-07 18:25:15', NULL),
(29, 'sell.delete', 'web', '2018-08-07 18:25:15', NULL),
(30, 'purchase_n_sell_report.view', 'web', '2018-08-07 18:25:15', NULL),
(31, 'contacts_report.view', 'web', '2018-08-07 18:25:15', NULL),
(32, 'stock_report.view', 'web', '2018-08-07 18:25:15', NULL),
(33, 'tax_report.view', 'web', '2018-08-07 18:25:15', NULL),
(34, 'trending_product_report.view', 'web', '2018-08-07 18:25:15', NULL),
(35, 'register_report.view', 'web', '2018-08-07 18:25:15', NULL),
(36, 'sales_representative.view', 'web', '2018-08-07 18:25:15', NULL),
(37, 'expense_report.view', 'web', '2018-08-07 18:25:15', NULL),
(38, 'business_settings.access', 'web', '2018-08-07 18:25:15', NULL),
(39, 'barcode_settings.access', 'web', '2018-08-07 18:25:15', NULL),
(40, 'invoice_settings.access', 'web', '2018-08-07 18:25:15', NULL),
(41, 'brand.view', 'web', '2018-08-07 18:25:15', NULL),
(42, 'brand.create', 'web', '2018-08-07 18:25:15', NULL),
(43, 'brand.update', 'web', '2018-08-07 18:25:15', NULL),
(44, 'brand.delete', 'web', '2018-08-07 18:25:15', NULL),
(45, 'tax_rate.view', 'web', '2018-08-07 18:25:15', NULL),
(46, 'tax_rate.create', 'web', '2018-08-07 18:25:15', NULL),
(47, 'tax_rate.update', 'web', '2018-08-07 18:25:15', NULL),
(48, 'tax_rate.delete', 'web', '2018-08-07 18:25:15', NULL),
(49, 'unit.view', 'web', '2018-08-07 18:25:15', NULL),
(50, 'unit.create', 'web', '2018-08-07 18:25:15', NULL),
(51, 'unit.update', 'web', '2018-08-07 18:25:15', NULL),
(52, 'unit.delete', 'web', '2018-08-07 18:25:15', NULL),
(53, 'category.view', 'web', '2018-08-07 18:25:15', NULL),
(54, 'category.create', 'web', '2018-08-07 18:25:15', NULL),
(55, 'category.update', 'web', '2018-08-07 18:25:15', NULL),
(56, 'category.delete', 'web', '2018-08-07 18:25:15', NULL),
(57, 'expense.access', 'web', '2018-08-07 18:25:15', NULL),
(58, 'access_all_locations', 'web', '2018-08-07 18:25:15', NULL),
(59, 'dashboard.data', 'web', '2018-08-07 18:25:15', NULL),
(60, 'location.1', 'web', '2018-08-07 21:23:12', '2018-08-07 21:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'test', 1, 'single', 1, NULL, NULL, NULL, NULL, 'exclusive', 1, 555, '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-08-07 18:58:51', '2018-08-07 18:58:51'),
(3, 'Product test', 1, 'single', 1, NULL, NULL, NULL, NULL, 'exclusive', 1, 20, '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-08-20 03:39:37', '2018-08-20 03:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(2, 'DUMMY', 2, 1, '2018-08-07 18:58:51', '2018-08-07 18:58:51'),
(3, 'DUMMY', 3, 1, '2018-08-20 03:39:37', '2018-08-20 03:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `pp_without_discount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(20,2) DEFAULT NULL,
  `purchase_price_inc_tax` decimal(20,2) NOT NULL DEFAULT '0.00',
  `item_tax` decimal(20,2) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `mfg_date`, `exp_date`, `lot_number`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2, 1000, '16.00', '0.00', '16.00', '16.00', '0.00', NULL, '344.00', '466.00', NULL, NULL, NULL, '2018-08-07 18:59:00', '2018-08-20 19:49:02'),
(2, 56, 3, 3, 1000, '1000.00', '0.00', '1000.00', '1000.00', '0.00', NULL, '0.00', '0.00', NULL, NULL, NULL, '2018-08-20 03:42:14', '2018-08-20 03:42:14'),
(3, 57, 3, 3, 1000, '960.00', '0.00', '960.00', '960.00', '0.00', NULL, '105.00', '0.00', NULL, NULL, NULL, '2018-08-20 03:44:09', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 3, 1, '2018-08-07 21:23:12', '2018-08-20 03:41:20'),
(2, 'business_location', 1, 1, '2018-08-07 21:23:12', '2018-08-07 21:23:12'),
(3, 'sell_payment', 59, 1, '2018-08-07 18:59:24', '2018-08-20 20:58:08'),
(4, 'stock_adjustment', 2, 1, '2018-08-07 19:37:26', '2018-08-10 12:45:42'),
(5, 'expense', 1, 1, '2018-08-09 05:58:30', '2018-08-09 05:58:30'),
(6, 'purchase', 1, 1, '2018-08-20 03:42:14', '2018-08-20 03:42:14'),
(7, 'purchase_payment', 1, 1, '2018-08-20 03:42:27', '2018-08-20 03:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2018-08-07 21:23:12', '2018-08-07 21:23:12'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2018-08-07 21:23:12', '2018-08-07 21:23:12'),
(3, 'Sales Rep#1', 'web', 1, 0, 0, '2018-08-07 20:46:40', '2018-08-07 20:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 3),
(14, 3),
(18, 3),
(26, 2),
(26, 3),
(27, 2),
(27, 3),
(28, 2),
(28, 3),
(29, 2),
(30, 3),
(31, 3),
(32, 3),
(34, 3),
(35, 3),
(36, 3),
(41, 3),
(45, 3),
(49, 3),
(53, 3),
(58, 3),
(59, 3),
(60, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_adjustment_lines`
--

INSERT INTO `stock_adjustment_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `unit_price`, `removed_purchase_line`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 2, '10.00', '16.00', NULL, '2018-08-07 19:37:26', '2018-08-07 19:37:26'),
(2, 35, 2, 2, '456.00', '16.00', NULL, '2018-08-10 12:45:42', '2018-08-10 12:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`key`, `value`) VALUES
('db_version', '2.5');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'VAT 16%', 16.00, 0, 1, NULL, '2018-08-20 03:46:22', '2018-08-20 03:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('purchase','sell','expense','stock_adjustment','sell_transfer','purchase_transfer','opening_stock','sell_return') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `geolocation` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(20,2) NOT NULL DEFAULT '0.00',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `final_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(20,2) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `status`, `is_quotation`, `geolocation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `shipping_details`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `opening_stock_product_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, '', 'paid', NULL, NULL, NULL, NULL, NULL, '2018-01-01 14:59:00', '16000.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, '16000.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, 2, 1, '2018-08-07 18:59:00', '2018-08-07 18:59:00'),
(2, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0001', '', '2018-08-07 14:59:24', '48.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '48.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 2, '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(3, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0002', '', '2018-08-07 15:11:36', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(4, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0003', '', '2018-08-07 15:13:43', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(5, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0004', '', '2018-08-07 15:28:26', '168.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '168.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(6, 1, 1, NULL, NULL, NULL, 'stock_adjustment', 'received', 0, '', NULL, 'normal', NULL, NULL, NULL, 'SA2018/0001', '2018-08-07 00:00:00', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, '160.00', NULL, NULL, NULL, NULL, 0, '1.000', '0.00', NULL, NULL, 1, '2018-08-07 19:37:26', '2018-08-07 19:37:26'),
(7, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0005', '', '2018-08-07 15:38:59', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 19:38:59', '2018-08-07 19:38:59'),
(8, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0006', '', '2018-08-07 15:49:03', '2400.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '2400.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(9, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0007', '', '2018-08-07 16:12:54', '192.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '192.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(10, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0008', '', '2018-08-07 18:57:21', '168.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '168.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(11, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0009', '', '2018-08-07 22:01:44', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(12, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0010', '', '2018-08-07 22:04:43', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(13, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0011', '', '2018-08-07 22:06:27', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(14, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0012', '', '2018-08-07 22:07:16', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(15, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0013', '', '2018-08-07 22:07:45', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(16, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0014', '', '2018-08-08 08:46:43', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(17, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0015', '', '2018-08-08 22:31:38', '48.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '48.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(18, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0016', '', '2018-08-08 22:31:39', '48.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '48.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(19, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0017', '', '2018-08-08 22:37:43', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(20, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0018', '', '2018-08-08 22:38:13', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(21, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0019', '', '2018-08-08 22:39:43', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(22, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0020', '', '2018-08-08 23:08:42', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(23, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0021', '', '2018-08-08 23:19:45', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(24, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0022', '', '2018-08-09 00:16:21', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(25, 1, 1, NULL, NULL, NULL, 'expense', 'final', 0, '', 'paid', NULL, NULL, NULL, NULL, 'EP2018/0001', '2018-08-09 00:00:00', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, '1000.00', NULL, 2, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 05:58:30', '2018-08-09 05:58:30'),
(26, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0023', '', '2018-08-09 01:59:41', '648.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '648.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(27, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 2, NULL, '0024', '', '2018-08-09 02:07:16', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(28, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 2, NULL, '0025', '', '2018-08-09 02:18:17', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(29, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 2, NULL, '0026', '', '2018-08-09 16:08:30', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(30, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0027', '', '2018-08-09 16:09:09', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(31, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0028', '', '2018-08-09 22:29:37', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(32, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0029', '', '2018-08-09 23:47:22', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(33, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, '', 'paid', NULL, 1, NULL, '0030', '', '2018-08-09 23:59:59', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(34, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Ring Rd Parklands, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0031', '', '2018-08-10 00:06:12', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(35, 1, 1, NULL, NULL, NULL, 'stock_adjustment', 'received', 0, '', NULL, 'normal', NULL, NULL, NULL, 'SA2018/0002', '2018-08-10 00:00:00', '0.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, '7296.00', NULL, NULL, NULL, NULL, 0, '1.000', '0.00', NULL, NULL, 1, '2018-08-10 12:45:42', '2018-08-10 12:45:42'),
(36, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0032', '', '2018-08-10 08:50:30', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(37, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0033', '', '2018-08-10 08:56:49', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(38, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0034', '', '2018-08-10 11:40:14', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(39, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Taifa Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0035', '', '2018-08-10 12:18:15', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(40, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Taifa Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0036', '', '2018-08-10 12:19:39', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(41, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Taifa Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0037', '', '2018-08-10 12:28:00', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(42, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Argwings Kodhek Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0038', '', '2018-08-13 13:58:42', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(43, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Argwings Kodhek Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0039', '', '2018-08-13 14:11:55', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(44, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0040', '', '2018-08-15 00:41:10', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(45, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Mandera Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0041', '', '2018-08-15 22:03:04', '72.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '72.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(46, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Mandera Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0042', '', '2018-08-15 22:27:56', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(47, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Mandera Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0043', '', '2018-08-15 22:29:21', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(48, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Mandera Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0044', '', '2018-08-15 22:38:34', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(49, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Utalii House, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0045', '', '2018-08-15 22:39:00', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(50, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0046', '', '2018-08-15 23:51:56', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(51, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0047', '', '2018-08-16 22:53:13', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(52, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0048', '', '2018-08-19 23:24:30', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(53, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0049', '', '2018-08-19 23:31:28', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:31:28', '2018-08-20 03:31:29'),
(54, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0050', '', '2018-08-19 23:34:38', '1440.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '8976.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(55, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0051', '', '2018-08-19 23:37:14', '1992.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '13296.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(56, 1, 1, NULL, NULL, NULL, 'purchase', 'ordered', 0, '', 'paid', NULL, 3, NULL, NULL, 'PO2018/0001', '2018-08-19 00:00:00', '1000000.00', NULL, '0.00', NULL, '0', NULL, '0.00', NULL, NULL, '1000000.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:42:14', '2018-08-20 03:42:27'),
(57, 1, 1, NULL, NULL, NULL, 'opening_stock', 'received', 0, '', 'paid', NULL, NULL, NULL, NULL, NULL, '2018-01-01 23:44:09', '960000.00', NULL, '0.00', NULL, NULL, NULL, '0.00', NULL, NULL, '960000.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, 3, 1, '2018-08-20 03:44:09', '2018-08-20 03:44:09'),
(58, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0052', '', '2018-08-19 23:44:33', '160000.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '160000.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(59, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0053', '', '2018-08-19 23:46:43', '1600.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '1600.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(60, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Kijunje Flats, Ngotho Rd, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0054', '', '2018-08-19 23:48:51', '1200.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '1200.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(61, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Eastern bypass slip road, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0055', '', '2018-08-20 15:47:58', '1600.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '1600.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(62, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Eastern bypass slip road, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0056', '', '2018-08-20 15:48:26', '48.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '48.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(63, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Eastern bypass slip road, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0057', '', '2018-08-20 15:49:02', '24.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '24.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(64, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Eastern bypass slip road, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0058', '', '2018-08-20 00:00:00', '1600.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '1600.00', NULL, NULL, NULL, NULL, 1, '1.000', NULL, NULL, NULL, 1, '2018-08-20 19:06:20', '2018-08-20 19:06:35'),
(65, 1, 1, NULL, NULL, NULL, 'sell', 'final', 0, 'Eastern bypass slip road, Nairobi, Kenya', 'paid', NULL, 1, NULL, '0059', '', '2018-08-20 23:58:08', '1600.00', NULL, '0.00', 'percentage', '0', NULL, '0.00', NULL, NULL, '1600.00', NULL, NULL, NULL, NULL, 0, '1.000', NULL, NULL, NULL, 1, '2018-08-20 20:58:08', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `method` enum('cash','card','cheque','bank_transfer','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` enum('visa','master') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `is_return`, `amount`, `method`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `payment_ref_no`, `created_at`, `updated_at`) VALUES
(1, 2, 0, '48.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 14:59:24', 2, 1, NULL, NULL, 'SP2018/0001', '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(2, 3, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 15:11:36', 1, 1, NULL, NULL, 'SP2018/0002', '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(3, 4, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 15:13:43', 1, 1, NULL, NULL, 'SP2018/0003', '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(4, 5, 0, '168.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 15:28:26', 1, 1, NULL, NULL, 'SP2018/0004', '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(5, 7, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 15:38:59', 1, 1, NULL, NULL, 'SP2018/0005', '2018-08-07 19:38:59', '2018-08-07 19:38:59'),
(6, 8, 0, '2400.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 15:49:03', 1, 1, NULL, NULL, 'SP2018/0006', '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(7, 9, 0, '192.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 16:12:54', 1, 1, NULL, NULL, 'SP2018/0007', '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(8, 10, 0, '168.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 18:57:21', 1, 1, NULL, NULL, 'SP2018/0008', '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(9, 11, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 22:01:44', 1, 1, NULL, NULL, 'SP2018/0009', '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(10, 12, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 22:04:43', 1, 1, NULL, NULL, 'SP2018/0010', '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(11, 13, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 22:06:27', 1, 1, NULL, NULL, 'SP2018/0011', '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(12, 14, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 22:07:16', 1, 1, NULL, NULL, 'SP2018/0012', '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(13, 15, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-07 22:07:45', 1, 1, NULL, NULL, 'SP2018/0013', '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(14, 16, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 08:46:43', 1, 1, NULL, NULL, 'SP2018/0014', '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(15, 17, 0, '48.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 22:31:38', 1, 1, NULL, NULL, 'SP2018/0015', '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(16, 18, 0, '48.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 22:31:39', 1, 1, NULL, NULL, 'SP2018/0016', '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(17, 19, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 22:37:43', 1, 1, NULL, NULL, 'SP2018/0017', '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(18, 20, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 22:38:13', 1, 1, NULL, NULL, 'SP2018/0018', '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(19, 21, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 22:39:43', 1, 1, NULL, NULL, 'SP2018/0019', '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(20, 22, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 23:08:42', 1, 1, NULL, NULL, 'SP2018/0020', '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(21, 23, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 23:19:45', 1, 1, NULL, NULL, 'SP2018/0021', '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(22, 24, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 00:16:21', 1, 1, NULL, NULL, 'SP2018/0022', '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(23, 26, 0, '648.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 01:59:41', 1, 1, NULL, NULL, 'SP2018/0023', '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(24, 27, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 02:07:16', 1, 2, NULL, NULL, 'SP2018/0024', '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(25, 28, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 02:18:17', 1, 2, NULL, NULL, 'SP2018/0025', '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(26, 29, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 16:08:30', 1, 2, NULL, NULL, 'SP2018/0026', '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(27, 30, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 16:09:09', 1, 1, NULL, NULL, 'SP2018/0027', '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(28, 31, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 22:29:37', 1, 1, NULL, NULL, 'SP2018/0028', '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(29, 32, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 23:47:22', 1, 1, NULL, NULL, 'SP2018/0029', '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(30, 33, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-09 23:59:59', 1, 1, NULL, NULL, 'SP2018/0030', '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(31, 34, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 00:06:12', 1, 1, NULL, NULL, 'SP2018/0031', '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(32, 36, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 08:50:30', 1, 1, NULL, NULL, 'SP2018/0032', '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(33, 37, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 08:56:49', 1, 1, NULL, NULL, 'SP2018/0033', '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(34, 38, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 11:40:14', 1, 1, NULL, NULL, 'SP2018/0034', '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(35, 39, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 12:18:15', 1, 1, NULL, NULL, 'SP2018/0035', '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(36, 40, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 12:19:39', 1, 1, NULL, NULL, 'SP2018/0036', '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(37, 41, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-10 12:28:00', 1, 1, NULL, NULL, 'SP2018/0037', '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(38, 42, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-13 13:58:42', 1, 1, NULL, NULL, 'SP2018/0038', '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(39, 43, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-13 14:11:55', 1, 1, NULL, NULL, 'SP2018/0039', '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(40, 44, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 00:41:10', 1, 1, NULL, NULL, 'SP2018/0040', '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(41, 45, 0, '72.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 22:03:04', 1, 1, NULL, NULL, 'SP2018/0041', '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(42, 46, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 22:27:56', 1, 1, NULL, NULL, 'SP2018/0042', '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(43, 47, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 22:29:21', 1, 1, NULL, NULL, 'SP2018/0043', '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(44, 48, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 22:38:34', 1, 1, NULL, NULL, 'SP2018/0044', '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(45, 49, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 22:39:00', 1, 1, NULL, NULL, 'SP2018/0045', '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(46, 50, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 23:51:56', 1, 1, NULL, NULL, 'SP2018/0046', '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(47, 51, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-16 22:53:13', 1, 1, NULL, NULL, 'SP2018/0047', '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(48, 52, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:24:30', 1, 1, NULL, NULL, 'SP2018/0048', '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(49, 53, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:31:28', 1, 1, NULL, NULL, 'SP2018/0049', '2018-08-20 03:31:28', '2018-08-20 03:31:28'),
(50, 54, 0, '8976.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:34:38', 1, 1, NULL, NULL, 'SP2018/0050', '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(51, 55, 0, '13296.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:37:14', 1, 1, NULL, NULL, 'SP2018/0051', '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(52, 56, 0, '1000000.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:42:27', 1, 3, NULL, NULL, 'PP2018/0001', '2018-08-20 03:42:27', '2018-08-20 03:42:27'),
(53, 58, 0, '160000.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:44:33', 1, 1, NULL, NULL, 'SP2018/0052', '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(54, 59, 0, '1600.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:46:43', 1, 1, NULL, NULL, 'SP2018/0053', '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(55, 60, 0, '1200.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-19 23:48:51', 1, 1, NULL, NULL, 'SP2018/0054', '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(56, 61, 0, '1600.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 15:47:58', 1, 1, NULL, NULL, 'SP2018/0055', '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(57, 62, 0, '48.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 15:48:26', 1, 1, NULL, NULL, 'SP2018/0056', '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(58, 63, 0, '24.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 15:49:02', 1, 1, NULL, NULL, 'SP2018/0057', '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(59, 64, 0, '1600.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 22:06:35', 1, 1, NULL, NULL, 'SP2018/0058', '2018-08-20 19:06:35', '2018-08-20 19:06:35'),
(60, 65, 0, '1600.00', 'cash', NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 23:58:08', 1, 1, NULL, NULL, 'SP2018/0059', '2018-08-20 20:58:08', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL,
  `unit_price_inc_tax` decimal(20,2) DEFAULT NULL,
  `item_tax` decimal(20,2) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `unit_price`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `sell_line_note`, `parent_sell_line_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, 2, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(2, 3, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(3, 4, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(4, 5, 2, 2, 7, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(5, 7, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 19:38:59', '2018-08-07 19:38:59'),
(6, 8, 2, 2, 100, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(7, 9, 2, 2, 8, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(8, 10, 2, 2, 7, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(9, 11, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(10, 12, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(11, 13, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(12, 14, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(13, 15, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(14, 16, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(15, 17, 2, 2, 2, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(16, 18, 2, 2, 2, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(17, 19, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(18, 20, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(19, 21, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(20, 22, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(21, 23, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(22, 24, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(23, 26, 2, 2, 27, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(24, 27, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(25, 28, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(26, 29, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(27, 30, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(28, 31, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(29, 32, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(30, 33, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(31, 34, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(32, 36, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(33, 37, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(34, 38, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(35, 39, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(36, 40, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(37, 41, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(38, 42, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(39, 43, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(40, 44, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(41, 45, 2, 2, 3, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(42, 46, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(43, 47, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(44, 48, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(45, 49, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(46, 50, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(47, 51, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(48, 52, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(49, 53, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 03:31:28', '2018-08-20 03:31:28'),
(50, 54, 2, 2, 60, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(51, 55, 2, 2, 83, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(52, 58, 3, 3, 100, '1600.00', '1600.00', '0.00', NULL, '', NULL, '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(53, 59, 3, 3, 1, '1600.00', '1600.00', '0.00', NULL, '', NULL, '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(54, 60, 3, 3, 1, '1200.00', '1200.00', '0.00', NULL, '', NULL, '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(55, 61, 3, 3, 1, '1600.00', '1600.00', '0.00', NULL, '', NULL, '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(56, 62, 2, 2, 2, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(57, 63, 2, 2, 1, '24.00', '24.00', '0.00', NULL, '', NULL, '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(58, 64, 3, 3, 1, '1600.00', '1600.00', '0.00', NULL, '', NULL, '2018-08-20 19:06:20', '2018-08-20 19:06:20'),
(59, 65, 3, 3, 1, '1600.00', '1600.00', '0.00', NULL, '', NULL, '2018-08-20 20:58:08', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, '2.00', '2018-08-07 18:59:24', '2018-08-07 18:59:24'),
(2, 2, NULL, 1, '1.00', '2018-08-07 19:11:36', '2018-08-07 19:11:36'),
(3, 3, NULL, 1, '1.00', '2018-08-07 19:13:43', '2018-08-07 19:13:43'),
(4, 4, NULL, 1, '7.00', '2018-08-07 19:28:26', '2018-08-07 19:28:26'),
(5, NULL, 1, 1, '10.00', '2018-08-07 19:37:26', '2018-08-07 19:37:26'),
(6, 5, NULL, 1, '1.00', '2018-08-07 19:39:00', '2018-08-07 19:39:00'),
(7, 6, NULL, 1, '100.00', '2018-08-07 19:49:03', '2018-08-07 19:49:03'),
(8, 7, NULL, 1, '8.00', '2018-08-07 20:12:54', '2018-08-07 20:12:54'),
(9, 8, NULL, 1, '7.00', '2018-08-07 22:57:21', '2018-08-07 22:57:21'),
(10, 9, NULL, 1, '1.00', '2018-08-08 02:01:44', '2018-08-08 02:01:44'),
(11, 10, NULL, 1, '1.00', '2018-08-08 02:04:43', '2018-08-08 02:04:43'),
(12, 11, NULL, 1, '1.00', '2018-08-08 02:06:27', '2018-08-08 02:06:27'),
(13, 12, NULL, 1, '1.00', '2018-08-08 02:07:16', '2018-08-08 02:07:16'),
(14, 13, NULL, 1, '1.00', '2018-08-08 02:07:45', '2018-08-08 02:07:45'),
(15, 14, NULL, 1, '1.00', '2018-08-08 12:46:43', '2018-08-08 12:46:43'),
(16, 15, NULL, 1, '2.00', '2018-08-09 02:31:38', '2018-08-09 02:31:38'),
(17, 16, NULL, 1, '2.00', '2018-08-09 02:31:39', '2018-08-09 02:31:39'),
(18, 17, NULL, 1, '1.00', '2018-08-09 02:37:43', '2018-08-09 02:37:43'),
(19, 18, NULL, 1, '1.00', '2018-08-09 02:38:13', '2018-08-09 02:38:13'),
(20, 19, NULL, 1, '1.00', '2018-08-09 02:39:43', '2018-08-09 02:39:43'),
(21, 20, NULL, 1, '1.00', '2018-08-09 03:08:42', '2018-08-09 03:08:42'),
(22, 21, NULL, 1, '1.00', '2018-08-09 03:19:45', '2018-08-09 03:19:45'),
(23, 22, NULL, 1, '1.00', '2018-08-09 04:16:21', '2018-08-09 04:16:21'),
(24, 23, NULL, 1, '27.00', '2018-08-09 05:59:41', '2018-08-09 05:59:41'),
(25, 24, NULL, 1, '1.00', '2018-08-09 06:07:16', '2018-08-09 06:07:16'),
(26, 25, NULL, 1, '1.00', '2018-08-09 06:18:17', '2018-08-09 06:18:17'),
(27, 26, NULL, 1, '1.00', '2018-08-09 20:08:30', '2018-08-09 20:08:30'),
(28, 27, NULL, 1, '1.00', '2018-08-09 20:09:09', '2018-08-09 20:09:09'),
(29, 28, NULL, 1, '1.00', '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(30, 29, NULL, 1, '1.00', '2018-08-10 03:47:22', '2018-08-10 03:47:22'),
(31, 30, NULL, 1, '1.00', '2018-08-10 03:59:59', '2018-08-10 03:59:59'),
(32, 31, NULL, 1, '1.00', '2018-08-10 04:06:12', '2018-08-10 04:06:12'),
(33, NULL, 2, 1, '456.00', '2018-08-10 12:45:42', '2018-08-10 12:45:42'),
(34, 32, NULL, 1, '1.00', '2018-08-10 12:50:30', '2018-08-10 12:50:30'),
(35, 33, NULL, 1, '1.00', '2018-08-10 12:56:49', '2018-08-10 12:56:49'),
(36, 34, NULL, 1, '1.00', '2018-08-10 15:40:14', '2018-08-10 15:40:14'),
(37, 35, NULL, 1, '1.00', '2018-08-10 16:18:15', '2018-08-10 16:18:15'),
(38, 36, NULL, 1, '1.00', '2018-08-10 16:19:39', '2018-08-10 16:19:39'),
(39, 37, NULL, 1, '1.00', '2018-08-10 16:28:00', '2018-08-10 16:28:00'),
(40, 38, NULL, 1, '1.00', '2018-08-13 17:58:42', '2018-08-13 17:58:42'),
(41, 39, NULL, 1, '1.00', '2018-08-13 18:11:55', '2018-08-13 18:11:55'),
(42, 40, NULL, 1, '1.00', '2018-08-15 04:41:10', '2018-08-15 04:41:10'),
(43, 41, NULL, 1, '3.00', '2018-08-16 02:03:04', '2018-08-16 02:03:04'),
(44, 42, NULL, 1, '1.00', '2018-08-16 02:27:56', '2018-08-16 02:27:56'),
(45, 43, NULL, 1, '1.00', '2018-08-16 02:29:21', '2018-08-16 02:29:21'),
(46, 44, NULL, 1, '1.00', '2018-08-16 02:38:34', '2018-08-16 02:38:34'),
(47, 45, NULL, 1, '1.00', '2018-08-16 02:39:00', '2018-08-16 02:39:00'),
(48, 46, NULL, 1, '1.00', '2018-08-16 03:51:56', '2018-08-16 03:51:56'),
(49, 47, NULL, 1, '1.00', '2018-08-17 02:53:13', '2018-08-17 02:53:13'),
(50, 48, NULL, 1, '1.00', '2018-08-20 03:24:30', '2018-08-20 03:24:30'),
(51, 49, NULL, 1, '1.00', '2018-08-20 03:31:29', '2018-08-20 03:31:29'),
(52, 50, NULL, 1, '60.00', '2018-08-20 03:34:38', '2018-08-20 03:34:38'),
(53, 51, NULL, 1, '83.00', '2018-08-20 03:37:14', '2018-08-20 03:37:14'),
(54, 52, NULL, 3, '100.00', '2018-08-20 03:44:33', '2018-08-20 03:44:33'),
(55, 53, NULL, 3, '1.00', '2018-08-20 03:46:43', '2018-08-20 03:46:43'),
(56, 54, NULL, 3, '1.00', '2018-08-20 03:48:51', '2018-08-20 03:48:51'),
(57, 55, NULL, 3, '1.00', '2018-08-20 19:47:58', '2018-08-20 19:47:58'),
(58, 56, NULL, 1, '2.00', '2018-08-20 19:48:26', '2018-08-20 19:48:26'),
(59, 57, NULL, 1, '1.00', '2018-08-20 19:49:02', '2018-08-20 19:49:02'),
(60, 58, NULL, 3, '1.00', '2018-08-20 19:06:20', '2018-08-20 19:06:20'),
(61, 59, NULL, 3, '1.00', '2018-08-20 20:58:08', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, 1, NULL, '2018-08-07 21:23:12', '2018-08-07 21:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ms', 'Agnes', 'Matu', 'agnes', 'agnes@gmail.com', '$2y$10$AsWXGgELWfNtKVExr.tnJ.hCxxxEth6oBQdWbJtxqYKXr8SO9f216', 'en', NULL, NULL, 'wjVYnhuX7KVFR1i7VzrFQWjYaEBOEayK7xPi7cjh074ESIZFZgR6XEqArQMY', 1, 0, '0.00', NULL, '2018-08-07 21:23:12', '2018-08-07 21:23:12'),
(2, 'Mr', 'Dennis', 'Kipkogei', 'dennis', 'denniskipkogei@gmail.com', '$2y$10$3k.EIKYgs1uLvuNQEnigF.lyxuC5V7W.zv/0xNlSPlvlS.9x04.fC', 'en', NULL, NULL, NULL, 1, 0, '0.00', NULL, '2018-08-07 18:55:34', '2018-08-07 20:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `default_purchase_price` decimal(20,2) DEFAULT NULL,
  `dpp_inc_tax` decimal(20,2) NOT NULL DEFAULT '0.00',
  `profit_percent` decimal(20,2) NOT NULL DEFAULT '0.00',
  `default_sell_price` decimal(20,2) DEFAULT NULL,
  `sell_price_inc_tax` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'DUMMY', 2, '0002', 2, '16.00', '16.00', '50.00', '24.00', '24.00', '2018-08-07 18:58:51', '2018-08-07 18:58:51', NULL),
(3, 'DUMMY', 3, '0003', 3, '1000.00', '1000.00', '60.00', '1600.00', '1600.00', '2018-08-20 03:39:37', '2018-08-20 03:42:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, 1, '190.00', '2018-08-07 18:59:00', '2018-08-20 19:49:02'),
(2, 3, 3, 3, 1, '895.00', '2018-08-20 03:44:09', '2018-08-20 20:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
