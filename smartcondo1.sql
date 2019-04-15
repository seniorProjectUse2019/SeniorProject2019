SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS smartcondo1 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE smartcondo1;

CREATE TABLE auth_group (
  id int(11) NOT NULL,
  name varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_group (id, `name`) VALUES
(2, 'RoomOwner'),
(1, 'Tenant');

CREATE TABLE auth_group_permissions (
  id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  permission_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES
(1, 1, 41),
(2, 1, 44),
(3, 1, 45),
(4, 1, 48),
(5, 1, 49),
(6, 1, 52),
(7, 1, 56),
(8, 1, 60),
(9, 1, 64),
(10, 1, 68),
(11, 1, 69),
(12, 1, 72),
(13, 1, 73),
(14, 1, 76),
(15, 1, 77),
(16, 1, 80),
(17, 1, 81),
(18, 1, 84),
(19, 1, 108),
(20, 1, 112),
(21, 1, 116),
(22, 1, 120),
(23, 2, 41),
(24, 2, 44),
(25, 2, 45),
(26, 2, 46),
(27, 2, 47),
(28, 2, 48),
(29, 2, 49),
(30, 2, 50),
(31, 2, 51),
(32, 2, 52),
(33, 2, 56),
(34, 2, 60),
(35, 2, 64),
(36, 2, 68),
(37, 2, 69),
(38, 2, 70),
(39, 2, 71),
(40, 2, 72),
(41, 2, 73),
(42, 2, 76),
(43, 2, 77),
(44, 2, 80),
(45, 2, 84),
(46, 2, 108),
(47, 2, 112),
(48, 2, 116),
(49, 2, 118),
(50, 2, 119),
(51, 2, 120);

CREATE TABLE auth_permission (
  id int(11) NOT NULL,
  name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  content_type_id int(11) NOT NULL,
  codename varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_permission (id, `name`, content_type_id, codename) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add book instance', 7, 'add_bookinstance'),
(26, 'Can change book instance', 7, 'change_bookinstance'),
(27, 'Can delete book instance', 7, 'delete_bookinstance'),
(28, 'Can view book instance', 7, 'view_bookinstance'),
(29, 'Can add genre', 8, 'add_genre'),
(30, 'Can change genre', 8, 'change_genre'),
(31, 'Can delete genre', 8, 'delete_genre'),
(32, 'Can view genre', 8, 'view_genre'),
(33, 'Can add book', 9, 'add_book'),
(34, 'Can change book', 9, 'change_book'),
(35, 'Can delete book', 9, 'delete_book'),
(36, 'Can view book', 9, 'view_book'),
(37, 'Can add author', 10, 'add_author'),
(38, 'Can change author', 10, 'change_author'),
(39, 'Can delete author', 10, 'delete_author'),
(40, 'Can view author', 10, 'view_author'),
(41, 'Can add invoice', 12, 'add_invoice'),
(42, 'Can change invoice', 12, 'change_invoice'),
(43, 'Can delete invoice', 12, 'delete_invoice'),
(44, 'Can view invoice', 12, 'view_invoice'),
(45, 'Can add invoice line', 13, 'add_invoiceline'),
(46, 'Can change invoice line', 13, 'change_invoiceline'),
(47, 'Can delete invoice line', 13, 'delete_invoiceline'),
(48, 'Can view invoice line', 13, 'view_invoiceline'),
(49, 'Can add payment type', 14, 'add_paymenttype'),
(50, 'Can change payment type', 14, 'change_paymenttype'),
(51, 'Can delete payment type', 14, 'delete_paymenttype'),
(52, 'Can view payment type', 14, 'view_paymenttype'),
(53, 'Can add data', 15, 'add_data'),
(54, 'Can change data', 15, 'change_data'),
(55, 'Can delete data', 15, 'delete_data'),
(56, 'Can view data', 15, 'view_data'),
(57, 'Can add room', 16, 'add_room'),
(58, 'Can change room', 16, 'change_room'),
(59, 'Can delete room', 16, 'delete_room'),
(60, 'Can view room', 16, 'view_room'),
(61, 'Can add data type', 11, 'add_datatype'),
(62, 'Can change data type', 11, 'change_datatype'),
(63, 'Can delete data type', 11, 'delete_datatype'),
(64, 'Can view data type', 11, 'view_datatype'),
(65, 'Can add notification', 17, 'add_notification'),
(66, 'Can change notification', 17, 'change_notification'),
(67, 'Can delete notification', 17, 'delete_notification'),
(68, 'Can view notification', 17, 'view_notification'),
(69, 'Can add invoice item', 18, 'add_invoiceitem'),
(70, 'Can change invoice item', 18, 'change_invoiceitem'),
(71, 'Can delete invoice item', 18, 'delete_invoiceitem'),
(72, 'Can view invoice item', 18, 'view_invoiceitem'),
(73, 'Can add invoice item', 19, 'add_invoiceitem'),
(74, 'Can change invoice item', 19, 'change_invoiceitem'),
(75, 'Can delete invoice item', 19, 'delete_invoiceitem'),
(76, 'Can view invoice item', 19, 'view_invoiceitem'),
(77, 'Can add invoice', 20, 'add_invoice'),
(78, 'Can change invoice', 20, 'change_invoice'),
(79, 'Can delete invoice', 20, 'delete_invoice'),
(80, 'Can view invoice', 20, 'view_invoice'),
(81, 'Can add payment type', 21, 'add_paymenttype'),
(82, 'Can change payment type', 21, 'change_paymenttype'),
(83, 'Can delete payment type', 21, 'delete_paymenttype'),
(84, 'Can view payment type', 21, 'view_paymenttype'),
(85, 'Can add association', 22, 'add_association'),
(86, 'Can change association', 22, 'change_association'),
(87, 'Can delete association', 22, 'delete_association'),
(88, 'Can view association', 22, 'view_association'),
(89, 'Can add code', 23, 'add_code'),
(90, 'Can change code', 23, 'change_code'),
(91, 'Can delete code', 23, 'delete_code'),
(92, 'Can view code', 23, 'view_code'),
(93, 'Can add nonce', 24, 'add_nonce'),
(94, 'Can change nonce', 24, 'change_nonce'),
(95, 'Can delete nonce', 24, 'delete_nonce'),
(96, 'Can view nonce', 24, 'view_nonce'),
(97, 'Can add user social auth', 25, 'add_usersocialauth'),
(98, 'Can change user social auth', 25, 'change_usersocialauth'),
(99, 'Can delete user social auth', 25, 'delete_usersocialauth'),
(100, 'Can view user social auth', 25, 'view_usersocialauth'),
(101, 'Can add partial', 26, 'add_partial'),
(102, 'Can change partial', 26, 'change_partial'),
(103, 'Can delete partial', 26, 'delete_partial'),
(104, 'Can view partial', 26, 'view_partial'),
(105, 'Can add global notificaiton', 27, 'add_globalnotificaiton'),
(106, 'Can change global notificaiton', 27, 'change_globalnotificaiton'),
(107, 'Can delete global notificaiton', 27, 'delete_globalnotificaiton'),
(108, 'Can view global notificaiton', 27, 'view_globalnotificaiton'),
(109, 'Can add specific notification', 17, 'add_specificnotification'),
(110, 'Can change specific notification', 17, 'change_specificnotification'),
(111, 'Can delete specific notification', 17, 'delete_specificnotification'),
(112, 'Can view specific notification', 17, 'view_specificnotification'),
(113, 'Can add room owner', 28, 'add_roomowner'),
(114, 'Can change room owner', 28, 'change_roomowner'),
(115, 'Can delete room owner', 28, 'delete_roomowner'),
(116, 'Can view room owner', 28, 'view_roomowner'),
(117, 'Can add user in the room', 28, 'add_userintheroom'),
(118, 'Can change user in the room', 28, 'change_userintheroom'),
(119, 'Can delete user in the room', 28, 'delete_userintheroom'),
(120, 'Can view user in the room', 28, 'view_userintheroom');

CREATE TABLE auth_user (
  id int(11) NOT NULL,
  password varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  last_login datetime(6) DEFAULT NULL,
  is_superuser tinyint(1) NOT NULL,
  username varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  first_name varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  last_name varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  email varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  is_staff tinyint(1) NOT NULL,
  is_active tinyint(1) NOT NULL,
  date_joined datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_user (id, `password`, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES
(1, 'pbkdf2_sha256$120000$sckRz3VGzzCx$iJjMcoEfsDUa9C2Gm34CN85bW3IyleDY+s0FYWZEFuQ=', '2019-04-12 09:17:09.242619', 1, 'mew', 'Sawachol', 'Rojanaporn', 'sawachol@gmail.com', 1, 1, '2019-03-10 12:09:46.000000'),
(2, 'pbkdf2_sha256$120000$CCSuzxOubyuK$N1HQYoU5utKvdYp+mT/LfZtdOdaX+zTTqP3RVYK1NcE=', NULL, 0, 'may', 'may', '', '', 0, 1, '2019-03-15 10:34:54.000000'),
(5, 'pbkdf2_sha256$120000$tkOnrXHXmqZQ$qIDtACVXtBcHw1oWLN8CdKZoqZSRRvmyYY+E7q+Vuww=', NULL, 0, 'Staff1', 'staff', 'staff', 'staffThru@gmail.com', 1, 1, '2019-04-02 16:05:37.000000'),
(6, '!cbE9RGkY5FI7hNNzPp667KQleCfSduikXlIBlf9E', '2019-04-12 09:16:25.833676', 0, 'U1b4c4a382f2643c2c85ea3e0da58e93b', 'mew', '', '', 0, 1, '2019-04-12 08:38:33.822408');

CREATE TABLE auth_user_groups (
  id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  group_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE auth_user_user_permissions (
  id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  permission_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO auth_user_user_permissions (id, user_id, permission_id) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 5, 4),
(5, 5, 5),
(6, 5, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 5, 16),
(17, 5, 17),
(18, 5, 18),
(19, 5, 19),
(20, 5, 20),
(21, 5, 21),
(22, 5, 22),
(23, 5, 23),
(24, 5, 24),
(25, 5, 25),
(26, 5, 26),
(27, 5, 27),
(28, 5, 28),
(29, 5, 29),
(30, 5, 30),
(31, 5, 31),
(32, 5, 32),
(33, 5, 33),
(34, 5, 34),
(35, 5, 35),
(36, 5, 36),
(37, 5, 37),
(38, 5, 38),
(39, 5, 39),
(40, 5, 40),
(41, 5, 41),
(42, 5, 42),
(43, 5, 43),
(44, 5, 44),
(45, 5, 45),
(46, 5, 46),
(47, 5, 47),
(48, 5, 48),
(49, 5, 49),
(50, 5, 50),
(51, 5, 51),
(52, 5, 52),
(53, 5, 53),
(54, 5, 54),
(55, 5, 55),
(56, 5, 56),
(57, 5, 57),
(58, 5, 58),
(59, 5, 59),
(60, 5, 60),
(61, 5, 61),
(62, 5, 62),
(63, 5, 63),
(64, 5, 64),
(65, 5, 65),
(66, 5, 66),
(67, 5, 67),
(68, 5, 68),
(69, 5, 69),
(70, 5, 70),
(71, 5, 71),
(72, 5, 72),
(73, 5, 73),
(74, 5, 74),
(75, 5, 75),
(76, 5, 76),
(77, 5, 77),
(78, 5, 78),
(79, 5, 79),
(80, 5, 80),
(81, 5, 81),
(82, 5, 82),
(83, 5, 83),
(84, 5, 84),
(85, 5, 85),
(86, 5, 86),
(87, 5, 87),
(88, 5, 88),
(89, 5, 89),
(90, 5, 90),
(91, 5, 91),
(92, 5, 92),
(93, 5, 93),
(94, 5, 94),
(95, 5, 95),
(96, 5, 96),
(97, 5, 97),
(98, 5, 98),
(99, 5, 99),
(100, 5, 100),
(101, 5, 101),
(102, 5, 102),
(103, 5, 103),
(104, 5, 104),
(105, 5, 105),
(106, 5, 106),
(107, 5, 107),
(108, 5, 108),
(109, 5, 109),
(110, 5, 110),
(111, 5, 111),
(112, 5, 112),
(113, 5, 113),
(114, 5, 114),
(115, 5, 115),
(116, 5, 116),
(117, 5, 117),
(118, 5, 118),
(119, 5, 119),
(120, 5, 120);

CREATE TABLE django_admin_log (
  id int(11) NOT NULL,
  action_time datetime(6) NOT NULL,
  object_id longtext COLLATE utf8_unicode_ci,
  object_repr varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  action_flag smallint(5) UNSIGNED NOT NULL,
  change_message longtext COLLATE utf8_unicode_ci NOT NULL,
  content_type_id int(11) DEFAULT NULL,
  user_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES
(1, '2019-03-10 12:14:48.240229', '1', 'DataType object (1)', 1, '[{\"added\": {}}]', 11, 1),
(2, '2019-03-10 12:53:09.135761', '5', '{\'Electric\'}', 1, '[{\"added\": {}}]', 11, 1),
(3, '2019-03-10 12:54:36.168197', '1bc66629-8ffd-416b-b5dc-6915eb418408', '305', 1, '[{\"added\": {}}]', 16, 1),
(4, '2019-03-10 12:57:40.527239', '3', 'homedetail.DataType.None of 2019-03-10', 1, '[{\"added\": {}}]', 15, 1),
(5, '2019-03-10 13:07:36.874404', '3', '3', 2, '[{\"changed\": {\"fields\": [\"Data_Type\"]}}]', 15, 1),
(6, '2019-03-10 13:08:13.083472', '6', 'Water', 1, '[{\"added\": {}}]', 11, 1),
(7, '2019-03-10 13:08:18.938994', '4', '4', 1, '[{\"added\": {}}]', 15, 1),
(8, '2019-03-15 10:32:01.925882', '1', 'mew', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]', 4, 1),
(9, '2019-03-15 10:34:54.953680', '2', 'may', 1, '[{\"added\": {}}]', 4, 1),
(10, '2019-03-15 10:54:49.205863', '1bc66629-8ffd-416b-b5dc-6915eb418408', '305', 2, '[{\"changed\": {\"fields\": [\"UserID\"]}}]', 16, 1),
(11, '2019-03-19 07:20:37.702028', 'bcd5688d-7d52-44a4-a2ac-c1e5768cd2e0', '304', 1, '[{\"added\": {}}]', 16, 1),
(12, '2019-03-19 07:20:47.642683', 'ea33e853-e43c-49f4-8219-b02debfd0453', '306', 1, '[{\"added\": {}}]', 16, 1),
(13, '2019-03-20 14:05:56.143477', '4', 'Online Bank', 1, '[{\"added\": {}}]', 21, 1),
(14, '2019-03-20 14:06:06.979748', '5', 'Atm', 1, '[{\"added\": {}}]', 21, 1),
(15, '2019-03-20 14:06:12.282885', '6', 'Credit', 1, '[{\"added\": {}}]', 21, 1),
(16, '2019-03-20 14:06:16.578811', '7', 'cash', 1, '[{\"added\": {}}]', 21, 1),
(17, '2019-03-23 12:32:21.139270', '5', '5', 3, '', 20, 1),
(18, '2019-03-23 12:32:21.200088', '4', '4', 3, '', 20, 1),
(19, '2019-03-23 13:10:58.330490', '25', '25', 3, '', 20, 1),
(20, '2019-03-23 13:10:58.399318', '24', '24', 3, '', 20, 1),
(21, '2019-03-23 13:10:58.601784', '23', '23', 3, '', 20, 1),
(22, '2019-03-23 13:10:58.645628', '22', '22', 3, '', 20, 1),
(23, '2019-03-23 13:10:58.725413', '21', '21', 3, '', 20, 1),
(24, '2019-03-23 13:10:58.790239', '20', '20', 3, '', 20, 1),
(25, '2019-03-23 13:10:58.847088', '19', '19', 3, '', 20, 1),
(26, '2019-03-23 13:10:58.890974', '18', '18', 3, '', 20, 1),
(27, '2019-03-23 13:10:58.946822', '17', '17', 3, '', 20, 1),
(28, '2019-03-23 13:10:58.974767', '16', '16', 3, '', 20, 1),
(29, '2019-03-23 13:10:59.012647', '15', '15', 3, '', 20, 1),
(30, '2019-03-23 13:10:59.040613', '14', '14', 3, '', 20, 1),
(31, '2019-03-23 13:10:59.079467', '13', '13', 3, '', 20, 1),
(32, '2019-03-23 13:10:59.155292', '12', '12', 3, '', 20, 1),
(33, '2019-03-23 13:10:59.185186', '11', '11', 3, '', 20, 1),
(34, '2019-03-23 13:10:59.221134', '10', '10', 3, '', 20, 1),
(35, '2019-03-23 13:10:59.251022', '9', '9', 3, '', 20, 1),
(36, '2019-03-23 13:10:59.287909', '8', '8', 3, '', 20, 1),
(37, '2019-03-23 13:10:59.317829', '7', '7', 3, '', 20, 1),
(38, '2019-03-23 13:10:59.354731', '6', '6', 3, '', 20, 1),
(39, '2019-03-23 13:11:30.103879', '7', '7', 3, '', 19, 1),
(40, '2019-03-23 13:11:30.150722', '6', '6', 3, '', 19, 1),
(41, '2019-03-23 13:11:30.180693', '5', '5', 3, '', 19, 1),
(42, '2019-03-23 13:11:30.217547', '4', '4', 3, '', 19, 1),
(43, '2019-03-23 13:11:30.247465', '3', '3', 3, '', 19, 1),
(44, '2019-03-23 13:11:30.283372', '2', '2', 3, '', 19, 1),
(45, '2019-03-23 13:11:30.340249', '1', '1', 3, '', 19, 1),
(46, '2019-03-23 13:29:29.395975', '4', '4', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 15, 1),
(47, '2019-03-23 13:29:43.321028', '26', '26', 3, '', 20, 1),
(48, '2019-03-23 13:29:51.471294', '8', '8', 3, '', 19, 1),
(49, '2019-03-23 13:33:08.516744', '27', '27', 3, '', 20, 1),
(50, '2019-03-23 13:33:15.903883', '9', '9', 3, '', 19, 1),
(51, '2019-03-23 13:34:29.412666', '29', '29', 3, '', 20, 1),
(52, '2019-03-23 13:34:36.159557', '11', '11', 3, '', 19, 1),
(53, '2019-03-23 13:35:05.935869', '3', '3', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 15, 1),
(54, '2019-03-25 10:02:53.680135', '3', 'U1b4c4a382f2643c2c85ea3e0da58e93b', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 1),
(57, '2019-03-26 06:14:45.619155', '4', 'U1b4c4a382f2643c2c85ea3e0da58e93b', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 1),
(58, '2019-03-28 06:50:30.071168', '5', '5', 1, '[{\"added\": {}}]', 15, 1),
(59, '2019-03-28 07:13:29.229470', '3', '3', 1, '[{\"added\": {}}]', 17, 1),
(60, '2019-03-28 07:22:34.653779', '1', '1', 1, '[{\"added\": {}}]', 27, 1),
(69, '2019-04-07 16:30:20.269191', '1', 'Tenant', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 3, 1),
(70, '2019-04-08 09:00:48.656678', '7', '7', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 15, 1),
(71, '2019-04-12 07:41:58.179530', '2', 'may', 2, '[{\"changed\": {\"fields\": [\"first_name\"]}}]', 4, 1),
(72, '2019-04-12 07:54:55.222670', '4', 'U1b4c4a382f2643c2c85ea3e0da58e93b', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 4, 1),
(73, '2019-04-12 08:38:03.966274', '4', 'U1b4c4a382f2643c2c85ea3e0da58e93b', 3, '', 4, 1),
(74, '2019-04-12 10:11:59.058964', '7', '7', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 15, 1),
(75, '2019-04-12 10:26:22.718658', '37', '37', 3, '', 20, 1),
(76, '2019-04-12 10:26:22.770840', '36', '36', 3, '', 20, 1),
(77, '2019-04-12 10:26:22.802167', '35', '35', 3, '', 20, 1),
(78, '2019-04-12 10:26:22.836494', '34', '34', 3, '', 20, 1),
(79, '2019-04-12 10:26:22.868708', '33', '33', 3, '', 20, 1),
(80, '2019-04-12 10:27:20.377086', '39', '39', 3, '', 20, 1),
(81, '2019-04-12 10:27:20.444912', '38', '38', 3, '', 20, 1),
(82, '2019-04-12 10:27:20.476788', '32', '32', 3, '', 20, 1),
(83, '2019-04-12 10:27:20.521987', '31', '31', 3, '', 20, 1),
(84, '2019-04-12 10:27:33.744898', '7', '7', 2, '[{\"changed\": {\"fields\": [\"status\"]}}]', 15, 1),
(85, '2019-04-13 16:52:38.879043', '8', '8', 1, '[{\"added\": {}}]', 15, 1);

CREATE TABLE django_content_type (
  id int(11) NOT NULL,
  app_label varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  model varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO django_content_type (id, app_label, model) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(15, 'homedetail', 'data'),
(11, 'homedetail', 'datatype'),
(16, 'homedetail', 'room'),
(28, 'homedetail', 'userintheroom'),
(27, 'notification', 'globalnotificaiton'),
(17, 'notification', 'specificnotification'),
(20, 'payment', 'invoice'),
(19, 'payment', 'invoiceitem'),
(21, 'payment', 'paymenttype'),
(12, 'payments', 'invoice'),
(18, 'payments', 'invoiceitem'),
(13, 'payments', 'invoiceline'),
(14, 'payments', 'paymenttype'),
(6, 'sessions', 'session'),
(22, 'social_django', 'association'),
(23, 'social_django', 'code'),
(24, 'social_django', 'nonce'),
(26, 'social_django', 'partial'),
(25, 'social_django', 'usersocialauth'),
(10, 'view', 'author'),
(9, 'view', 'book'),
(7, 'view', 'bookinstance'),
(8, 'view', 'genre');

CREATE TABLE django_migrations (
  id int(11) NOT NULL,
  app varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  applied datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO django_migrations (id, app, `name`, applied) VALUES
(1, 'contenttypes', '0001_initial', '2019-02-16 12:57:57.191272'),
(2, 'auth', '0001_initial', '2019-02-16 12:58:04.353380'),
(3, 'admin', '0001_initial', '2019-02-16 12:58:07.443682'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-02-16 12:58:07.539668'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-02-16 12:58:07.655112'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-02-16 12:58:09.055359'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-02-16 12:58:09.713250'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-02-16 12:58:10.493667'),
(9, 'auth', '0004_alter_user_username_opts', '2019-02-16 12:58:10.558734'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-02-16 12:58:11.229781'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-02-16 12:58:11.370462'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-02-16 12:58:11.432902'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-02-16 12:58:12.163206'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-02-16 12:58:13.159391'),
(15, 'sessions', '0001_initial', '2019-02-16 12:58:13.603896'),
(16, 'view', '0001_initial', '2019-02-17 07:49:02.363028'),
(17, 'homedetail', '0001_initial', '2019-03-10 12:13:22.542044'),
(18, 'notification', '0001_initial', '2019-03-10 12:13:23.797353'),
(19, 'payments', '0001_initial', '2019-03-10 12:13:28.391367'),
(20, 'homedetail', '0002_auto_20190310_1946', '2019-03-10 12:46:52.687487'),
(21, 'homedetail', '0003_auto_20190310_1957', '2019-03-10 12:57:29.121163'),
(22, 'homedetail', '0004_auto_20190310_2006', '2019-03-10 13:07:10.164238'),
(23, 'homedetail', '0005_auto_20190315_1653', '2019-03-15 09:53:38.980199'),
(24, 'homedetail', '0006_auto_20190315_1745', '2019-03-15 10:45:50.947081'),
(25, 'homedetail', '0007_auto_20190316_1729', '2019-03-16 10:30:01.822573'),
(26, 'payments', '0002_auto_20190316_1729', '2019-03-16 10:30:03.814766'),
(27, 'homedetail', '0008_auto_20190316_1800', '2019-03-16 11:00:27.737901'),
(28, 'homedetail', '0009_auto_20190316_1801', '2019-03-16 11:01:23.087420'),
(29, 'homedetail', '0010_auto_20190316_2136', '2019-03-16 14:36:33.251487'),
(30, 'payments', '0003_auto_20190316_2136', '2019-03-16 14:36:34.490966'),
(31, 'homedetail', '0011_auto_20190316_2138', '2019-03-19 08:50:23.640582'),
(32, 'payment', '0001_initial', '2019-03-19 09:03:52.496459'),
(33, 'payment', '0002_auto_20190319_2149', '2019-03-19 14:49:34.632816'),
(34, 'payment', '0003_auto_20190319_2151', '2019-03-19 14:51:29.555711'),
(35, 'payment', '0004_invoice_roomid', '2019-03-20 06:51:31.106651'),
(36, 'homedetail', '0012_auto_20190320_1438', '2019-03-20 07:38:18.753305'),
(37, 'payment', '0005_auto_20190320_2104', '2019-03-20 14:04:29.917504'),
(38, 'homedetail', '0013_auto_20190323_2029', '2019-03-23 13:29:15.987929'),
(39, 'default', '0001_initial', '2019-03-25 06:16:00.076130'),
(40, 'social_auth', '0001_initial', '2019-03-25 06:16:00.163863'),
(41, 'default', '0002_add_related_name', '2019-03-25 06:16:00.937787'),
(42, 'social_auth', '0002_add_related_name', '2019-03-25 06:16:00.983665'),
(43, 'default', '0003_alter_email_max_length', '2019-03-25 06:16:02.017812'),
(44, 'social_auth', '0003_alter_email_max_length', '2019-03-25 06:16:02.064039'),
(45, 'default', '0004_auto_20160423_0400', '2019-03-25 06:16:02.168498'),
(46, 'social_auth', '0004_auto_20160423_0400', '2019-03-25 06:16:02.212299'),
(47, 'social_auth', '0005_auto_20160727_2333', '2019-03-25 06:16:02.435701'),
(48, 'social_django', '0006_partial', '2019-03-25 06:16:03.027093'),
(49, 'social_django', '0007_code_timestamp', '2019-03-25 06:16:03.830798'),
(50, 'social_django', '0008_partial_timestamp', '2019-03-25 06:16:04.576332'),
(51, 'social_django', '0001_initial', '2019-03-25 06:16:04.652181'),
(52, 'social_django', '0002_add_related_name', '2019-03-25 06:16:04.703001'),
(53, 'social_django', '0005_auto_20160727_2333', '2019-03-25 06:16:04.793724'),
(54, 'social_django', '0004_auto_20160423_0400', '2019-03-25 06:16:04.933461'),
(55, 'social_django', '0003_alter_email_max_length', '2019-03-25 06:16:04.978343'),
(56, 'notification', '0002_auto_20190328_1417', '2019-03-28 07:17:47.142152'),
(57, 'notification', '0003_specificnotification_dataid', '2019-03-28 10:57:54.905405'),
(58, 'homedetail', '0014_roomowner', '2019-04-02 14:20:00.620641'),
(59, 'homedetail', '0015_auto_20190402_2257', '2019-04-02 15:57:35.734876'),
(60, 'payment', '0006_auto_20190406_2342', '2019-04-06 16:42:36.457647'),
(61, 'payment', '0007_auto_20190407_0008', '2019-04-06 17:08:26.715695'),
(62, 'homedetail', '0016_auto_20190407_1634', '2019-04-07 09:34:24.346985'),
(63, 'homedetail', '0017_auto_20190407_1659', '2019-04-07 09:59:29.671335');

CREATE TABLE django_session (
  session_key varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  session_data longtext COLLATE utf8_unicode_ci NOT NULL,
  expire_date datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO django_session (session_key, session_data, expire_date) VALUES
('c6sda9r800w4jzb3yir9qlu6xeg1514a', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-04-13 08:00:33.575838'),
('lf9pobnhviizp2kbzn507tavvvgguik6', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-03-24 12:10:06.506337'),
('tn04050opu4tll2mzvzrk0ooqj101d8k', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-03-26 14:09:15.946101'),
('vxl8hvlx1asb1fzv2r16s8qrylve2715', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-04-26 09:17:09.371278'),
('xojxlqtwpirvk8kw9da8ls2c2d0pnlh1', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-04-11 06:49:04.968917'),
('ypyjrk9wgjcpcr5tqfclcwbi85c05zap', 'MWY2ODE2ZWM1M2ZlNjlmZjM0NzY2MDBhNzJlMGE0NTkzZjhkNDBmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjk0ZDk3NGQ1YTVhNzMwZTJjMWQ1ZGRiZGYzYzQ1Mzk5YWY4NWE5In0=', '2019-03-30 08:47:34.276941');

CREATE TABLE homedetail_data (
  id int(11) NOT NULL,
  DataDate date DEFAULT NULL,
  Detail longtext COLLATE utf8_unicode_ci,
  UnitUsed decimal(10,2) NOT NULL,
  RoomId_id char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  Data_Type_id int(11) DEFAULT NULL,
  DataDeadLine date DEFAULT NULL,
  status varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO homedetail_data (id, DataDate, Detail, UnitUsed, RoomId_id, Data_Type_id, DataDeadLine, `status`) VALUES
(3, '2019-03-10', '', '55.00', '1bc666298ffd416bb5dc6915eb418408', 5, '2019-03-14', 'O'),
(4, '2019-03-10', '', '12.00', '1bc666298ffd416bb5dc6915eb418408', 6, '2019-03-29', 'O'),
(5, '2019-03-28', '', '23.00', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 5, '2019-03-28', 'O'),
(7, '2019-03-10', '123', '123231.00', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 5, '2019-03-28', 'N'),
(8, '2019-04-13', 'what is this', '12.00', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 6, '2019-04-13', 'N');

CREATE TABLE homedetail_datatype (
  id int(11) NOT NULL,
  DataType_Name varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  DataTypeDetail longtext COLLATE utf8_unicode_ci NOT NULL,
  Rate decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO homedetail_datatype (id, DataType_Name, DataTypeDetail, Rate) VALUES
(5, 'Electric', 'sds', '23.00'),
(6, 'Water', 'water', '12.00');

CREATE TABLE homedetail_room (
  RoomId char(32) COLLATE utf8_unicode_ci NOT NULL,
  RoomNumber varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  RoomDetail longtext COLLATE utf8_unicode_ci NOT NULL,
  status varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  UserID_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO homedetail_room (RoomId, RoomNumber, RoomDetail, `status`, UserID_id) VALUES
('1bc666298ffd416bb5dc6915eb418408', '305', 'double', 'o', 1),
('bcd5688d7d5244a4a2acc1e5768cd2e0', '304', 'efd', 'a', 1),
('ea33e853e43c49f48219b02debfd0453', '306', 'asd', 'a', 2);

CREATE TABLE homedetail_userintheroom (
  id int(11) NOT NULL,
  RoomId_id char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  User_id int(11) DEFAULT NULL,
  status varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO homedetail_userintheroom (id, RoomId_id, User_id, `status`) VALUES
(1, 'bcd5688d7d5244a4a2acc1e5768cd2e0', 1, 'O');

CREATE TABLE notification_globalnotificaiton (
  id int(11) NOT NULL,
  Topic varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  Detail longtext COLLATE utf8_unicode_ci NOT NULL,
  notification_type varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO notification_globalnotificaiton (id, Topic, Detail, notification_type) VALUES
(1, 'Hello to all', 'Hello to all', 'a');

CREATE TABLE notification_specificnotification (
  id int(11) NOT NULL,
  topic varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  detail longtext COLLATE utf8_unicode_ci NOT NULL,
  notification_type varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  RoomID_id char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  DataID_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO notification_specificnotification (id, topic, detail, notification_type, RoomID_id, DataID_id) VALUES
(1, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(2, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 5),
(3, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(4, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(5, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(6, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(7, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(8, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 7),
(9, 'Utility Notification', 'You have new Payment pending please go to detail page to Check for more detail', 'u', 'bcd5688d7d5244a4a2acc1e5768cd2e0', 8);

CREATE TABLE payment_invoice (
  id int(11) NOT NULL,
  Created_date datetime(6) NOT NULL,
  Evidence varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  status varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PayerID_id int(11) DEFAULT NULL,
  Data_id int(11) DEFAULT NULL,
  Rate_id int(11) DEFAULT NULL,
  quantity int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE payment_invoice_payment_method (
  id int(11) NOT NULL,
  invoice_id int(11) NOT NULL,
  paymenttype_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE payment_paymenttype (
  id int(11) NOT NULL,
  PaymentTypeDetail varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payment_paymenttype (id, PaymentTypeDetail) VALUES
(4, 'Online Bank'),
(5, 'Atm'),
(6, 'Credit'),
(7, 'cash');

CREATE TABLE social_auth_association (
  id int(11) NOT NULL,
  server_url varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  handle varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  secret varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  issued int(11) NOT NULL,
  lifetime int(11) NOT NULL,
  assoc_type varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE social_auth_code (
  id int(11) NOT NULL,
  email varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  code varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  verified tinyint(1) NOT NULL,
  timestamp datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE social_auth_nonce (
  id int(11) NOT NULL,
  server_url varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  timestamp int(11) NOT NULL,
  salt varchar(65) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE social_auth_partial (
  id int(11) NOT NULL,
  token varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  next_step smallint(5) UNSIGNED NOT NULL,
  backend varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  data longtext COLLATE utf8_unicode_ci NOT NULL,
  timestamp datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE social_auth_usersocialauth (
  id int(11) NOT NULL,
  provider varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  uid varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  extra_data longtext COLLATE utf8_unicode_ci NOT NULL,
  user_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE auth_group
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY name (name);

ALTER TABLE auth_group_permissions
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY auth_group_permissions_group_id_permission_id_0cd325b0_uniq (group_id,permission_id),
  ADD KEY auth_group_permissio_permission_id_84c5c92e_fk_auth_perm (permission_id);

ALTER TABLE auth_permission
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY auth_permission_content_type_id_codename_01ab375a_uniq (content_type_id,codename);

ALTER TABLE auth_user
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY username (username);

ALTER TABLE auth_user_groups
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY auth_user_groups_user_id_group_id_94350c0c_uniq (user_id,group_id),
  ADD KEY auth_user_groups_group_id_97559544_fk_auth_group_id (group_id);

ALTER TABLE auth_user_user_permissions
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY auth_user_user_permissions_user_id_permission_id_14a6b632_uniq (user_id,permission_id),
  ADD KEY auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm (permission_id);

ALTER TABLE django_admin_log
  ADD PRIMARY KEY (id),
  ADD KEY django_admin_log_content_type_id_c4bce8eb_fk_django_co (content_type_id),
  ADD KEY django_admin_log_user_id_c564eba6_fk_auth_user_id (user_id);

ALTER TABLE django_content_type
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY django_content_type_app_label_model_76bd3d3b_uniq (app_label,model);

ALTER TABLE django_migrations
  ADD PRIMARY KEY (id);

ALTER TABLE django_session
  ADD PRIMARY KEY (session_key),
  ADD KEY django_session_expire_date_a5c62663 (expire_date);

ALTER TABLE homedetail_data
  ADD PRIMARY KEY (id),
  ADD KEY homedetail_data_RoomId_id_d9f1b22c_fk_homedetail_room_RoomId (RoomId_id),
  ADD KEY homedetail_data_Data_Type_id_8664598a_fk_homedetail_datatype_id (Data_Type_id);

ALTER TABLE homedetail_datatype
  ADD PRIMARY KEY (id);

ALTER TABLE homedetail_room
  ADD PRIMARY KEY (RoomId),
  ADD KEY homedetail_room_UserID_id_38aac871_fk_auth_user_id (UserID_id);

ALTER TABLE homedetail_userintheroom
  ADD PRIMARY KEY (id),
  ADD KEY homedetail_userinthe_RoomId_id_9c184c3b_fk_homedetai (RoomId_id),
  ADD KEY homedetail_userintheroom_User_id_c59da95c (User_id);

ALTER TABLE notification_globalnotificaiton
  ADD PRIMARY KEY (id);

ALTER TABLE notification_specificnotification
  ADD PRIMARY KEY (id),
  ADD KEY notification_notific_RoomID_id_58a6ceb9_fk_homedetai (RoomID_id),
  ADD KEY notification_specifi_DataID_id_0ff553ec_fk_homedetai (DataID_id);

ALTER TABLE payment_invoice
  ADD PRIMARY KEY (id),
  ADD KEY payment_invoice_PayerID_id_61513154_fk_auth_user_id (PayerID_id),
  ADD KEY payment_invoice_Data_id_905d3d56_fk_homedetail_data_id (Data_id),
  ADD KEY payment_invoice_Rate_id_11b29c51_fk_homedetail_datatype_id (Rate_id);

ALTER TABLE payment_invoice_payment_method
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY payment_invoice_Payment__invoice_id_paymenttype_i_7c7e0359_uniq (invoice_id,paymenttype_id),
  ADD KEY payment_invoice_Paym_paymenttype_id_1162a387_fk_payment_p (paymenttype_id);

ALTER TABLE payment_paymenttype
  ADD PRIMARY KEY (id);

ALTER TABLE social_auth_association
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY social_auth_association_server_url_handle_078befa2_uniq (server_url,handle);

ALTER TABLE social_auth_code
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY social_auth_code_email_code_801b2d02_uniq (email,code),
  ADD KEY social_auth_code_code_a2393167 (code),
  ADD KEY social_auth_code_timestamp_176b341f (timestamp);

ALTER TABLE social_auth_nonce
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY social_auth_nonce_server_url_timestamp_salt_f6284463_uniq (server_url,timestamp,salt);

ALTER TABLE social_auth_partial
  ADD PRIMARY KEY (id),
  ADD KEY social_auth_partial_token_3017fea3 (token),
  ADD KEY social_auth_partial_timestamp_50f2119f (timestamp);

ALTER TABLE social_auth_usersocialauth
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY social_auth_usersocialauth_provider_uid_e6b5e668_uniq (provider,uid),
  ADD KEY social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id (user_id);


ALTER TABLE auth_group
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE auth_group_permissions
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

ALTER TABLE auth_permission
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

ALTER TABLE auth_user
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE auth_user_groups
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE auth_user_user_permissions
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

ALTER TABLE django_admin_log
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

ALTER TABLE django_content_type
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE django_migrations
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

ALTER TABLE homedetail_data
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE homedetail_datatype
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE homedetail_userintheroom
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE notification_globalnotificaiton
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE notification_specificnotification
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE payment_invoice
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE payment_invoice_payment_method
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE payment_paymenttype
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE social_auth_association
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE social_auth_code
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE social_auth_nonce
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE social_auth_partial
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE social_auth_usersocialauth
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE auth_group_permissions
  ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id),
  ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id);

ALTER TABLE auth_permission
  ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id);

ALTER TABLE auth_user_groups
  ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id),
  ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id);

ALTER TABLE auth_user_user_permissions
  ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id),
  ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id);

ALTER TABLE django_admin_log
  ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id),
  ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id);

ALTER TABLE homedetail_data
  ADD CONSTRAINT homedetail_data_Data_Type_id_8664598a_fk_homedetail_datatype_id FOREIGN KEY (Data_Type_id) REFERENCES homedetail_datatype (id),
  ADD CONSTRAINT homedetail_data_RoomId_id_d9f1b22c_fk_homedetail_room_RoomId FOREIGN KEY (RoomId_id) REFERENCES homedetail_room (RoomId);

ALTER TABLE homedetail_room
  ADD CONSTRAINT homedetail_room_UserID_id_38aac871_fk_auth_user_id FOREIGN KEY (UserID_id) REFERENCES auth_user (id);

ALTER TABLE homedetail_userintheroom
  ADD CONSTRAINT homedetail_userinthe_RoomId_id_9c184c3b_fk_homedetai FOREIGN KEY (RoomId_id) REFERENCES homedetail_room (RoomId),
  ADD CONSTRAINT homedetail_userintheroom_User_id_c59da95c_fk_auth_user_id FOREIGN KEY (User_id) REFERENCES auth_user (id);

ALTER TABLE notification_specificnotification
  ADD CONSTRAINT notification_notific_RoomID_id_58a6ceb9_fk_homedetai FOREIGN KEY (RoomID_id) REFERENCES homedetail_room (RoomId),
  ADD CONSTRAINT notification_specifi_DataID_id_0ff553ec_fk_homedetai FOREIGN KEY (DataID_id) REFERENCES homedetail_data (id);

ALTER TABLE payment_invoice
  ADD CONSTRAINT payment_invoice_Data_id_905d3d56_fk_homedetail_data_id FOREIGN KEY (Data_id) REFERENCES homedetail_data (id),
  ADD CONSTRAINT payment_invoice_PayerID_id_61513154_fk_auth_user_id FOREIGN KEY (PayerID_id) REFERENCES auth_user (id),
  ADD CONSTRAINT payment_invoice_Rate_id_11b29c51_fk_homedetail_datatype_id FOREIGN KEY (Rate_id) REFERENCES homedetail_datatype (id);

ALTER TABLE payment_invoice_payment_method
  ADD CONSTRAINT payment_invoice_Paym_invoice_id_0b87c4a3_fk_payment_i FOREIGN KEY (invoice_id) REFERENCES payment_invoice (id),
  ADD CONSTRAINT payment_invoice_Paym_paymenttype_id_1162a387_fk_payment_p FOREIGN KEY (paymenttype_id) REFERENCES payment_paymenttype (id);

ALTER TABLE social_auth_usersocialauth
  ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
