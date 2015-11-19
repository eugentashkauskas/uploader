-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 19 2015 г., 10:08
-- Версия сервера: 5.5.29-log
-- Версия PHP: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `smkhostc_test09`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cms_app_log`
--

CREATE TABLE IF NOT EXISTS `cms_app_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `p` varchar(50) NOT NULL,
  `do` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_db_queries_analyzer`
--

CREATE TABLE IF NOT EXISTS `cms_db_queries_analyzer` (
  `hash` char(32) NOT NULL,
  `query` text NOT NULL,
  `tt` decimal(6,3) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_db_queries_analyzer_data`
--

CREATE TABLE IF NOT EXISTS `cms_db_queries_analyzer_data` (
  `hash` char(32) NOT NULL,
  `query` text NOT NULL,
  `min_tt` decimal(6,3) unsigned NOT NULL,
  `avg_tt` decimal(6,3) unsigned NOT NULL,
  `max_tt` decimal(6,3) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `uses_indexes` tinyint(1) unsigned NOT NULL,
  `page_title` varchar(255) NOT NULL,
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_dstrings_`
--

CREATE TABLE IF NOT EXISTS `cms_dstrings_` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ru` text,
  `ua` text,
  `en` text,
  `lv` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_error_log`
--

CREATE TABLE IF NOT EXISTS `cms_error_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` int(10) unsigned NOT NULL,
  `ip_long` int(10) unsigned NOT NULL,
  `agent` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `msg` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` int(11) NOT NULL,
  `vars` text NOT NULL COMMENT 'serialized',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_file_consistency`
--

CREATE TABLE IF NOT EXISTS `cms_file_consistency` (
  `hash` char(32) NOT NULL,
  `file` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_front_log`
--

CREATE TABLE IF NOT EXISTS `cms_front_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_languages`
--

CREATE TABLE IF NOT EXISTS `cms_languages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(2) NOT NULL,
  `full` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_maxmind_geoip_c`
--

CREATE TABLE IF NOT EXISTS `cms_maxmind_geoip_c` (
  `code` char(2) COLLATE latin1_general_ci NOT NULL,
  `country` char(38) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='1416485331';

-- --------------------------------------------------------

--
-- Структура таблицы `cms_maxmind_geoip_r`
--

CREATE TABLE IF NOT EXISTS `cms_maxmind_geoip_r` (
  `country_code` char(2) COLLATE latin1_general_ci NOT NULL,
  `start` int(10) unsigned NOT NULL,
  `end` int(10) unsigned NOT NULL,
  KEY `country_code` (`country_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='1416485331';

-- --------------------------------------------------------

--
-- Структура таблицы `cms_migrations`
--

CREATE TABLE IF NOT EXISTS `cms_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages`
--

CREATE TABLE IF NOT EXISTS `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned DEFAULT '0',
  `is_lng_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `location` tinytext NOT NULL,
  `title` tinytext NOT NULL,
  `in_menu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` mediumint(8) unsigned NOT NULL,
  `file_cache` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `transparent_get` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `string_label` varchar(50) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `html_file` varchar(255) NOT NULL,
  `go_level_down` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastmod_ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_clickmap`
--

CREATE TABLE IF NOT EXISTS `cms_pages_clickmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `x` smallint(5) unsigned NOT NULL,
  `y` smallint(5) unsigned NOT NULL,
  `ip_long` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_components`
--

CREATE TABLE IF NOT EXISTS `cms_pages_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `component` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_components_cached`
--

CREATE TABLE IF NOT EXISTS `cms_pages_components_cached` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_components_custom`
--

CREATE TABLE IF NOT EXISTS `cms_pages_components_custom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `component` varchar(255) NOT NULL,
  `key_id` int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_components_disabled`
--

CREATE TABLE IF NOT EXISTS `cms_pages_components_disabled` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_components_history`
--

CREATE TABLE IF NOT EXISTS `cms_pages_components_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `component` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_permissions`
--

CREATE TABLE IF NOT EXISTS `cms_pages_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `properties` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`page_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_quicklinks`
--

CREATE TABLE IF NOT EXISTS `cms_pages_quicklinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `href` varchar(255) NOT NULL,
  `searchword` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_redirect_history`
--

CREATE TABLE IF NOT EXISTS `cms_pages_redirect_history` (
  `page_id` int(10) unsigned NOT NULL,
  `old_full_url` varchar(255) NOT NULL,
  `new_full_url` varchar(255) NOT NULL,
  `last` tinyint(1) NOT NULL DEFAULT '1',
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_templates`
--

CREATE TABLE IF NOT EXISTS `cms_pages_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_themes`
--

CREATE TABLE IF NOT EXISTS `cms_pages_themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_pages_words`
--

CREATE TABLE IF NOT EXISTS `cms_pages_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `word` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_services`
--

CREATE TABLE IF NOT EXISTS `cms_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `last_ts` int(10) unsigned NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `running` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_start` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_settings`
--

CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_translations`
--

CREATE TABLE IF NOT EXISTS `cms_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ru` text,
  `ua` text,
  `en` text,
  `lv` text,
  `RO` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_translations_`
--

CREATE TABLE IF NOT EXISTS `cms_translations_` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `en` text,
  `ru` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_usage`
--

CREATE TABLE IF NOT EXISTS `cms_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `function_class` varchar(255) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_function` (`function_class`,`function_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users`
--

CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` char(128) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `lng` char(2) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_attempts`
--

CREATE TABLE IF NOT EXISTS `cms_users_attempts` (
  `ip` int(10) unsigned NOT NULL,
  `failed_attempts` int(10) unsigned NOT NULL,
  `last_attempt_ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_groups`
--

CREATE TABLE IF NOT EXISTS `cms_users_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `undeletable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_set_permissions` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `full_access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `structure_permissions` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_groups_access`
--

CREATE TABLE IF NOT EXISTS `cms_users_groups_access` (
  `group_id` int(10) unsigned NOT NULL,
  `p` varchar(50) NOT NULL,
  `do` varchar(50) NOT NULL,
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_log`
--

CREATE TABLE IF NOT EXISTS `cms_users_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` char(32) NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  `ip_long` int(10) unsigned NOT NULL,
  `agent` varchar(255) NOT NULL,
  `request_uri` text NOT NULL,
  `referer` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `p` varchar(50) NOT NULL,
  `do` varchar(50) NOT NULL,
  `post` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_messages`
--

CREATE TABLE IF NOT EXISTS `cms_users_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_user_id` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_users_sessions`
--

CREATE TABLE IF NOT EXISTS `cms_users_sessions` (
  `id` int(10) unsigned NOT NULL,
  `sid` char(32) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue`
--

CREATE TABLE IF NOT EXISTS `m_catalogue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'dstring',
  `subtitle` int(10) unsigned NOT NULL COMMENT 'dstring',
  `description` text NOT NULL COMMENT 'dstring',
  `price` decimal(8,2) unsigned NOT NULL COMMENT 'In default currency',
  `currency_code` varchar(32) NOT NULL,
  `price_special` decimal(8,2) unsigned NOT NULL,
  `price_special_note` int(10) unsigned NOT NULL COMMENT 'dstring',
  `order` int(10) unsigned NOT NULL,
  `add_ts` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `category_id` int(10) unsigned NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_seen_ts` int(10) unsigned NOT NULL,
  `manufacturer_id` int(10) unsigned NOT NULL,
  `code` varchar(100) NOT NULL,
  `amount_in_stock` int(10) unsigned NOT NULL COMMENT 'count',
  `spec_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `pscs` decimal(8,3) unsigned NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `show_period_days` varchar(32) NOT NULL,
  `show_till_ts` int(10) unsigned NOT NULL,
  `address` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `precision` int(1) unsigned NOT NULL,
  `latitude` varchar(32) NOT NULL,
  `longitude` varchar(32) NOT NULL,
  `unique_ref_id` varchar(32) NOT NULL,
  `delivery` varchar(50) NOT NULL,
  `web` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue2params`
--

CREATE TABLE IF NOT EXISTS `m_catalogue2params` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `param_id` int(10) unsigned NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_categories`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `title` int(10) unsigned NOT NULL COMMENT 'dstring',
  `description` int(10) unsigned NOT NULL COMMENT 'dstring',
  `add_ts` int(10) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL COMMENT 'Parent category',
  `icon_img` varchar(255) NOT NULL,
  `specification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_deliveries`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` int(10) unsigned NOT NULL COMMENT 'dstring',
  `price` decimal(8,3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_images`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `main_image` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_manufacturers`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_payments`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` int(10) unsigned NOT NULL COMMENT 'dstring',
  `order` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_prices`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `price` decimal(8,2) unsigned NOT NULL,
  `price_per` varchar(20) NOT NULL,
  `offer_limit` decimal(8,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_specifications`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_specifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_specifications_params`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_specifications_params` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spec_id` int(10) unsigned NOT NULL,
  `key` int(10) unsigned NOT NULL COMMENT 'dstring',
  `order` int(10) unsigned NOT NULL,
  `type` enum('TEXT','CHECKBOX','SELECT') NOT NULL DEFAULT 'CHECKBOX',
  `primary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spec_id` (`spec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_specifications_params_options`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_specifications_params_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `param_id` int(10) unsigned NOT NULL,
  `name` int(10) unsigned NOT NULL COMMENT 'dstring',
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spec_id` (`param_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_types`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` int(10) unsigned NOT NULL COMMENT 'dstring',
  `order` int(10) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_catalogue_views`
--

CREATE TABLE IF NOT EXISTS `m_catalogue_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `sticker_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_clients`
--

CREATE TABLE IF NOT EXISTS `m_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `registration_ts` int(10) unsigned NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `login` varchar(50) NOT NULL,
  `password` char(128) NOT NULL COMMENT 'hash',
  `email` varchar(255) NOT NULL,
  `email_primary` varchar(255) NOT NULL,
  `email_confirmation_code` varchar(255) NOT NULL,
  `uid` char(32) NOT NULL,
  `referral_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `company_postal` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `type` int(1) unsigned NOT NULL,
  `pk` varchar(25) NOT NULL,
  `reg_number` varchar(50) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `account` varchar(50) NOT NULL,
  `payment_type` int(10) unsigned NOT NULL,
  `receive_letters` tinyint(1) NOT NULL DEFAULT '0',
  `receive_news` tinyint(1) NOT NULL DEFAULT '0',
  `about` text NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `last_login_ts` int(10) unsigned NOT NULL,
  `lng` varchar(3) NOT NULL,
  `web` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `company_country` varchar(255) NOT NULL,
  `company_city` varchar(255) NOT NULL,
  `fb_uid` bigint(32) unsigned NOT NULL,
  `fb_active` tinyint(1) NOT NULL DEFAULT '0',
  `fb_name` varchar(255) NOT NULL,
  `fb_firstName` varchar(255) NOT NULL,
  `fb_lastName` varchar(255) NOT NULL,
  `fb_email` varchar(255) NOT NULL,
  `fb_imageUrl` varchar(255) NOT NULL,
  `fb_url` varchar(255) NOT NULL,
  `fb_accessToken` varchar(255) NOT NULL,
  `fb_expires` int(10) unsigned NOT NULL,
  `vk_uid` bigint(32) unsigned NOT NULL,
  `vk_active` tinyint(1) NOT NULL DEFAULT '0',
  `vk_accessToken` varchar(255) NOT NULL,
  `vk_firstName` varchar(255) NOT NULL,
  `vk_lastName` varchar(255) NOT NULL,
  `gl_uid` bigint(32) NOT NULL,
  `gl_active` tinyint(1) NOT NULL DEFAULT '0',
  `gl_accessToken` varchar(255) NOT NULL,
  `gl_expires` int(10) unsigned NOT NULL,
  `gl_name` varchar(255) NOT NULL,
  `gl_firstName` varchar(255) NOT NULL,
  `gl_lastName` varchar(255) NOT NULL,
  `gl_imageUrl` varchar(255) NOT NULL,
  `gl_url` varchar(255) NOT NULL,
  `gl_email` varchar(255) NOT NULL,
  `vk_email` varchar(255) NOT NULL,
  `vk_imageUrl` varchar(255) NOT NULL,
  `vk_url` varchar(255) NOT NULL,
  `ok_uid` bigint(32) NOT NULL,
  `ok_active` tinyint(1) NOT NULL DEFAULT '0',
  `ok_accessToken` varchar(255) NOT NULL,
  `ok_expires` int(10) unsigned NOT NULL,
  `ok_name` varchar(255) NOT NULL,
  `ok_firstName` varchar(255) NOT NULL,
  `ok_lastName` varchar(255) NOT NULL,
  `ok_imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_clients_emails`
--

CREATE TABLE IF NOT EXISTS `m_clients_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `primary` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `check_hash` char(32) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_clients_groups`
--

CREATE TABLE IF NOT EXISTS `m_clients_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` int(10) unsigned NOT NULL COMMENT 'dstring',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_currencies_exchange_rates`
--

CREATE TABLE IF NOT EXISTS `m_currencies_exchange_rates` (
  `currency` varchar(3) NOT NULL,
  `rate` decimal(8,3) NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `base` tinyint(1) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `sign` varchar(32) NOT NULL,
  PRIMARY KEY (`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `m_emails`
--

CREATE TABLE IF NOT EXISTS `m_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `subject` varchar(255) NOT NULL,
  `recepient` text NOT NULL,
  `body` text NOT NULL,
  `sent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_queue` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_emails_templates`
--

CREATE TABLE IF NOT EXISTS `m_emails_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `content` int(10) unsigned NOT NULL COMMENT 'dstring',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_favourites`
--

CREATE TABLE IF NOT EXISTS `m_favourites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `favourer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_id` (`entity_id`,`favourer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `m_sessions`
--

CREATE TABLE IF NOT EXISTS `m_sessions` (
  `sid` char(32) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `ts` int(10) unsigned NOT NULL,
  `agent` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `m_subscribers`
--

CREATE TABLE IF NOT EXISTS `m_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registration_ts` int(10) unsigned NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `email_confirmation_code` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cms_users_messages`
--
ALTER TABLE `cms_users_messages`
  ADD CONSTRAINT `cms_users_id_messages` FOREIGN KEY (`to_user_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cms_users_sessions`
--
ALTER TABLE `cms_users_sessions`
  ADD CONSTRAINT `cms_users_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
