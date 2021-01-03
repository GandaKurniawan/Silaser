-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2020 at 06:39 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silaser_trpl`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `users_id`, `products_id`, `quantity`, `session_id`, `created_at`, `updated_at`) VALUES
(121, 1, 44, 1, 'X8bv4FiAxtnPdUwupbgCbcljzjkeY97WJDAnfEwo', '2020-12-03 03:06:05', '2020-12-03 03:06:05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(12, 'HDD/SSD', '2018-10-22 21:32:33', '2018-11-16 02:00:00'),
(10, 'LCD', '2018-10-22 21:31:29', '2020-12-21 04:49:45'),
(11, 'RAM', '2018-10-22 21:32:14', '2018-11-16 02:07:15'),
(13, 'VGA', '2018-10-22 21:33:26', '2018-11-16 02:05:43'),
(14, 'Motherboard', '2018-10-22 21:34:31', '2018-11-16 02:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Coupon001', 10, 'Persentase', '2021-12-06', 1, '2018-12-05 20:19:15', '2018-12-05 20:19:15'),
(7, '50persen', 50, 'Persentase', '2020-12-31', 1, '2020-11-18 21:06:41', '2020-11-18 21:06:41'),
(11, 'newmember', 34, 'Persentase', '2020-12-31', 1, '2020-12-20 17:04:16', '2020-12-20 17:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `expeditions`
--

CREATE TABLE `expeditions` (
  `id` int(11) NOT NULL,
  `expedition_name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `estimation` varchar(30) NOT NULL,
  `base_charge` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expeditions`
--

INSERT INTO `expeditions` (`id`, `expedition_name`, `type`, `estimation`, `base_charge`, `created_at`, `updated_at`) VALUES
(1, 'Pos Indonesia', 'Express Next Day', '1-2 hari', 10000, '2020-11-15 06:39:23', NULL),
(2, 'J&T Express', 'EZ', '2-3 hari', 7000, '2020-11-15 06:39:28', NULL),
(3, 'JNE Express', 'CTC', '2-3 hari', 6000, '2020-11-15 06:39:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from`, `to`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 'Optio eos quae placeat ut.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(2, 8, 13, 'Iste animi dignissimos laudantium perferendis aut nulla dolorem.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(3, 14, 5, 'Eveniet quia rem ut laboriosam.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(4, 2, 17, 'Adipisci earum sed eaque dicta minus commodi voluptatem aut.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(5, 13, 10, 'Ratione totam quas deserunt quis placeat.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(6, 29, 20, 'Expedita ut occaecati rem iure harum qui.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(7, 10, 20, 'Placeat quis hic facilis dicta aut id.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(8, 17, 13, 'Occaecati molestiae amet ducimus fugit vitae.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(9, 25, 1, 'Dolorem est velit exercitationem quibusdam omnis officiis doloribus ut.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:05'),
(10, 4, 6, 'Eos voluptatem placeat omnis unde.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(11, 8, 16, 'Nostrum a quo explicabo dicta.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(12, 2, 21, 'Non numquam est aut.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(13, 26, 2, 'Placeat non dolor voluptate incidunt accusantium asperiores nulla qui.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(14, 27, 15, 'Vel quam alias labore repudiandae.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(15, 5, 13, 'Voluptas temporibus atque adipisci consequuntur.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(16, 23, 3, 'Esse adipisci harum sed perferendis.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(17, 20, 14, 'Culpa dolorem numquam sit inventore est.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(18, 15, 17, 'Vitae qui dignissimos nemo error ut fuga.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(19, 27, 30, 'Nihil reiciendis quia cumque occaecati ut omnis est.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(20, 11, 19, 'Corrupti dolores omnis occaecati.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(21, 6, 3, 'Magni modi et libero vel totam.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(22, 18, 5, 'Quaerat voluptas tempore qui non voluptas suscipit.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(23, 13, 29, 'Velit impedit aperiam aliquid aperiam sed alias minima in.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(24, 19, 1, 'Aliquam optio totam molestiae vel beatae non repellendus.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:06'),
(25, 30, 10, 'Delectus cupiditate dolorem quis ut.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(26, 5, 16, 'Perspiciatis nulla officiis quaerat aliquid voluptatum rerum maiores.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(27, 10, 15, 'Voluptatem doloremque voluptatem eum.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(28, 23, 20, 'Amet minus est id qui nemo labore accusamus.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(29, 9, 12, 'Et modi qui id nam pariatur tempora.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(30, 27, 9, 'Aut expedita corporis ea aut.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(31, 20, 30, 'Porro ea recusandae dolorum est.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(32, 29, 19, 'Assumenda quia sunt a quas atque impedit assumenda.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(33, 15, 1, 'Accusantium omnis voluptas praesentium velit molestiae.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:06'),
(34, 6, 3, 'Iste pariatur totam non voluptatum cumque ut.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(35, 14, 3, 'Quod ut et mollitia aliquid nihil veniam.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(36, 24, 22, 'Quasi fugit molestiae quia neque.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(37, 12, 21, 'Nostrum fugiat asperiores autem velit voluptatum.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(38, 3, 17, 'Modi voluptatibus commodi quae in ex excepturi.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(39, 16, 30, 'Nesciunt dolorum ut assumenda sit voluptas corrupti ducimus.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(40, 14, 19, 'Maiores porro ex sed et aut vel.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(41, 8, 11, 'Qui id et dolorem aperiam assumenda expedita.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(42, 8, 19, 'Amet consequuntur aperiam voluptas dolor ad.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(43, 27, 15, 'Officia quasi enim illum omnis ut aut et.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(44, 20, 7, 'Nulla iusto perferendis debitis incidunt similique numquam qui.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(45, 2, 19, 'Temporibus dolorem labore aliquam.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(46, 29, 22, 'Corporis vitae ut earum qui sunt accusamus qui consequatur.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(47, 25, 9, 'Sit rerum voluptatem accusamus fugiat et reiciendis aliquid.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(48, 5, 17, 'Aspernatur corrupti et velit ipsam non quidem optio.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(49, 25, 7, 'Ipsam ipsum ullam voluptas esse quae perspiciatis.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(50, 8, 4, 'Autem aut dignissimos consequatur reiciendis.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(51, 22, 14, 'Sint fugiat ut voluptatem reprehenderit labore.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(52, 14, 21, 'Pariatur tempora corrupti minima aspernatur delectus.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(53, 14, 25, 'Natus debitis blanditiis ea sunt.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(54, 7, 28, 'Distinctio beatae nesciunt vero accusamus quos maiores consectetur.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(55, 13, 24, 'Laboriosam quidem exercitationem quia adipisci consectetur voluptate harum.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(56, 11, 2, 'Et veniam eligendi vel molestias nihil temporibus quae.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(57, 3, 6, 'Cupiditate officia praesentium ipsa nesciunt dolorem quae occaecati incidunt.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(58, 13, 14, 'Tenetur fuga a iure earum et excepturi.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(59, 28, 12, 'Consequatur quia ad eius illum.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(60, 11, 2, 'Ut quo aut quos est ab eveniet quis.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(61, 6, 28, 'Perspiciatis eos deserunt nemo ratione error magnam at aliquam.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(62, 4, 29, 'Eum velit eos illo.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(63, 28, 22, 'Vero odit officiis enim enim.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(64, 12, 1, 'Vitae numquam repudiandae cumque nemo pariatur unde totam.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(65, 30, 9, 'Enim numquam possimus non odit inventore.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(66, 8, 21, 'Nostrum recusandae adipisci minus.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(67, 10, 8, 'Et dolor quaerat saepe nulla eveniet qui.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(68, 28, 2, 'Et et quasi sunt.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(69, 23, 11, 'Est et enim illo incidunt.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(70, 7, 24, 'Ea quo molestiae cumque molestias ratione laudantium.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(71, 23, 5, 'Odit corporis nihil placeat itaque non adipisci.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(72, 13, 3, 'Nam blanditiis consequatur dignissimos.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(73, 3, 30, 'In necessitatibus eveniet autem atque facere.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(74, 10, 30, 'Ea voluptatibus vero minus rerum.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(75, 17, 28, 'Quis sit quasi corrupti laborum eveniet.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(76, 29, 3, 'At ea quae quia officia quod quia laudantium.', 1, '2020-11-23 17:48:03', '2020-11-23 20:55:46'),
(77, 8, 7, 'Quia aspernatur ex aliquam possimus eum necessitatibus sed.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(78, 19, 18, 'Nobis asperiores ipsam et quibusdam.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(79, 16, 21, 'Mollitia perspiciatis quidem voluptas eum veritatis.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(80, 19, 1, 'Nam qui nesciunt sint officia.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:06'),
(81, 10, 16, 'Reprehenderit quas in nam voluptas eveniet labore.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(82, 15, 28, 'Ipsam explicabo asperiores laudantium rerum eaque magni aspernatur.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(83, 9, 3, 'Nam repellat quasi eos labore veniam.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(84, 28, 24, 'Porro voluptas voluptatibus eum velit iste impedit.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(85, 9, 18, 'Possimus provident beatae consequatur ex accusantium at.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(86, 12, 14, 'Officia et autem odit eum et aut pariatur.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(87, 10, 14, 'Sit accusamus laboriosam nostrum.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(88, 27, 22, 'Est ab ut reiciendis sit nesciunt.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(89, 16, 27, 'Occaecati est quia sint quia fugiat temporibus assumenda magni.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(90, 15, 14, 'Voluptatem et incidunt et ut nam enim dolores.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(91, 9, 11, 'Illum mollitia quia architecto libero.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(92, 26, 22, 'Et consequatur excepturi officia.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(93, 19, 23, 'Laborum quasi doloremque modi voluptate et consequatur aut.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(94, 16, 3, 'Qui harum nisi ut voluptatibus.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(95, 4, 1, 'Consequatur rerum cumque optio fugiat non optio.', 1, '2020-11-23 17:48:03', '2020-12-02 08:29:19'),
(96, 2, 17, 'Voluptas eum eos id ab.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(97, 24, 1, 'Et quis soluta sunt autem.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:04'),
(98, 30, 14, 'Dignissimos aperiam a et corporis vel qui sint.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(99, 10, 2, 'Dolor consequatur dolorem est voluptatem repellat quae amet necessitatibus.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(100, 7, 2, 'Tempora voluptatem laborum hic repudiandae et sit repellat.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(101, 2, 14, 'Numquam eius dicta minus nemo modi consequatur autem.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(102, 20, 7, 'Autem assumenda eius debitis aut molestias consequatur quaerat.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(103, 24, 13, 'Eos harum iusto corporis et sed aut quis.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(104, 7, 29, 'Et dolorem est nulla qui quia sed.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(105, 3, 23, 'Nam ut soluta nesciunt voluptatem repellat.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(106, 17, 19, 'Nulla voluptas blanditiis at sit harum aut.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(107, 7, 10, 'Id rem sint molestiae non ea magnam rerum.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(108, 29, 19, 'Quas dolor ut officiis veniam enim doloremque quod.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(109, 2, 30, 'Quam suscipit voluptatibus sapiente corrupti optio eius numquam.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(110, 1, 28, 'Sint ut et sit.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(111, 2, 29, 'Sint ut totam earum ratione accusamus quia voluptatum vel.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(112, 15, 1, 'Est ipsam et ut nemo qui a.', 1, '2020-11-23 17:48:03', '2020-11-23 18:14:06'),
(113, 10, 13, 'Eos sit ex vero nesciunt et.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(114, 30, 13, 'Quia pariatur asperiores similique commodi maiores quo cupiditate autem.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(115, 8, 16, 'Quia quos quae commodi ut qui ut dignissimos.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(116, 8, 9, 'Hic molestiae doloribus voluptatem non mollitia.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(117, 5, 13, 'Ut natus autem eos praesentium.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(118, 18, 23, 'Molestiae itaque qui ea qui doloribus aut.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(119, 28, 5, 'Explicabo dicta consequatur reiciendis dolorem.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(120, 2, 10, 'Modi sit nulla ea et ut.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(121, 15, 16, 'Eaque exercitationem repellat qui.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(122, 13, 7, 'Voluptatum earum et omnis.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(123, 23, 3, 'Dolore sit ducimus suscipit iste.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(124, 25, 17, 'Et maiores et nesciunt nemo.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(125, 19, 22, 'Sed distinctio qui nihil iste deleniti.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(126, 26, 17, 'Voluptatibus sed dolor vitae magnam placeat voluptas.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(127, 18, 15, 'Fuga corporis ratione at.', 1, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(128, 6, 11, 'At illum dolor suscipit animi illum enim.', 0, '2020-11-23 17:48:03', '2020-11-23 17:48:03'),
(129, 23, 28, 'Laborum maxime non minus minus dolorem modi.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(130, 11, 17, 'Explicabo architecto non suscipit exercitationem rerum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(131, 11, 14, 'Quisquam at temporibus rem ut minima saepe.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(132, 11, 3, 'Sed commodi cupiditate perspiciatis alias maxime ipsam odit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(133, 16, 13, 'Molestiae dignissimos et fugit et quidem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(134, 23, 10, 'Sunt ea minus reprehenderit amet ex non corporis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(135, 14, 8, 'Aut optio architecto atque enim ea eum corporis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(136, 1, 27, 'Numquam ut modi voluptas.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(137, 23, 11, 'Rem velit eos est corrupti facilis in enim.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(138, 10, 3, 'Minus ex maiores incidunt aspernatur numquam quia at.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(139, 20, 9, 'Et dolore nihil nisi sunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(140, 23, 4, 'Adipisci voluptatem qui possimus dolor aliquam nam ipsum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(141, 13, 25, 'Et voluptatibus illo minus vitae repellendus veniam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(142, 15, 19, 'Quia consequatur sunt culpa voluptas.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(143, 27, 26, 'Suscipit quo et eaque iusto qui ut ab.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(144, 6, 23, 'Autem animi voluptatem ut dolor quis dolor sit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(145, 15, 26, 'Quae reprehenderit saepe totam aut illo consequatur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(146, 21, 15, 'Et sunt harum aut delectus repudiandae quia accusamus.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(147, 4, 26, 'Quis voluptas aut perspiciatis vero laborum vero.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(148, 16, 28, 'Excepturi eius delectus esse eligendi harum pariatur nihil quam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(149, 4, 10, 'Molestiae numquam qui repellat vero.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(150, 29, 9, 'Doloribus quisquam dolores eum ipsa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(151, 9, 5, 'Eligendi beatae porro aut non veritatis unde natus.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(152, 8, 2, 'Quas eum et enim mollitia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(153, 22, 19, 'Et non voluptas delectus libero in accusamus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(154, 22, 30, 'Et placeat quidem vitae est iusto odit molestiae voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(155, 3, 5, 'Libero eligendi aut nulla ratione aut explicabo.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(156, 7, 30, 'Voluptatem perferendis occaecati voluptas.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(157, 29, 9, 'Voluptatum dolores voluptates aut neque blanditiis qui quam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(158, 18, 17, 'Id dolor alias deleniti velit dolore.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(159, 14, 17, 'Atque harum illum est totam non.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(160, 19, 24, 'Quisquam aliquid qui nobis nemo eligendi et aut.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(161, 15, 10, 'Dignissimos dolorem nemo et quia qui et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(162, 7, 3, 'Molestiae suscipit voluptatem nulla quam aut dolores et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(163, 23, 10, 'Similique atque unde tempore quam impedit repellendus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(164, 13, 7, 'Iure eos quia veritatis dolor.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(165, 23, 8, 'Exercitationem at voluptatem qui et placeat enim.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(166, 1, 4, 'Debitis voluptatem ab qui distinctio qui beatae nemo.', 1, '2020-11-23 17:48:04', '2020-12-02 11:30:01'),
(167, 20, 19, 'Similique illo non ipsum ad.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(168, 2, 11, 'Quo ut consequatur in vel cumque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(169, 2, 26, 'Quaerat velit quos laudantium sed voluptatum iusto.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(170, 1, 26, 'Ad vitae et fugiat ea eum impedit doloribus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(171, 14, 23, 'Deserunt libero magni qui aut.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(172, 18, 10, 'Consequatur laborum libero consequatur vel.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(173, 7, 19, 'Quisquam quo sed placeat veritatis consequatur qui.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(174, 21, 15, 'Explicabo quidem dolores ratione enim tenetur voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(175, 17, 27, 'Adipisci nam sapiente velit cum recusandae quisquam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(176, 13, 11, 'Debitis incidunt voluptatem esse soluta.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(177, 26, 25, 'Eaque incidunt repellat aliquid sit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(178, 23, 15, 'Ducimus nulla ex culpa amet ut voluptates.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(179, 26, 16, 'Est facere sed perferendis molestias.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(180, 26, 16, 'Et dolores et ut vero ipsam eos distinctio sed.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(181, 5, 23, 'Architecto eos dignissimos odio ut assumenda eveniet a.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(182, 22, 18, 'Inventore molestiae fugit dolorem delectus eos magni.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(183, 8, 22, 'Voluptate voluptatem aperiam quaerat nostrum voluptas in.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(184, 29, 17, 'Voluptates tenetur dolor qui rerum numquam omnis dicta.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(185, 25, 13, 'Magni aliquid omnis maxime neque et adipisci esse.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(186, 23, 1, 'Velit non dicta numquam atque eum voluptas quae.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(187, 7, 2, 'Molestiae recusandae voluptatem et quo et inventore.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(188, 30, 29, 'Magni expedita ut in nemo.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(189, 28, 12, 'Fugit libero sed ea aspernatur optio dolores quis vero.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(190, 26, 16, 'Omnis necessitatibus provident quidem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(191, 30, 20, 'Impedit cupiditate necessitatibus qui blanditiis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(192, 15, 10, 'Repudiandae ut in voluptate est et et tempore tempora.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(193, 27, 19, 'Quis repudiandae ut voluptates sit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(194, 7, 13, 'Ea molestiae occaecati aut quo at labore.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(195, 16, 24, 'Unde tenetur aliquam aut aut cupiditate consequuntur est.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(196, 15, 11, 'Laborum ut perferendis voluptatem aut nihil.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(197, 21, 9, 'Quibusdam rerum veniam necessitatibus enim consectetur reprehenderit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(198, 1, 30, 'Qui ea a occaecati perferendis dignissimos.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(199, 24, 7, 'Est aperiam doloremque dicta ea iure eum dolorem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(200, 23, 22, 'Veniam corrupti dignissimos qui harum tempore.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(201, 24, 14, 'A est enim dolores velit nemo voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(202, 8, 7, 'Modi quia reprehenderit repellat et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(203, 26, 9, 'Est ipsum sint at.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(204, 13, 11, 'Nisi aut et cupiditate accusantium ullam sed qui.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(205, 3, 5, 'Eum quia aut culpa libero.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(206, 4, 5, 'Repellendus eum sit sequi qui.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(207, 28, 15, 'Voluptates aut dolorem reprehenderit necessitatibus voluptas quis non.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(208, 2, 23, 'Commodi illum officiis officiis alias temporibus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(209, 9, 29, 'Eveniet est dolore accusantium.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(210, 7, 15, 'Vel facere nostrum quisquam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(211, 28, 24, 'Minus aspernatur natus nisi rerum et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(212, 3, 4, 'Et et distinctio similique velit aut culpa iste.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(213, 16, 18, 'Corporis alias voluptas sequi qui consequatur et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(214, 16, 4, 'Et recusandae et assumenda reiciendis facere minima atque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(215, 24, 1, 'Ipsa recusandae est et et eius ut doloribus aperiam.', 1, '2020-11-23 17:48:04', '2020-11-23 18:14:04'),
(216, 7, 19, 'A eos dolores quae in nihil omnis aut amet.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(217, 9, 11, 'Ad qui ut et minus omnis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(218, 26, 20, 'Voluptate blanditiis eligendi commodi vel quis necessitatibus explicabo.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(219, 11, 15, 'Aliquam aspernatur laudantium impedit sequi dolor rerum ratione qui.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(220, 6, 18, 'Pariatur consequatur autem laboriosam doloremque culpa quisquam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(221, 3, 26, 'Tempore facere atque adipisci iusto.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(222, 19, 8, 'Deleniti sint aperiam facilis vel aut ducimus magni.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(223, 25, 28, 'Est odio voluptate maxime voluptatibus amet.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(224, 25, 19, 'Assumenda porro officiis reprehenderit saepe dolorum quaerat dolores.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(225, 20, 16, 'Voluptas temporibus ad quod sunt earum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(226, 30, 12, 'Qui autem doloremque totam maiores.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(227, 6, 30, 'Assumenda et eum ipsum quo omnis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(228, 17, 6, 'Voluptatum qui nesciunt exercitationem quae autem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(229, 22, 14, 'Perspiciatis sit qui sint culpa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(230, 4, 10, 'Debitis earum et necessitatibus provident.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(231, 4, 8, 'Suscipit odio inventore voluptate eum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(232, 24, 23, 'Facere distinctio rerum qui consequuntur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(233, 29, 1, 'Expedita nisi similique et soluta molestiae.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(234, 10, 1, 'Veritatis possimus sint omnis facere sint.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(235, 16, 10, 'Ipsum porro impedit impedit et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(236, 18, 22, 'Eligendi vitae et qui soluta.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(237, 4, 7, 'Maxime ducimus nihil minima vel accusantium aut porro.', 1, '2020-11-23 17:48:04', '2020-12-21 05:30:00'),
(238, 18, 20, 'Quo quasi quos assumenda vitae fuga aut commodi.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(239, 8, 13, 'Cum natus possimus distinctio quae voluptas.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(240, 3, 18, 'Eum quaerat illo qui ad.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(241, 4, 23, 'Ipsam vel quod suscipit quo commodi.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(242, 10, 20, 'Similique laboriosam dolorem debitis in quo quis facilis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(243, 27, 30, 'Deleniti officiis quo illum ratione.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(244, 22, 9, 'Ab fugit aliquam facere autem velit eaque et quidem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(245, 1, 20, 'Maiores qui voluptatem rem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(246, 17, 5, 'Qui voluptatibus ad corrupti odio voluptatum sit quos.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(247, 4, 12, 'Explicabo qui quidem illum deserunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(248, 6, 26, 'Rem eaque est omnis adipisci vel laudantium autem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(249, 9, 23, 'Nulla et qui laborum veniam voluptas quidem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(250, 30, 24, 'Omnis reiciendis sed debitis maxime ad odit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(251, 30, 8, 'Temporibus velit facilis numquam tempore.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(252, 10, 8, 'Rerum excepturi dolor hic doloribus est.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(253, 11, 20, 'Quaerat ut eum et saepe.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(254, 16, 25, 'Hic quasi aliquam ea omnis similique sed voluptas.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(255, 11, 9, 'Quis hic dolorum enim quisquam quisquam mollitia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(256, 24, 13, 'Dolor perferendis quasi suscipit maxime aut.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(257, 13, 21, 'Impedit perferendis cum qui itaque et amet.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(258, 23, 25, 'Cupiditate velit eaque doloremque dolorem occaecati molestias temporibus voluptatem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(259, 4, 21, 'Aspernatur eum excepturi distinctio et amet sapiente.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(260, 4, 9, 'Explicabo et sit est.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(261, 13, 28, 'Deleniti totam magnam corporis omnis debitis sunt.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(262, 15, 3, 'Cumque vel voluptatem fugiat delectus.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(263, 26, 29, 'Et quas laborum dolorem quia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(264, 9, 20, 'Tenetur assumenda voluptas dolor vitae mollitia.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(265, 16, 5, 'Ducimus est deleniti fugit aliquid et reprehenderit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(266, 16, 9, 'Omnis magnam explicabo nulla.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(267, 14, 5, 'Deleniti tempora deserunt temporibus cumque impedit nemo reiciendis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(268, 23, 9, 'Nobis ad animi eum perferendis quia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(269, 22, 7, 'Quam est quo sed voluptatem nesciunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(270, 25, 21, 'Odio temporibus molestiae nulla deserunt recusandae quos et eveniet.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(271, 2, 10, 'Corporis blanditiis occaecati consequuntur laborum incidunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(272, 18, 25, 'Architecto quaerat et debitis totam itaque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(273, 17, 2, 'Tempore qui voluptatem ipsum non in qui qui dignissimos.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(274, 23, 12, 'Aspernatur nihil excepturi beatae quisquam laudantium et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(275, 21, 13, 'Sit et vel odio.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(276, 19, 22, 'Est fugit voluptatum consequatur consequatur id.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(277, 7, 23, 'Qui eaque aperiam culpa illo ex repellendus nihil.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(278, 23, 26, 'Mollitia ut voluptatem tempora consectetur voluptas.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(279, 9, 12, 'Qui error asperiores velit dolores voluptatibus ducimus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(280, 15, 1, 'Iusto fugiat qui pariatur voluptas et.', 1, '2020-11-23 17:48:04', '2020-11-23 18:14:06'),
(281, 13, 19, 'Dolores aliquam et beatae eligendi ut qui.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(282, 18, 23, 'Velit eum est officia dolore voluptates quam nulla.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(283, 18, 7, 'Dignissimos nisi laudantium recusandae ut illo sunt debitis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(284, 11, 17, 'Repellat ex earum cum dolorem enim voluptas.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(285, 26, 15, 'Rerum molestiae voluptatum corrupti.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(286, 8, 3, 'Ut et et necessitatibus neque autem ad aut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(287, 9, 24, 'Temporibus qui enim ullam qui.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(288, 18, 3, 'Eum assumenda quis labore est aliquid.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(289, 24, 21, 'Omnis repellendus sed doloribus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(290, 17, 13, 'Consectetur doloremque magnam labore id nemo accusamus illum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(291, 10, 14, 'Consequatur dolor et optio consequuntur asperiores.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(292, 5, 23, 'Incidunt autem nulla id.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(293, 9, 3, 'Molestias minus consequatur non et a illo voluptatibus sunt.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(294, 19, 18, 'Autem officia eius rem ex.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(295, 25, 1, 'Vel exercitationem quam dolor quo.', 1, '2020-11-23 17:48:04', '2020-11-23 18:14:05'),
(296, 12, 17, 'Aliquam et vel sapiente quae exercitationem quia occaecati.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(297, 8, 27, 'Odio temporibus eaque iste cum enim.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(298, 19, 23, 'A veritatis vel dolores eligendi omnis omnis magnam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(299, 29, 24, 'Nostrum nostrum veniam dolores.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(300, 17, 14, 'Dolorem totam est sapiente.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(301, 13, 10, 'Consequuntur eius recusandae fuga rerum voluptates quam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(302, 14, 12, 'Nihil rem ipsum doloribus velit voluptate necessitatibus perferendis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(303, 18, 12, 'Dignissimos necessitatibus nulla molestias expedita exercitationem sit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(304, 4, 8, 'Non sit molestiae unde quae incidunt pariatur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(305, 19, 6, 'Ab deserunt non ut id voluptates officia.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(306, 17, 29, 'Ipsum nemo porro veniam illo non enim dolores.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(307, 23, 7, 'Quis voluptas sunt natus quo excepturi odio ipsam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(308, 20, 23, 'Et fuga aut consequuntur quia tempore.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(309, 4, 22, 'Aut quaerat similique id omnis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(310, 22, 6, 'Ullam est ipsa voluptates voluptas ipsam accusantium.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(311, 20, 15, 'Nostrum ipsum quia est itaque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(312, 28, 12, 'Odio excepturi vel perferendis doloribus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(313, 30, 16, 'Ut quia voluptate eos mollitia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(314, 19, 16, 'Odio qui ipsam voluptatem non.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(315, 21, 12, 'Quas dolores esse ipsam est.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(316, 12, 25, 'Dolor sit explicabo reiciendis odit et ratione.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(317, 20, 2, 'Accusantium nihil perferendis laborum vero quisquam quo.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(318, 27, 9, 'Nihil iste voluptates facilis non.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(319, 22, 5, 'Sunt suscipit quas nihil facilis labore est qui neque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(320, 12, 3, 'Ipsam corporis consequuntur praesentium.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(321, 10, 11, 'Est nam maxime itaque vel harum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(322, 4, 5, 'Laboriosam iusto sint molestiae inventore explicabo et dolor.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(323, 22, 7, 'Voluptatem velit qui dicta quas natus molestiae quo.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(324, 26, 12, 'Cumque labore nesciunt accusantium error blanditiis aliquam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(325, 21, 25, 'Facere labore nihil incidunt non occaecati.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(326, 4, 27, 'Id iure voluptas velit libero esse voluptatem sint.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(327, 15, 6, 'Molestias in eaque quia porro et asperiores voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(328, 4, 10, 'Inventore et voluptatem sapiente atque et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(329, 5, 11, 'Sed tempora aut neque repellat ea nostrum et nam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(330, 3, 18, 'Ut quae natus dolores.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(331, 25, 22, 'Deserunt praesentium debitis odio consequatur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(332, 9, 12, 'Maxime consectetur explicabo hic modi.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(333, 5, 7, 'Tenetur nihil voluptate et laudantium.', 1, '2020-11-23 17:48:04', '2020-12-02 11:58:43'),
(334, 8, 26, 'Laboriosam non similique voluptatibus corrupti laudantium ducimus quis voluptatibus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(335, 3, 14, 'Saepe beatae at vitae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(336, 24, 2, 'Ut non cum minus qui.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(337, 7, 6, 'In repellat quibusdam cupiditate assumenda neque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(338, 17, 15, 'Adipisci culpa sunt consectetur minus aut quo.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(339, 2, 6, 'Sed voluptas quo a iste.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(340, 24, 20, 'Sit voluptatem deleniti ea consequatur ea exercitationem eveniet.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(341, 5, 23, 'Consequatur quaerat ea assumenda quae nam enim aliquam rerum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(342, 22, 9, 'Aliquid tenetur in adipisci iusto atque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(343, 3, 29, 'Tempora ut eveniet unde dolores omnis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(344, 3, 17, 'Dolorum aperiam enim rem voluptate quia.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(345, 4, 20, 'Voluptate dignissimos voluptates minima sunt unde ipsa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(346, 18, 4, 'Molestiae labore et mollitia ipsa debitis laborum alias.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(347, 30, 1, 'Nulla consequatur qui dignissimos fugit earum.', 1, '2020-11-23 17:48:04', '2020-11-23 18:14:04'),
(348, 16, 10, 'Rem quibusdam perferendis fugit quia dolor.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(349, 11, 29, 'Corporis vero sunt tempore magni molestiae aut sit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(350, 23, 19, 'Ipsa fugiat qui voluptatem autem odit inventore quam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(351, 19, 6, 'Dolores modi fuga reprehenderit voluptatibus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(352, 27, 26, 'Nam porro sunt iure commodi quisquam voluptatem illum ratione.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(353, 15, 27, 'Distinctio labore quia minima debitis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(354, 19, 8, 'Sequi reprehenderit autem quia et porro distinctio quas libero.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(355, 25, 19, 'Aut ut libero corrupti optio accusantium dolorum sed perspiciatis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(356, 5, 21, 'Saepe est corporis recusandae et provident.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(357, 4, 24, 'Rem porro dignissimos animi eligendi error aut perferendis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(358, 12, 26, 'Eius sed sit qui eum perferendis amet.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(359, 27, 9, 'Eligendi eos inventore possimus nesciunt magni.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(360, 23, 18, 'Deserunt omnis sit in tempora deleniti veritatis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(361, 19, 16, 'Ab vel quasi vel exercitationem molestiae dolore consequatur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(362, 16, 29, 'Magnam quisquam est ad aspernatur voluptates praesentium.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(363, 6, 1, 'Saepe eveniet voluptatem sed quia in.', 1, '2020-11-23 17:48:04', '2020-12-01 22:58:26'),
(364, 20, 4, 'Sunt est cum quo nihil.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(365, 9, 23, 'Doloribus odit eum quaerat necessitatibus quaerat est molestiae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(366, 16, 13, 'Saepe eos et consectetur et dolores atque voluptas.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(367, 10, 9, 'Ullam minus quis libero aut.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(368, 9, 10, 'Odit veniam eos quo aut.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(369, 20, 4, 'Enim magni dolor et ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(370, 27, 5, 'Tempora aliquid quibusdam voluptatum sed dolorum voluptatem.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(371, 30, 26, 'Deserunt et sed architecto.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(372, 28, 17, 'Fuga magnam et cum vel.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(373, 16, 29, 'Ullam libero omnis facilis sint aut perspiciatis ipsa.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(374, 3, 5, 'Facere vero harum debitis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(375, 17, 3, 'Eveniet voluptate quo nihil odit nostrum eaque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(376, 7, 5, 'Voluptatem labore officiis iste quaerat.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(377, 2, 3, 'Totam ut placeat dolorem repudiandae qui dolorem vitae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(378, 16, 17, 'Maxime ea similique est velit accusamus corporis non.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(379, 7, 4, 'Quis voluptas alias odio accusantium eos dolores non.', 1, '2020-11-23 17:48:04', '2020-12-21 05:30:00'),
(380, 27, 25, 'Repellendus cum consequatur maxime quis rerum amet.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(381, 1, 24, 'Doloremque aut autem maxime quia quo ea.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(382, 3, 14, 'Ut molestiae id at quo neque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(383, 20, 15, 'Et rerum ipsa rerum provident nobis numquam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(384, 7, 28, 'Est veniam sunt delectus veritatis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(385, 13, 25, 'Culpa necessitatibus alias et a et sint.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(386, 26, 8, 'Asperiores dolorem maxime ea in libero et sunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(387, 25, 19, 'Soluta sapiente facilis commodi quos quo.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(388, 2, 28, 'Laborum id et odit ducimus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(389, 12, 7, 'Est quis quos sed iusto.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(390, 16, 9, 'Quis est itaque ipsam explicabo dolor.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(391, 24, 29, 'Voluptatem excepturi qui ut id.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(392, 25, 3, 'Incidunt et amet iusto dolorum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(393, 6, 20, 'Quisquam est dolor distinctio mollitia et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(394, 16, 10, 'Blanditiis suscipit qui nisi et ab.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(395, 26, 27, 'Et ut aut ut minima ducimus neque ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(396, 19, 27, 'Magni vel molestiae dolores excepturi ipsa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(397, 2, 13, 'Est voluptatem harum ad qui eos minima.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(398, 16, 4, 'Est atque enim enim neque dicta pariatur aspernatur accusamus.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(399, 27, 2, 'Voluptas a qui repellendus qui culpa sunt.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(400, 29, 17, 'Quo non sed voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(401, 3, 4, 'Voluptate aspernatur voluptatem consequatur sapiente et dignissimos.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(402, 2, 14, 'Excepturi dicta voluptates vel amet sed nobis nesciunt dolore.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(403, 7, 28, 'Laboriosam et voluptatibus consequuntur sunt qui ea.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(404, 12, 1, 'Beatae rerum voluptatem error ad deserunt ipsum quibusdam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(405, 17, 27, 'Voluptatem harum beatae maxime ut dolor in nihil.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(406, 30, 14, 'Id itaque fugit exercitationem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(407, 4, 17, 'Laudantium tenetur dolores omnis pariatur.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(408, 11, 17, 'Aut molestias omnis unde culpa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(409, 18, 7, 'Velit labore est doloremque sit tempore rerum maiores.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(410, 4, 14, 'Cum officiis debitis et porro nobis.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(411, 28, 15, 'Eligendi animi qui qui aliquid quam illum ad corporis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(412, 20, 11, 'Minus praesentium eum tempore deserunt laborum ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(413, 25, 30, 'Facilis fugiat molestias possimus rerum consequatur necessitatibus.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(414, 21, 5, 'Sit nobis officiis et consequatur fugit suscipit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(415, 6, 8, 'Expedita est est rerum esse aut corrupti quod.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(416, 4, 11, 'Beatae similique quos distinctio et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(417, 27, 23, 'Neque exercitationem voluptas debitis corrupti neque tempora possimus assumenda.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(418, 26, 13, 'Nulla dolor est reiciendis qui.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(419, 4, 1, 'Velit eligendi minima est minima aut.', 1, '2020-11-23 17:48:04', '2020-12-02 08:29:19'),
(420, 9, 3, 'Recusandae eveniet vero rerum est esse aut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(421, 24, 2, 'Adipisci iure quas at in error sit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(422, 23, 6, 'Ut eaque omnis quisquam voluptas cupiditate dolor.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(423, 5, 11, 'Accusamus architecto consectetur ratione quis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(424, 20, 19, 'Delectus quam dicta saepe impedit assumenda voluptas in.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(425, 6, 14, 'Dignissimos est doloremque cumque et ex.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(426, 6, 27, 'Est aspernatur debitis doloremque voluptatem ipsa laboriosam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(427, 16, 7, 'Illo repudiandae blanditiis sit molestias a dolores aspernatur.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(428, 13, 9, 'Iusto ut nam sunt provident quis aut voluptatem aperiam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(429, 14, 4, 'Culpa aspernatur est ipsa quis sint quis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(430, 30, 15, 'In aut ut soluta reiciendis ut ut a ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(431, 3, 19, 'Quos optio aperiam aut provident quis et tempora.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(432, 11, 23, 'Ullam fuga corrupti et qui esse est fuga.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(433, 27, 18, 'Velit odio adipisci iste.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(434, 16, 13, 'Ducimus nulla eaque reiciendis et sapiente quo.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(435, 10, 12, 'Iste aut ea quaerat est deserunt eos.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(436, 17, 4, 'Asperiores necessitatibus molestiae eum doloribus ipsam et.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(437, 20, 12, 'Iusto quam deleniti autem ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(438, 13, 12, 'Ducimus assumenda occaecati voluptatem quae tempora porro.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(439, 18, 26, 'Quia possimus necessitatibus qui possimus est et recusandae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(440, 24, 17, 'Quia magni a nihil rerum ipsam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(441, 8, 7, 'Sequi et doloremque molestiae et voluptas.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(442, 3, 24, 'Quae nesciunt provident id earum ducimus aut autem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(443, 15, 27, 'Exercitationem culpa qui porro cumque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(444, 29, 30, 'Facere ullam repudiandae impedit et dolorem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(445, 13, 2, 'Facilis fugiat iusto natus consequatur eligendi.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(446, 3, 30, 'Architecto est fugit qui animi.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(447, 28, 30, 'Magnam dolorem modi magni nemo rerum qui.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(448, 11, 30, 'Odit velit praesentium labore dolorum esse nesciunt.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(449, 5, 29, 'Id ut nostrum est a accusantium.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(450, 29, 23, 'Ea ipsa alias est.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(451, 4, 19, 'Inventore minima quia maiores nostrum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(452, 8, 3, 'Magnam iure harum quasi labore est.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(453, 9, 18, 'Laboriosam nobis cupiditate sequi fuga.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(454, 10, 28, 'Mollitia sed optio natus nisi cumque.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(455, 15, 24, 'Amet alias excepturi sit harum.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04');
INSERT INTO `messages` (`id`, `from`, `to`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(456, 21, 5, 'Laborum quis numquam tenetur fugit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(457, 28, 19, 'Error quis nihil aut officia.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(458, 6, 8, 'Quia debitis ipsum debitis vel eum blanditiis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(459, 30, 26, 'Est neque iure aliquam recusandae dicta magni.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(460, 16, 18, 'Rerum at impedit quos repellendus veritatis voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(461, 15, 17, 'Doloremque sit vel ut velit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(462, 21, 3, 'Qui quas porro dicta in laudantium consequuntur.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(463, 28, 29, 'Labore officia ut iusto modi vel non non.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(464, 6, 13, 'Facere corrupti ut dolor occaecati animi harum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(465, 14, 13, 'Est nihil qui error eius omnis neque ipsa.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(466, 30, 15, 'Magni itaque commodi officiis dicta enim perferendis ad.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(467, 18, 10, 'Esse ut quo ipsa dolorem alias enim.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(468, 12, 8, 'Nam rerum eligendi cum repellendus necessitatibus.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(469, 11, 9, 'Atque sunt est enim sed quis dolorem facere.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(470, 1, 5, 'Esse ut eligendi vitae consequatur.', 1, '2020-11-23 17:48:04', '2020-12-01 22:59:00'),
(471, 24, 6, 'Qui commodi temporibus dolores iste quae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(472, 11, 5, 'Quo et adipisci aliquid optio commodi voluptatem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(473, 29, 20, 'Itaque porro magni illo deserunt ullam.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(474, 22, 20, 'Neque incidunt ut sint deleniti.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(475, 21, 7, 'A exercitationem eos exercitationem animi et atque eum.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(476, 27, 29, 'Enim id quibusdam modi consequatur nobis sit maiores.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(477, 13, 21, 'Officiis amet cupiditate autem.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(478, 1, 20, 'Enim sed architecto voluptatibus sed et voluptatum doloremque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(479, 2, 21, 'Ullam iure hic amet qui autem voluptatem dignissimos.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(480, 5, 16, 'Aliquam dolorem eaque hic velit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(481, 23, 28, 'Repellat reiciendis est qui culpa amet inventore aut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(482, 2, 15, 'Non et voluptas maiores aperiam et deleniti numquam.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(483, 20, 2, 'Aut minus reiciendis ut incidunt quo dolore.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(484, 28, 8, 'Aut aut ut ut ut quasi ipsam eius.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(485, 1, 4, 'Occaecati est corrupti ea officiis omnis.', 1, '2020-11-23 17:48:04', '2020-12-02 11:30:01'),
(486, 17, 27, 'Autem eius et voluptas molestiae.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(487, 8, 21, 'Ratione excepturi nostrum est totam molestias quos odit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(488, 1, 27, 'Qui reiciendis facere voluptatibus temporibus aut voluptas ea.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(489, 17, 18, 'Magni eum totam sed molestias non.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(490, 19, 18, 'Doloremque consequatur voluptatibus facilis ratione temporibus et.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(491, 10, 13, 'Reiciendis labore nulla neque est.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(492, 19, 11, 'Mollitia molestiae earum velit assumenda.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(493, 26, 23, 'Ut porro sunt voluptate velit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(494, 23, 10, 'Modi commodi autem perferendis.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(495, 3, 24, 'Repudiandae voluptates accusantium distinctio ea dicta impedit.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(496, 29, 5, 'Similique ea est odit deleniti fugit.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(497, 2, 8, 'Hic eaque similique ut voluptas eaque.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(498, 29, 30, 'Iusto fugit est quasi ut in.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(499, 29, 18, 'Iusto unde voluptatibus enim adipisci quasi qui ut.', 1, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(500, 2, 18, 'Est non praesentium nihil eligendi.', 0, '2020-11-23 17:48:04', '2020-11-23 17:48:04'),
(501, 31, 3, 'halo', 1, '2020-11-23 20:54:37', '2020-11-23 20:58:02'),
(502, 3, 31, 'hai', 1, '2020-11-23 20:54:54', '2020-11-23 21:38:47'),
(503, 3, 31, 'tes', 1, '2020-11-23 20:55:02', '2020-11-23 21:38:47'),
(504, 31, 3, 'qewqwe', 1, '2020-11-23 20:55:37', '2020-11-23 20:58:02'),
(505, 3, 29, 'kok gk masuk ya', 0, '2020-11-23 20:55:51', '2020-11-23 20:55:51'),
(506, 3, 31, 'qwe\'', 1, '2020-11-23 20:57:35', '2020-11-23 21:38:47'),
(507, 3, 31, 'halo halo', 1, '2020-11-23 20:57:48', '2020-11-23 21:38:47'),
(508, 31, 3, '2222', 0, '2020-11-23 21:38:36', '2020-11-23 21:38:36'),
(509, 1, 5, 'sssss', 1, '2020-11-24 06:13:47', '2020-12-01 22:59:00'),
(510, 5, 1, 'hai', 1, '2020-12-01 22:58:23', '2020-12-01 22:59:00'),
(511, 5, 1, 'asdss', 1, '2020-12-01 22:58:32', '2020-12-01 22:59:00'),
(512, 5, 1, 'halo admin', 1, '2020-12-01 22:58:52', '2020-12-01 22:59:00'),
(513, 1, 5, 'halo user', 1, '2020-12-01 22:59:00', '2020-12-01 22:59:00'),
(514, 1, 7, 'hai konsultan', 0, '2020-12-02 08:29:29', '2020-12-02 08:29:29'),
(515, 7, 4, 'tes', 1, '2020-12-02 14:23:05', '2020-12-21 05:30:00'),
(516, 4, 7, 'halo', 1, '2020-12-02 14:23:14', '2020-12-21 05:30:00'),
(517, 7, 4, 's', 1, '2020-12-03 02:43:13', '2020-12-21 05:30:00'),
(518, 4, 7, 'tes', 1, '2020-12-03 02:43:21', '2020-12-21 05:30:00'),
(519, 4, 7, 'tes', 1, '2020-12-03 05:09:06', '2020-12-21 05:30:00'),
(520, 7, 4, 'iya', 1, '2020-12-03 05:09:17', '2020-12-21 05:30:00'),
(521, 7, 4, 'halo dandy', 1, '2020-12-21 05:29:51', '2020-12-21 05:30:00'),
(522, 4, 7, 'halo pak fajar', 1, '2020-12-21 05:29:59', '2020-12-21 05:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 2),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2018_10_20_040609_create_categories_table', 3),
(9, '2018_10_24_075802_create_products_table', 4),
(10, '2018_11_08_024109_create_product_att_table', 5),
(11, '2018_11_20_055123_create_tblgallery_table', 6),
(12, '2018_11_26_070031_create_cart_table', 7),
(13, '2018_11_28_072535_create_coupons_table', 8),
(15, '2018_12_01_042342_create_countries_table', 10),
(19, '2018_12_03_043804_add_more_fields_to_users_table', 14),
(17, '2018_12_03_093548_create_delivery_address_table', 12),
(18, '2018_12_05_024718_create_orders_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) NOT NULL,
  `expedition` int(11) NOT NULL,
  `shipping_charge` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT 0,
  `coupon_amount` int(11) DEFAULT 0,
  `grand_total` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `checkout_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum dibayar',
  `struk` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT 'belum dikirim',
  `shipping_date` date DEFAULT NULL,
  `receipt_status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT 'belum diterima',
  `receipt_date` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `expedition`, `shipping_charge`, `coupon_id`, `coupon_amount`, `grand_total`, `order_date`, `checkout_status`, `struk`, `resi`, `shipping_status`, `shipping_date`, `receipt_status`, `receipt_date`, `address`, `kelurahan`, `kecamatan`, `postcode`, `mobile`, `created_at`, `updated_at`) VALUES
(15, 4, 2, 0, 0, 0, 12, '2020-11-17', 'sudah dibayar', NULL, NULL, 'belum dikirim', NULL, 'sudah diterima', '2020-11-22', '', '', '', '', '', '2020-11-17 12:46:28', '2020-11-22 12:23:05'),
(24, 1, 2, 7, 0, 0, 43, '2020-11-19', 'dibatalkan', NULL, NULL, 'dibatalkan', '2020-11-17', 'dibatalkan', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-19 09:58:12', '2020-12-21 05:38:22'),
(25, 1, 2, 7, 6, 0, 43, '2020-11-19', 'sudah dibayar', NULL, '9340184082', 'sudah dikirim', '2020-11-20', 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-19 09:58:12', '2020-11-23 05:39:48'),
(26, 1, 2, 7, 0, 0, 43, '2020-11-19', 'dibatalkan', NULL, '0987654321', 'dibatalkan', '2020-11-20', 'dibatalkan', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-19 09:59:43', '2020-12-21 05:38:22'),
(27, 1, 3, 6, 0, 0, 43, '2020-11-21', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-21 10:35:31', '2020-11-21 10:35:31'),
(28, 1, 3, 6, 0, 0, 43, '2020-11-21', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-21 10:36:20', '2020-11-21 10:36:20'),
(29, 1, 3, 6, 0, 0, 43, '2020-11-21', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-21 10:36:49', '2020-11-21 10:36:49'),
(30, 4, 2, 7000, 7, 11500, 18530, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 07:13:25', '2020-11-22 07:13:25'),
(31, 4, 1, 10000, NULL, NULL, 20031, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 08:17:13', '2020-11-22 08:17:13'),
(32, 4, 2, 7000, 6, 500, 11532, '2020-11-22', 'sudah dibayar', 'struk_order-32.jpg', '182410101001', 'sudah dikirim', '2020-11-22', 'sudah diterima', '2020-11-23', 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 08:18:08', '2020-11-23 05:19:11'),
(33, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 15:54:09', '2020-11-22 15:54:09'),
(34, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 15:54:48', '2020-11-22 15:54:48'),
(35, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 15:54:48', '2020-11-22 15:54:48'),
(36, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 15:59:17', '2020-11-22 15:59:17'),
(37, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 15:59:17', '2020-11-22 15:59:17'),
(38, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 16:06:28', '2020-11-22 16:06:28'),
(39, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 16:08:10', '2020-11-22 16:08:10'),
(40, 4, 1, 10000, NULL, NULL, 22033, '2020-11-22', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-22 16:08:34', '2020-11-22 16:08:34'),
(41, 1, 2, 7000, NULL, NULL, 29041, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 01:21:33', '2020-11-23 01:21:33'),
(42, 1, 2, 7000, NULL, NULL, 29041, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 01:25:07', '2020-11-23 01:25:07'),
(43, 1, 2, 7000, NULL, NULL, 29041, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 01:26:21', '2020-11-23 01:26:21'),
(44, 1, 2, 7000, NULL, NULL, 17044, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 01:41:13', '2020-11-23 01:41:13'),
(45, 1, 2, 7000, 6, 500, 11545, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 01:44:31', '2020-11-23 01:44:31'),
(46, 1, 1, 10, NULL, NULL, 10046, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-11-23 04:15:30', '2020-11-23 04:15:30'),
(47, 4, 2, 7000, 7, 500, 7547, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-23 04:39:55', '2020-11-23 04:39:55'),
(48, 4, 2, 7000, 7, 500, 7547, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-23 04:40:13', '2020-11-23 04:40:13'),
(49, 4, 2, 7000, 7, 500, 7547, '2020-11-23', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-23 04:40:22', '2020-11-23 04:40:22'),
(50, 4, 2, 7000, 7, 500, 7547, '2020-11-23', 'sudah dibayar', 'struk_order-50.png', NULL, 'belum dikirim', NULL, 'sudah diterima', '2020-12-21', 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-11-23 04:42:58', '2020-12-20 17:41:56'),
(51, 1, 1, 30000, NULL, NULL, 36051, '2020-12-01', 'sudah dibayar', 'struk_order-51.jpg', '182410107601', 'sudah dikirim', '2018-04-03', 'sudah diterima', '2020-12-01', 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-12-01 07:55:38', '2020-12-01 07:58:55'),
(52, 4, 2, 7000, 7, 205000, 212052, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:07:13', '2020-12-03 02:07:13'),
(53, 4, 2, 7000, 7, 205000, 212053, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:10:25', '2020-12-03 02:10:25'),
(54, 4, 2, 7000, NULL, NULL, 2107054, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:14:59', '2020-12-03 02:14:59'),
(55, 4, 2, 7000, NULL, NULL, 2107055, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:15:31', '2020-12-03 02:15:31'),
(56, 1, 1, 10000, NULL, NULL, 970056, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-12-03 02:31:10', '2020-12-03 02:31:10'),
(57, 4, 2, 7000, 6, 54000, 493057, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:37:04', '2020-12-03 02:37:04'),
(58, 4, 2, 7000, 6, 54000, 493058, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:38:35', '2020-12-03 02:38:35'),
(59, 4, 2, 7000, 6, 54000, 493059, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:38:52', '2020-12-03 02:38:52'),
(60, 4, 3, 6000, 6, 96000, 870060, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:39:18', '2020-12-03 02:39:18'),
(61, 1, 3, 6000, 6, 96000, 870061, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B28', 'sumbersari', 'ajung', '22222', '082234795673', '2020-12-03 02:40:45', '2020-12-03 02:40:45'),
(62, 4, 3, 6000, 6, 96000, 870062, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:41:17', '2020-12-03 02:41:17'),
(63, 4, 3, 6000, 6, 96000, 870062, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:42:22', '2020-12-03 02:42:22'),
(64, 4, 3, 6000, 6, 96000, 870064, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:42:32', '2020-12-03 02:42:32'),
(65, 4, 3, 6000, NULL, NULL, 966065, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:49:07', '2020-12-03 02:49:07'),
(66, 4, 2, 7000, NULL, NULL, 967066, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 02:54:44', '2020-12-03 02:54:44'),
(67, 4, 1, 10000, NULL, NULL, 970067, '2020-12-03', 'belum dibayar', 'struk_order-67.png', NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 03:12:27', '2020-12-20 18:13:12'),
(68, 5, 2, 7000, NULL, NULL, 547068, '2020-12-03', 'sudah dibayar', 'struk_order-68.png', '9340875082', 'sudah dikirim', '2020-11-20', 'sudah diterima', '2020-12-03', 'Jalan Mawar', 'qwqwwqwqew', 'qwwqeqwqwqw', '23412', '456332345689', '2020-12-03 03:15:15', '2020-12-03 03:21:50'),
(69, 4, 3, 6000, NULL, NULL, 1236069, '2020-12-03', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-03 05:10:54', '2020-12-03 05:10:54'),
(70, 4, 1, 10000, NULL, NULL, 540070, '2020-12-05', 'sudah dibayar', NULL, 'ghgg54565656', 'sudah dikirim', '2017-08-04', 'belum diterima', NULL, 'Perumahan Gunung Batu B-28 RT 001/RW 005 Lingkungan Krajan Barat', 'Sumbersari', 'Sumbersari', '68121', '082234795673', '2020-12-05 16:42:15', '2020-12-20 06:08:59'),
(71, 4, 3, 6000, NULL, NULL, 546071, '2020-12-21', 'belum dibayar', NULL, NULL, 'belum dikirim', NULL, 'belum diterima', NULL, 'Jalan Mawar Merah Gang 3 no 15', 'Kebonsari', 'Sumbersari', '68111', '082234795673', '2020-12-20 19:32:59', '2020-12-20 19:32:59'),
(72, 4, 2, 7000, NULL, NULL, 967072, '2020-12-21', 'sudah dibayar', 'struk_order-72.jpg', 'ygg446662562245', 'sudah dikirim', '2020-11-20', 'sudah diterima', '2020-12-21', 'Jalan Mawar Merah Gang 3 no 15', 'Kebonsari', 'Sumbersari', '68111', '082234795673', '2020-12-21 05:26:24', '2020-12-21 05:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orders_id`, `products_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 15, 32, 1, '2020-11-17 12:46:28', '2020-11-17 12:46:28'),
(2, 16, 33, 1, '2020-11-17 12:56:22', '2020-11-17 12:56:22'),
(3, 17, 34, 1, '2020-11-17 13:00:18', '2020-11-17 13:00:18'),
(4, 19, 34, 1, '2020-11-17 13:03:24', '2020-11-17 13:03:24'),
(5, 19, 33, 1, '2020-11-17 13:03:24', '2020-11-17 13:03:24'),
(6, 19, 32, 1, '2020-11-17 13:03:24', '2020-11-17 13:03:24'),
(7, 19, 31, 1, '2020-11-17 13:03:24', '2020-11-17 13:03:24'),
(8, 20, 33, 1, '2020-11-18 11:39:35', '2020-11-18 11:39:35'),
(9, 21, 31, 2, '2020-11-18 11:49:23', '2020-11-18 11:49:23'),
(10, 22, 31, 2, '2020-11-18 11:59:08', '2020-11-18 11:59:08'),
(11, 26, 32, 1, '2020-11-19 09:59:43', '2020-11-19 09:59:43'),
(12, 27, 31, 1, '2020-11-21 10:35:31', '2020-11-21 10:35:31'),
(13, 30, 32, 1, '2020-11-22 07:13:25', '2020-11-22 07:13:25'),
(14, 30, 41, 1, '2020-11-22 07:13:25', '2020-11-22 07:13:25'),
(15, 30, 31, 1, '2020-11-22 07:13:25', '2020-11-22 07:13:25'),
(16, 31, 31, 1, '2020-11-22 08:17:13', '2020-11-22 08:17:13'),
(17, 32, 33, 1, '2020-11-22 08:18:08', '2020-11-22 08:18:08'),
(18, 33, 32, 1, '2020-11-22 15:54:09', '2020-11-22 15:54:09'),
(19, 41, 31, 1, '2020-11-23 01:21:33', '2020-11-23 01:21:33'),
(20, 41, 32, 1, '2020-11-23 01:21:33', '2020-11-23 01:21:33'),
(21, 44, 31, 1, '2020-11-23 01:41:13', '2020-11-23 01:41:13'),
(22, 45, 33, 1, '2020-11-23 01:44:31', '2020-11-23 01:44:31'),
(23, 46, 31, 1, '2020-11-23 04:15:30', '2020-11-23 04:15:30'),
(24, 47, 41, 1, '2020-11-23 04:39:55', '2020-11-23 04:39:55'),
(25, 51, 34, 3, '2020-12-01 07:55:38', '2020-12-01 07:55:38'),
(26, 52, 33, 1, '2020-12-03 02:07:13', '2020-12-03 02:07:13'),
(27, 53, 33, 1, '2020-12-03 02:10:25', '2020-12-03 02:10:25'),
(28, 54, 33, 1, '2020-12-03 02:14:59', '2020-12-03 02:14:59'),
(29, 55, 33, 1, '2020-12-03 02:15:31', '2020-12-03 02:15:31'),
(30, 56, 43, 1, '2020-12-03 02:31:10', '2020-12-03 02:31:10'),
(31, 57, 33, 1, '2020-12-03 02:37:04', '2020-12-03 02:37:04'),
(32, 58, 33, 1, '2020-12-03 02:38:35', '2020-12-03 02:38:35'),
(33, 59, 33, 1, '2020-12-03 02:38:52', '2020-12-03 02:38:52'),
(34, 60, 33, 1, '2020-12-03 02:39:18', '2020-12-03 02:39:18'),
(35, 61, 43, 1, '2020-12-03 02:40:45', '2020-12-03 02:40:45'),
(36, 62, 33, 1, '2020-12-03 02:41:17', '2020-12-03 02:41:17'),
(37, 63, 33, 1, '2020-12-03 02:42:22', '2020-12-03 02:42:22'),
(38, 64, 33, 1, '2020-12-03 02:42:32', '2020-12-03 02:42:32'),
(39, 65, 33, 1, '2020-12-03 02:49:07', '2020-12-03 02:49:07'),
(40, 66, 33, 1, '2020-12-03 02:54:44', '2020-12-03 02:54:44'),
(41, 67, 43, 1, '2020-12-03 03:12:27', '2020-12-03 03:12:27'),
(42, 68, 46, 1, '2020-12-03 03:15:15', '2020-12-03 03:15:15'),
(43, 69, 45, 3, '2020-12-03 05:10:54', '2020-12-03 05:10:54'),
(44, 70, 46, 1, '2020-12-05 16:42:15', '2020-12-05 16:42:15'),
(45, 71, 46, 1, '2020-12-20 19:32:59', '2020-12-20 19:32:59'),
(46, 72, 43, 1, '2020-12-21 05:26:24', '2020-12-21 05:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `categories_id` int(11) NOT NULL,
  `p_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categories_id`, `p_name`, `description`, `stock`, `price`, `weight`, `image`, `created_at`, `updated_at`) VALUES
(43, 10, 'Layar LED LCD Laptop Acer Swift 3 SF314 N17W7', 'Deskripsi Layar LED LCD Laptop Acer Swift 3 SF314 N17W7\r\n\r\nGaransi 1 Bulan\r\n\r\nMax. Resolution: 1920 x 1080\r\nScreen Size:14.0\" inch n \r\nConector : 30 Pin\r\nNo Screew<b></b>', 6, 960000, 300, 'layar-led-lcd-laptop-acer-swift-3-sf314-n17w7.jpg', '2020-12-02 23:36:16', '2020-12-21 05:26:24'),
(44, 10, 'Layar LCD LED Toshiba Satellite L745', '<br>Kondisi 100% Baru Original dan Bergaransi 2 Bulan (Garansi No ribet, Rusak ganti Baru, Bukan diservice)<br><br>Ukuran : 14.0 Standard<br>Resolusi : 1366x768 pixels<br>Jumlah PIN : 40-pin<br>Ket: Posisi soket Pin dan Posisi Kuping mur/baut silakan lihat foto', 10, 4800000, 300, 'layar-lcd-led-toshiba-satellite-l745.jpg', '2020-12-02 23:40:05', '2020-12-21 04:58:44'),
(45, 12, 'KLEVV SSD NEO N400 240GB', 'SKU Product&nbsp;: 162329<br><br>Est. Weight&nbsp;&nbsp;&nbsp;: N/A Kg<br><br>Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;SSD<br><br>Subcategory :&nbsp;Internal SSD (SOLID STATE DISK)<br><br>Brand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;KLEVV<br><br>Tags&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;-', 45, 410000, 100, 'klevv-ssd-neo-n400-240gb.jpg', '2020-12-02 23:42:44', '2020-12-21 04:58:54'),
(46, 11, 'V-GeN Platinum SO-DIMM DDR4 8GB PC17000', 'SKU Product&nbsp;: 123093<br><br>Est. Weight&nbsp;&nbsp;&nbsp;: 0.05 Kg<br><br>Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<a target=\"_blank\" rel=\"nofollow\" href=\"https://www.enterkomputer.com/category/11/memory-ram\">Ram</a><br><br>Subcategory :&nbsp;Notebook<br><br>Brand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;V-GEN<br><br>Tags&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;-', 1, 540000, 50, 'v-gen-platinum-so-dimm-ddr4-8gb-pc17000.jpg', '2020-12-02 23:49:49', '2020-12-20 19:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-12-02 09:15:40', NULL),
(2, 'konsultan', '2020-12-02 09:16:06', NULL),
(3, 'pelanggan', '2020-12-02 09:16:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblgallery`
--

CREATE TABLE `tblgallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `products_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblgallery`
--

INSERT INTO `tblgallery` (`id`, `products_id`, `image`, `created_at`, `updated_at`) VALUES
(8, 27, '7664271544063472.jpg', '2018-12-05 19:31:12', '2018-12-05 19:31:12'),
(9, 27, '6768551544063472.jpg', '2018-12-05 19:31:13', '2018-12-05 19:31:13'),
(10, 27, '4131281544063473.jpg', '2018-12-05 19:31:13', '2018-12-05 19:31:13'),
(11, 28, '6720891544063734.jpg', '2018-12-05 19:35:34', '2018-12-05 19:35:34'),
(12, 28, '4686631544063734.jpg', '2018-12-05 19:35:34', '2018-12-05 19:35:34'),
(13, 28, '5960611544063759.jpeg', '2018-12-05 19:35:59', '2018-12-05 19:35:59'),
(14, 29, '5146071544063935.JPG', '2018-12-05 19:38:55', '2018-12-05 19:38:55'),
(15, 29, '762811544063935.jpg', '2018-12-05 19:38:55', '2018-12-05 19:38:55'),
(16, 29, '3716041544063935.jpg', '2018-12-05 19:38:56', '2018-12-05 19:38:56'),
(17, 30, '6832831544064156.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(18, 30, '1655391544064157.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(19, 30, '4693601544064157.jpg', '2018-12-05 19:42:37', '2018-12-05 19:42:37'),
(20, 31, '9233341544064441.jpg', '2018-12-05 19:47:21', '2018-12-05 19:47:21'),
(21, 31, '8167501544064441.jpg', '2018-12-05 19:47:22', '2018-12-05 19:47:22'),
(22, 31, '3887071544064442.jpg', '2018-12-05 19:47:22', '2018-12-05 19:47:22'),
(23, 32, '3998691544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(24, 32, '1159141544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(25, 32, '2035101544064618.jpg', '2018-12-05 19:50:18', '2018-12-05 19:50:18'),
(26, 33, '2128501544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(27, 33, '5649911544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(28, 33, '3704141544064917.jpg', '2018-12-05 19:55:17', '2018-12-05 19:55:17'),
(29, 34, '3899431544065346.JPG', '2018-12-05 20:02:26', '2018-12-05 20:02:26'),
(30, 34, '119131544065346.jpg', '2018-12-05 20:02:27', '2018-12-05 20:02:27'),
(31, 34, '6905491544065347.jpg', '2018-12-05 20:02:27', '2018-12-05 20:02:27'),
(32, 35, '981591544065510.jpeg', '2018-12-05 20:05:10', '2018-12-05 20:05:10'),
(33, 35, '5320811544065510.jpg', '2018-12-05 20:05:11', '2018-12-05 20:05:11'),
(34, 35, '1153181544065511.jpg', '2018-12-05 20:05:11', '2018-12-05 20:05:11'),
(36, 43, '9156231608526553.jpg', '2020-12-21 04:55:53', '2020-12-21 04:55:53'),
(37, 43, '6387861608526558.jpg', '2020-12-21 04:55:58', '2020-12-21 04:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelurahan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `kelurahan`, `kecamatan`, `postcode`, `mobile`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'WeShare', 'demo@gmail.com', '$2y$10$ktiMqsnbFw9c0re24BHC0ee5f/SuTibMTNezUkU2yeD3zvGbpjAgq', NULL, NULL, NULL, NULL, NULL, 1, '7LMu247CViTMOa5H0rR3gWMyhFtRCi4dNf8ucr4k0N8fuUCwrqHa6K3GJRAt', '2018-10-15 02:32:54', '2020-12-07 15:22:13'),
(8, 'bagus aja', 'bagus@mail.com', '$2y$10$aARnscb2WX0r44Z.bZm1g.LZD6QmWQljqbCli2WSGPn9VQNQgV1j.', NULL, NULL, NULL, NULL, NULL, 2, NULL, '2020-12-07 16:55:58', '2020-12-07 16:55:58'),
(4, 'Dandy Satrio', 'dandy@a.com', '$2y$10$bHnqMMJTivAnYDxlivvXPeYm5AjdfT5uC2IvSzNc2XN06hJZtTMCm', 'Jalan Mawar Merah Gang 3 no 15', 'Kebonsari', 'Sumbersari', '68111', '082234795673', 3, 'FOjq7a3CNUDZEjOIcfAX4KEECiTE5uRp7vhPiZOjLjvNQQYzbZqU1fthXU8y', '2018-12-06 01:40:27', '2020-12-07 08:07:40'),
(5, 'tes', 'tes@a.in', '$2y$10$m9fNpTgwyBVqqVfsJ9bXUensvx5iqlYhzqmL3khhSpKpgqNQnW0t2', 'Jalan Mawar', 'qwqwwqwqew', 'qwwqeqwqwqw', '23412', '456332345689', 3, 'mEPkQFLL4Uk4widTgLXaXMxwgZ37enBzX6daoOfV1xNSYmdvofj0ICx5pL9U', NULL, NULL),
(6, 'riki tiki', 'rikitiki@da.com', '$2y$10$WbWM5R5Zmw0J939pmnHGTefqMV9pkK07lNULgzZsiSYOqQ4KyOGoC', 'Perumahan Gunung Batu B28', '', '', '22222', '082234795673', 3, 'J1lQGCiFBnZ0f3FovhLSwlV4RLZPRBH12ckSsdlgUeexgzxrQq2I6Bns7Kv4', '2020-11-17 14:16:25', '2020-11-17 14:16:25'),
(7, 'fajar alam', 'konsultan@tes.com', '$2y$10$eYlug0sILf5KxjYbzCJXAufyKYOhphfowA7b9/8AOilYGRMJs8Hd2', NULL, NULL, NULL, NULL, NULL, 2, 'O1006tOAt7J8ivSfBzCcY4NSr2ZnDLYspUyKXFflmIuW4n6iaTYCBrjA65pY', '2020-11-24 03:49:19', '2020-12-07 15:52:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`name`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `expeditions`
--
ALTER TABLE `expeditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `resi` (`resi`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `coupon_code` (`coupon_id`),
  ADD KEY `expedition` (`expedition`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id` (`orders_id`),
  ADD KEY `products_is` (`products_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id` (`categories_id`),
  ADD KEY `categories_id_2` (`categories_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgallery`
--
ALTER TABLE `tblgallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `expeditions`
--
ALTER TABLE `expeditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblgallery`
--
ALTER TABLE `tblgallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
