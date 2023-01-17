-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2023 at 04:55 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Apple', 'Apple Company', 1, '2021-08-30 10:33:53'),
(3, 'Samsung', 'Samsung Company', 1, '2021-08-30 10:34:22'),
(4, 'Vivo', 'Vivo Company', 1, '2021-08-30 10:34:38'),
(6, 'Xiaomi', 'Xiaomi Company', 1, '2021-08-30 10:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(16, 3, 3, 5000, 1, '2023-01-12 21:21:39'),
(22, 1, 5, 24999, 1, '2023-01-12 22:52:20'),
(24, 4, 3, 5000, 1, '2023-01-12 22:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Smart Phone', 'Smart Phone Products', 1, '2021-08-30 10:52:25'),
(2, 'Accessories', 'Phone Accessories', 1, '2021-08-30 10:52:49'),
(3, 'Mobile Hardware', 'Mobile Hardware products', 1, '2021-08-30 10:53:31'),
(4, 'External Storage', 'External Storage Products', 1, '2021-08-30 10:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@gmail.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address', '2021-08-30 15:32:20'),
(2, 'albin', 'maharjan', 'Male', '687654231', 'albinmaharjan', 'd9729feb74992cc3482b350163a1a010', 'dallu', '2023-01-12 07:51:08'),
(3, 'Aman', 'Maharjan', 'Male', '986188979', 'amanmahrjan@gmail.com', '53bbd72492e32f086bab3e3370d6413a', 'nayabazar', '2023-01-12 20:43:47'),
(4, 'demo', 'acc', 'Male', '986188979', 'demoacc@gamil.com', 'e67d82db13ecee932486646ec0257be3', 'dallu', '2023-01-12 22:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 15, 74990, '2021-08-30 13:24:01', NULL),
(2, 2, 20, 69990, '2021-08-30 13:27:26', NULL),
(3, 3, 25, 5000, '2021-08-30 15:42:20', '2023-01-11 15:10:40'),
(4, 4, 10, 169999, '2023-01-11 14:47:20', NULL),
(5, 5, 20, 24999, '2023-01-11 23:34:49', NULL),
(6, 6, 17, 44999, '2023-01-11 23:35:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 3, 'nayabazar', 'cod', 1, 24999, 0, 0, '2023-01-12 20:54:01', '2023-01-12 21:38:35'),
(2, 1, 'kathmandu', 'cod', 1, 5000, 3, 1, '2023-01-11 15:41:47', '2023-01-11 15:45:22'),
(3, 1, '', 'cod', 1, 169999, 0, 0, '2023-01-11 15:51:54', NULL),
(9, 1, '', 'cod', 1, 0, 0, 0, '2023-01-12 13:04:44', NULL),
(11, 1, '', 'cod', 1, 0, 0, 0, '2023-01-12 13:07:49', NULL),
(12, 1, '', 'cod', 1, 0, 0, 0, '2023-01-12 13:07:51', NULL),
(13, 1, '', 'cod', 1, 0, 0, 0, '2023-01-12 13:07:56', NULL),
(17, 1, '', 'cod', 1, 169999, 0, 0, '2023-01-12 13:08:12', NULL),
(18, 1, '', 'cod', 1, 89998, 0, 0, '2023-01-12 13:26:38', NULL),
(19, 3, 'nayabazar', 'cod', 1, 169999, 0, 0, '2023-01-12 20:44:03', NULL),
(20, 3, 'nayabazar', 'cod', 1, 149980, 0, 0, '2023-01-12 20:48:34', NULL),
(22, 1, 'nayabazar', 'cod', 1, 24999, 0, 0, '2023-01-12 22:22:35', NULL),
(23, 1, 'nayabazar', 'cod', 1, 44999, 0, 0, '2023-01-12 22:51:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(3, 2, 3, 1, 5000, 5000),
(4, 3, 4, 1, 169999, 169999),
(5, 4, 1, 1, 74990, 74990),
(6, 17, 4, 1, 169999, 169999),
(7, 18, 6, 2, 44999, 89998),
(8, 19, 4, 1, 169999, 169999),
(9, 20, 1, 2, 74990, 149980),
(10, 21, 5, 1, 24999, 24999),
(11, 22, 5, 1, 24999, 24999),
(12, 23, 6, 1, 44999, 44999);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`, `date_created`) VALUES
(1, 1, 1, 0, 'iPhone Pro Max 12', '<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\"><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Body:</span> Textured matte glass back, Stainless steel frame, 228 grams</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Dimensions:</span> 6.33H x 3.07W x 0.29-inches</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Display: </span>6.7-inch (2778 × 1284 pixels) OLED Super Retina XDR display, 458ppi, Ceramic Shield protection</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Chipset: </span>Six-core A14 Bionic 64-bit processor, 16-core Neural Engine</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Storage: </span>128 / 256 / 512GB (non-expandable)</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Operating System: </span>iOS 14</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">SIM: </span>Dual SIM (nano + eSIM)</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Back Camera: </span>Triple:<br><span class=\\\"aCOpRe\\\">•</span> Ultra-wide: 12MP f/2.4, 120° FOV, 5-elements lens, 13mm focal length<br><span class=\\\"aCOpRe\\\">•</span> Wide: 12MP f/1.6, 7-elements lens, 26mm focal length, 1.7<span class=\\\"ILfuVd NA6bn\\\">μm pixels, Sensor-shift OIS</span><br><span class=\\\"aCOpRe\\\">•</span> Telephoto: 12MP 6-elements lens, OIS, f/2.2, 65mm focal length<br><span class=\\\"aCOpRe\\\">•</span> LiDAR scanner for AR workloads, night portraits, etc.</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Front Camera:</span> 12MP TrueDepth camera with f/2.2 aperture</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Security: </span>TrueDepth camera for FaceID facial recognition</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Connectivity</span>: 5G (sub-6GHz and mmWave), Gigabit LTE with 4×4 MIMO and LAA, 802.11ax Wi‑Fi 6 with 2×2 MIMO, Bluetooth 5.0, NFC, GPS with GLONASS, GLONASS, Galileo, QZSS, and Beidou, Ultra-Wideband chip</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Other features: </span>Water and dust-resistant (IP68), Stereo speakers</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Color options:</span> Graphite, Silver, Gold, Pacific Blue</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 0px;\\\"><span style=\\\"font-weight: 700;\\\">Battery: </span>3687mAh; 20W fast charging, 7.5W Qi Wireless Charging; 15W MagSafe Wireless Charger (No charger included in the box)</li></ul>', 1, '2021-08-30 12:19:22'),
(3, 1, 2, 2, 'iPhone Pro Max 12 Case Cover', '<p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">1. Combines with classic, fashion, and protective elements</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">2. Slide cover protects the phone camera from scratch and protects your privacy.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">3. Made of environmentally-friendly PC and TPU material, which is tough and wear-resistant.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">4. Processed by advanced technology.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">5. Good touch feeling.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">6. Anti-fingerprint and oil stain.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">7. One-piece molding completely fits your device.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">8. Provides reliable protection.</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">9. Impact-resistant airbags on four corners</p><p style=\\\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\\\">10. All-around coverage.</p>', 1, '2021-08-30 15:42:08'),
(4, 3, 1, 0, 'Samsung Galaxy S22 Ultra ', '<ul style=\\\"padding: 0px; margin-bottom: 26px; color: rgb(34, 34, 34); font-family: roboto; font-size: 15px;\\\"><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Body:</span>&nbsp;163.3 x 77.9 x 8.9mm, 229 grams, IP68 rated, Gorilla Glass Victus+, Aluminum frame, S-pen support</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Display:</span>&nbsp;6.8-inches Dynamic AMOLED 2X Infinity-O, Gorilla Glass Victus+, Adaptive 120Hz refresh rate, Vision Booster</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Resolution:</span>&nbsp;WQHD+ (3200 x 1440 pixels)</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Chipset:</span>&nbsp;Snapdragon 8 Gen 1 (4nm)</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">CPU:&nbsp;</span>Octa-core (1x Cortex-X2 + 3x Cortex-A710 + 4x Cortex-A510)</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">GPU:</span>&nbsp;Adreno 730</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">RAM:</span>&nbsp;8/12GB LPDDR5</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Storage:</span>&nbsp;128/256/512GB, up to 1TB UFS 3.1 internal storage</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Software</span>&nbsp;<span style=\\\"font-weight: 700;\\\">&amp; UI:</span>&nbsp;One UI 4 on top of Android 12</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Rear Camera:</span>&nbsp;Quad (with LED flash)<br>– 108MP f/1.8 primary lens, OIS, PDAF<br>– 12MP f/2.2 ultra-wide-angle lens, 120º FOV<br>– 10MP f/2.4 telephoto lens, 3x optical zoom<br>– 10MP f/4.9 telephoto lens, 10x optical zoom</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Front Camera:</span>&nbsp;40MP, f/2.2 lens (punch-hole)</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Security:</span>&nbsp;Ultrasonic fingerprint sensor</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Battery:</span>&nbsp;5000mAh with 45W fast charging, 15W wireless charging</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Connectivity:</span>&nbsp;5G,&nbsp;<a href=\\\"https://www.wi-fi.org/file/wi-fi-6e-highlights\\\" target=\\\"_blank\\\" rel=\\\"noopener nofollow\\\" style=\\\"color: rgb(77, 178, 236);\\\">Wi-Fi 6E</a>, Bluetooth 5.2,<a href=\\\"https://www.gadgetbytenepal.com/ultra-wideband-in-smartphones/\\\" target=\\\"_blank\\\" rel=\\\"noopener\\\" style=\\\"color: rgb(77, 178, 236);\\\">&nbsp;Ultra Wide Band</a></li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Color Options in Nepal:</span>&nbsp;Phantom Black, Green, Burgundy</li><li aria-level=\\\"1\\\" style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 0px;\\\"><span style=\\\"font-weight: 700;\\\">Price in Nepal:&nbsp;</span>Rs. 169,999 (12/256GB) | Rs. 179,999 (12/512GB)</li></ul>', 1, '2023-01-11 14:25:13'),
(5, 4, 1, 0, 'Vivo V23e', '<ul style=\\\"padding: 0px; margin-bottom: 26px; color: rgb(34, 34, 34); font-family: roboto; font-size: 15px;\\\"><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Body:</span>&nbsp;160.87 × 74.28 × 7.36-7.41mm, 172gm</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Display:</span>&nbsp;6.44-inch AMOLED panel, FHD+ (2400 x 1080), 60Hz refresh rate</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Chipset:</span>&nbsp;MediaTek Helio G96 4G (12nm)</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Memory:</span>&nbsp;8GB RAM, 128/256GB storage</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Software:</span>&nbsp;Android 11 with Funtouch OS 12</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Rear Camera:</span>&nbsp;Triple (with LED flash)<br>– 64MP, f/1.79 primary<br>– 8MP, f/2.2 ultrawide<br>– 2MP, f/2.4 macro</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Front Camera:</span>&nbsp;50MP, f/2.0 (waterdrop notch)</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Security:</span>&nbsp;In-display fingerprint sensor</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Battery:</span>&nbsp;4050mAh, 44W charging (11V, 4A)</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 10px;\\\"><span style=\\\"font-weight: 700;\\\">Connectivity:</span>&nbsp;Hybrid SIM slot, dual-band Wi-Fi, Bluetooth 5.2</li><li style=\\\"line-height: inherit; margin-left: 21px; margin-bottom: 0px;\\\"><span style=\\\"font-weight: 700;\\\">Color Options:</span>&nbsp;Sunshine Coast, Moonlight Shadow</li></ul>', 1, '2023-01-11 15:56:26'),
(6, 1, 2, 0, 'Apple Airpods Pro with MagSafe Wireless Charging case', '<table style=\\\"border-spacing: 0px; width: 610.4px; margin-bottom: 0px; color: rgb(0, 0, 0); font-family: &quot;helvetica normal&quot;; font-size: 16px;\\\"><tbody><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Sensor</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Dual beamforming microphones, Inward-facing microphone, Dual optical sensors, Motion-detecting accelerometer, Speech-detecting accelerometer, Force sensor.</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Battery</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Up to 4.5 hours of listening time with a single charge (up to 5 hours with Active Noise Cancellation and Transparency off), Up to 3.5 hours of talk time with a single charge, AirPods Pro with Wireless Charging Case, More than 24 hours of listening time, More than 18 hours of talk time, 5 minutes in the case provides around 1 hour of listening time or around 1 hour of talk time.</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Chip</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">H1-based System in Package</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Audio Technology</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Active Noise Cancellation, Transparency mode, Adaptive EQ, Vent system for pressure equalization, Custom high-excursion Apple driver, Custom high dynamic range amplifier.</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Connectivity</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Bluetooth 5.0</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Controls</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Press the force sensor once to play, pause, or answer a phone call, Press twice to skip forward, Press three times to skip back, Press and hold to switch between Active Noise Cancellation and Transparency mode, Say “Hey Siri” to do things like playing a song, make a call, or get directions.</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Size and Weight</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">AirPods Pro (each) : Height: 1.22 inches (30.9 mm), Width: 0.86 inch (21.8 mm), Depth: 0.94 inch (24.0 mm), Weight: 0.19 ounce (5.4 grams), Wireless Charging Case : Height: 1.78 inches (45.2 mm), Width: 2.39 inches (60.6 mm), Depth: 0.85 inch (21.7 mm), Weight: 1.61 ounces (45.6 grams).</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Charging Case</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Works with Qi-certified chargers or the Lightning connector</p></td></tr><tr><td style=\\\"padding: 0px 0px 15px; width: 152.6px;\\\"><label style=\\\"max-width: 100%; margin-bottom: 5px; font-size: 15px;\\\">Accessibility</label></td><td style=\\\"padding: 0px 0px 15px; width: 457.8px;\\\"><p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 1.6em; font-size: 15px;\\\">Accessibility features help people with disabilities get the most out of their new AirPods Pro. Features include: Live Listen audio</p></td></tr></tbody></table>', 1, '2023-01-11 15:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(2, 2, 5000, '2023-01-11 15:41:47'),
(3, 3, 169999, '2023-01-11 15:51:54'),
(4, 4, 74990, '2023-01-12 11:20:19'),
(5, 17, 169999, '2023-01-12 13:08:12'),
(6, 18, 89998, '2023-01-12 13:26:38'),
(7, 19, 169999, '2023-01-12 20:44:03'),
(8, 20, 149980, '2023-01-12 20:48:34'),
(9, 21, 24999, '2023-01-12 20:54:01'),
(10, 22, 24999, '2023-01-12 22:22:35'),
(11, 23, 44999, '2023-01-12 22:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 3, 'Batteries', 'Mobile Batteries', 1, '2021-08-30 11:28:40'),
(2, 2, 'Phone Case Cover', 'Mobile Phones Cases', 1, '2021-08-30 11:29:15'),
(3, 4, 'Micro SD Card', 'Micro SD Cards', 1, '2021-08-30 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Mobo-Shopping'),
(6, 'short_name', 'Mobo-Shopping'),
(11, 'logo', 'uploads/1673459220_MCpxEdXjmVHUivvzZ6KUMU.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1673459220_gsmarena_000.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
