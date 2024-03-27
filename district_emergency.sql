-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2024 at 01:32 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `district_emergency`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
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
(25, 'Can add userregg', 7, 'add_userregg'),
(26, 'Can change userregg', 7, 'change_userregg'),
(27, 'Can delete userregg', 7, 'delete_userregg'),
(28, 'Can view userregg', 7, 'view_userregg'),
(29, 'Can add services', 8, 'add_services'),
(30, 'Can change services', 8, 'change_services'),
(31, 'Can delete services', 8, 'delete_services'),
(32, 'Can view services', 8, 'view_services'),
(33, 'Can add volregg', 9, 'add_volregg'),
(34, 'Can change volregg', 9, 'change_volregg'),
(35, 'Can delete volregg', 9, 'delete_volregg'),
(36, 'Can view volregg', 9, 'view_volregg'),
(37, 'Can add emergency', 10, 'add_emergency'),
(38, 'Can change emergency', 10, 'change_emergency'),
(39, 'Can delete emergency', 10, 'delete_emergency'),
(40, 'Can view emergency', 10, 'view_emergency'),
(41, 'Can add servicerequest', 11, 'add_servicerequest'),
(42, 'Can change servicerequest', 11, 'change_servicerequest'),
(43, 'Can delete servicerequest', 11, 'delete_servicerequest'),
(44, 'Can view servicerequest', 11, 'view_servicerequest'),
(45, 'Can add emc_servicerequest', 12, 'add_emc_servicerequest'),
(46, 'Can change emc_servicerequest', 12, 'change_emc_servicerequest'),
(47, 'Can delete emc_servicerequest', 12, 'delete_emc_servicerequest'),
(48, 'Can view emc_servicerequest', 12, 'view_emc_servicerequest'),
(49, 'Can add assign_request', 13, 'add_assign_request'),
(50, 'Can change assign_request', 13, 'change_assign_request'),
(51, 'Can delete assign_request', 13, 'delete_assign_request'),
(52, 'Can view assign_request', 13, 'view_assign_request'),
(53, 'Can add donations', 14, 'add_donations'),
(54, 'Can change donations', 14, 'change_donations'),
(55, 'Can delete donations', 14, 'delete_donations'),
(56, 'Can view donations', 14, 'view_donations'),
(57, 'Can add camps', 15, 'add_camps'),
(58, 'Can change camps', 15, 'change_camps'),
(59, 'Can delete camps', 15, 'delete_camps'),
(60, 'Can view camps', 15, 'view_camps'),
(61, 'Can add hospitals', 16, 'add_hospitals'),
(62, 'Can change hospitals', 16, 'change_hospitals'),
(63, 'Can delete hospitals', 16, 'delete_hospitals'),
(64, 'Can view hospitals', 16, 'view_hospitals'),
(65, 'Can add chats', 17, 'add_chats'),
(66, 'Can change chats', 17, 'change_chats'),
(67, 'Can delete chats', 17, 'delete_chats'),
(68, 'Can view chats', 17, 'view_chats');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dems_assign_request`
--

CREATE TABLE IF NOT EXISTS `dems_assign_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(150) NOT NULL,
  `e_uid` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `volunteer` varchar(150) NOT NULL,
  `req_id` varchar(150) NOT NULL,
  `issue` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dems_assign_request`
--

INSERT INTO `dems_assign_request` (`id`, `uid`, `e_uid`, `date`, `volunteer`, `req_id`, `issue`, `location`, `phone`, `status`) VALUES
(1, 'Lal', '0', '2023-06-14', '1', '1', 'Need Help', 'KOLLAM', '9242266262', 'accepted'),
(2, 'jeirn james', '0', '2023-06-21', '5', '2', 'emergency', 'ERNAKULAM', '9242266262', 'accepted'),
(3, 'jeirn james', '0', '2023-06-24', '1', '3', 'Emergency', 'KOLLAM', '9242266262', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `dems_camps`
--

CREATE TABLE IF NOT EXISTS `dems_camps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `place` varchar(150) NOT NULL,
  `map` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dems_camps`
--

INSERT INTO `dems_camps` (`id`, `name`, `date`, `phone`, `place`, `map`) VALUES
(2, 'Flood Camp 2023', '2023-06-03', '3242266262', 'thrissur', 'https://www.google.com/maps/@10.0070609,76.3058215,15z?authuser=0&entry=ttu'),
(3, 'camp 1', '2024-03-23', '9809898987', 'munnar', 'https://www.google.com/maps/place/Karukappilly+Jn.');

-- --------------------------------------------------------

--
-- Table structure for table `dems_chats`
--

CREATE TABLE IF NOT EXISTS `dems_chats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cus_id` varchar(150) NOT NULL,
  `admin` varchar(150) NOT NULL,
  `cus_msg` varchar(150) NOT NULL,
  `admin_msg` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `dems_chats`
--

INSERT INTO `dems_chats` (`id`, `cus_id`, `admin`, `cus_msg`, `admin_msg`) VALUES
(1, '1', 'admin', 'hello', ''),
(2, '1', 'admin', '', 'haaii'),
(3, '1', 'admin', '', 'hello'),
(4, '1', 'admin', '', 'haiii'),
(5, '1', 'admin', '', 'haii'),
(6, '1', 'admin', '', 'haa'),
(7, '1', 'admin', '', 'haa'),
(8, '1', 'admin', '', 'cdfjskljk'),
(9, '1', 'admin', '', 'jsjj'),
(10, '2', 'admin', '', 'haii'),
(11, '1', 'admin', 'haaa', '');

-- --------------------------------------------------------

--
-- Table structure for table `dems_donations`
--

CREATE TABLE IF NOT EXISTS `dems_donations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `typee` varchar(150) NOT NULL,
  `quantity` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `place` varchar(150) NOT NULL,
  `uid` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dems_donations`
--

INSERT INTO `dems_donations` (`id`, `name`, `typee`, `quantity`, `phone`, `place`, `uid`) VALUES
(1, 'Dress', 'dress', '10', '9809898987', 'kochi', 'joel');

-- --------------------------------------------------------

--
-- Table structure for table `dems_emc_servicerequest`
--

CREATE TABLE IF NOT EXISTS `dems_emc_servicerequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `intensity` varchar(150) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `message` varchar(150) NOT NULL,
  `service` varchar(150) NOT NULL,
  `e_uid` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `category` varchar(150) NOT NULL,
  `maplink` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dems_emc_servicerequest`
--

INSERT INTO `dems_emc_servicerequest` (`id`, `uid`, `location`, `intensity`, `image`, `message`, `service`, `e_uid`, `status`, `category`, `maplink`) VALUES
(1, '0', 'ernakulam', 'High', NULL, 'High', 'Fire Emergency', 'jerin', 'pending', 'Private', 'https://www.google.com/maps/@10.0070609,76.3058215,15z?authuser=0&entry=ttu'),
(3, '0', 'ernakulam', 'High', NULL, 'High', 'Water Emergency', 'Testing22', 'pending', 'Public', 'https://www.google.com/maps/@10.0070609,76.3058215,15z?authuser=0&entry=ttu'),
(4, 'jeirn james', 'kollam', 'High', NULL, 'jjhj', 'Water Emergency', '0', 'pending', 'Public', 'https://www.google.com/maps/@10.0070609,76.3058215,15z?authuser=0&entry=ttu'),
(5, 'jeirn james', 'ernakulam', 'High', 'gf.jpg', 'High', 'Fire Emergency', '0', 'pending', 'Public', 'https://www.google.com/maps/@10.0070609,76.3058215,15z?authuser=0&entry=ttu');

-- --------------------------------------------------------

--
-- Table structure for table `dems_emergency`
--

CREATE TABLE IF NOT EXISTS `dems_emergency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dems_emergency`
--

INSERT INTO `dems_emergency` (`id`, `name`, `password`) VALUES
(1, 'joel', '123');

-- --------------------------------------------------------

--
-- Table structure for table `dems_hospitals`
--

CREATE TABLE IF NOT EXISTS `dems_hospitals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `place` varchar(150) NOT NULL,
  `map` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dems_hospitals`
--

INSERT INTO `dems_hospitals` (`id`, `name`, `phone`, `place`, `map`) VALUES
(2, 'Renai', '9809898987', 'kochi', 'https://www.google.com/maps/place/Karukappilly+Jn.,+Mamangalam,+Elamakkara,+Ernakulam,+Kochi,+Kerala+682');

-- --------------------------------------------------------

--
-- Table structure for table `dems_servicerequest`
--

CREATE TABLE IF NOT EXISTS `dems_servicerequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(150) NOT NULL,
  `e_uid` varchar(150) NOT NULL,
  `service` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `message` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dems_servicerequest`
--

INSERT INTO `dems_servicerequest` (`id`, `uid`, `e_uid`, `service`, `date`, `message`, `location`, `phone`, `status`, `state`) VALUES
(1, 'Lal', '0', 'Nss', '2023-06-14', 'Need Help', 'KOLLAM', '9242266262', 'assigned', 'Kerala'),
(2, 'jeirn james', '0', 'Red Cross', '2023-06-21', 'emergency', 'ERNAKULAM', '9242266262', 'assigned', 'Kerala'),
(3, 'jeirn james', '0', 'Nss', '2023-06-24', 'Emergency', 'KOLLAM', '9242266262', 'assigned', 'Kerala'),
(4, 'jeirn james', '0', 'Red Cross', '2023-07-02', 'kjnkjn', 'ERNAKULAM', '9242266262', 'pending', 'Kerala'),
(5, 'jeirn james', '0', 'Nss', '2024-03-28', 'dhakjhda', 'Pathanamthitta', '9809898987', 'pending', 'Kerala');

-- --------------------------------------------------------

--
-- Table structure for table `dems_services`
--

CREATE TABLE IF NOT EXISTS `dems_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `dems_services`
--

INSERT INTO `dems_services` (`id`, `name`) VALUES
(1, 'Nss'),
(2, 'Ncc'),
(3, 'Red Cross'),
(5, 'SPC');

-- --------------------------------------------------------

--
-- Table structure for table `dems_userregg`
--

CREATE TABLE IF NOT EXISTS `dems_userregg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dems_userregg`
--

INSERT INTO `dems_userregg` (`id`, `name`, `email`, `address`, `phone`, `password`) VALUES
(1, 'jeirn james', 'j@gmail.com', 'konni,pathanamthittaa', '9645277457', '123'),
(2, 'Lal', 'l@gmail.com', 'kollam', '9865986589', 'Lal12345');

-- --------------------------------------------------------

--
-- Table structure for table `dems_volregg`
--

CREATE TABLE IF NOT EXISTS `dems_volregg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `age` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `service` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dems_volregg`
--

INSERT INTO `dems_volregg` (`id`, `name`, `email`, `address`, `phone`, `age`, `gender`, `service`, `password`, `state`) VALUES
(1, 'Babu', 'b@gmail.com', 'Kottayam', '9865986589', '29', 'male', 'Nss', '123', 'Kerala'),
(5, 'Sam', 's@gmail.com', 'Kannur', '9865986589', '23', 'male', 'Red Cross', '123', 'Kerala'),
(6, 'Jose', 'jo@gmail.com', 'Ernakulam', '9242266266', '29', 'male', 'Red Cross', '123', 'Kerala'),
(7, 'Akhil', 'ah@gmail.com', 'Alappuzha', '3242266262', '29', 'male', 'Red Cross', '123', 'Kerala'),
(8, 'vol 2', 'v@gmail.com', 'Pathanamthitta', '9809898987', '23', 'male', 'Nss', '123', 'Kerala');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'dems', 'assign_request'),
(15, 'dems', 'camps'),
(17, 'dems', 'chats'),
(14, 'dems', 'donations'),
(12, 'dems', 'emc_servicerequest'),
(10, 'dems', 'emergency'),
(16, 'dems', 'hospitals'),
(11, 'dems', 'servicerequest'),
(8, 'dems', 'services'),
(7, 'dems', 'userregg'),
(9, 'dems', 'volregg'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-16 10:02:12.620991'),
(2, 'auth', '0001_initial', '2023-05-16 10:02:13.856283'),
(3, 'admin', '0001_initial', '2023-05-16 10:02:14.094503'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-16 10:02:14.117617'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-16 10:02:14.117617'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-05-16 10:02:14.197880'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-05-16 10:02:14.230585'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-05-16 10:02:14.279558'),
(9, 'auth', '0004_alter_user_username_opts', '2023-05-16 10:02:14.287604'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-05-16 10:02:14.320281'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-05-16 10:02:14.328299'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-16 10:02:14.336565'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-05-16 10:02:14.377632'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-16 10:02:14.418568'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-05-16 10:02:14.459287'),
(16, 'auth', '0011_update_proxy_permissions', '2023-05-16 10:02:14.467445'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-05-16 10:02:14.507797'),
(18, 'dems', '0001_initial', '2023-05-16 10:02:14.557053'),
(19, 'sessions', '0001_initial', '2023-05-16 10:02:14.723885'),
(20, 'dems', '0002_services', '2023-05-16 11:34:07.178783'),
(21, 'dems', '0003_volregg', '2023-05-16 11:51:10.620147'),
(22, 'dems', '0004_emergency', '2023-05-17 08:25:49.935380'),
(23, 'dems', '0005_servicerequest', '2023-05-17 10:41:04.471085'),
(24, 'dems', '0006_emc_servicerequest', '2023-05-18 10:40:39.130445'),
(25, 'dems', '0007_emc_servicerequest_e_uid', '2023-05-19 05:52:37.725311'),
(26, 'dems', '0008_auto_20230524_1459', '2023-05-24 09:29:34.028295'),
(27, 'dems', '0009_assign_request', '2023-05-24 09:47:54.629371'),
(28, 'dems', '0010_assign_request_status', '2023-05-24 11:39:45.940355'),
(29, 'dems', '0011_auto_20230525_1452', '2023-05-25 09:22:14.159300'),
(30, 'dems', '0012_donations', '2023-05-25 16:13:03.588751'),
(31, 'dems', '0013_donations_uid', '2023-05-25 16:17:33.250949'),
(32, 'dems', '0014_camps', '2023-05-25 16:43:11.342316'),
(33, 'dems', '0015_alter_emc_servicerequest_image', '2024-03-24 10:53:13.817046'),
(34, 'dems', '0016_emc_servicerequest_category', '2024-03-24 11:02:32.761633'),
(35, 'dems', '0017_volregg_state', '2024-03-24 11:29:11.660203'),
(36, 'dems', '0018_servicerequest_state', '2024-03-24 11:35:53.773441'),
(37, 'dems', '0019_emc_servicerequest_maplink', '2024-03-24 11:42:57.786228'),
(38, 'dems', '0020_camps_map', '2024-03-24 11:51:08.002578'),
(39, 'dems', '0021_alter_camps_map', '2024-03-24 11:52:13.773733'),
(40, 'dems', '0022_hospitals', '2024-03-24 12:02:05.436187'),
(41, 'dems', '0023_chats', '2024-03-24 12:14:08.382725');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0j7kyr4zoy8wcc45u4krk2q0bbc6u26q', 'eyJ2aWQiOjcsInZuYW1lIjoiQWtoaWwiLCJ2ZW1haWwiOiJhaEBnbWFpbC5jb20ifQ:1q6rJa:GvF1EPq07hymyugj_fFNbMh58ihvS1YF6aCIF6bGKcA', '2023-06-21 11:26:58.951783'),
('3cg1kb26yu6wrdd0t7eyw39555jwbzbo', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1pzZtw:MBXxsXLI_FUX0Vkfr2H2mEnJcsX4IVO9EfyFEL0vh_M', '2023-06-01 09:26:24.287205'),
('4kg0rjmdkssh0e6pi2d9428tkyiw1b4q', 'e30:1rkHB4:vA9UacoCXo0FKVVM4J-HZuRW9sMPSzu2or1UWP9V3Jk', '2024-03-27 05:29:22.292947'),
('68s7pm8ljr8r64ukmpc0i2ji6i3hp67q', 'e30:1rmSKf:aQphI4D6H-eXmKTKwi0YcPdTihFnUAm1AXLWIhSdy_s', '2024-04-02 05:48:17.121929'),
('7pd3lfdauedn7teo3sxm2zdylw27ay5j', 'eyJ1aWQiOjEsInVuYW1lIjoiamVpcm4gamFtZXMiLCJ1ZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1qCxJx:U_omlV-Gfkp1cKqGMGTU2IDIv4-kxlNNj5UDGKwcax0', '2023-07-08 07:04:33.266432'),
('7wrj08r5j2d826d34nmwoar4vevbrq2d', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rkorV:G2mPMArCL0DEuTHuYeZ1uO7EK4qofggITVR8cBVu3hw', '2024-03-28 17:27:25.218650'),
('dmw4asnzdl9y0skbmwf8moisrvhz2pyw', 'e30:1pzwBj:DtkcTce7X0zFfcfEtxVY-ZsoT43FOGmlnNhGCqNq4go', '2023-06-02 09:14:15.736624'),
('h10fbwbmo81nfpuxfm0d89ffqsu87mk4', 'eyJ1aWQiOjEsInVuYW1lIjoiamVpcm4gamFtZXMiLCJ1ZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1q2OIR:hTZC5dhLzWcWYGTwbR5E0EggdsAvlVxVIpkWvCMFZJ4', '2023-06-09 03:39:19.084594'),
('ja7dwkrh0wh5hxzletho336xa2z3msxj', 'eyJ1aWQiOjEsInVuYW1lIjoiamVpcm4gamFtZXMiLCJ1ZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1pzWDr:dTeW6GqMtMSr3gMbXUZVU75sQ0xye8Kg39W5cfY9tOU', '2023-06-01 05:30:43.379990'),
('rm3oyn49qui35v5cv40vq795mq88ghfr', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1qBblC:TJDHewCFCj69VwS_clnVQKpPMT1uCGt9-hB4mZ1oXHc', '2023-07-04 13:51:06.306828'),
('rrxs6fphrfib15jofqguk01auk1liw66', 'e30:1rjgYa:hnbrLSmqZavuv-omp4qp982plD1pWAX4uT4LJ4RpqZ0', '2024-03-25 14:23:12.721911'),
('sagzvmsmpkqqd4d5vjer7utixg9bc0wu', 'e30:1roN0h:p1DiQj3_OZZbaB1gN2KuXuglFoHzk7FE4Ho8dK3Zjjo', '2024-04-07 12:31:35.114745'),
('yywf0ujnuxws9onrxmbs1xolwx96hxl7', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1qXz0o:Fj7kaLaKvbCvGT6G9ubicGE3A2uJDZoeeYI-EEJh2uQ', '2023-09-04 07:07:42.957155'),
('zq6hmp7bt6qnx3gph8bt28uv72lk4esq', 'eyJ1aWQiOjEsInVuYW1lIjoiamVpcm4gamFtZXMiLCJ1ZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1qCyWq:xCnQyShEXybJdYhgRITX8V8R5sDTIciDFPgH5TpDwD0', '2023-07-08 08:21:56.180055');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
