/*
Navicat MySQL Data Transfer

Source Server         : local_root
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : crm_wedoerp_ca

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2021-03-22 19:59:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tblactivity_log`
-- ----------------------------
DROP TABLE IF EXISTS `tblactivity_log`;
CREATE TABLE `tblactivity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblactivity_log
-- ----------------------------
INSERT INTO `tblactivity_log` VALUES ('53', 'Lead Deleted [Deleted by: zhang sekina, ID: 2]', '2021-03-16 08:05:45', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('54', 'Customer Group Deleted [ID:4]', '2021-03-16 08:06:29', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('55', 'Staff Member Deleted [Name: zhu clark1, Data Transferred To: zhang sekina]', '2021-03-16 08:07:53', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('56', 'Staff Member Deleted [Name: zhu clark, Data Transferred To: zhang sekina]', '2021-03-16 08:08:02', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('57', 'New Client Created [ID: 3, From Staff: 5]', '2021-03-16 11:47:34', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('58', 'Customer Info Updated [ID: 3]', '2021-03-16 11:50:12', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('59', 'Non Existing User Tried to Login [Email: naeduwedo@gmail.com, Is Staff Member: No, IP: 192.168.1.70]', '2021-03-20 11:09:51', null);
INSERT INTO `tblactivity_log` VALUES ('60', 'New Leads Status Added [StatusID: 2, Name: 投资]', '2021-03-20 11:14:21', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('61', 'New Leads Source Added [SourceID: 3, Name: 微信]', '2021-03-20 11:14:45', 'clark zhu');
INSERT INTO `tblactivity_log` VALUES ('62', 'New Leads Source Added [SourceID: 4, Name: YouTube]', '2021-03-20 11:14:49', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('63', 'New Lead Added [ID: 3]', '2021-03-20 11:14:58', 'zhang sekina');
INSERT INTO `tblactivity_log` VALUES ('64', 'New Lead Added [ID: 4]', '2021-03-20 11:25:46', 'clark zhu');

-- ----------------------------
-- Table structure for `tblannouncements`
-- ----------------------------
DROP TABLE IF EXISTS `tblannouncements`;
CREATE TABLE `tblannouncements` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text,
  `showtousers` int(11) NOT NULL,
  `showtostaff` int(11) NOT NULL,
  `showname` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblannouncements
-- ----------------------------

-- ----------------------------
-- Table structure for `tblclients`
-- ----------------------------
DROP TABLE IF EXISTS `tblclients`;
CREATE TABLE `tblclients` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(191) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT '0',
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `leadid` int(11) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT '0',
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT '0',
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int(11) NOT NULL DEFAULT '0',
  `show_primary_contact` int(11) NOT NULL DEFAULT '0',
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int(11) NOT NULL DEFAULT '1',
  `addedfrom` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblclients
-- ----------------------------
INSERT INTO `tblclients` VALUES ('3', '北美地产学堂', '', '6474050855', '40', 'North York', 'M2J 3S2', 'Ontario', 'Bowhill Cres', '', '2021-03-16 11:47:34', '1', null, '', '', '', '', '0', '', '', '', '', '0', null, null, '', '0', '0', null, '1', '5');

-- ----------------------------
-- Table structure for `tblconsents`
-- ----------------------------
DROP TABLE IF EXISTS `tblconsents`;
CREATE TABLE `tblconsents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `lead_id` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `opt_in_purpose_description` text,
  `purpose_id` int(11) NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblconsents
-- ----------------------------

-- ----------------------------
-- Table structure for `tblconsent_purposes`
-- ----------------------------
DROP TABLE IF EXISTS `tblconsent_purposes`;
CREATE TABLE `tblconsent_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblconsent_purposes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontacts`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontacts`;
CREATE TABLE `tblcontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '1',
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_emails` tinyint(1) NOT NULL DEFAULT '1',
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT '1',
  `contract_emails` tinyint(1) NOT NULL DEFAULT '1',
  `task_emails` tinyint(1) NOT NULL DEFAULT '1',
  `project_emails` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontacts
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontact_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontact_permissions`;
CREATE TABLE `tblcontact_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontact_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontracts`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontracts`;
CREATE TABLE `tblcontracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `description` text,
  `subject` varchar(191) DEFAULT NULL,
  `client` int(11) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int(11) NOT NULL DEFAULT '0',
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT '0',
  `signature` varchar(40) DEFAULT NULL,
  `marked_as_signed` tinyint(1) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontracts
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontracts_types`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontracts_types`;
CREATE TABLE `tblcontracts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontracts_types
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontract_comments`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontract_comments`;
CREATE TABLE `tblcontract_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `contract_id` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontract_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcontract_renewals`
-- ----------------------------
DROP TABLE IF EXISTS `tblcontract_renewals`;
CREATE TABLE `tblcontract_renewals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) NOT NULL,
  `renewed_by_staff_id` int(11) NOT NULL DEFAULT '0',
  `is_on_old_expiry_notified` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcontract_renewals
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcountries`
-- ----------------------------
DROP TABLE IF EXISTS `tblcountries`;
CREATE TABLE `tblcountries` (
  `country_id` int(5) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcountries
-- ----------------------------
INSERT INTO `tblcountries` VALUES ('1', 'AF', 'Afghanistan', 'Islamic Republic of Afghanistan', 'AFG', '004', 'yes', '93', '.af');
INSERT INTO `tblcountries` VALUES ('2', 'AX', 'Aland Islands', '&Aring;land Islands', 'ALA', '248', 'no', '358', '.ax');
INSERT INTO `tblcountries` VALUES ('3', 'AL', 'Albania', 'Republic of Albania', 'ALB', '008', 'yes', '355', '.al');
INSERT INTO `tblcountries` VALUES ('4', 'DZ', 'Algeria', 'People\'s Democratic Republic of Algeria', 'DZA', '012', 'yes', '213', '.dz');
INSERT INTO `tblcountries` VALUES ('5', 'AS', 'American Samoa', 'American Samoa', 'ASM', '016', 'no', '1+684', '.as');
INSERT INTO `tblcountries` VALUES ('6', 'AD', 'Andorra', 'Principality of Andorra', 'AND', '020', 'yes', '376', '.ad');
INSERT INTO `tblcountries` VALUES ('7', 'AO', 'Angola', 'Republic of Angola', 'AGO', '024', 'yes', '244', '.ao');
INSERT INTO `tblcountries` VALUES ('8', 'AI', 'Anguilla', 'Anguilla', 'AIA', '660', 'no', '1+264', '.ai');
INSERT INTO `tblcountries` VALUES ('9', 'AQ', 'Antarctica', 'Antarctica', 'ATA', '010', 'no', '672', '.aq');
INSERT INTO `tblcountries` VALUES ('10', 'AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'ATG', '028', 'yes', '1+268', '.ag');
INSERT INTO `tblcountries` VALUES ('11', 'AR', 'Argentina', 'Argentine Republic', 'ARG', '032', 'yes', '54', '.ar');
INSERT INTO `tblcountries` VALUES ('12', 'AM', 'Armenia', 'Republic of Armenia', 'ARM', '051', 'yes', '374', '.am');
INSERT INTO `tblcountries` VALUES ('13', 'AW', 'Aruba', 'Aruba', 'ABW', '533', 'no', '297', '.aw');
INSERT INTO `tblcountries` VALUES ('14', 'AU', 'Australia', 'Commonwealth of Australia', 'AUS', '036', 'yes', '61', '.au');
INSERT INTO `tblcountries` VALUES ('15', 'AT', 'Austria', 'Republic of Austria', 'AUT', '040', 'yes', '43', '.at');
INSERT INTO `tblcountries` VALUES ('16', 'AZ', 'Azerbaijan', 'Republic of Azerbaijan', 'AZE', '031', 'yes', '994', '.az');
INSERT INTO `tblcountries` VALUES ('17', 'BS', 'Bahamas', 'Commonwealth of The Bahamas', 'BHS', '044', 'yes', '1+242', '.bs');
INSERT INTO `tblcountries` VALUES ('18', 'BH', 'Bahrain', 'Kingdom of Bahrain', 'BHR', '048', 'yes', '973', '.bh');
INSERT INTO `tblcountries` VALUES ('19', 'BD', 'Bangladesh', 'People\'s Republic of Bangladesh', 'BGD', '050', 'yes', '880', '.bd');
INSERT INTO `tblcountries` VALUES ('20', 'BB', 'Barbados', 'Barbados', 'BRB', '052', 'yes', '1+246', '.bb');
INSERT INTO `tblcountries` VALUES ('21', 'BY', 'Belarus', 'Republic of Belarus', 'BLR', '112', 'yes', '375', '.by');
INSERT INTO `tblcountries` VALUES ('22', 'BE', 'Belgium', 'Kingdom of Belgium', 'BEL', '056', 'yes', '32', '.be');
INSERT INTO `tblcountries` VALUES ('23', 'BZ', 'Belize', 'Belize', 'BLZ', '084', 'yes', '501', '.bz');
INSERT INTO `tblcountries` VALUES ('24', 'BJ', 'Benin', 'Republic of Benin', 'BEN', '204', 'yes', '229', '.bj');
INSERT INTO `tblcountries` VALUES ('25', 'BM', 'Bermuda', 'Bermuda Islands', 'BMU', '060', 'no', '1+441', '.bm');
INSERT INTO `tblcountries` VALUES ('26', 'BT', 'Bhutan', 'Kingdom of Bhutan', 'BTN', '064', 'yes', '975', '.bt');
INSERT INTO `tblcountries` VALUES ('27', 'BO', 'Bolivia', 'Plurinational State of Bolivia', 'BOL', '068', 'yes', '591', '.bo');
INSERT INTO `tblcountries` VALUES ('28', 'BQ', 'Bonaire, Sint Eustatius and Saba', 'Bonaire, Sint Eustatius and Saba', 'BES', '535', 'no', '599', '.bq');
INSERT INTO `tblcountries` VALUES ('29', 'BA', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BIH', '070', 'yes', '387', '.ba');
INSERT INTO `tblcountries` VALUES ('30', 'BW', 'Botswana', 'Republic of Botswana', 'BWA', '072', 'yes', '267', '.bw');
INSERT INTO `tblcountries` VALUES ('31', 'BV', 'Bouvet Island', 'Bouvet Island', 'BVT', '074', 'no', 'NONE', '.bv');
INSERT INTO `tblcountries` VALUES ('32', 'BR', 'Brazil', 'Federative Republic of Brazil', 'BRA', '076', 'yes', '55', '.br');
INSERT INTO `tblcountries` VALUES ('33', 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'IOT', '086', 'no', '246', '.io');
INSERT INTO `tblcountries` VALUES ('34', 'BN', 'Brunei', 'Brunei Darussalam', 'BRN', '096', 'yes', '673', '.bn');
INSERT INTO `tblcountries` VALUES ('35', 'BG', 'Bulgaria', 'Republic of Bulgaria', 'BGR', '100', 'yes', '359', '.bg');
INSERT INTO `tblcountries` VALUES ('36', 'BF', 'Burkina Faso', 'Burkina Faso', 'BFA', '854', 'yes', '226', '.bf');
INSERT INTO `tblcountries` VALUES ('37', 'BI', 'Burundi', 'Republic of Burundi', 'BDI', '108', 'yes', '257', '.bi');
INSERT INTO `tblcountries` VALUES ('38', 'KH', 'Cambodia', 'Kingdom of Cambodia', 'KHM', '116', 'yes', '855', '.kh');
INSERT INTO `tblcountries` VALUES ('39', 'CM', 'Cameroon', 'Republic of Cameroon', 'CMR', '120', 'yes', '237', '.cm');
INSERT INTO `tblcountries` VALUES ('40', 'CA', 'Canada', 'Canada', 'CAN', '124', 'yes', '1', '.ca');
INSERT INTO `tblcountries` VALUES ('41', 'CV', 'Cape Verde', 'Republic of Cape Verde', 'CPV', '132', 'yes', '238', '.cv');
INSERT INTO `tblcountries` VALUES ('42', 'KY', 'Cayman Islands', 'The Cayman Islands', 'CYM', '136', 'no', '1+345', '.ky');
INSERT INTO `tblcountries` VALUES ('43', 'CF', 'Central African Republic', 'Central African Republic', 'CAF', '140', 'yes', '236', '.cf');
INSERT INTO `tblcountries` VALUES ('44', 'TD', 'Chad', 'Republic of Chad', 'TCD', '148', 'yes', '235', '.td');
INSERT INTO `tblcountries` VALUES ('45', 'CL', 'Chile', 'Republic of Chile', 'CHL', '152', 'yes', '56', '.cl');
INSERT INTO `tblcountries` VALUES ('46', 'CN', 'China', 'People\'s Republic of China', 'CHN', '156', 'yes', '86', '.cn');
INSERT INTO `tblcountries` VALUES ('47', 'CX', 'Christmas Island', 'Christmas Island', 'CXR', '162', 'no', '61', '.cx');
INSERT INTO `tblcountries` VALUES ('48', 'CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'CCK', '166', 'no', '61', '.cc');
INSERT INTO `tblcountries` VALUES ('49', 'CO', 'Colombia', 'Republic of Colombia', 'COL', '170', 'yes', '57', '.co');
INSERT INTO `tblcountries` VALUES ('50', 'KM', 'Comoros', 'Union of the Comoros', 'COM', '174', 'yes', '269', '.km');
INSERT INTO `tblcountries` VALUES ('51', 'CG', 'Congo', 'Republic of the Congo', 'COG', '178', 'yes', '242', '.cg');
INSERT INTO `tblcountries` VALUES ('52', 'CK', 'Cook Islands', 'Cook Islands', 'COK', '184', 'some', '682', '.ck');
INSERT INTO `tblcountries` VALUES ('53', 'CR', 'Costa Rica', 'Republic of Costa Rica', 'CRI', '188', 'yes', '506', '.cr');
INSERT INTO `tblcountries` VALUES ('54', 'CI', 'Cote d\'ivoire (Ivory Coast)', 'Republic of C&ocirc;te D\'Ivoire (Ivory Coast)', 'CIV', '384', 'yes', '225', '.ci');
INSERT INTO `tblcountries` VALUES ('55', 'HR', 'Croatia', 'Republic of Croatia', 'HRV', '191', 'yes', '385', '.hr');
INSERT INTO `tblcountries` VALUES ('56', 'CU', 'Cuba', 'Republic of Cuba', 'CUB', '192', 'yes', '53', '.cu');
INSERT INTO `tblcountries` VALUES ('57', 'CW', 'Curacao', 'Cura&ccedil;ao', 'CUW', '531', 'no', '599', '.cw');
INSERT INTO `tblcountries` VALUES ('58', 'CY', 'Cyprus', 'Republic of Cyprus', 'CYP', '196', 'yes', '357', '.cy');
INSERT INTO `tblcountries` VALUES ('59', 'CZ', 'Czech Republic', 'Czech Republic', 'CZE', '203', 'yes', '420', '.cz');
INSERT INTO `tblcountries` VALUES ('60', 'CD', 'Democratic Republic of the Congo', 'Democratic Republic of the Congo', 'COD', '180', 'yes', '243', '.cd');
INSERT INTO `tblcountries` VALUES ('61', 'DK', 'Denmark', 'Kingdom of Denmark', 'DNK', '208', 'yes', '45', '.dk');
INSERT INTO `tblcountries` VALUES ('62', 'DJ', 'Djibouti', 'Republic of Djibouti', 'DJI', '262', 'yes', '253', '.dj');
INSERT INTO `tblcountries` VALUES ('63', 'DM', 'Dominica', 'Commonwealth of Dominica', 'DMA', '212', 'yes', '1+767', '.dm');
INSERT INTO `tblcountries` VALUES ('64', 'DO', 'Dominican Republic', 'Dominican Republic', 'DOM', '214', 'yes', '1+809, 8', '.do');
INSERT INTO `tblcountries` VALUES ('65', 'EC', 'Ecuador', 'Republic of Ecuador', 'ECU', '218', 'yes', '593', '.ec');
INSERT INTO `tblcountries` VALUES ('66', 'EG', 'Egypt', 'Arab Republic of Egypt', 'EGY', '818', 'yes', '20', '.eg');
INSERT INTO `tblcountries` VALUES ('67', 'SV', 'El Salvador', 'Republic of El Salvador', 'SLV', '222', 'yes', '503', '.sv');
INSERT INTO `tblcountries` VALUES ('68', 'GQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', 'GNQ', '226', 'yes', '240', '.gq');
INSERT INTO `tblcountries` VALUES ('69', 'ER', 'Eritrea', 'State of Eritrea', 'ERI', '232', 'yes', '291', '.er');
INSERT INTO `tblcountries` VALUES ('70', 'EE', 'Estonia', 'Republic of Estonia', 'EST', '233', 'yes', '372', '.ee');
INSERT INTO `tblcountries` VALUES ('71', 'ET', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 'ETH', '231', 'yes', '251', '.et');
INSERT INTO `tblcountries` VALUES ('72', 'FK', 'Falkland Islands (Malvinas)', 'The Falkland Islands (Malvinas)', 'FLK', '238', 'no', '500', '.fk');
INSERT INTO `tblcountries` VALUES ('73', 'FO', 'Faroe Islands', 'The Faroe Islands', 'FRO', '234', 'no', '298', '.fo');
INSERT INTO `tblcountries` VALUES ('74', 'FJ', 'Fiji', 'Republic of Fiji', 'FJI', '242', 'yes', '679', '.fj');
INSERT INTO `tblcountries` VALUES ('75', 'FI', 'Finland', 'Republic of Finland', 'FIN', '246', 'yes', '358', '.fi');
INSERT INTO `tblcountries` VALUES ('76', 'FR', 'France', 'French Republic', 'FRA', '250', 'yes', '33', '.fr');
INSERT INTO `tblcountries` VALUES ('77', 'GF', 'French Guiana', 'French Guiana', 'GUF', '254', 'no', '594', '.gf');
INSERT INTO `tblcountries` VALUES ('78', 'PF', 'French Polynesia', 'French Polynesia', 'PYF', '258', 'no', '689', '.pf');
INSERT INTO `tblcountries` VALUES ('79', 'TF', 'French Southern Territories', 'French Southern Territories', 'ATF', '260', 'no', null, '.tf');
INSERT INTO `tblcountries` VALUES ('80', 'GA', 'Gabon', 'Gabonese Republic', 'GAB', '266', 'yes', '241', '.ga');
INSERT INTO `tblcountries` VALUES ('81', 'GM', 'Gambia', 'Republic of The Gambia', 'GMB', '270', 'yes', '220', '.gm');
INSERT INTO `tblcountries` VALUES ('82', 'GE', 'Georgia', 'Georgia', 'GEO', '268', 'yes', '995', '.ge');
INSERT INTO `tblcountries` VALUES ('83', 'DE', 'Germany', 'Federal Republic of Germany', 'DEU', '276', 'yes', '49', '.de');
INSERT INTO `tblcountries` VALUES ('84', 'GH', 'Ghana', 'Republic of Ghana', 'GHA', '288', 'yes', '233', '.gh');
INSERT INTO `tblcountries` VALUES ('85', 'GI', 'Gibraltar', 'Gibraltar', 'GIB', '292', 'no', '350', '.gi');
INSERT INTO `tblcountries` VALUES ('86', 'GR', 'Greece', 'Hellenic Republic', 'GRC', '300', 'yes', '30', '.gr');
INSERT INTO `tblcountries` VALUES ('87', 'GL', 'Greenland', 'Greenland', 'GRL', '304', 'no', '299', '.gl');
INSERT INTO `tblcountries` VALUES ('88', 'GD', 'Grenada', 'Grenada', 'GRD', '308', 'yes', '1+473', '.gd');
INSERT INTO `tblcountries` VALUES ('89', 'GP', 'Guadaloupe', 'Guadeloupe', 'GLP', '312', 'no', '590', '.gp');
INSERT INTO `tblcountries` VALUES ('90', 'GU', 'Guam', 'Guam', 'GUM', '316', 'no', '1+671', '.gu');
INSERT INTO `tblcountries` VALUES ('91', 'GT', 'Guatemala', 'Republic of Guatemala', 'GTM', '320', 'yes', '502', '.gt');
INSERT INTO `tblcountries` VALUES ('92', 'GG', 'Guernsey', 'Guernsey', 'GGY', '831', 'no', '44', '.gg');
INSERT INTO `tblcountries` VALUES ('93', 'GN', 'Guinea', 'Republic of Guinea', 'GIN', '324', 'yes', '224', '.gn');
INSERT INTO `tblcountries` VALUES ('94', 'GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'GNB', '624', 'yes', '245', '.gw');
INSERT INTO `tblcountries` VALUES ('95', 'GY', 'Guyana', 'Co-operative Republic of Guyana', 'GUY', '328', 'yes', '592', '.gy');
INSERT INTO `tblcountries` VALUES ('96', 'HT', 'Haiti', 'Republic of Haiti', 'HTI', '332', 'yes', '509', '.ht');
INSERT INTO `tblcountries` VALUES ('97', 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', 'HMD', '334', 'no', 'NONE', '.hm');
INSERT INTO `tblcountries` VALUES ('98', 'HN', 'Honduras', 'Republic of Honduras', 'HND', '340', 'yes', '504', '.hn');
INSERT INTO `tblcountries` VALUES ('99', 'HK', 'Hong Kong', 'Hong Kong', 'HKG', '344', 'no', '852', '.hk');
INSERT INTO `tblcountries` VALUES ('100', 'HU', 'Hungary', 'Hungary', 'HUN', '348', 'yes', '36', '.hu');
INSERT INTO `tblcountries` VALUES ('101', 'IS', 'Iceland', 'Republic of Iceland', 'ISL', '352', 'yes', '354', '.is');
INSERT INTO `tblcountries` VALUES ('102', 'IN', 'India', 'Republic of India', 'IND', '356', 'yes', '91', '.in');
INSERT INTO `tblcountries` VALUES ('103', 'ID', 'Indonesia', 'Republic of Indonesia', 'IDN', '360', 'yes', '62', '.id');
INSERT INTO `tblcountries` VALUES ('104', 'IR', 'Iran', 'Islamic Republic of Iran', 'IRN', '364', 'yes', '98', '.ir');
INSERT INTO `tblcountries` VALUES ('105', 'IQ', 'Iraq', 'Republic of Iraq', 'IRQ', '368', 'yes', '964', '.iq');
INSERT INTO `tblcountries` VALUES ('106', 'IE', 'Ireland', 'Ireland', 'IRL', '372', 'yes', '353', '.ie');
INSERT INTO `tblcountries` VALUES ('107', 'IM', 'Isle of Man', 'Isle of Man', 'IMN', '833', 'no', '44', '.im');
INSERT INTO `tblcountries` VALUES ('108', 'IL', 'Israel', 'State of Israel', 'ISR', '376', 'yes', '972', '.il');
INSERT INTO `tblcountries` VALUES ('109', 'IT', 'Italy', 'Italian Republic', 'ITA', '380', 'yes', '39', '.jm');
INSERT INTO `tblcountries` VALUES ('110', 'JM', 'Jamaica', 'Jamaica', 'JAM', '388', 'yes', '1+876', '.jm');
INSERT INTO `tblcountries` VALUES ('111', 'JP', 'Japan', 'Japan', 'JPN', '392', 'yes', '81', '.jp');
INSERT INTO `tblcountries` VALUES ('112', 'JE', 'Jersey', 'The Bailiwick of Jersey', 'JEY', '832', 'no', '44', '.je');
INSERT INTO `tblcountries` VALUES ('113', 'JO', 'Jordan', 'Hashemite Kingdom of Jordan', 'JOR', '400', 'yes', '962', '.jo');
INSERT INTO `tblcountries` VALUES ('114', 'KZ', 'Kazakhstan', 'Republic of Kazakhstan', 'KAZ', '398', 'yes', '7', '.kz');
INSERT INTO `tblcountries` VALUES ('115', 'KE', 'Kenya', 'Republic of Kenya', 'KEN', '404', 'yes', '254', '.ke');
INSERT INTO `tblcountries` VALUES ('116', 'KI', 'Kiribati', 'Republic of Kiribati', 'KIR', '296', 'yes', '686', '.ki');
INSERT INTO `tblcountries` VALUES ('117', 'XK', 'Kosovo', 'Republic of Kosovo', '---', '---', 'some', '381', '');
INSERT INTO `tblcountries` VALUES ('118', 'KW', 'Kuwait', 'State of Kuwait', 'KWT', '414', 'yes', '965', '.kw');
INSERT INTO `tblcountries` VALUES ('119', 'KG', 'Kyrgyzstan', 'Kyrgyz Republic', 'KGZ', '417', 'yes', '996', '.kg');
INSERT INTO `tblcountries` VALUES ('120', 'LA', 'Laos', 'Lao People\'s Democratic Republic', 'LAO', '418', 'yes', '856', '.la');
INSERT INTO `tblcountries` VALUES ('121', 'LV', 'Latvia', 'Republic of Latvia', 'LVA', '428', 'yes', '371', '.lv');
INSERT INTO `tblcountries` VALUES ('122', 'LB', 'Lebanon', 'Republic of Lebanon', 'LBN', '422', 'yes', '961', '.lb');
INSERT INTO `tblcountries` VALUES ('123', 'LS', 'Lesotho', 'Kingdom of Lesotho', 'LSO', '426', 'yes', '266', '.ls');
INSERT INTO `tblcountries` VALUES ('124', 'LR', 'Liberia', 'Republic of Liberia', 'LBR', '430', 'yes', '231', '.lr');
INSERT INTO `tblcountries` VALUES ('125', 'LY', 'Libya', 'Libya', 'LBY', '434', 'yes', '218', '.ly');
INSERT INTO `tblcountries` VALUES ('126', 'LI', 'Liechtenstein', 'Principality of Liechtenstein', 'LIE', '438', 'yes', '423', '.li');
INSERT INTO `tblcountries` VALUES ('127', 'LT', 'Lithuania', 'Republic of Lithuania', 'LTU', '440', 'yes', '370', '.lt');
INSERT INTO `tblcountries` VALUES ('128', 'LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 'LUX', '442', 'yes', '352', '.lu');
INSERT INTO `tblcountries` VALUES ('129', 'MO', 'Macao', 'The Macao Special Administrative Region', 'MAC', '446', 'no', '853', '.mo');
INSERT INTO `tblcountries` VALUES ('130', 'MK', 'North Macedonia', 'Republic of North Macedonia', 'MKD', '807', 'yes', '389', '.mk');
INSERT INTO `tblcountries` VALUES ('131', 'MG', 'Madagascar', 'Republic of Madagascar', 'MDG', '450', 'yes', '261', '.mg');
INSERT INTO `tblcountries` VALUES ('132', 'MW', 'Malawi', 'Republic of Malawi', 'MWI', '454', 'yes', '265', '.mw');
INSERT INTO `tblcountries` VALUES ('133', 'MY', 'Malaysia', 'Malaysia', 'MYS', '458', 'yes', '60', '.my');
INSERT INTO `tblcountries` VALUES ('134', 'MV', 'Maldives', 'Republic of Maldives', 'MDV', '462', 'yes', '960', '.mv');
INSERT INTO `tblcountries` VALUES ('135', 'ML', 'Mali', 'Republic of Mali', 'MLI', '466', 'yes', '223', '.ml');
INSERT INTO `tblcountries` VALUES ('136', 'MT', 'Malta', 'Republic of Malta', 'MLT', '470', 'yes', '356', '.mt');
INSERT INTO `tblcountries` VALUES ('137', 'MH', 'Marshall Islands', 'Republic of the Marshall Islands', 'MHL', '584', 'yes', '692', '.mh');
INSERT INTO `tblcountries` VALUES ('138', 'MQ', 'Martinique', 'Martinique', 'MTQ', '474', 'no', '596', '.mq');
INSERT INTO `tblcountries` VALUES ('139', 'MR', 'Mauritania', 'Islamic Republic of Mauritania', 'MRT', '478', 'yes', '222', '.mr');
INSERT INTO `tblcountries` VALUES ('140', 'MU', 'Mauritius', 'Republic of Mauritius', 'MUS', '480', 'yes', '230', '.mu');
INSERT INTO `tblcountries` VALUES ('141', 'YT', 'Mayotte', 'Mayotte', 'MYT', '175', 'no', '262', '.yt');
INSERT INTO `tblcountries` VALUES ('142', 'MX', 'Mexico', 'United Mexican States', 'MEX', '484', 'yes', '52', '.mx');
INSERT INTO `tblcountries` VALUES ('143', 'FM', 'Micronesia', 'Federated States of Micronesia', 'FSM', '583', 'yes', '691', '.fm');
INSERT INTO `tblcountries` VALUES ('144', 'MD', 'Moldava', 'Republic of Moldova', 'MDA', '498', 'yes', '373', '.md');
INSERT INTO `tblcountries` VALUES ('145', 'MC', 'Monaco', 'Principality of Monaco', 'MCO', '492', 'yes', '377', '.mc');
INSERT INTO `tblcountries` VALUES ('146', 'MN', 'Mongolia', 'Mongolia', 'MNG', '496', 'yes', '976', '.mn');
INSERT INTO `tblcountries` VALUES ('147', 'ME', 'Montenegro', 'Montenegro', 'MNE', '499', 'yes', '382', '.me');
INSERT INTO `tblcountries` VALUES ('148', 'MS', 'Montserrat', 'Montserrat', 'MSR', '500', 'no', '1+664', '.ms');
INSERT INTO `tblcountries` VALUES ('149', 'MA', 'Morocco', 'Kingdom of Morocco', 'MAR', '504', 'yes', '212', '.ma');
INSERT INTO `tblcountries` VALUES ('150', 'MZ', 'Mozambique', 'Republic of Mozambique', 'MOZ', '508', 'yes', '258', '.mz');
INSERT INTO `tblcountries` VALUES ('151', 'MM', 'Myanmar (Burma)', 'Republic of the Union of Myanmar', 'MMR', '104', 'yes', '95', '.mm');
INSERT INTO `tblcountries` VALUES ('152', 'NA', 'Namibia', 'Republic of Namibia', 'NAM', '516', 'yes', '264', '.na');
INSERT INTO `tblcountries` VALUES ('153', 'NR', 'Nauru', 'Republic of Nauru', 'NRU', '520', 'yes', '674', '.nr');
INSERT INTO `tblcountries` VALUES ('154', 'NP', 'Nepal', 'Federal Democratic Republic of Nepal', 'NPL', '524', 'yes', '977', '.np');
INSERT INTO `tblcountries` VALUES ('155', 'NL', 'Netherlands', 'Kingdom of the Netherlands', 'NLD', '528', 'yes', '31', '.nl');
INSERT INTO `tblcountries` VALUES ('156', 'NC', 'New Caledonia', 'New Caledonia', 'NCL', '540', 'no', '687', '.nc');
INSERT INTO `tblcountries` VALUES ('157', 'NZ', 'New Zealand', 'New Zealand', 'NZL', '554', 'yes', '64', '.nz');
INSERT INTO `tblcountries` VALUES ('158', 'NI', 'Nicaragua', 'Republic of Nicaragua', 'NIC', '558', 'yes', '505', '.ni');
INSERT INTO `tblcountries` VALUES ('159', 'NE', 'Niger', 'Republic of Niger', 'NER', '562', 'yes', '227', '.ne');
INSERT INTO `tblcountries` VALUES ('160', 'NG', 'Nigeria', 'Federal Republic of Nigeria', 'NGA', '566', 'yes', '234', '.ng');
INSERT INTO `tblcountries` VALUES ('161', 'NU', 'Niue', 'Niue', 'NIU', '570', 'some', '683', '.nu');
INSERT INTO `tblcountries` VALUES ('162', 'NF', 'Norfolk Island', 'Norfolk Island', 'NFK', '574', 'no', '672', '.nf');
INSERT INTO `tblcountries` VALUES ('163', 'KP', 'North Korea', 'Democratic People\'s Republic of Korea', 'PRK', '408', 'yes', '850', '.kp');
INSERT INTO `tblcountries` VALUES ('164', 'MP', 'Northern Mariana Islands', 'Northern Mariana Islands', 'MNP', '580', 'no', '1+670', '.mp');
INSERT INTO `tblcountries` VALUES ('165', 'NO', 'Norway', 'Kingdom of Norway', 'NOR', '578', 'yes', '47', '.no');
INSERT INTO `tblcountries` VALUES ('166', 'OM', 'Oman', 'Sultanate of Oman', 'OMN', '512', 'yes', '968', '.om');
INSERT INTO `tblcountries` VALUES ('167', 'PK', 'Pakistan', 'Islamic Republic of Pakistan', 'PAK', '586', 'yes', '92', '.pk');
INSERT INTO `tblcountries` VALUES ('168', 'PW', 'Palau', 'Republic of Palau', 'PLW', '585', 'yes', '680', '.pw');
INSERT INTO `tblcountries` VALUES ('169', 'PS', 'Palestine', 'State of Palestine (or Occupied Palestinian Territory)', 'PSE', '275', 'some', '970', '.ps');
INSERT INTO `tblcountries` VALUES ('170', 'PA', 'Panama', 'Republic of Panama', 'PAN', '591', 'yes', '507', '.pa');
INSERT INTO `tblcountries` VALUES ('171', 'PG', 'Papua New Guinea', 'Independent State of Papua New Guinea', 'PNG', '598', 'yes', '675', '.pg');
INSERT INTO `tblcountries` VALUES ('172', 'PY', 'Paraguay', 'Republic of Paraguay', 'PRY', '600', 'yes', '595', '.py');
INSERT INTO `tblcountries` VALUES ('173', 'PE', 'Peru', 'Republic of Peru', 'PER', '604', 'yes', '51', '.pe');
INSERT INTO `tblcountries` VALUES ('174', 'PH', 'Phillipines', 'Republic of the Philippines', 'PHL', '608', 'yes', '63', '.ph');
INSERT INTO `tblcountries` VALUES ('175', 'PN', 'Pitcairn', 'Pitcairn', 'PCN', '612', 'no', 'NONE', '.pn');
INSERT INTO `tblcountries` VALUES ('176', 'PL', 'Poland', 'Republic of Poland', 'POL', '616', 'yes', '48', '.pl');
INSERT INTO `tblcountries` VALUES ('177', 'PT', 'Portugal', 'Portuguese Republic', 'PRT', '620', 'yes', '351', '.pt');
INSERT INTO `tblcountries` VALUES ('178', 'PR', 'Puerto Rico', 'Commonwealth of Puerto Rico', 'PRI', '630', 'no', '1+939', '.pr');
INSERT INTO `tblcountries` VALUES ('179', 'QA', 'Qatar', 'State of Qatar', 'QAT', '634', 'yes', '974', '.qa');
INSERT INTO `tblcountries` VALUES ('180', 'RE', 'Reunion', 'R&eacute;union', 'REU', '638', 'no', '262', '.re');
INSERT INTO `tblcountries` VALUES ('181', 'RO', 'Romania', 'Romania', 'ROU', '642', 'yes', '40', '.ro');
INSERT INTO `tblcountries` VALUES ('182', 'RU', 'Russia', 'Russian Federation', 'RUS', '643', 'yes', '7', '.ru');
INSERT INTO `tblcountries` VALUES ('183', 'RW', 'Rwanda', 'Republic of Rwanda', 'RWA', '646', 'yes', '250', '.rw');
INSERT INTO `tblcountries` VALUES ('184', 'BL', 'Saint Barthelemy', 'Saint Barth&eacute;lemy', 'BLM', '652', 'no', '590', '.bl');
INSERT INTO `tblcountries` VALUES ('185', 'SH', 'Saint Helena', 'Saint Helena, Ascension and Tristan da Cunha', 'SHN', '654', 'no', '290', '.sh');
INSERT INTO `tblcountries` VALUES ('186', 'KN', 'Saint Kitts and Nevis', 'Federation of Saint Christopher and Nevis', 'KNA', '659', 'yes', '1+869', '.kn');
INSERT INTO `tblcountries` VALUES ('187', 'LC', 'Saint Lucia', 'Saint Lucia', 'LCA', '662', 'yes', '1+758', '.lc');
INSERT INTO `tblcountries` VALUES ('188', 'MF', 'Saint Martin', 'Saint Martin', 'MAF', '663', 'no', '590', '.mf');
INSERT INTO `tblcountries` VALUES ('189', 'PM', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'SPM', '666', 'no', '508', '.pm');
INSERT INTO `tblcountries` VALUES ('190', 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'VCT', '670', 'yes', '1+784', '.vc');
INSERT INTO `tblcountries` VALUES ('191', 'WS', 'Samoa', 'Independent State of Samoa', 'WSM', '882', 'yes', '685', '.ws');
INSERT INTO `tblcountries` VALUES ('192', 'SM', 'San Marino', 'Republic of San Marino', 'SMR', '674', 'yes', '378', '.sm');
INSERT INTO `tblcountries` VALUES ('193', 'ST', 'Sao Tome and Principe', 'Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe', 'STP', '678', 'yes', '239', '.st');
INSERT INTO `tblcountries` VALUES ('194', 'SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'SAU', '682', 'yes', '966', '.sa');
INSERT INTO `tblcountries` VALUES ('195', 'SN', 'Senegal', 'Republic of Senegal', 'SEN', '686', 'yes', '221', '.sn');
INSERT INTO `tblcountries` VALUES ('196', 'RS', 'Serbia', 'Republic of Serbia', 'SRB', '688', 'yes', '381', '.rs');
INSERT INTO `tblcountries` VALUES ('197', 'SC', 'Seychelles', 'Republic of Seychelles', 'SYC', '690', 'yes', '248', '.sc');
INSERT INTO `tblcountries` VALUES ('198', 'SL', 'Sierra Leone', 'Republic of Sierra Leone', 'SLE', '694', 'yes', '232', '.sl');
INSERT INTO `tblcountries` VALUES ('199', 'SG', 'Singapore', 'Republic of Singapore', 'SGP', '702', 'yes', '65', '.sg');
INSERT INTO `tblcountries` VALUES ('200', 'SX', 'Sint Maarten', 'Sint Maarten', 'SXM', '534', 'no', '1+721', '.sx');
INSERT INTO `tblcountries` VALUES ('201', 'SK', 'Slovakia', 'Slovak Republic', 'SVK', '703', 'yes', '421', '.sk');
INSERT INTO `tblcountries` VALUES ('202', 'SI', 'Slovenia', 'Republic of Slovenia', 'SVN', '705', 'yes', '386', '.si');
INSERT INTO `tblcountries` VALUES ('203', 'SB', 'Solomon Islands', 'Solomon Islands', 'SLB', '090', 'yes', '677', '.sb');
INSERT INTO `tblcountries` VALUES ('204', 'SO', 'Somalia', 'Somali Republic', 'SOM', '706', 'yes', '252', '.so');
INSERT INTO `tblcountries` VALUES ('205', 'ZA', 'South Africa', 'Republic of South Africa', 'ZAF', '710', 'yes', '27', '.za');
INSERT INTO `tblcountries` VALUES ('206', 'GS', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'SGS', '239', 'no', '500', '.gs');
INSERT INTO `tblcountries` VALUES ('207', 'KR', 'South Korea', 'Republic of Korea', 'KOR', '410', 'yes', '82', '.kr');
INSERT INTO `tblcountries` VALUES ('208', 'SS', 'South Sudan', 'Republic of South Sudan', 'SSD', '728', 'yes', '211', '.ss');
INSERT INTO `tblcountries` VALUES ('209', 'ES', 'Spain', 'Kingdom of Spain', 'ESP', '724', 'yes', '34', '.es');
INSERT INTO `tblcountries` VALUES ('210', 'LK', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 'LKA', '144', 'yes', '94', '.lk');
INSERT INTO `tblcountries` VALUES ('211', 'SD', 'Sudan', 'Republic of the Sudan', 'SDN', '729', 'yes', '249', '.sd');
INSERT INTO `tblcountries` VALUES ('212', 'SR', 'Suriname', 'Republic of Suriname', 'SUR', '740', 'yes', '597', '.sr');
INSERT INTO `tblcountries` VALUES ('213', 'SJ', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'SJM', '744', 'no', '47', '.sj');
INSERT INTO `tblcountries` VALUES ('214', 'SZ', 'Swaziland', 'Kingdom of Swaziland', 'SWZ', '748', 'yes', '268', '.sz');
INSERT INTO `tblcountries` VALUES ('215', 'SE', 'Sweden', 'Kingdom of Sweden', 'SWE', '752', 'yes', '46', '.se');
INSERT INTO `tblcountries` VALUES ('216', 'CH', 'Switzerland', 'Swiss Confederation', 'CHE', '756', 'yes', '41', '.ch');
INSERT INTO `tblcountries` VALUES ('217', 'SY', 'Syria', 'Syrian Arab Republic', 'SYR', '760', 'yes', '963', '.sy');
INSERT INTO `tblcountries` VALUES ('218', 'TW', 'Taiwan', 'Republic of China (Taiwan)', 'TWN', '158', 'former', '886', '.tw');
INSERT INTO `tblcountries` VALUES ('219', 'TJ', 'Tajikistan', 'Republic of Tajikistan', 'TJK', '762', 'yes', '992', '.tj');
INSERT INTO `tblcountries` VALUES ('220', 'TZ', 'Tanzania', 'United Republic of Tanzania', 'TZA', '834', 'yes', '255', '.tz');
INSERT INTO `tblcountries` VALUES ('221', 'TH', 'Thailand', 'Kingdom of Thailand', 'THA', '764', 'yes', '66', '.th');
INSERT INTO `tblcountries` VALUES ('222', 'TL', 'Timor-Leste (East Timor)', 'Democratic Republic of Timor-Leste', 'TLS', '626', 'yes', '670', '.tl');
INSERT INTO `tblcountries` VALUES ('223', 'TG', 'Togo', 'Togolese Republic', 'TGO', '768', 'yes', '228', '.tg');
INSERT INTO `tblcountries` VALUES ('224', 'TK', 'Tokelau', 'Tokelau', 'TKL', '772', 'no', '690', '.tk');
INSERT INTO `tblcountries` VALUES ('225', 'TO', 'Tonga', 'Kingdom of Tonga', 'TON', '776', 'yes', '676', '.to');
INSERT INTO `tblcountries` VALUES ('226', 'TT', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 'TTO', '780', 'yes', '1+868', '.tt');
INSERT INTO `tblcountries` VALUES ('227', 'TN', 'Tunisia', 'Republic of Tunisia', 'TUN', '788', 'yes', '216', '.tn');
INSERT INTO `tblcountries` VALUES ('228', 'TR', 'Turkey', 'Republic of Turkey', 'TUR', '792', 'yes', '90', '.tr');
INSERT INTO `tblcountries` VALUES ('229', 'TM', 'Turkmenistan', 'Turkmenistan', 'TKM', '795', 'yes', '993', '.tm');
INSERT INTO `tblcountries` VALUES ('230', 'TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'TCA', '796', 'no', '1+649', '.tc');
INSERT INTO `tblcountries` VALUES ('231', 'TV', 'Tuvalu', 'Tuvalu', 'TUV', '798', 'yes', '688', '.tv');
INSERT INTO `tblcountries` VALUES ('232', 'UG', 'Uganda', 'Republic of Uganda', 'UGA', '800', 'yes', '256', '.ug');
INSERT INTO `tblcountries` VALUES ('233', 'UA', 'Ukraine', 'Ukraine', 'UKR', '804', 'yes', '380', '.ua');
INSERT INTO `tblcountries` VALUES ('234', 'AE', 'United Arab Emirates', 'United Arab Emirates', 'ARE', '784', 'yes', '971', '.ae');
INSERT INTO `tblcountries` VALUES ('235', 'GB', 'United Kingdom', 'United Kingdom of Great Britain and Nothern Ireland', 'GBR', '826', 'yes', '44', '.uk');
INSERT INTO `tblcountries` VALUES ('236', 'US', 'United States', 'United States of America', 'USA', '840', 'yes', '1', '.us');
INSERT INTO `tblcountries` VALUES ('237', 'UM', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'UMI', '581', 'no', 'NONE', 'NONE');
INSERT INTO `tblcountries` VALUES ('238', 'UY', 'Uruguay', 'Eastern Republic of Uruguay', 'URY', '858', 'yes', '598', '.uy');
INSERT INTO `tblcountries` VALUES ('239', 'UZ', 'Uzbekistan', 'Republic of Uzbekistan', 'UZB', '860', 'yes', '998', '.uz');
INSERT INTO `tblcountries` VALUES ('240', 'VU', 'Vanuatu', 'Republic of Vanuatu', 'VUT', '548', 'yes', '678', '.vu');
INSERT INTO `tblcountries` VALUES ('241', 'VA', 'Vatican City', 'State of the Vatican City', 'VAT', '336', 'no', '39', '.va');
INSERT INTO `tblcountries` VALUES ('242', 'VE', 'Venezuela', 'Bolivarian Republic of Venezuela', 'VEN', '862', 'yes', '58', '.ve');
INSERT INTO `tblcountries` VALUES ('243', 'VN', 'Vietnam', 'Socialist Republic of Vietnam', 'VNM', '704', 'yes', '84', '.vn');
INSERT INTO `tblcountries` VALUES ('244', 'VG', 'Virgin Islands, British', 'British Virgin Islands', 'VGB', '092', 'no', '1+284', '.vg');
INSERT INTO `tblcountries` VALUES ('245', 'VI', 'Virgin Islands, US', 'Virgin Islands of the United States', 'VIR', '850', 'no', '1+340', '.vi');
INSERT INTO `tblcountries` VALUES ('246', 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'WLF', '876', 'no', '681', '.wf');
INSERT INTO `tblcountries` VALUES ('247', 'EH', 'Western Sahara', 'Western Sahara', 'ESH', '732', 'no', '212', '.eh');
INSERT INTO `tblcountries` VALUES ('248', 'YE', 'Yemen', 'Republic of Yemen', 'YEM', '887', 'yes', '967', '.ye');
INSERT INTO `tblcountries` VALUES ('249', 'ZM', 'Zambia', 'Republic of Zambia', 'ZMB', '894', 'yes', '260', '.zm');
INSERT INTO `tblcountries` VALUES ('250', 'ZW', 'Zimbabwe', 'Republic of Zimbabwe', 'ZWE', '716', 'yes', '263', '.zw');

-- ----------------------------
-- Table structure for `tblcreditnotes`
-- ----------------------------
DROP TABLE IF EXISTS `tblcreditnotes`;
CREATE TABLE `tblcreditnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` text,
  `terms` text,
  `clientnote` text,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcreditnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcreditnote_refunds`
-- ----------------------------
DROP TABLE IF EXISTS `tblcreditnote_refunds`;
CREATE TABLE `tblcreditnote_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) NOT NULL,
  `note` text,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcreditnote_refunds
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcredits`
-- ----------------------------
DROP TABLE IF EXISTS `tblcredits`;
CREATE TABLE `tblcredits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcredits
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcurrencies`
-- ----------------------------
DROP TABLE IF EXISTS `tblcurrencies`;
CREATE TABLE `tblcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcurrencies
-- ----------------------------
INSERT INTO `tblcurrencies` VALUES ('1', '$', 'USD', '.', ',', 'before', '1');
INSERT INTO `tblcurrencies` VALUES ('2', '€', 'EUR', ',', '.', 'before', '0');

-- ----------------------------
-- Table structure for `tblcustomers_groups`
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomers_groups`;
CREATE TABLE `tblcustomers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcustomers_groups
-- ----------------------------
INSERT INTO `tblcustomers_groups` VALUES ('5', 'BMDCKT');

-- ----------------------------
-- Table structure for `tblcustomer_admins`
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomer_admins`;
CREATE TABLE `tblcustomer_admins` (
  `staff_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_assigned` text NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcustomer_admins
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcustomer_groups`
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomer_groups`;
CREATE TABLE `tblcustomer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcustomer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcustomfields`
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomfields`;
CREATE TABLE `tblcustomfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(15) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `options` mediumtext,
  `display_inline` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` int(11) DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `show_on_pdf` int(11) NOT NULL DEFAULT '0',
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT '0',
  `only_admin` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_client_portal` int(11) NOT NULL DEFAULT '0',
  `disalow_client_to_edit` int(11) NOT NULL DEFAULT '0',
  `bs_column` int(11) NOT NULL DEFAULT '12',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcustomfields
-- ----------------------------

-- ----------------------------
-- Table structure for `tblcustomfieldsvalues`
-- ----------------------------
DROP TABLE IF EXISTS `tblcustomfieldsvalues`;
CREATE TABLE `tblcustomfieldsvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `fieldto` varchar(15) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblcustomfieldsvalues
-- ----------------------------

-- ----------------------------
-- Table structure for `tbldepartments`
-- ----------------------------
DROP TABLE IF EXISTS `tbldepartments`;
CREATE TABLE `tbldepartments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imap_username` varchar(191) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT '0',
  `host` varchar(150) DEFAULT NULL,
  `password` mediumtext,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(191) NOT NULL DEFAULT 'INBOX',
  `delete_after_import` int(11) NOT NULL DEFAULT '0',
  `calendar_id` mediumtext,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbldepartments
-- ----------------------------

-- ----------------------------
-- Table structure for `tbldismissed_announcements`
-- ----------------------------
DROP TABLE IF EXISTS `tbldismissed_announcements`;
CREATE TABLE `tbldismissed_announcements` (
  `dismissedannouncementid` int(11) NOT NULL AUTO_INCREMENT,
  `announcementid` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbldismissed_announcements
-- ----------------------------

-- ----------------------------
-- Table structure for `tblemaillists`
-- ----------------------------
DROP TABLE IF EXISTS `tblemaillists`;
CREATE TABLE `tblemaillists` (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `creator` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblemaillists
-- ----------------------------

-- ----------------------------
-- Table structure for `tblemailtemplates`
-- ----------------------------
DROP TABLE IF EXISTS `tblemailtemplates`;
CREATE TABLE `tblemailtemplates` (
  `emailtemplateid` int(11) NOT NULL AUTO_INCREMENT,
  `type` mediumtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `language` varchar(40) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` text NOT NULL,
  `fromname` mediumtext NOT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `plaintext` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=1801 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblemailtemplates
-- ----------------------------
INSERT INTO `tblemailtemplates` VALUES ('1', 'client', 'new-client-created', 'english', 'New Contact Added/Registered (Welcome Email)', 'Welcome aboard', 'Dear {contact_firstname} {contact_lastname}<br /><br />Thank you for registering on the <strong>{companyname}</strong> CRM System.<br /><br />We just wanted to say welcome.<br /><br />Please contact us if you need any help.<br /><br />Click here to view your profile: <a href=\"{crm_url}\">{crm_url}</a><br /><br />Kind Regards, <br />{email_signature}<br /><br />(This is an automated email, so please don\'t reply to this email address)', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('2', 'invoice', 'invoice-send-to-client', 'english', 'Send Invoice to Customer', 'Invoice with number {invoice_number} created', '<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">We have prepared the following invoice for you: <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Invoice status</strong>: {invoice_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('3', 'ticket', 'new-ticket-opened-admin', 'english', 'New Ticket Opened (Opened by Staff, Sent to Customer)', 'New Support Ticket Opened', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department:</strong> {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a><br /><br />Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('4', 'ticket', 'ticket-reply', 'english', 'Ticket Reply (Sent to Customer)', 'New Ticket Reply', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">You have a new ticket reply to ticket <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket Subject:</strong> {ticket_subject}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('5', 'ticket', 'ticket-autoresponse', 'english', 'New Ticket Opened - Autoresponse', 'New Support Ticket Opened', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Thank you for contacting our support team. A support ticket has now been opened for your request. You will be notified when a response is made by email.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('6', 'invoice', 'invoice-payment-recorded', 'english', 'Invoice Payment Recorded (Sent to Customer)', 'Invoice Payment Recorded', '<span style=\"font-size: 12pt;\">Hello {contact_firstname}&nbsp;{contact_lastname}<br /><br /></span>Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br /><br />Amount:&nbsp;<strong>{payment_total}<br /></strong>Date:&nbsp;<strong>{payment_date}</strong><br />Invoice number:&nbsp;<span style=\"font-size: 12pt;\"><strong># {invoice_number}<br /><br /></strong></span>-------------------------------------------------<br /><br />You can always view the invoice for this payment at the following link:&nbsp;<a href=\"{invoice_link}\"><span style=\"font-size: 12pt;\">{invoice_number}</span></a><br /><br />We are looking forward working with you.<br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('7', 'invoice', 'invoice-overdue-notice', 'english', 'Invoice Overdue Notice', 'Invoice Overdue Notice - {invoice_number}', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">This is an overdue notice for invoice <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">This invoice was due: {invoice_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('8', 'invoice', 'invoice-already-send', 'english', 'Invoice Already Sent to Customer', 'Invoice # {invoice_number} ', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">At your request, here is the invoice with number <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('9', 'ticket', 'new-ticket-created-staff', 'english', 'New Ticket Created (Opened by Customer, Sent to Staff Members)', 'New Ticket Created', '<span style=\"font-size: 12pt;\">A new support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('10', 'estimate', 'estimate-send-to-client', 'english', 'Send Estimate to Customer', 'Estimate # {estimate_number} created', '<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the attached estimate <strong># {estimate_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Estimate status:</strong> {estimate_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">We look forward to your communication.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}<br /></span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('11', 'ticket', 'ticket-reply-to-admin', 'english', 'Ticket Reply (Sent to Staff)', 'New Support Ticket Reply', '<span style=\"font-size: 12pt;\">A new support ticket reply from {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('12', 'estimate', 'estimate-already-send', 'english', 'Estimate Already Sent to Customer', 'Estimate # {estimate_number} ', '<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank you for your estimate request.</span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('13', 'contract', 'contract-expiration', 'english', 'Contract Expiration Reminder (Sent to Customer Contacts)', 'Contract Expiration Reminder', '<span style=\"font-size: 12pt;\">Dear {client_company}</span><br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('14', 'tasks', 'task-assigned', 'english', 'New Task Assigned (Sent to Staff)', 'New Task Assigned to You - {task_name}', '<span style=\"font-size: 12pt;\">Dear {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\">You have been assigned to a new task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}<br /></span><strong>Start Date:</strong> {task_startdate}<br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {task_priority}<br /><br /></span><span style=\"font-size: 12pt;\"><span>You can view the task on the following link</span>: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('15', 'tasks', 'task-added-as-follower', 'english', 'Staff Member Added as Follower on Task (Sent to Staff)', 'You are added as follower on task - {task_name}', '<span style=\"font-size: 12pt;\">Hi {staff_firstname}<br /></span><br /><span style=\"font-size: 12pt;\">You have been added as follower on the following task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Start date:</strong> {task_startdate}</span><br /><br /><span>You can view the task on the following link</span><span>: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('16', 'tasks', 'task-commented', 'english', 'New Comment on Task (Sent to Staff)', 'New Comment on Task - {task_name}', 'Dear {staff_firstname}<br /><br />A comment has been made on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><strong>Comment:</strong> {task_comment}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('17', 'tasks', 'task-added-attachment', 'english', 'New Attachment(s) on Task (Sent to Staff)', 'New Attachment on Task - {task_name}', 'Hi {staff_firstname}<br /><br /><strong>{task_user_take_action}</strong> added an attachment on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('18', 'estimate', 'estimate-declined-to-staff', 'english', 'Estimate Declined (Sent to Staff)', 'Customer Declined Estimate', '<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) declined estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('19', 'estimate', 'estimate-accepted-to-staff', 'english', 'Estimate Accepted (Sent to Staff)', 'Customer Accepted Estimate', '<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) accepted estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('20', 'proposals', 'proposal-client-accepted', 'english', 'Customer Action - Accepted (Sent to Staff)', 'Customer Accepted Proposal', '<div>Hi<br /> <br />Client <strong>{proposal_proposal_to}</strong> accepted the following proposal:<br /> <br /><strong>Number:</strong> {proposal_number}<br /><strong>Subject</strong>: {proposal_subject}<br /><strong>Total</strong>: {proposal_total}<br /> <br />View the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('21', 'proposals', 'proposal-send-to-customer', 'english', 'Send Proposal to Customer', 'Proposal With Number {proposal_number} Created', 'Dear {proposal_proposal_to}<br /><br />Please find our attached proposal.<br /><br />This proposal is valid until: {proposal_open_till}<br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Please don\'t hesitate to comment online if you have any questions.<br /><br />We look forward to your communication.<br /><br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('22', 'proposals', 'proposal-client-declined', 'english', 'Customer Action - Declined (Sent to Staff)', 'Client Declined Proposal', 'Hi<br /> <br />Customer <strong>{proposal_proposal_to}</strong> declined the proposal <strong>{proposal_subject}</strong><br /> <br />View the proposal on the following link <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('23', 'proposals', 'proposal-client-thank-you', 'english', 'Thank You Email (Sent to Customer After Accept)', 'Thank for you accepting proposal', 'Dear {proposal_proposal_to}<br /> <br />Thank for for accepting the proposal.<br /> <br />We look forward to doing business with you.<br /> <br />We will contact you as soon as possible<br /> <br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('24', 'proposals', 'proposal-comment-to-client', 'english', 'New Comment  (Sent to Customer/Lead)', 'New Proposal Comment', 'Dear {proposal_proposal_to}<br /> <br />A new comment has been made on the following proposal: <strong>{proposal_number}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('25', 'proposals', 'proposal-comment-to-admin', 'english', 'New Comment (Sent to Staff) ', 'New Proposal Comment', 'Hi<br /> <br />A new comment has been made to the proposal <strong>{proposal_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('26', 'estimate', 'estimate-thank-you-to-customer', 'english', 'Thank You Email (Sent to Customer After Accept)', 'Thank for you accepting estimate', '<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank for for accepting the estimate.</span><br /> <br /><span style=\"font-size: 12pt;\">We look forward to doing business with you.</span><br /> <br /><span style=\"font-size: 12pt;\">We will contact you as soon as possible.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('27', 'tasks', 'task-deadline-notification', 'english', 'Task Deadline Reminder - Sent to Assigned Members', 'Task Deadline Reminder', 'Hi {staff_firstname}&nbsp;{staff_lastname}<br /><br />This is an automated email from {companyname}.<br /><br />The task <strong>{task_name}</strong> deadline is on <strong>{task_duedate}</strong>. <br />This task is still not finished.<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('28', 'contract', 'send-contract', 'english', 'Send Contract to Customer', 'Contract - {contract_subject}', '<p><span style=\"font-size: 12pt;\">Hi&nbsp;{contact_firstname}&nbsp;{contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the <a href=\"{contract_link}\">{contract_subject}</a> attached.<br /><br />Description: {contract_description}<br /><br /></span><span style=\"font-size: 12pt;\">Looking forward to hear from you.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('29', 'invoice', 'invoice-payment-recorded-to-staff', 'english', 'Invoice Payment Recorded (Sent to Staff)', 'New Invoice Payment', '<span style=\"font-size: 12pt;\">Hi</span><br /><br /><span style=\"font-size: 12pt;\">Customer recorded payment for invoice <strong># {invoice_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('30', 'ticket', 'auto-close-ticket', 'english', 'Auto Close Ticket', 'Ticket Auto Closed', '<p><span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Ticket {ticket_subject} has been auto close due to inactivity.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket #</strong>: <a href=\"{ticket_public_url}\">{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('31', 'project', 'new-project-discussion-created-to-staff', 'english', 'New Project Discussion (Sent to Project Members)', 'New Project Discussion Created - {project_name}', '<p>Hi {staff_firstname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('32', 'project', 'new-project-discussion-created-to-customer', 'english', 'New Project Discussion (Sent to Customer Contacts)', 'New Project Discussion Created - {project_name}', '<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('33', 'project', 'new-project-file-uploaded-to-customer', 'english', 'New Project File(s) Uploaded (Sent to Customer Contacts)', 'New Project File(s) Uploaded - {project_name}', '<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project file is uploaded on <strong>{project_name}</strong> from <strong>{file_creator}</strong><br /><br />You can view the project on the following link: <a href=\"{project_link}\">{project_name}</a><br /><br />To view the file in our CRM you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('34', 'project', 'new-project-file-uploaded-to-staff', 'english', 'New Project File(s) Uploaded (Sent to Project Members)', 'New Project File(s) Uploaded - {project_name}', '<p>Hello&nbsp;{staff_firstname}</p>\r\n<p>New project&nbsp;file is uploaded on&nbsp;<strong>{project_name}</strong> from&nbsp;<strong>{file_creator}</strong></p>\r\n<p>You can view the project on the following link: <a href=\"{project_link}\">{project_name}<br /></a><br />To view&nbsp;the file you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></p>\r\n<p>Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('35', 'project', 'new-project-discussion-comment-to-customer', 'english', 'New Discussion Comment  (Sent to Customer Contacts)', 'New Discussion Comment', '<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Discussion subject:</strong> {discussion_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Comment</strong>: {discussion_comment}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('36', 'project', 'new-project-discussion-comment-to-staff', 'english', 'New Discussion Comment (Sent to Project Members)', 'New Discussion Comment', '<p>Hi {staff_firstname}<br /><br />New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong><br /><br /><strong>Discussion subject:</strong> {discussion_subject}<br /><strong>Comment:</strong> {discussion_comment}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('37', 'project', 'staff-added-as-project-member', 'english', 'Staff Added as Project Member', 'New project assigned to you', '<p>Hi {staff_firstname}<br /><br />New project has been assigned to you.<br /><br />You can view the project on the following link <a href=\"{project_link}\">{project_name}</a><br /><br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('38', 'estimate', 'estimate-expiry-reminder', 'english', 'Estimate Expiration Reminder', 'Estimate Expiration Reminder', '<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">The estimate with <strong># {estimate_number}</strong> will expire on <strong>{estimate_expirydate}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('39', 'proposals', 'proposal-expiry-reminder', 'english', 'Proposal Expiration Reminder', 'Proposal Expiration Reminder', '<p>Hello {proposal_proposal_to}<br /><br />The proposal {proposal_number}&nbsp;will expire on <strong>{proposal_open_till}</strong><br /><br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('40', 'staff', 'new-staff-created', 'english', 'New Staff Created (Welcome Email)', 'You are added as staff member', 'Hi {staff_firstname}<br /><br />You are added as member on our CRM.<br /><br />Please use the following logic credentials:<br /><br /><strong>Email:</strong> {staff_email}<br /><strong>Password:</strong> {password}<br /><br />Click <a href=\"{admin_url}\">here </a>to login in the dashboard.<br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('41', 'client', 'contact-forgot-password', 'english', 'Forgot Password', 'Create New Password', '<h2>Create a new password</h2>\r\nForgot your password?<br /> To create a new password, just follow this link:<br /> <br /><a href=\"{reset_password_url}\">Reset Password</a><br /> <br /> You received this email, because it was requested by a {companyname}&nbsp;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br /><br /> {email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('42', 'client', 'contact-password-reseted', 'english', 'Password Reset - Confirmation', 'Your password has been changed', '<strong><span style=\"font-size: 14pt;\">You have changed your password.</span><br /></strong><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {contact_email}<br /><br />If this wasnt you, please contact us.<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('43', 'client', 'contact-set-password', 'english', 'Set New Password', 'Set new password on {companyname} ', '<h2><span style=\"font-size: 14pt;\">Setup your new password on {companyname}</span></h2>\r\nPlease use the following link to set up your new password:<br /><br /><a href=\"{set_password_url}\">Set new password</a><br /><br />Keep it in your records so you don\'t forget it.<br /><br />Please set your new password in <strong>48 hours</strong>. After that, you won\'t be able to set your password because this link will expire.<br /><br />You can login at: <a href=\"{crm_url}\">{crm_url}</a><br />Your email address for login: {contact_email}<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('44', 'staff', 'staff-forgot-password', 'english', 'Forgot Password', 'Create New Password', '<h2><span style=\"font-size: 14pt;\">Create a new password</span></h2>\r\nForgot your password?<br /> To create a new password, just follow this link:<br /> <br /><a href=\"{reset_password_url}\">Reset Password</a><br /> <br /> You received this email, because it was requested by a <strong>{companyname}</strong>&nbsp;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br /><br /> {email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('45', 'staff', 'staff-password-reseted', 'english', 'Password Reset - Confirmation', 'Your password has been changed', '<span style=\"font-size: 14pt;\"><strong>You have changed your password.<br /></strong></span><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {staff_email}<br /><br /> If this wasnt you, please contact us.<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('46', 'project', 'assigned-to-project', 'english', 'New Project Created (Sent to Customer Contacts)', 'New Project Created', '<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>New project is assigned to your company.<br /><br /><strong>Project Name:</strong>&nbsp;{project_name}<br /><strong>Project Start Date:</strong>&nbsp;{project_start_date}</p>\r\n<p>You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>We are looking forward hearing from you.<br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('47', 'tasks', 'task-added-attachment-to-contacts', 'english', 'New Attachment(s) on Task (Sent to Customer Contacts)', 'New Attachment on Task - {task_name}', '<span>Hi {contact_firstname} {contact_lastname}</span><br /><br /><strong>{task_user_take_action}</strong><span> added an attachment on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('48', 'tasks', 'task-commented-to-contacts', 'english', 'New Comment on Task (Sent to Customer Contacts)', 'New Comment on Task - {task_name}', '<span>Dear {contact_firstname} {contact_lastname}</span><br /><br /><span>A comment has been made on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><strong>Comment:</strong><span> {task_comment}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('49', 'leads', 'new-lead-assigned', 'english', 'New Lead Assigned to Staff Member', 'New lead assigned to you', '<p>Hello {lead_assigned}<br /><br />New lead is assigned to you.<br /><br /><strong>Lead Name:</strong>&nbsp;{lead_name}<br /><strong>Lead Email:</strong>&nbsp;{lead_email}<br /><br />You can view the lead on the following link: <a href=\"{lead_link}\">{lead_name}</a><br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('50', 'client', 'client-statement', 'english', 'Statement - Account Summary', 'Account Statement from {statement_from} to {statement_to}', 'Dear {contact_firstname} {contact_lastname}, <br /><br />Its been a great experience working with you.<br /><br />Attached with this email is a list of all transactions for the period between {statement_from} to {statement_to}<br /><br />For your information your account balance due is total:&nbsp;{statement_balance_due}<br /><br />Please contact us if you need more information.<br /> <br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('51', 'ticket', 'ticket-assigned-to-admin', 'english', 'New Ticket Assigned (Sent to Staff)', 'New support ticket has been assigned to you', '<p><span style=\"font-size: 12pt;\">Hi</span></p>\r\n<p><span style=\"font-size: 12pt;\">A new support ticket&nbsp;has been assigned to you.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('52', 'client', 'new-client-registered-to-admin', 'english', 'New Customer Registration (Sent to admins)', 'New Customer Registration', 'Hello.<br /><br />New customer registration on your customer portal:<br /><br /><strong>Firstname:</strong>&nbsp;{contact_firstname}<br /><strong>Lastname:</strong>&nbsp;{contact_lastname}<br /><strong>Company:</strong>&nbsp;{client_company}<br /><strong>Email:</strong>&nbsp;{contact_email}<br /><br />Best Regards', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('53', 'leads', 'new-web-to-lead-form-submitted', 'english', 'Web to lead form submitted - Sent to lead', '{lead_name} - We Received Your Request', 'Hello {lead_name}.<br /><br /><strong>Your request has been received.</strong><br /><br />This email is to let you know that we received your request and we will get back to you as soon as possible with more information.<br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('54', 'staff', 'two-factor-authentication', 'english', 'Two Factor Authentication', 'Confirm Your Login', '<p>Hi {staff_firstname}</p>\r\n<p style=\"text-align: left;\">You received this email because you have enabled two factor authentication in your account.<br />Use the following code to confirm your login:</p>\r\n<p style=\"text-align: left;\"><span style=\"font-size: 18pt;\"><strong>{two_factor_auth_code}<br /><br /></strong><span style=\"font-size: 12pt;\">{email_signature}</span><strong><br /><br /><br /><br /></strong></span></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('55', 'project', 'project-finished-to-customer', 'english', 'Project Marked as Finished (Sent to Customer Contacts)', 'Project Marked as Finished', '<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>You are receiving this email because project&nbsp;<strong>{project_name}</strong> has been marked as finished. This project is assigned under your company and we just wanted to keep you up to date.<br /><br />You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>If you have any questions don\'t hesitate to contact us.<br /><br />Kind Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('56', 'credit_note', 'credit-note-send-to-client', 'english', 'Send Credit Note To Email', 'Credit Note With Number #{credit_note_number} Created', 'Dear&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have attached the credit note with number <strong>#{credit_note_number} </strong>for your reference.<br /><br /><strong>Date:</strong>&nbsp;{credit_note_date}<br /><strong>Total Amount:</strong>&nbsp;{credit_note_total}<br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('57', 'tasks', 'task-status-change-to-staff', 'english', 'Task Status Changed (Sent to Staff)', 'Task Status Changed', '<span style=\"font-size: 12pt;\">Hi {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('58', 'tasks', 'task-status-change-to-contacts', 'english', 'Task Status Changed (Sent to Customer Contacts)', 'Task Status Changed', '<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('59', 'staff', 'reminder-email-staff', 'english', 'Staff Reminder Email', 'You Have a New Reminder!', '<p>Hello&nbsp;{staff_firstname}<br /><br /><strong>You have a new reminder&nbsp;linked to&nbsp;{staff_reminder_relation_name}!<br /><br />Reminder description:</strong><br />{staff_reminder_description}<br /><br />Click <a href=\"{staff_reminder_relation_link}\">here</a> to view&nbsp;<a href=\"{staff_reminder_relation_link}\">{staff_reminder_relation_name}</a><br /><br />Best Regards<br /><br /></p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('60', 'contract', 'contract-comment-to-client', 'english', 'New Comment  (Sent to Customer Contacts)', 'New Contract Comment', 'Dear {contact_firstname} {contact_lastname}<br /> <br />A new comment has been made on the following contract: <strong>{contract_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a><br /> <br />Kind Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('61', 'contract', 'contract-comment-to-admin', 'english', 'New Comment (Sent to Staff) ', 'New Contract Comment', 'Hi {staff_firstname}<br /><br />A new comment has been made to the contract&nbsp;<strong>{contract_subject}</strong><br /><br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('62', 'subscriptions', 'send-subscription', 'english', 'Send Subscription to Customer', 'Subscription Created', 'Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have prepared the subscription&nbsp;<strong>{subscription_name}</strong> for your company.<br /><br />Click <a href=\"{subscription_link}\">here</a> to review the subscription and subscribe.<br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('63', 'subscriptions', 'subscription-payment-failed', 'english', 'Subscription Payment Failed', 'Your most recent invoice payment failed', 'Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br br=\"\" />Unfortunately, your most recent invoice payment for&nbsp;<strong>{subscription_name}</strong> was declined.<br /><br />This could be due to a change in your card number, your card expiring,<br />cancellation of your credit card, or the card issuer not recognizing the<br />payment and therefore taking action to prevent it.<br /><br />Please update your payment information as soon as possible by logging in here:<br /><a href=\"{crm_url}/login\">{crm_url}/login</a><br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('64', 'subscriptions', 'subscription-canceled', 'english', 'Subscription Canceled (Sent to customer primary contact)', 'Your subscription has been canceled', 'Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />Your subscription&nbsp;<strong>{subscription_name} </strong>has been canceled, if you have any questions don\'t hesitate to contact us.<br /><br />It was a pleasure doing business with you.<br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('65', 'subscriptions', 'subscription-payment-succeeded', 'english', 'Subscription Payment Succeeded (Sent to customer primary contact)', 'Subscription  Payment Receipt - {subscription_name}', 'Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />This email is to let you know that we received your payment for subscription&nbsp;<strong>{subscription_name}&nbsp;</strong>of&nbsp;<strong><span>{payment_total}<br /><br /></span></strong>The invoice associated with it is now with status&nbsp;<strong>{invoice_status}<br /></strong><br />Thank you for your confidence.<br /><br />Best Regards,<br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('66', 'contract', 'contract-expiration-to-staff', 'english', 'Contract Expiration Reminder (Sent to Staff)', 'Contract Expiration Reminder', 'Hi {staff_firstname}<br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('67', 'gdpr', 'gdpr-removal-request', 'english', 'Removal Request From Contact (Sent to administrators)', 'Data Removal Request Received', 'Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by&nbsp;{contact_firstname} {contact_lastname}<br /><br />You can review this request and take proper actions directly from the admin area.', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('68', 'gdpr', 'gdpr-removal-request-lead', 'english', 'Removal Request From Lead (Sent to administrators)', 'Data Removal Request Received', 'Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by {lead_name}<br /><br />You can review this request and take proper actions directly from the admin area.<br /><br />To view the lead inside the admin area click here:&nbsp;<a href=\"{lead_link}\">{lead_link}</a>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('69', 'client', 'client-registration-confirmed', 'english', 'Customer Registration Confirmed', 'Your registration is confirmed', '<p>Dear {contact_firstname} {contact_lastname}<br /><br />We just wanted to let you know that your registration at&nbsp;{companyname} is successfully confirmed and your account is now active.<br /><br />You can login at&nbsp;<a href=\"{crm_url}\">{crm_url}</a> with the email and password you provided during registration.<br /><br />Please contact us if you need any help.<br /><br />Kind Regards, <br />{email_signature}</p>\r\n<p><br />(This is an automated email, so please don\'t reply to this email address)</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('70', 'contract', 'contract-signed-to-staff', 'english', 'Contract Signed (Sent to Staff)', 'Customer Signed a Contract', 'Hi {staff_firstname}<br /><br />A contract with subject&nbsp;<strong>{contract_subject} </strong>has been successfully signed by the customer.<br /><br />You can view the contract at the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('71', 'subscriptions', 'customer-subscribed-to-staff', 'english', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator)', 'Customer Subscribed to a Subscription', 'The customer <strong>{client_company}</strong> subscribed to a subscription with name&nbsp;<strong>{subscription_name}</strong><br /><br /><strong>ID</strong>:&nbsp;{subscription_id}<br /><strong>Subscription name</strong>:&nbsp;{subscription_name}<br /><strong>Subscription description</strong>:&nbsp;{subscription_description}<br /><br />You can view the subscription by clicking <a href=\"{subscription_link}\">here</a><br />\r\n<div style=\"text-align: center;\"><span style=\"font-size: 10pt;\">&nbsp;</span></div>\r\nBest Regards,<br />{email_signature}<br /><br /><span style=\"font-size: 10pt;\"><span style=\"color: #999999;\">You are receiving this email because you are either administrator or you are creator of the subscription.</span></span>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('72', 'client', 'contact-verification-email', 'english', 'Email Verification (Sent to Contact After Registration)', 'Verify Email Address', '<p>Hello&nbsp;{contact_firstname}<br /><br />Please click the button below to verify your email address.<br /><br /><a href=\"{email_verification_url}\">Verify Email Address</a><br /><br />If you did not create an account, no further action is required</p>\r\n<p><br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('73', 'client', 'new-customer-profile-file-uploaded-to-staff', 'english', 'New Customer Profile File(s) Uploaded (Sent to Staff)', 'Customer Uploaded New File(s) in Profile', 'Hi!<br /><br />New file(s) is uploaded into the customer ({client_company}) profile by&nbsp;{contact_firstname}<br /><br />You can check the uploaded files into the admin area by clicking <a href=\"{customer_profile_files_admin_link}\">here</a> or at the following link:&nbsp;{customer_profile_files_admin_link}<br /><br />{email_signature}', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('74', 'staff', 'event-notification-to-staff', 'english', 'Event Notification (Calendar)', 'Upcoming Event - {event_title}', 'Hi {staff_firstname}! <br /><br />This is a reminder for event <a href=\\\"{event_link}\\\">{event_title}</a> scheduled at {event_start_date}. <br /><br />Regards.', '', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('75', 'subscriptions', 'subscription-payment-requires-action', 'english', 'Credit Card Authorization Required - SCA', 'Important: Confirm your subscription {subscription_name} payment', '<p>Hello {contact_firstname}</p>\r\n<p><strong>Your bank sometimes requires an additional step to make sure an online transaction was authorized.</strong><br /><br />Because of European regulation to protect consumers, many online payments now require two-factor authentication. Your bank ultimately decides when authentication is required to confirm a payment, but you may notice this step when you start paying for a service or when the cost changes.<br /><br />In order to pay the subscription <strong>{subscription_name}</strong>, you will need to&nbsp;confirm your payment by clicking on the follow link: <strong><a href=\"{subscription_authorize_payment_link}\">{subscription_authorize_payment_link}</a></strong><br /><br />To view the subscription, please click at the following link: <a href=\"{subscription_link}\"><span>{subscription_link}</span></a><br />or you can login in our dedicated area here: <a href=\"{crm_url}/login\">{crm_url}/login</a> in case you want to update your credit card or view the subscriptions you are subscribed.<br /><br />Best Regards,<br />{email_signature}</p>', '{companyname} | CRM', '', '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('76', 'client', 'new-client-created', 'bulgarian', 'New Contact Added/Registered (Welcome Email) [bulgarian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('77', 'invoice', 'invoice-send-to-client', 'bulgarian', 'Send Invoice to Customer [bulgarian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('78', 'ticket', 'new-ticket-opened-admin', 'bulgarian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [bulgarian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('79', 'ticket', 'ticket-reply', 'bulgarian', 'Ticket Reply (Sent to Customer) [bulgarian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('80', 'ticket', 'ticket-autoresponse', 'bulgarian', 'New Ticket Opened - Autoresponse [bulgarian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('81', 'invoice', 'invoice-payment-recorded', 'bulgarian', 'Invoice Payment Recorded (Sent to Customer) [bulgarian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('82', 'invoice', 'invoice-overdue-notice', 'bulgarian', 'Invoice Overdue Notice [bulgarian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('83', 'invoice', 'invoice-already-send', 'bulgarian', 'Invoice Already Sent to Customer [bulgarian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('84', 'ticket', 'new-ticket-created-staff', 'bulgarian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [bulgarian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('85', 'estimate', 'estimate-send-to-client', 'bulgarian', 'Send Estimate to Customer [bulgarian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('86', 'ticket', 'ticket-reply-to-admin', 'bulgarian', 'Ticket Reply (Sent to Staff) [bulgarian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('87', 'estimate', 'estimate-already-send', 'bulgarian', 'Estimate Already Sent to Customer [bulgarian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('88', 'contract', 'contract-expiration', 'bulgarian', 'Contract Expiration Reminder (Sent to Customer Contacts) [bulgarian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('89', 'tasks', 'task-assigned', 'bulgarian', 'New Task Assigned (Sent to Staff) [bulgarian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('90', 'tasks', 'task-added-as-follower', 'bulgarian', 'Staff Member Added as Follower on Task (Sent to Staff) [bulgarian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('91', 'tasks', 'task-commented', 'bulgarian', 'New Comment on Task (Sent to Staff) [bulgarian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('92', 'tasks', 'task-added-attachment', 'bulgarian', 'New Attachment(s) on Task (Sent to Staff) [bulgarian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('93', 'estimate', 'estimate-declined-to-staff', 'bulgarian', 'Estimate Declined (Sent to Staff) [bulgarian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('94', 'estimate', 'estimate-accepted-to-staff', 'bulgarian', 'Estimate Accepted (Sent to Staff) [bulgarian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('95', 'proposals', 'proposal-client-accepted', 'bulgarian', 'Customer Action - Accepted (Sent to Staff) [bulgarian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('96', 'proposals', 'proposal-send-to-customer', 'bulgarian', 'Send Proposal to Customer [bulgarian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('97', 'proposals', 'proposal-client-declined', 'bulgarian', 'Customer Action - Declined (Sent to Staff) [bulgarian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('98', 'proposals', 'proposal-client-thank-you', 'bulgarian', 'Thank You Email (Sent to Customer After Accept) [bulgarian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('99', 'proposals', 'proposal-comment-to-client', 'bulgarian', 'New Comment  (Sent to Customer/Lead) [bulgarian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('100', 'proposals', 'proposal-comment-to-admin', 'bulgarian', 'New Comment (Sent to Staff)  [bulgarian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('101', 'estimate', 'estimate-thank-you-to-customer', 'bulgarian', 'Thank You Email (Sent to Customer After Accept) [bulgarian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('102', 'tasks', 'task-deadline-notification', 'bulgarian', 'Task Deadline Reminder - Sent to Assigned Members [bulgarian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('103', 'contract', 'send-contract', 'bulgarian', 'Send Contract to Customer [bulgarian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('104', 'invoice', 'invoice-payment-recorded-to-staff', 'bulgarian', 'Invoice Payment Recorded (Sent to Staff) [bulgarian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('105', 'ticket', 'auto-close-ticket', 'bulgarian', 'Auto Close Ticket [bulgarian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('106', 'project', 'new-project-discussion-created-to-staff', 'bulgarian', 'New Project Discussion (Sent to Project Members) [bulgarian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('107', 'project', 'new-project-discussion-created-to-customer', 'bulgarian', 'New Project Discussion (Sent to Customer Contacts) [bulgarian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('108', 'project', 'new-project-file-uploaded-to-customer', 'bulgarian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [bulgarian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('109', 'project', 'new-project-file-uploaded-to-staff', 'bulgarian', 'New Project File(s) Uploaded (Sent to Project Members) [bulgarian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('110', 'project', 'new-project-discussion-comment-to-customer', 'bulgarian', 'New Discussion Comment  (Sent to Customer Contacts) [bulgarian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('111', 'project', 'new-project-discussion-comment-to-staff', 'bulgarian', 'New Discussion Comment (Sent to Project Members) [bulgarian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('112', 'project', 'staff-added-as-project-member', 'bulgarian', 'Staff Added as Project Member [bulgarian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('113', 'estimate', 'estimate-expiry-reminder', 'bulgarian', 'Estimate Expiration Reminder [bulgarian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('114', 'proposals', 'proposal-expiry-reminder', 'bulgarian', 'Proposal Expiration Reminder [bulgarian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('115', 'staff', 'new-staff-created', 'bulgarian', 'New Staff Created (Welcome Email) [bulgarian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('116', 'client', 'contact-forgot-password', 'bulgarian', 'Forgot Password [bulgarian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('117', 'client', 'contact-password-reseted', 'bulgarian', 'Password Reset - Confirmation [bulgarian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('118', 'client', 'contact-set-password', 'bulgarian', 'Set New Password [bulgarian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('119', 'staff', 'staff-forgot-password', 'bulgarian', 'Forgot Password [bulgarian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('120', 'staff', 'staff-password-reseted', 'bulgarian', 'Password Reset - Confirmation [bulgarian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('121', 'project', 'assigned-to-project', 'bulgarian', 'New Project Created (Sent to Customer Contacts) [bulgarian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('122', 'tasks', 'task-added-attachment-to-contacts', 'bulgarian', 'New Attachment(s) on Task (Sent to Customer Contacts) [bulgarian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('123', 'tasks', 'task-commented-to-contacts', 'bulgarian', 'New Comment on Task (Sent to Customer Contacts) [bulgarian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('124', 'leads', 'new-lead-assigned', 'bulgarian', 'New Lead Assigned to Staff Member [bulgarian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('125', 'client', 'client-statement', 'bulgarian', 'Statement - Account Summary [bulgarian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('126', 'ticket', 'ticket-assigned-to-admin', 'bulgarian', 'New Ticket Assigned (Sent to Staff) [bulgarian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('127', 'client', 'new-client-registered-to-admin', 'bulgarian', 'New Customer Registration (Sent to admins) [bulgarian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('128', 'leads', 'new-web-to-lead-form-submitted', 'bulgarian', 'Web to lead form submitted - Sent to lead [bulgarian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('129', 'staff', 'two-factor-authentication', 'bulgarian', 'Two Factor Authentication [bulgarian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('130', 'project', 'project-finished-to-customer', 'bulgarian', 'Project Marked as Finished (Sent to Customer Contacts) [bulgarian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('131', 'credit_note', 'credit-note-send-to-client', 'bulgarian', 'Send Credit Note To Email [bulgarian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('132', 'tasks', 'task-status-change-to-staff', 'bulgarian', 'Task Status Changed (Sent to Staff) [bulgarian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('133', 'tasks', 'task-status-change-to-contacts', 'bulgarian', 'Task Status Changed (Sent to Customer Contacts) [bulgarian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('134', 'staff', 'reminder-email-staff', 'bulgarian', 'Staff Reminder Email [bulgarian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('135', 'contract', 'contract-comment-to-client', 'bulgarian', 'New Comment  (Sent to Customer Contacts) [bulgarian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('136', 'contract', 'contract-comment-to-admin', 'bulgarian', 'New Comment (Sent to Staff)  [bulgarian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('137', 'subscriptions', 'send-subscription', 'bulgarian', 'Send Subscription to Customer [bulgarian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('138', 'subscriptions', 'subscription-payment-failed', 'bulgarian', 'Subscription Payment Failed [bulgarian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('139', 'subscriptions', 'subscription-canceled', 'bulgarian', 'Subscription Canceled (Sent to customer primary contact) [bulgarian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('140', 'subscriptions', 'subscription-payment-succeeded', 'bulgarian', 'Subscription Payment Succeeded (Sent to customer primary contact) [bulgarian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('141', 'contract', 'contract-expiration-to-staff', 'bulgarian', 'Contract Expiration Reminder (Sent to Staff) [bulgarian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('142', 'gdpr', 'gdpr-removal-request', 'bulgarian', 'Removal Request From Contact (Sent to administrators) [bulgarian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('143', 'gdpr', 'gdpr-removal-request-lead', 'bulgarian', 'Removal Request From Lead (Sent to administrators) [bulgarian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('144', 'client', 'client-registration-confirmed', 'bulgarian', 'Customer Registration Confirmed [bulgarian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('145', 'contract', 'contract-signed-to-staff', 'bulgarian', 'Contract Signed (Sent to Staff) [bulgarian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('146', 'subscriptions', 'customer-subscribed-to-staff', 'bulgarian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [bulgarian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('147', 'client', 'contact-verification-email', 'bulgarian', 'Email Verification (Sent to Contact After Registration) [bulgarian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('148', 'client', 'new-customer-profile-file-uploaded-to-staff', 'bulgarian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [bulgarian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('149', 'staff', 'event-notification-to-staff', 'bulgarian', 'Event Notification (Calendar) [bulgarian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('150', 'subscriptions', 'subscription-payment-requires-action', 'bulgarian', 'Credit Card Authorization Required - SCA [bulgarian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('151', 'client', 'new-client-created', 'catalan', 'New Contact Added/Registered (Welcome Email) [catalan]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('152', 'invoice', 'invoice-send-to-client', 'catalan', 'Send Invoice to Customer [catalan]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('153', 'ticket', 'new-ticket-opened-admin', 'catalan', 'New Ticket Opened (Opened by Staff, Sent to Customer) [catalan]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('154', 'ticket', 'ticket-reply', 'catalan', 'Ticket Reply (Sent to Customer) [catalan]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('155', 'ticket', 'ticket-autoresponse', 'catalan', 'New Ticket Opened - Autoresponse [catalan]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('156', 'invoice', 'invoice-payment-recorded', 'catalan', 'Invoice Payment Recorded (Sent to Customer) [catalan]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('157', 'invoice', 'invoice-overdue-notice', 'catalan', 'Invoice Overdue Notice [catalan]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('158', 'invoice', 'invoice-already-send', 'catalan', 'Invoice Already Sent to Customer [catalan]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('159', 'ticket', 'new-ticket-created-staff', 'catalan', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [catalan]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('160', 'estimate', 'estimate-send-to-client', 'catalan', 'Send Estimate to Customer [catalan]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('161', 'ticket', 'ticket-reply-to-admin', 'catalan', 'Ticket Reply (Sent to Staff) [catalan]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('162', 'estimate', 'estimate-already-send', 'catalan', 'Estimate Already Sent to Customer [catalan]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('163', 'contract', 'contract-expiration', 'catalan', 'Contract Expiration Reminder (Sent to Customer Contacts) [catalan]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('164', 'tasks', 'task-assigned', 'catalan', 'New Task Assigned (Sent to Staff) [catalan]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('165', 'tasks', 'task-added-as-follower', 'catalan', 'Staff Member Added as Follower on Task (Sent to Staff) [catalan]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('166', 'tasks', 'task-commented', 'catalan', 'New Comment on Task (Sent to Staff) [catalan]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('167', 'tasks', 'task-added-attachment', 'catalan', 'New Attachment(s) on Task (Sent to Staff) [catalan]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('168', 'estimate', 'estimate-declined-to-staff', 'catalan', 'Estimate Declined (Sent to Staff) [catalan]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('169', 'estimate', 'estimate-accepted-to-staff', 'catalan', 'Estimate Accepted (Sent to Staff) [catalan]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('170', 'proposals', 'proposal-client-accepted', 'catalan', 'Customer Action - Accepted (Sent to Staff) [catalan]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('171', 'proposals', 'proposal-send-to-customer', 'catalan', 'Send Proposal to Customer [catalan]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('172', 'proposals', 'proposal-client-declined', 'catalan', 'Customer Action - Declined (Sent to Staff) [catalan]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('173', 'proposals', 'proposal-client-thank-you', 'catalan', 'Thank You Email (Sent to Customer After Accept) [catalan]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('174', 'proposals', 'proposal-comment-to-client', 'catalan', 'New Comment  (Sent to Customer/Lead) [catalan]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('175', 'proposals', 'proposal-comment-to-admin', 'catalan', 'New Comment (Sent to Staff)  [catalan]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('176', 'estimate', 'estimate-thank-you-to-customer', 'catalan', 'Thank You Email (Sent to Customer After Accept) [catalan]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('177', 'tasks', 'task-deadline-notification', 'catalan', 'Task Deadline Reminder - Sent to Assigned Members [catalan]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('178', 'contract', 'send-contract', 'catalan', 'Send Contract to Customer [catalan]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('179', 'invoice', 'invoice-payment-recorded-to-staff', 'catalan', 'Invoice Payment Recorded (Sent to Staff) [catalan]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('180', 'ticket', 'auto-close-ticket', 'catalan', 'Auto Close Ticket [catalan]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('181', 'project', 'new-project-discussion-created-to-staff', 'catalan', 'New Project Discussion (Sent to Project Members) [catalan]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('182', 'project', 'new-project-discussion-created-to-customer', 'catalan', 'New Project Discussion (Sent to Customer Contacts) [catalan]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('183', 'project', 'new-project-file-uploaded-to-customer', 'catalan', 'New Project File(s) Uploaded (Sent to Customer Contacts) [catalan]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('184', 'project', 'new-project-file-uploaded-to-staff', 'catalan', 'New Project File(s) Uploaded (Sent to Project Members) [catalan]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('185', 'project', 'new-project-discussion-comment-to-customer', 'catalan', 'New Discussion Comment  (Sent to Customer Contacts) [catalan]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('186', 'project', 'new-project-discussion-comment-to-staff', 'catalan', 'New Discussion Comment (Sent to Project Members) [catalan]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('187', 'project', 'staff-added-as-project-member', 'catalan', 'Staff Added as Project Member [catalan]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('188', 'estimate', 'estimate-expiry-reminder', 'catalan', 'Estimate Expiration Reminder [catalan]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('189', 'proposals', 'proposal-expiry-reminder', 'catalan', 'Proposal Expiration Reminder [catalan]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('190', 'staff', 'new-staff-created', 'catalan', 'New Staff Created (Welcome Email) [catalan]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('191', 'client', 'contact-forgot-password', 'catalan', 'Forgot Password [catalan]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('192', 'client', 'contact-password-reseted', 'catalan', 'Password Reset - Confirmation [catalan]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('193', 'client', 'contact-set-password', 'catalan', 'Set New Password [catalan]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('194', 'staff', 'staff-forgot-password', 'catalan', 'Forgot Password [catalan]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('195', 'staff', 'staff-password-reseted', 'catalan', 'Password Reset - Confirmation [catalan]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('196', 'project', 'assigned-to-project', 'catalan', 'New Project Created (Sent to Customer Contacts) [catalan]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('197', 'tasks', 'task-added-attachment-to-contacts', 'catalan', 'New Attachment(s) on Task (Sent to Customer Contacts) [catalan]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('198', 'tasks', 'task-commented-to-contacts', 'catalan', 'New Comment on Task (Sent to Customer Contacts) [catalan]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('199', 'leads', 'new-lead-assigned', 'catalan', 'New Lead Assigned to Staff Member [catalan]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('200', 'client', 'client-statement', 'catalan', 'Statement - Account Summary [catalan]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('201', 'ticket', 'ticket-assigned-to-admin', 'catalan', 'New Ticket Assigned (Sent to Staff) [catalan]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('202', 'client', 'new-client-registered-to-admin', 'catalan', 'New Customer Registration (Sent to admins) [catalan]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('203', 'leads', 'new-web-to-lead-form-submitted', 'catalan', 'Web to lead form submitted - Sent to lead [catalan]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('204', 'staff', 'two-factor-authentication', 'catalan', 'Two Factor Authentication [catalan]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('205', 'project', 'project-finished-to-customer', 'catalan', 'Project Marked as Finished (Sent to Customer Contacts) [catalan]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('206', 'credit_note', 'credit-note-send-to-client', 'catalan', 'Send Credit Note To Email [catalan]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('207', 'tasks', 'task-status-change-to-staff', 'catalan', 'Task Status Changed (Sent to Staff) [catalan]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('208', 'tasks', 'task-status-change-to-contacts', 'catalan', 'Task Status Changed (Sent to Customer Contacts) [catalan]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('209', 'staff', 'reminder-email-staff', 'catalan', 'Staff Reminder Email [catalan]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('210', 'contract', 'contract-comment-to-client', 'catalan', 'New Comment  (Sent to Customer Contacts) [catalan]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('211', 'contract', 'contract-comment-to-admin', 'catalan', 'New Comment (Sent to Staff)  [catalan]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('212', 'subscriptions', 'send-subscription', 'catalan', 'Send Subscription to Customer [catalan]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('213', 'subscriptions', 'subscription-payment-failed', 'catalan', 'Subscription Payment Failed [catalan]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('214', 'subscriptions', 'subscription-canceled', 'catalan', 'Subscription Canceled (Sent to customer primary contact) [catalan]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('215', 'subscriptions', 'subscription-payment-succeeded', 'catalan', 'Subscription Payment Succeeded (Sent to customer primary contact) [catalan]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('216', 'contract', 'contract-expiration-to-staff', 'catalan', 'Contract Expiration Reminder (Sent to Staff) [catalan]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('217', 'gdpr', 'gdpr-removal-request', 'catalan', 'Removal Request From Contact (Sent to administrators) [catalan]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('218', 'gdpr', 'gdpr-removal-request-lead', 'catalan', 'Removal Request From Lead (Sent to administrators) [catalan]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('219', 'client', 'client-registration-confirmed', 'catalan', 'Customer Registration Confirmed [catalan]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('220', 'contract', 'contract-signed-to-staff', 'catalan', 'Contract Signed (Sent to Staff) [catalan]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('221', 'subscriptions', 'customer-subscribed-to-staff', 'catalan', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [catalan]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('222', 'client', 'contact-verification-email', 'catalan', 'Email Verification (Sent to Contact After Registration) [catalan]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('223', 'client', 'new-customer-profile-file-uploaded-to-staff', 'catalan', 'New Customer Profile File(s) Uploaded (Sent to Staff) [catalan]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('224', 'staff', 'event-notification-to-staff', 'catalan', 'Event Notification (Calendar) [catalan]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('225', 'subscriptions', 'subscription-payment-requires-action', 'catalan', 'Credit Card Authorization Required - SCA [catalan]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('226', 'client', 'new-client-created', 'chinese', 'New Contact Added/Registered (Welcome Email) [chinese]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('227', 'invoice', 'invoice-send-to-client', 'chinese', 'Send Invoice to Customer [chinese]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('228', 'ticket', 'new-ticket-opened-admin', 'chinese', 'New Ticket Opened (Opened by Staff, Sent to Customer) [chinese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('229', 'ticket', 'ticket-reply', 'chinese', 'Ticket Reply (Sent to Customer) [chinese]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('230', 'ticket', 'ticket-autoresponse', 'chinese', 'New Ticket Opened - Autoresponse [chinese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('231', 'invoice', 'invoice-payment-recorded', 'chinese', 'Invoice Payment Recorded (Sent to Customer) [chinese]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('232', 'invoice', 'invoice-overdue-notice', 'chinese', 'Invoice Overdue Notice [chinese]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('233', 'invoice', 'invoice-already-send', 'chinese', 'Invoice Already Sent to Customer [chinese]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('234', 'ticket', 'new-ticket-created-staff', 'chinese', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [chinese]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('235', 'estimate', 'estimate-send-to-client', 'chinese', 'Send Estimate to Customer [chinese]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('236', 'ticket', 'ticket-reply-to-admin', 'chinese', 'Ticket Reply (Sent to Staff) [chinese]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('237', 'estimate', 'estimate-already-send', 'chinese', 'Estimate Already Sent to Customer [chinese]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('238', 'contract', 'contract-expiration', 'chinese', 'Contract Expiration Reminder (Sent to Customer Contacts) [chinese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('239', 'tasks', 'task-assigned', 'chinese', 'New Task Assigned (Sent to Staff) [chinese]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('240', 'tasks', 'task-added-as-follower', 'chinese', 'Staff Member Added as Follower on Task (Sent to Staff) [chinese]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('241', 'tasks', 'task-commented', 'chinese', 'New Comment on Task (Sent to Staff) [chinese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('242', 'tasks', 'task-added-attachment', 'chinese', 'New Attachment(s) on Task (Sent to Staff) [chinese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('243', 'estimate', 'estimate-declined-to-staff', 'chinese', 'Estimate Declined (Sent to Staff) [chinese]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('244', 'estimate', 'estimate-accepted-to-staff', 'chinese', 'Estimate Accepted (Sent to Staff) [chinese]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('245', 'proposals', 'proposal-client-accepted', 'chinese', 'Customer Action - Accepted (Sent to Staff) [chinese]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('246', 'proposals', 'proposal-send-to-customer', 'chinese', 'Send Proposal to Customer [chinese]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('247', 'proposals', 'proposal-client-declined', 'chinese', 'Customer Action - Declined (Sent to Staff) [chinese]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('248', 'proposals', 'proposal-client-thank-you', 'chinese', 'Thank You Email (Sent to Customer After Accept) [chinese]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('249', 'proposals', 'proposal-comment-to-client', 'chinese', 'New Comment  (Sent to Customer/Lead) [chinese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('250', 'proposals', 'proposal-comment-to-admin', 'chinese', 'New Comment (Sent to Staff)  [chinese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('251', 'estimate', 'estimate-thank-you-to-customer', 'chinese', 'Thank You Email (Sent to Customer After Accept) [chinese]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('252', 'tasks', 'task-deadline-notification', 'chinese', 'Task Deadline Reminder - Sent to Assigned Members [chinese]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('253', 'contract', 'send-contract', 'chinese', 'Send Contract to Customer [chinese]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('254', 'invoice', 'invoice-payment-recorded-to-staff', 'chinese', 'Invoice Payment Recorded (Sent to Staff) [chinese]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('255', 'ticket', 'auto-close-ticket', 'chinese', 'Auto Close Ticket [chinese]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('256', 'project', 'new-project-discussion-created-to-staff', 'chinese', 'New Project Discussion (Sent to Project Members) [chinese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('257', 'project', 'new-project-discussion-created-to-customer', 'chinese', 'New Project Discussion (Sent to Customer Contacts) [chinese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('258', 'project', 'new-project-file-uploaded-to-customer', 'chinese', 'New Project File(s) Uploaded (Sent to Customer Contacts) [chinese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('259', 'project', 'new-project-file-uploaded-to-staff', 'chinese', 'New Project File(s) Uploaded (Sent to Project Members) [chinese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('260', 'project', 'new-project-discussion-comment-to-customer', 'chinese', 'New Discussion Comment  (Sent to Customer Contacts) [chinese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('261', 'project', 'new-project-discussion-comment-to-staff', 'chinese', 'New Discussion Comment (Sent to Project Members) [chinese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('262', 'project', 'staff-added-as-project-member', 'chinese', 'Staff Added as Project Member [chinese]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('263', 'estimate', 'estimate-expiry-reminder', 'chinese', 'Estimate Expiration Reminder [chinese]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('264', 'proposals', 'proposal-expiry-reminder', 'chinese', 'Proposal Expiration Reminder [chinese]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('265', 'staff', 'new-staff-created', 'chinese', 'New Staff Created (Welcome Email) [chinese]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('266', 'client', 'contact-forgot-password', 'chinese', 'Forgot Password [chinese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('267', 'client', 'contact-password-reseted', 'chinese', 'Password Reset - Confirmation [chinese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('268', 'client', 'contact-set-password', 'chinese', 'Set New Password [chinese]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('269', 'staff', 'staff-forgot-password', 'chinese', 'Forgot Password [chinese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('270', 'staff', 'staff-password-reseted', 'chinese', 'Password Reset - Confirmation [chinese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('271', 'project', 'assigned-to-project', 'chinese', 'New Project Created (Sent to Customer Contacts) [chinese]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('272', 'tasks', 'task-added-attachment-to-contacts', 'chinese', 'New Attachment(s) on Task (Sent to Customer Contacts) [chinese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('273', 'tasks', 'task-commented-to-contacts', 'chinese', 'New Comment on Task (Sent to Customer Contacts) [chinese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('274', 'leads', 'new-lead-assigned', 'chinese', 'New Lead Assigned to Staff Member [chinese]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('275', 'client', 'client-statement', 'chinese', 'Statement - Account Summary [chinese]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('276', 'ticket', 'ticket-assigned-to-admin', 'chinese', 'New Ticket Assigned (Sent to Staff) [chinese]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('277', 'client', 'new-client-registered-to-admin', 'chinese', 'New Customer Registration (Sent to admins) [chinese]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('278', 'leads', 'new-web-to-lead-form-submitted', 'chinese', 'Web to lead form submitted - Sent to lead [chinese]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('279', 'staff', 'two-factor-authentication', 'chinese', 'Two Factor Authentication [chinese]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('280', 'project', 'project-finished-to-customer', 'chinese', 'Project Marked as Finished (Sent to Customer Contacts) [chinese]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('281', 'credit_note', 'credit-note-send-to-client', 'chinese', 'Send Credit Note To Email [chinese]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('282', 'tasks', 'task-status-change-to-staff', 'chinese', 'Task Status Changed (Sent to Staff) [chinese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('283', 'tasks', 'task-status-change-to-contacts', 'chinese', 'Task Status Changed (Sent to Customer Contacts) [chinese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('284', 'staff', 'reminder-email-staff', 'chinese', 'Staff Reminder Email [chinese]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('285', 'contract', 'contract-comment-to-client', 'chinese', 'New Comment  (Sent to Customer Contacts) [chinese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('286', 'contract', 'contract-comment-to-admin', 'chinese', 'New Comment (Sent to Staff)  [chinese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('287', 'subscriptions', 'send-subscription', 'chinese', 'Send Subscription to Customer [chinese]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('288', 'subscriptions', 'subscription-payment-failed', 'chinese', 'Subscription Payment Failed [chinese]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('289', 'subscriptions', 'subscription-canceled', 'chinese', 'Subscription Canceled (Sent to customer primary contact) [chinese]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('290', 'subscriptions', 'subscription-payment-succeeded', 'chinese', 'Subscription Payment Succeeded (Sent to customer primary contact) [chinese]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('291', 'contract', 'contract-expiration-to-staff', 'chinese', 'Contract Expiration Reminder (Sent to Staff) [chinese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('292', 'gdpr', 'gdpr-removal-request', 'chinese', 'Removal Request From Contact (Sent to administrators) [chinese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('293', 'gdpr', 'gdpr-removal-request-lead', 'chinese', 'Removal Request From Lead (Sent to administrators) [chinese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('294', 'client', 'client-registration-confirmed', 'chinese', 'Customer Registration Confirmed [chinese]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('295', 'contract', 'contract-signed-to-staff', 'chinese', 'Contract Signed (Sent to Staff) [chinese]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('296', 'subscriptions', 'customer-subscribed-to-staff', 'chinese', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [chinese]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('297', 'client', 'contact-verification-email', 'chinese', 'Email Verification (Sent to Contact After Registration) [chinese]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('298', 'client', 'new-customer-profile-file-uploaded-to-staff', 'chinese', 'New Customer Profile File(s) Uploaded (Sent to Staff) [chinese]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('299', 'staff', 'event-notification-to-staff', 'chinese', 'Event Notification (Calendar) [chinese]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('300', 'subscriptions', 'subscription-payment-requires-action', 'chinese', 'Credit Card Authorization Required - SCA [chinese]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('301', 'client', 'new-client-created', 'czech', 'New Contact Added/Registered (Welcome Email) [czech]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('302', 'invoice', 'invoice-send-to-client', 'czech', 'Send Invoice to Customer [czech]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('303', 'ticket', 'new-ticket-opened-admin', 'czech', 'New Ticket Opened (Opened by Staff, Sent to Customer) [czech]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('304', 'ticket', 'ticket-reply', 'czech', 'Ticket Reply (Sent to Customer) [czech]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('305', 'ticket', 'ticket-autoresponse', 'czech', 'New Ticket Opened - Autoresponse [czech]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('306', 'invoice', 'invoice-payment-recorded', 'czech', 'Invoice Payment Recorded (Sent to Customer) [czech]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('307', 'invoice', 'invoice-overdue-notice', 'czech', 'Invoice Overdue Notice [czech]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('308', 'invoice', 'invoice-already-send', 'czech', 'Invoice Already Sent to Customer [czech]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('309', 'ticket', 'new-ticket-created-staff', 'czech', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [czech]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('310', 'estimate', 'estimate-send-to-client', 'czech', 'Send Estimate to Customer [czech]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('311', 'ticket', 'ticket-reply-to-admin', 'czech', 'Ticket Reply (Sent to Staff) [czech]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('312', 'estimate', 'estimate-already-send', 'czech', 'Estimate Already Sent to Customer [czech]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('313', 'contract', 'contract-expiration', 'czech', 'Contract Expiration Reminder (Sent to Customer Contacts) [czech]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('314', 'tasks', 'task-assigned', 'czech', 'New Task Assigned (Sent to Staff) [czech]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('315', 'tasks', 'task-added-as-follower', 'czech', 'Staff Member Added as Follower on Task (Sent to Staff) [czech]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('316', 'tasks', 'task-commented', 'czech', 'New Comment on Task (Sent to Staff) [czech]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('317', 'tasks', 'task-added-attachment', 'czech', 'New Attachment(s) on Task (Sent to Staff) [czech]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('318', 'estimate', 'estimate-declined-to-staff', 'czech', 'Estimate Declined (Sent to Staff) [czech]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('319', 'estimate', 'estimate-accepted-to-staff', 'czech', 'Estimate Accepted (Sent to Staff) [czech]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('320', 'proposals', 'proposal-client-accepted', 'czech', 'Customer Action - Accepted (Sent to Staff) [czech]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('321', 'proposals', 'proposal-send-to-customer', 'czech', 'Send Proposal to Customer [czech]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('322', 'proposals', 'proposal-client-declined', 'czech', 'Customer Action - Declined (Sent to Staff) [czech]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('323', 'proposals', 'proposal-client-thank-you', 'czech', 'Thank You Email (Sent to Customer After Accept) [czech]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('324', 'proposals', 'proposal-comment-to-client', 'czech', 'New Comment  (Sent to Customer/Lead) [czech]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('325', 'proposals', 'proposal-comment-to-admin', 'czech', 'New Comment (Sent to Staff)  [czech]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('326', 'estimate', 'estimate-thank-you-to-customer', 'czech', 'Thank You Email (Sent to Customer After Accept) [czech]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('327', 'tasks', 'task-deadline-notification', 'czech', 'Task Deadline Reminder - Sent to Assigned Members [czech]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('328', 'contract', 'send-contract', 'czech', 'Send Contract to Customer [czech]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('329', 'invoice', 'invoice-payment-recorded-to-staff', 'czech', 'Invoice Payment Recorded (Sent to Staff) [czech]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('330', 'ticket', 'auto-close-ticket', 'czech', 'Auto Close Ticket [czech]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('331', 'project', 'new-project-discussion-created-to-staff', 'czech', 'New Project Discussion (Sent to Project Members) [czech]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('332', 'project', 'new-project-discussion-created-to-customer', 'czech', 'New Project Discussion (Sent to Customer Contacts) [czech]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('333', 'project', 'new-project-file-uploaded-to-customer', 'czech', 'New Project File(s) Uploaded (Sent to Customer Contacts) [czech]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('334', 'project', 'new-project-file-uploaded-to-staff', 'czech', 'New Project File(s) Uploaded (Sent to Project Members) [czech]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('335', 'project', 'new-project-discussion-comment-to-customer', 'czech', 'New Discussion Comment  (Sent to Customer Contacts) [czech]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('336', 'project', 'new-project-discussion-comment-to-staff', 'czech', 'New Discussion Comment (Sent to Project Members) [czech]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('337', 'project', 'staff-added-as-project-member', 'czech', 'Staff Added as Project Member [czech]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('338', 'estimate', 'estimate-expiry-reminder', 'czech', 'Estimate Expiration Reminder [czech]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('339', 'proposals', 'proposal-expiry-reminder', 'czech', 'Proposal Expiration Reminder [czech]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('340', 'staff', 'new-staff-created', 'czech', 'New Staff Created (Welcome Email) [czech]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('341', 'client', 'contact-forgot-password', 'czech', 'Forgot Password [czech]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('342', 'client', 'contact-password-reseted', 'czech', 'Password Reset - Confirmation [czech]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('343', 'client', 'contact-set-password', 'czech', 'Set New Password [czech]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('344', 'staff', 'staff-forgot-password', 'czech', 'Forgot Password [czech]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('345', 'staff', 'staff-password-reseted', 'czech', 'Password Reset - Confirmation [czech]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('346', 'project', 'assigned-to-project', 'czech', 'New Project Created (Sent to Customer Contacts) [czech]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('347', 'tasks', 'task-added-attachment-to-contacts', 'czech', 'New Attachment(s) on Task (Sent to Customer Contacts) [czech]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('348', 'tasks', 'task-commented-to-contacts', 'czech', 'New Comment on Task (Sent to Customer Contacts) [czech]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('349', 'leads', 'new-lead-assigned', 'czech', 'New Lead Assigned to Staff Member [czech]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('350', 'client', 'client-statement', 'czech', 'Statement - Account Summary [czech]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('351', 'ticket', 'ticket-assigned-to-admin', 'czech', 'New Ticket Assigned (Sent to Staff) [czech]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('352', 'client', 'new-client-registered-to-admin', 'czech', 'New Customer Registration (Sent to admins) [czech]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('353', 'leads', 'new-web-to-lead-form-submitted', 'czech', 'Web to lead form submitted - Sent to lead [czech]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('354', 'staff', 'two-factor-authentication', 'czech', 'Two Factor Authentication [czech]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('355', 'project', 'project-finished-to-customer', 'czech', 'Project Marked as Finished (Sent to Customer Contacts) [czech]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('356', 'credit_note', 'credit-note-send-to-client', 'czech', 'Send Credit Note To Email [czech]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('357', 'tasks', 'task-status-change-to-staff', 'czech', 'Task Status Changed (Sent to Staff) [czech]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('358', 'tasks', 'task-status-change-to-contacts', 'czech', 'Task Status Changed (Sent to Customer Contacts) [czech]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('359', 'staff', 'reminder-email-staff', 'czech', 'Staff Reminder Email [czech]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('360', 'contract', 'contract-comment-to-client', 'czech', 'New Comment  (Sent to Customer Contacts) [czech]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('361', 'contract', 'contract-comment-to-admin', 'czech', 'New Comment (Sent to Staff)  [czech]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('362', 'subscriptions', 'send-subscription', 'czech', 'Send Subscription to Customer [czech]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('363', 'subscriptions', 'subscription-payment-failed', 'czech', 'Subscription Payment Failed [czech]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('364', 'subscriptions', 'subscription-canceled', 'czech', 'Subscription Canceled (Sent to customer primary contact) [czech]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('365', 'subscriptions', 'subscription-payment-succeeded', 'czech', 'Subscription Payment Succeeded (Sent to customer primary contact) [czech]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('366', 'contract', 'contract-expiration-to-staff', 'czech', 'Contract Expiration Reminder (Sent to Staff) [czech]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('367', 'gdpr', 'gdpr-removal-request', 'czech', 'Removal Request From Contact (Sent to administrators) [czech]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('368', 'gdpr', 'gdpr-removal-request-lead', 'czech', 'Removal Request From Lead (Sent to administrators) [czech]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('369', 'client', 'client-registration-confirmed', 'czech', 'Customer Registration Confirmed [czech]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('370', 'contract', 'contract-signed-to-staff', 'czech', 'Contract Signed (Sent to Staff) [czech]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('371', 'subscriptions', 'customer-subscribed-to-staff', 'czech', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [czech]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('372', 'client', 'contact-verification-email', 'czech', 'Email Verification (Sent to Contact After Registration) [czech]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('373', 'client', 'new-customer-profile-file-uploaded-to-staff', 'czech', 'New Customer Profile File(s) Uploaded (Sent to Staff) [czech]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('374', 'staff', 'event-notification-to-staff', 'czech', 'Event Notification (Calendar) [czech]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('375', 'subscriptions', 'subscription-payment-requires-action', 'czech', 'Credit Card Authorization Required - SCA [czech]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('376', 'client', 'new-client-created', 'dutch', 'New Contact Added/Registered (Welcome Email) [dutch]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('377', 'invoice', 'invoice-send-to-client', 'dutch', 'Send Invoice to Customer [dutch]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('378', 'ticket', 'new-ticket-opened-admin', 'dutch', 'New Ticket Opened (Opened by Staff, Sent to Customer) [dutch]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('379', 'ticket', 'ticket-reply', 'dutch', 'Ticket Reply (Sent to Customer) [dutch]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('380', 'ticket', 'ticket-autoresponse', 'dutch', 'New Ticket Opened - Autoresponse [dutch]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('381', 'invoice', 'invoice-payment-recorded', 'dutch', 'Invoice Payment Recorded (Sent to Customer) [dutch]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('382', 'invoice', 'invoice-overdue-notice', 'dutch', 'Invoice Overdue Notice [dutch]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('383', 'invoice', 'invoice-already-send', 'dutch', 'Invoice Already Sent to Customer [dutch]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('384', 'ticket', 'new-ticket-created-staff', 'dutch', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [dutch]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('385', 'estimate', 'estimate-send-to-client', 'dutch', 'Send Estimate to Customer [dutch]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('386', 'ticket', 'ticket-reply-to-admin', 'dutch', 'Ticket Reply (Sent to Staff) [dutch]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('387', 'estimate', 'estimate-already-send', 'dutch', 'Estimate Already Sent to Customer [dutch]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('388', 'contract', 'contract-expiration', 'dutch', 'Contract Expiration Reminder (Sent to Customer Contacts) [dutch]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('389', 'tasks', 'task-assigned', 'dutch', 'New Task Assigned (Sent to Staff) [dutch]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('390', 'tasks', 'task-added-as-follower', 'dutch', 'Staff Member Added as Follower on Task (Sent to Staff) [dutch]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('391', 'tasks', 'task-commented', 'dutch', 'New Comment on Task (Sent to Staff) [dutch]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('392', 'tasks', 'task-added-attachment', 'dutch', 'New Attachment(s) on Task (Sent to Staff) [dutch]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('393', 'estimate', 'estimate-declined-to-staff', 'dutch', 'Estimate Declined (Sent to Staff) [dutch]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('394', 'estimate', 'estimate-accepted-to-staff', 'dutch', 'Estimate Accepted (Sent to Staff) [dutch]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('395', 'proposals', 'proposal-client-accepted', 'dutch', 'Customer Action - Accepted (Sent to Staff) [dutch]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('396', 'proposals', 'proposal-send-to-customer', 'dutch', 'Send Proposal to Customer [dutch]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('397', 'proposals', 'proposal-client-declined', 'dutch', 'Customer Action - Declined (Sent to Staff) [dutch]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('398', 'proposals', 'proposal-client-thank-you', 'dutch', 'Thank You Email (Sent to Customer After Accept) [dutch]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('399', 'proposals', 'proposal-comment-to-client', 'dutch', 'New Comment  (Sent to Customer/Lead) [dutch]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('400', 'proposals', 'proposal-comment-to-admin', 'dutch', 'New Comment (Sent to Staff)  [dutch]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('401', 'estimate', 'estimate-thank-you-to-customer', 'dutch', 'Thank You Email (Sent to Customer After Accept) [dutch]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('402', 'tasks', 'task-deadline-notification', 'dutch', 'Task Deadline Reminder - Sent to Assigned Members [dutch]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('403', 'contract', 'send-contract', 'dutch', 'Send Contract to Customer [dutch]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('404', 'invoice', 'invoice-payment-recorded-to-staff', 'dutch', 'Invoice Payment Recorded (Sent to Staff) [dutch]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('405', 'ticket', 'auto-close-ticket', 'dutch', 'Auto Close Ticket [dutch]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('406', 'project', 'new-project-discussion-created-to-staff', 'dutch', 'New Project Discussion (Sent to Project Members) [dutch]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('407', 'project', 'new-project-discussion-created-to-customer', 'dutch', 'New Project Discussion (Sent to Customer Contacts) [dutch]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('408', 'project', 'new-project-file-uploaded-to-customer', 'dutch', 'New Project File(s) Uploaded (Sent to Customer Contacts) [dutch]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('409', 'project', 'new-project-file-uploaded-to-staff', 'dutch', 'New Project File(s) Uploaded (Sent to Project Members) [dutch]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('410', 'project', 'new-project-discussion-comment-to-customer', 'dutch', 'New Discussion Comment  (Sent to Customer Contacts) [dutch]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('411', 'project', 'new-project-discussion-comment-to-staff', 'dutch', 'New Discussion Comment (Sent to Project Members) [dutch]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('412', 'project', 'staff-added-as-project-member', 'dutch', 'Staff Added as Project Member [dutch]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('413', 'estimate', 'estimate-expiry-reminder', 'dutch', 'Estimate Expiration Reminder [dutch]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('414', 'proposals', 'proposal-expiry-reminder', 'dutch', 'Proposal Expiration Reminder [dutch]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('415', 'staff', 'new-staff-created', 'dutch', 'New Staff Created (Welcome Email) [dutch]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('416', 'client', 'contact-forgot-password', 'dutch', 'Forgot Password [dutch]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('417', 'client', 'contact-password-reseted', 'dutch', 'Password Reset - Confirmation [dutch]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('418', 'client', 'contact-set-password', 'dutch', 'Set New Password [dutch]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('419', 'staff', 'staff-forgot-password', 'dutch', 'Forgot Password [dutch]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('420', 'staff', 'staff-password-reseted', 'dutch', 'Password Reset - Confirmation [dutch]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('421', 'project', 'assigned-to-project', 'dutch', 'New Project Created (Sent to Customer Contacts) [dutch]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('422', 'tasks', 'task-added-attachment-to-contacts', 'dutch', 'New Attachment(s) on Task (Sent to Customer Contacts) [dutch]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('423', 'tasks', 'task-commented-to-contacts', 'dutch', 'New Comment on Task (Sent to Customer Contacts) [dutch]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('424', 'leads', 'new-lead-assigned', 'dutch', 'New Lead Assigned to Staff Member [dutch]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('425', 'client', 'client-statement', 'dutch', 'Statement - Account Summary [dutch]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('426', 'ticket', 'ticket-assigned-to-admin', 'dutch', 'New Ticket Assigned (Sent to Staff) [dutch]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('427', 'client', 'new-client-registered-to-admin', 'dutch', 'New Customer Registration (Sent to admins) [dutch]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('428', 'leads', 'new-web-to-lead-form-submitted', 'dutch', 'Web to lead form submitted - Sent to lead [dutch]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('429', 'staff', 'two-factor-authentication', 'dutch', 'Two Factor Authentication [dutch]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('430', 'project', 'project-finished-to-customer', 'dutch', 'Project Marked as Finished (Sent to Customer Contacts) [dutch]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('431', 'credit_note', 'credit-note-send-to-client', 'dutch', 'Send Credit Note To Email [dutch]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('432', 'tasks', 'task-status-change-to-staff', 'dutch', 'Task Status Changed (Sent to Staff) [dutch]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('433', 'tasks', 'task-status-change-to-contacts', 'dutch', 'Task Status Changed (Sent to Customer Contacts) [dutch]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('434', 'staff', 'reminder-email-staff', 'dutch', 'Staff Reminder Email [dutch]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('435', 'contract', 'contract-comment-to-client', 'dutch', 'New Comment  (Sent to Customer Contacts) [dutch]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('436', 'contract', 'contract-comment-to-admin', 'dutch', 'New Comment (Sent to Staff)  [dutch]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('437', 'subscriptions', 'send-subscription', 'dutch', 'Send Subscription to Customer [dutch]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('438', 'subscriptions', 'subscription-payment-failed', 'dutch', 'Subscription Payment Failed [dutch]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('439', 'subscriptions', 'subscription-canceled', 'dutch', 'Subscription Canceled (Sent to customer primary contact) [dutch]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('440', 'subscriptions', 'subscription-payment-succeeded', 'dutch', 'Subscription Payment Succeeded (Sent to customer primary contact) [dutch]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('441', 'contract', 'contract-expiration-to-staff', 'dutch', 'Contract Expiration Reminder (Sent to Staff) [dutch]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('442', 'gdpr', 'gdpr-removal-request', 'dutch', 'Removal Request From Contact (Sent to administrators) [dutch]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('443', 'gdpr', 'gdpr-removal-request-lead', 'dutch', 'Removal Request From Lead (Sent to administrators) [dutch]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('444', 'client', 'client-registration-confirmed', 'dutch', 'Customer Registration Confirmed [dutch]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('445', 'contract', 'contract-signed-to-staff', 'dutch', 'Contract Signed (Sent to Staff) [dutch]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('446', 'subscriptions', 'customer-subscribed-to-staff', 'dutch', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [dutch]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('447', 'client', 'contact-verification-email', 'dutch', 'Email Verification (Sent to Contact After Registration) [dutch]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('448', 'client', 'new-customer-profile-file-uploaded-to-staff', 'dutch', 'New Customer Profile File(s) Uploaded (Sent to Staff) [dutch]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('449', 'staff', 'event-notification-to-staff', 'dutch', 'Event Notification (Calendar) [dutch]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('450', 'subscriptions', 'subscription-payment-requires-action', 'dutch', 'Credit Card Authorization Required - SCA [dutch]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('451', 'client', 'new-client-created', 'french', 'New Contact Added/Registered (Welcome Email) [french]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('452', 'invoice', 'invoice-send-to-client', 'french', 'Send Invoice to Customer [french]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('453', 'ticket', 'new-ticket-opened-admin', 'french', 'New Ticket Opened (Opened by Staff, Sent to Customer) [french]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('454', 'ticket', 'ticket-reply', 'french', 'Ticket Reply (Sent to Customer) [french]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('455', 'ticket', 'ticket-autoresponse', 'french', 'New Ticket Opened - Autoresponse [french]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('456', 'invoice', 'invoice-payment-recorded', 'french', 'Invoice Payment Recorded (Sent to Customer) [french]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('457', 'invoice', 'invoice-overdue-notice', 'french', 'Invoice Overdue Notice [french]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('458', 'invoice', 'invoice-already-send', 'french', 'Invoice Already Sent to Customer [french]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('459', 'ticket', 'new-ticket-created-staff', 'french', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [french]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('460', 'estimate', 'estimate-send-to-client', 'french', 'Send Estimate to Customer [french]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('461', 'ticket', 'ticket-reply-to-admin', 'french', 'Ticket Reply (Sent to Staff) [french]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('462', 'estimate', 'estimate-already-send', 'french', 'Estimate Already Sent to Customer [french]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('463', 'contract', 'contract-expiration', 'french', 'Contract Expiration Reminder (Sent to Customer Contacts) [french]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('464', 'tasks', 'task-assigned', 'french', 'New Task Assigned (Sent to Staff) [french]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('465', 'tasks', 'task-added-as-follower', 'french', 'Staff Member Added as Follower on Task (Sent to Staff) [french]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('466', 'tasks', 'task-commented', 'french', 'New Comment on Task (Sent to Staff) [french]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('467', 'tasks', 'task-added-attachment', 'french', 'New Attachment(s) on Task (Sent to Staff) [french]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('468', 'estimate', 'estimate-declined-to-staff', 'french', 'Estimate Declined (Sent to Staff) [french]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('469', 'estimate', 'estimate-accepted-to-staff', 'french', 'Estimate Accepted (Sent to Staff) [french]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('470', 'proposals', 'proposal-client-accepted', 'french', 'Customer Action - Accepted (Sent to Staff) [french]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('471', 'proposals', 'proposal-send-to-customer', 'french', 'Send Proposal to Customer [french]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('472', 'proposals', 'proposal-client-declined', 'french', 'Customer Action - Declined (Sent to Staff) [french]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('473', 'proposals', 'proposal-client-thank-you', 'french', 'Thank You Email (Sent to Customer After Accept) [french]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('474', 'proposals', 'proposal-comment-to-client', 'french', 'New Comment  (Sent to Customer/Lead) [french]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('475', 'proposals', 'proposal-comment-to-admin', 'french', 'New Comment (Sent to Staff)  [french]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('476', 'estimate', 'estimate-thank-you-to-customer', 'french', 'Thank You Email (Sent to Customer After Accept) [french]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('477', 'tasks', 'task-deadline-notification', 'french', 'Task Deadline Reminder - Sent to Assigned Members [french]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('478', 'contract', 'send-contract', 'french', 'Send Contract to Customer [french]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('479', 'invoice', 'invoice-payment-recorded-to-staff', 'french', 'Invoice Payment Recorded (Sent to Staff) [french]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('480', 'ticket', 'auto-close-ticket', 'french', 'Auto Close Ticket [french]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('481', 'project', 'new-project-discussion-created-to-staff', 'french', 'New Project Discussion (Sent to Project Members) [french]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('482', 'project', 'new-project-discussion-created-to-customer', 'french', 'New Project Discussion (Sent to Customer Contacts) [french]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('483', 'project', 'new-project-file-uploaded-to-customer', 'french', 'New Project File(s) Uploaded (Sent to Customer Contacts) [french]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('484', 'project', 'new-project-file-uploaded-to-staff', 'french', 'New Project File(s) Uploaded (Sent to Project Members) [french]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('485', 'project', 'new-project-discussion-comment-to-customer', 'french', 'New Discussion Comment  (Sent to Customer Contacts) [french]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('486', 'project', 'new-project-discussion-comment-to-staff', 'french', 'New Discussion Comment (Sent to Project Members) [french]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('487', 'project', 'staff-added-as-project-member', 'french', 'Staff Added as Project Member [french]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('488', 'estimate', 'estimate-expiry-reminder', 'french', 'Estimate Expiration Reminder [french]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('489', 'proposals', 'proposal-expiry-reminder', 'french', 'Proposal Expiration Reminder [french]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('490', 'staff', 'new-staff-created', 'french', 'New Staff Created (Welcome Email) [french]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('491', 'client', 'contact-forgot-password', 'french', 'Forgot Password [french]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('492', 'client', 'contact-password-reseted', 'french', 'Password Reset - Confirmation [french]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('493', 'client', 'contact-set-password', 'french', 'Set New Password [french]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('494', 'staff', 'staff-forgot-password', 'french', 'Forgot Password [french]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('495', 'staff', 'staff-password-reseted', 'french', 'Password Reset - Confirmation [french]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('496', 'project', 'assigned-to-project', 'french', 'New Project Created (Sent to Customer Contacts) [french]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('497', 'tasks', 'task-added-attachment-to-contacts', 'french', 'New Attachment(s) on Task (Sent to Customer Contacts) [french]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('498', 'tasks', 'task-commented-to-contacts', 'french', 'New Comment on Task (Sent to Customer Contacts) [french]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('499', 'leads', 'new-lead-assigned', 'french', 'New Lead Assigned to Staff Member [french]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('500', 'client', 'client-statement', 'french', 'Statement - Account Summary [french]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('501', 'ticket', 'ticket-assigned-to-admin', 'french', 'New Ticket Assigned (Sent to Staff) [french]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('502', 'client', 'new-client-registered-to-admin', 'french', 'New Customer Registration (Sent to admins) [french]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('503', 'leads', 'new-web-to-lead-form-submitted', 'french', 'Web to lead form submitted - Sent to lead [french]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('504', 'staff', 'two-factor-authentication', 'french', 'Two Factor Authentication [french]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('505', 'project', 'project-finished-to-customer', 'french', 'Project Marked as Finished (Sent to Customer Contacts) [french]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('506', 'credit_note', 'credit-note-send-to-client', 'french', 'Send Credit Note To Email [french]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('507', 'tasks', 'task-status-change-to-staff', 'french', 'Task Status Changed (Sent to Staff) [french]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('508', 'tasks', 'task-status-change-to-contacts', 'french', 'Task Status Changed (Sent to Customer Contacts) [french]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('509', 'staff', 'reminder-email-staff', 'french', 'Staff Reminder Email [french]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('510', 'contract', 'contract-comment-to-client', 'french', 'New Comment  (Sent to Customer Contacts) [french]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('511', 'contract', 'contract-comment-to-admin', 'french', 'New Comment (Sent to Staff)  [french]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('512', 'subscriptions', 'send-subscription', 'french', 'Send Subscription to Customer [french]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('513', 'subscriptions', 'subscription-payment-failed', 'french', 'Subscription Payment Failed [french]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('514', 'subscriptions', 'subscription-canceled', 'french', 'Subscription Canceled (Sent to customer primary contact) [french]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('515', 'subscriptions', 'subscription-payment-succeeded', 'french', 'Subscription Payment Succeeded (Sent to customer primary contact) [french]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('516', 'contract', 'contract-expiration-to-staff', 'french', 'Contract Expiration Reminder (Sent to Staff) [french]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('517', 'gdpr', 'gdpr-removal-request', 'french', 'Removal Request From Contact (Sent to administrators) [french]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('518', 'gdpr', 'gdpr-removal-request-lead', 'french', 'Removal Request From Lead (Sent to administrators) [french]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('519', 'client', 'client-registration-confirmed', 'french', 'Customer Registration Confirmed [french]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('520', 'contract', 'contract-signed-to-staff', 'french', 'Contract Signed (Sent to Staff) [french]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('521', 'subscriptions', 'customer-subscribed-to-staff', 'french', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [french]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('522', 'client', 'contact-verification-email', 'french', 'Email Verification (Sent to Contact After Registration) [french]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('523', 'client', 'new-customer-profile-file-uploaded-to-staff', 'french', 'New Customer Profile File(s) Uploaded (Sent to Staff) [french]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('524', 'staff', 'event-notification-to-staff', 'french', 'Event Notification (Calendar) [french]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('525', 'subscriptions', 'subscription-payment-requires-action', 'french', 'Credit Card Authorization Required - SCA [french]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('526', 'client', 'new-client-created', 'german', 'New Contact Added/Registered (Welcome Email) [german]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('527', 'invoice', 'invoice-send-to-client', 'german', 'Send Invoice to Customer [german]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('528', 'ticket', 'new-ticket-opened-admin', 'german', 'New Ticket Opened (Opened by Staff, Sent to Customer) [german]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('529', 'ticket', 'ticket-reply', 'german', 'Ticket Reply (Sent to Customer) [german]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('530', 'ticket', 'ticket-autoresponse', 'german', 'New Ticket Opened - Autoresponse [german]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('531', 'invoice', 'invoice-payment-recorded', 'german', 'Invoice Payment Recorded (Sent to Customer) [german]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('532', 'invoice', 'invoice-overdue-notice', 'german', 'Invoice Overdue Notice [german]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('533', 'invoice', 'invoice-already-send', 'german', 'Invoice Already Sent to Customer [german]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('534', 'ticket', 'new-ticket-created-staff', 'german', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [german]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('535', 'estimate', 'estimate-send-to-client', 'german', 'Send Estimate to Customer [german]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('536', 'ticket', 'ticket-reply-to-admin', 'german', 'Ticket Reply (Sent to Staff) [german]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('537', 'estimate', 'estimate-already-send', 'german', 'Estimate Already Sent to Customer [german]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('538', 'contract', 'contract-expiration', 'german', 'Contract Expiration Reminder (Sent to Customer Contacts) [german]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('539', 'tasks', 'task-assigned', 'german', 'New Task Assigned (Sent to Staff) [german]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('540', 'tasks', 'task-added-as-follower', 'german', 'Staff Member Added as Follower on Task (Sent to Staff) [german]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('541', 'tasks', 'task-commented', 'german', 'New Comment on Task (Sent to Staff) [german]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('542', 'tasks', 'task-added-attachment', 'german', 'New Attachment(s) on Task (Sent to Staff) [german]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('543', 'estimate', 'estimate-declined-to-staff', 'german', 'Estimate Declined (Sent to Staff) [german]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('544', 'estimate', 'estimate-accepted-to-staff', 'german', 'Estimate Accepted (Sent to Staff) [german]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('545', 'proposals', 'proposal-client-accepted', 'german', 'Customer Action - Accepted (Sent to Staff) [german]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('546', 'proposals', 'proposal-send-to-customer', 'german', 'Send Proposal to Customer [german]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('547', 'proposals', 'proposal-client-declined', 'german', 'Customer Action - Declined (Sent to Staff) [german]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('548', 'proposals', 'proposal-client-thank-you', 'german', 'Thank You Email (Sent to Customer After Accept) [german]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('549', 'proposals', 'proposal-comment-to-client', 'german', 'New Comment  (Sent to Customer/Lead) [german]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('550', 'proposals', 'proposal-comment-to-admin', 'german', 'New Comment (Sent to Staff)  [german]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('551', 'estimate', 'estimate-thank-you-to-customer', 'german', 'Thank You Email (Sent to Customer After Accept) [german]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('552', 'tasks', 'task-deadline-notification', 'german', 'Task Deadline Reminder - Sent to Assigned Members [german]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('553', 'contract', 'send-contract', 'german', 'Send Contract to Customer [german]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('554', 'invoice', 'invoice-payment-recorded-to-staff', 'german', 'Invoice Payment Recorded (Sent to Staff) [german]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('555', 'ticket', 'auto-close-ticket', 'german', 'Auto Close Ticket [german]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('556', 'project', 'new-project-discussion-created-to-staff', 'german', 'New Project Discussion (Sent to Project Members) [german]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('557', 'project', 'new-project-discussion-created-to-customer', 'german', 'New Project Discussion (Sent to Customer Contacts) [german]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('558', 'project', 'new-project-file-uploaded-to-customer', 'german', 'New Project File(s) Uploaded (Sent to Customer Contacts) [german]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('559', 'project', 'new-project-file-uploaded-to-staff', 'german', 'New Project File(s) Uploaded (Sent to Project Members) [german]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('560', 'project', 'new-project-discussion-comment-to-customer', 'german', 'New Discussion Comment  (Sent to Customer Contacts) [german]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('561', 'project', 'new-project-discussion-comment-to-staff', 'german', 'New Discussion Comment (Sent to Project Members) [german]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('562', 'project', 'staff-added-as-project-member', 'german', 'Staff Added as Project Member [german]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('563', 'estimate', 'estimate-expiry-reminder', 'german', 'Estimate Expiration Reminder [german]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('564', 'proposals', 'proposal-expiry-reminder', 'german', 'Proposal Expiration Reminder [german]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('565', 'staff', 'new-staff-created', 'german', 'New Staff Created (Welcome Email) [german]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('566', 'client', 'contact-forgot-password', 'german', 'Forgot Password [german]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('567', 'client', 'contact-password-reseted', 'german', 'Password Reset - Confirmation [german]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('568', 'client', 'contact-set-password', 'german', 'Set New Password [german]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('569', 'staff', 'staff-forgot-password', 'german', 'Forgot Password [german]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('570', 'staff', 'staff-password-reseted', 'german', 'Password Reset - Confirmation [german]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('571', 'project', 'assigned-to-project', 'german', 'New Project Created (Sent to Customer Contacts) [german]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('572', 'tasks', 'task-added-attachment-to-contacts', 'german', 'New Attachment(s) on Task (Sent to Customer Contacts) [german]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('573', 'tasks', 'task-commented-to-contacts', 'german', 'New Comment on Task (Sent to Customer Contacts) [german]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('574', 'leads', 'new-lead-assigned', 'german', 'New Lead Assigned to Staff Member [german]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('575', 'client', 'client-statement', 'german', 'Statement - Account Summary [german]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('576', 'ticket', 'ticket-assigned-to-admin', 'german', 'New Ticket Assigned (Sent to Staff) [german]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('577', 'client', 'new-client-registered-to-admin', 'german', 'New Customer Registration (Sent to admins) [german]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('578', 'leads', 'new-web-to-lead-form-submitted', 'german', 'Web to lead form submitted - Sent to lead [german]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('579', 'staff', 'two-factor-authentication', 'german', 'Two Factor Authentication [german]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('580', 'project', 'project-finished-to-customer', 'german', 'Project Marked as Finished (Sent to Customer Contacts) [german]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('581', 'credit_note', 'credit-note-send-to-client', 'german', 'Send Credit Note To Email [german]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('582', 'tasks', 'task-status-change-to-staff', 'german', 'Task Status Changed (Sent to Staff) [german]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('583', 'tasks', 'task-status-change-to-contacts', 'german', 'Task Status Changed (Sent to Customer Contacts) [german]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('584', 'staff', 'reminder-email-staff', 'german', 'Staff Reminder Email [german]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('585', 'contract', 'contract-comment-to-client', 'german', 'New Comment  (Sent to Customer Contacts) [german]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('586', 'contract', 'contract-comment-to-admin', 'german', 'New Comment (Sent to Staff)  [german]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('587', 'subscriptions', 'send-subscription', 'german', 'Send Subscription to Customer [german]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('588', 'subscriptions', 'subscription-payment-failed', 'german', 'Subscription Payment Failed [german]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('589', 'subscriptions', 'subscription-canceled', 'german', 'Subscription Canceled (Sent to customer primary contact) [german]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('590', 'subscriptions', 'subscription-payment-succeeded', 'german', 'Subscription Payment Succeeded (Sent to customer primary contact) [german]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('591', 'contract', 'contract-expiration-to-staff', 'german', 'Contract Expiration Reminder (Sent to Staff) [german]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('592', 'gdpr', 'gdpr-removal-request', 'german', 'Removal Request From Contact (Sent to administrators) [german]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('593', 'gdpr', 'gdpr-removal-request-lead', 'german', 'Removal Request From Lead (Sent to administrators) [german]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('594', 'client', 'client-registration-confirmed', 'german', 'Customer Registration Confirmed [german]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('595', 'contract', 'contract-signed-to-staff', 'german', 'Contract Signed (Sent to Staff) [german]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('596', 'subscriptions', 'customer-subscribed-to-staff', 'german', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [german]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('597', 'client', 'contact-verification-email', 'german', 'Email Verification (Sent to Contact After Registration) [german]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('598', 'client', 'new-customer-profile-file-uploaded-to-staff', 'german', 'New Customer Profile File(s) Uploaded (Sent to Staff) [german]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('599', 'staff', 'event-notification-to-staff', 'german', 'Event Notification (Calendar) [german]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('600', 'subscriptions', 'subscription-payment-requires-action', 'german', 'Credit Card Authorization Required - SCA [german]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('601', 'client', 'new-client-created', 'greek', 'New Contact Added/Registered (Welcome Email) [greek]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('602', 'invoice', 'invoice-send-to-client', 'greek', 'Send Invoice to Customer [greek]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('603', 'ticket', 'new-ticket-opened-admin', 'greek', 'New Ticket Opened (Opened by Staff, Sent to Customer) [greek]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('604', 'ticket', 'ticket-reply', 'greek', 'Ticket Reply (Sent to Customer) [greek]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('605', 'ticket', 'ticket-autoresponse', 'greek', 'New Ticket Opened - Autoresponse [greek]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('606', 'invoice', 'invoice-payment-recorded', 'greek', 'Invoice Payment Recorded (Sent to Customer) [greek]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('607', 'invoice', 'invoice-overdue-notice', 'greek', 'Invoice Overdue Notice [greek]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('608', 'invoice', 'invoice-already-send', 'greek', 'Invoice Already Sent to Customer [greek]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('609', 'ticket', 'new-ticket-created-staff', 'greek', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [greek]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('610', 'estimate', 'estimate-send-to-client', 'greek', 'Send Estimate to Customer [greek]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('611', 'ticket', 'ticket-reply-to-admin', 'greek', 'Ticket Reply (Sent to Staff) [greek]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('612', 'estimate', 'estimate-already-send', 'greek', 'Estimate Already Sent to Customer [greek]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('613', 'contract', 'contract-expiration', 'greek', 'Contract Expiration Reminder (Sent to Customer Contacts) [greek]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('614', 'tasks', 'task-assigned', 'greek', 'New Task Assigned (Sent to Staff) [greek]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('615', 'tasks', 'task-added-as-follower', 'greek', 'Staff Member Added as Follower on Task (Sent to Staff) [greek]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('616', 'tasks', 'task-commented', 'greek', 'New Comment on Task (Sent to Staff) [greek]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('617', 'tasks', 'task-added-attachment', 'greek', 'New Attachment(s) on Task (Sent to Staff) [greek]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('618', 'estimate', 'estimate-declined-to-staff', 'greek', 'Estimate Declined (Sent to Staff) [greek]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('619', 'estimate', 'estimate-accepted-to-staff', 'greek', 'Estimate Accepted (Sent to Staff) [greek]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('620', 'proposals', 'proposal-client-accepted', 'greek', 'Customer Action - Accepted (Sent to Staff) [greek]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('621', 'proposals', 'proposal-send-to-customer', 'greek', 'Send Proposal to Customer [greek]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('622', 'proposals', 'proposal-client-declined', 'greek', 'Customer Action - Declined (Sent to Staff) [greek]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('623', 'proposals', 'proposal-client-thank-you', 'greek', 'Thank You Email (Sent to Customer After Accept) [greek]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('624', 'proposals', 'proposal-comment-to-client', 'greek', 'New Comment  (Sent to Customer/Lead) [greek]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('625', 'proposals', 'proposal-comment-to-admin', 'greek', 'New Comment (Sent to Staff)  [greek]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('626', 'estimate', 'estimate-thank-you-to-customer', 'greek', 'Thank You Email (Sent to Customer After Accept) [greek]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('627', 'tasks', 'task-deadline-notification', 'greek', 'Task Deadline Reminder - Sent to Assigned Members [greek]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('628', 'contract', 'send-contract', 'greek', 'Send Contract to Customer [greek]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('629', 'invoice', 'invoice-payment-recorded-to-staff', 'greek', 'Invoice Payment Recorded (Sent to Staff) [greek]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('630', 'ticket', 'auto-close-ticket', 'greek', 'Auto Close Ticket [greek]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('631', 'project', 'new-project-discussion-created-to-staff', 'greek', 'New Project Discussion (Sent to Project Members) [greek]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('632', 'project', 'new-project-discussion-created-to-customer', 'greek', 'New Project Discussion (Sent to Customer Contacts) [greek]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('633', 'project', 'new-project-file-uploaded-to-customer', 'greek', 'New Project File(s) Uploaded (Sent to Customer Contacts) [greek]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('634', 'project', 'new-project-file-uploaded-to-staff', 'greek', 'New Project File(s) Uploaded (Sent to Project Members) [greek]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('635', 'project', 'new-project-discussion-comment-to-customer', 'greek', 'New Discussion Comment  (Sent to Customer Contacts) [greek]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('636', 'project', 'new-project-discussion-comment-to-staff', 'greek', 'New Discussion Comment (Sent to Project Members) [greek]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('637', 'project', 'staff-added-as-project-member', 'greek', 'Staff Added as Project Member [greek]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('638', 'estimate', 'estimate-expiry-reminder', 'greek', 'Estimate Expiration Reminder [greek]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('639', 'proposals', 'proposal-expiry-reminder', 'greek', 'Proposal Expiration Reminder [greek]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('640', 'staff', 'new-staff-created', 'greek', 'New Staff Created (Welcome Email) [greek]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('641', 'client', 'contact-forgot-password', 'greek', 'Forgot Password [greek]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('642', 'client', 'contact-password-reseted', 'greek', 'Password Reset - Confirmation [greek]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('643', 'client', 'contact-set-password', 'greek', 'Set New Password [greek]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('644', 'staff', 'staff-forgot-password', 'greek', 'Forgot Password [greek]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('645', 'staff', 'staff-password-reseted', 'greek', 'Password Reset - Confirmation [greek]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('646', 'project', 'assigned-to-project', 'greek', 'New Project Created (Sent to Customer Contacts) [greek]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('647', 'tasks', 'task-added-attachment-to-contacts', 'greek', 'New Attachment(s) on Task (Sent to Customer Contacts) [greek]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('648', 'tasks', 'task-commented-to-contacts', 'greek', 'New Comment on Task (Sent to Customer Contacts) [greek]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('649', 'leads', 'new-lead-assigned', 'greek', 'New Lead Assigned to Staff Member [greek]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('650', 'client', 'client-statement', 'greek', 'Statement - Account Summary [greek]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('651', 'ticket', 'ticket-assigned-to-admin', 'greek', 'New Ticket Assigned (Sent to Staff) [greek]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('652', 'client', 'new-client-registered-to-admin', 'greek', 'New Customer Registration (Sent to admins) [greek]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('653', 'leads', 'new-web-to-lead-form-submitted', 'greek', 'Web to lead form submitted - Sent to lead [greek]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('654', 'staff', 'two-factor-authentication', 'greek', 'Two Factor Authentication [greek]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('655', 'project', 'project-finished-to-customer', 'greek', 'Project Marked as Finished (Sent to Customer Contacts) [greek]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('656', 'credit_note', 'credit-note-send-to-client', 'greek', 'Send Credit Note To Email [greek]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('657', 'tasks', 'task-status-change-to-staff', 'greek', 'Task Status Changed (Sent to Staff) [greek]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('658', 'tasks', 'task-status-change-to-contacts', 'greek', 'Task Status Changed (Sent to Customer Contacts) [greek]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('659', 'staff', 'reminder-email-staff', 'greek', 'Staff Reminder Email [greek]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('660', 'contract', 'contract-comment-to-client', 'greek', 'New Comment  (Sent to Customer Contacts) [greek]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('661', 'contract', 'contract-comment-to-admin', 'greek', 'New Comment (Sent to Staff)  [greek]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('662', 'subscriptions', 'send-subscription', 'greek', 'Send Subscription to Customer [greek]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('663', 'subscriptions', 'subscription-payment-failed', 'greek', 'Subscription Payment Failed [greek]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('664', 'subscriptions', 'subscription-canceled', 'greek', 'Subscription Canceled (Sent to customer primary contact) [greek]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('665', 'subscriptions', 'subscription-payment-succeeded', 'greek', 'Subscription Payment Succeeded (Sent to customer primary contact) [greek]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('666', 'contract', 'contract-expiration-to-staff', 'greek', 'Contract Expiration Reminder (Sent to Staff) [greek]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('667', 'gdpr', 'gdpr-removal-request', 'greek', 'Removal Request From Contact (Sent to administrators) [greek]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('668', 'gdpr', 'gdpr-removal-request-lead', 'greek', 'Removal Request From Lead (Sent to administrators) [greek]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('669', 'client', 'client-registration-confirmed', 'greek', 'Customer Registration Confirmed [greek]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('670', 'contract', 'contract-signed-to-staff', 'greek', 'Contract Signed (Sent to Staff) [greek]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('671', 'subscriptions', 'customer-subscribed-to-staff', 'greek', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [greek]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('672', 'client', 'contact-verification-email', 'greek', 'Email Verification (Sent to Contact After Registration) [greek]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('673', 'client', 'new-customer-profile-file-uploaded-to-staff', 'greek', 'New Customer Profile File(s) Uploaded (Sent to Staff) [greek]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('674', 'staff', 'event-notification-to-staff', 'greek', 'Event Notification (Calendar) [greek]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('675', 'subscriptions', 'subscription-payment-requires-action', 'greek', 'Credit Card Authorization Required - SCA [greek]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('676', 'client', 'new-client-created', 'indonesia', 'New Contact Added/Registered (Welcome Email) [indonesia]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('677', 'invoice', 'invoice-send-to-client', 'indonesia', 'Send Invoice to Customer [indonesia]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('678', 'ticket', 'new-ticket-opened-admin', 'indonesia', 'New Ticket Opened (Opened by Staff, Sent to Customer) [indonesia]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('679', 'ticket', 'ticket-reply', 'indonesia', 'Ticket Reply (Sent to Customer) [indonesia]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('680', 'ticket', 'ticket-autoresponse', 'indonesia', 'New Ticket Opened - Autoresponse [indonesia]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('681', 'invoice', 'invoice-payment-recorded', 'indonesia', 'Invoice Payment Recorded (Sent to Customer) [indonesia]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('682', 'invoice', 'invoice-overdue-notice', 'indonesia', 'Invoice Overdue Notice [indonesia]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('683', 'invoice', 'invoice-already-send', 'indonesia', 'Invoice Already Sent to Customer [indonesia]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('684', 'ticket', 'new-ticket-created-staff', 'indonesia', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [indonesia]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('685', 'estimate', 'estimate-send-to-client', 'indonesia', 'Send Estimate to Customer [indonesia]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('686', 'ticket', 'ticket-reply-to-admin', 'indonesia', 'Ticket Reply (Sent to Staff) [indonesia]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('687', 'estimate', 'estimate-already-send', 'indonesia', 'Estimate Already Sent to Customer [indonesia]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('688', 'contract', 'contract-expiration', 'indonesia', 'Contract Expiration Reminder (Sent to Customer Contacts) [indonesia]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('689', 'tasks', 'task-assigned', 'indonesia', 'New Task Assigned (Sent to Staff) [indonesia]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('690', 'tasks', 'task-added-as-follower', 'indonesia', 'Staff Member Added as Follower on Task (Sent to Staff) [indonesia]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('691', 'tasks', 'task-commented', 'indonesia', 'New Comment on Task (Sent to Staff) [indonesia]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('692', 'tasks', 'task-added-attachment', 'indonesia', 'New Attachment(s) on Task (Sent to Staff) [indonesia]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('693', 'estimate', 'estimate-declined-to-staff', 'indonesia', 'Estimate Declined (Sent to Staff) [indonesia]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('694', 'estimate', 'estimate-accepted-to-staff', 'indonesia', 'Estimate Accepted (Sent to Staff) [indonesia]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('695', 'proposals', 'proposal-client-accepted', 'indonesia', 'Customer Action - Accepted (Sent to Staff) [indonesia]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('696', 'proposals', 'proposal-send-to-customer', 'indonesia', 'Send Proposal to Customer [indonesia]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('697', 'proposals', 'proposal-client-declined', 'indonesia', 'Customer Action - Declined (Sent to Staff) [indonesia]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('698', 'proposals', 'proposal-client-thank-you', 'indonesia', 'Thank You Email (Sent to Customer After Accept) [indonesia]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('699', 'proposals', 'proposal-comment-to-client', 'indonesia', 'New Comment  (Sent to Customer/Lead) [indonesia]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('700', 'proposals', 'proposal-comment-to-admin', 'indonesia', 'New Comment (Sent to Staff)  [indonesia]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('701', 'estimate', 'estimate-thank-you-to-customer', 'indonesia', 'Thank You Email (Sent to Customer After Accept) [indonesia]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('702', 'tasks', 'task-deadline-notification', 'indonesia', 'Task Deadline Reminder - Sent to Assigned Members [indonesia]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('703', 'contract', 'send-contract', 'indonesia', 'Send Contract to Customer [indonesia]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('704', 'invoice', 'invoice-payment-recorded-to-staff', 'indonesia', 'Invoice Payment Recorded (Sent to Staff) [indonesia]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('705', 'ticket', 'auto-close-ticket', 'indonesia', 'Auto Close Ticket [indonesia]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('706', 'project', 'new-project-discussion-created-to-staff', 'indonesia', 'New Project Discussion (Sent to Project Members) [indonesia]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('707', 'project', 'new-project-discussion-created-to-customer', 'indonesia', 'New Project Discussion (Sent to Customer Contacts) [indonesia]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('708', 'project', 'new-project-file-uploaded-to-customer', 'indonesia', 'New Project File(s) Uploaded (Sent to Customer Contacts) [indonesia]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('709', 'project', 'new-project-file-uploaded-to-staff', 'indonesia', 'New Project File(s) Uploaded (Sent to Project Members) [indonesia]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('710', 'project', 'new-project-discussion-comment-to-customer', 'indonesia', 'New Discussion Comment  (Sent to Customer Contacts) [indonesia]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('711', 'project', 'new-project-discussion-comment-to-staff', 'indonesia', 'New Discussion Comment (Sent to Project Members) [indonesia]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('712', 'project', 'staff-added-as-project-member', 'indonesia', 'Staff Added as Project Member [indonesia]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('713', 'estimate', 'estimate-expiry-reminder', 'indonesia', 'Estimate Expiration Reminder [indonesia]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('714', 'proposals', 'proposal-expiry-reminder', 'indonesia', 'Proposal Expiration Reminder [indonesia]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('715', 'staff', 'new-staff-created', 'indonesia', 'New Staff Created (Welcome Email) [indonesia]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('716', 'client', 'contact-forgot-password', 'indonesia', 'Forgot Password [indonesia]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('717', 'client', 'contact-password-reseted', 'indonesia', 'Password Reset - Confirmation [indonesia]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('718', 'client', 'contact-set-password', 'indonesia', 'Set New Password [indonesia]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('719', 'staff', 'staff-forgot-password', 'indonesia', 'Forgot Password [indonesia]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('720', 'staff', 'staff-password-reseted', 'indonesia', 'Password Reset - Confirmation [indonesia]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('721', 'project', 'assigned-to-project', 'indonesia', 'New Project Created (Sent to Customer Contacts) [indonesia]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('722', 'tasks', 'task-added-attachment-to-contacts', 'indonesia', 'New Attachment(s) on Task (Sent to Customer Contacts) [indonesia]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('723', 'tasks', 'task-commented-to-contacts', 'indonesia', 'New Comment on Task (Sent to Customer Contacts) [indonesia]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('724', 'leads', 'new-lead-assigned', 'indonesia', 'New Lead Assigned to Staff Member [indonesia]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('725', 'client', 'client-statement', 'indonesia', 'Statement - Account Summary [indonesia]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('726', 'ticket', 'ticket-assigned-to-admin', 'indonesia', 'New Ticket Assigned (Sent to Staff) [indonesia]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('727', 'client', 'new-client-registered-to-admin', 'indonesia', 'New Customer Registration (Sent to admins) [indonesia]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('728', 'leads', 'new-web-to-lead-form-submitted', 'indonesia', 'Web to lead form submitted - Sent to lead [indonesia]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('729', 'staff', 'two-factor-authentication', 'indonesia', 'Two Factor Authentication [indonesia]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('730', 'project', 'project-finished-to-customer', 'indonesia', 'Project Marked as Finished (Sent to Customer Contacts) [indonesia]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('731', 'credit_note', 'credit-note-send-to-client', 'indonesia', 'Send Credit Note To Email [indonesia]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('732', 'tasks', 'task-status-change-to-staff', 'indonesia', 'Task Status Changed (Sent to Staff) [indonesia]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('733', 'tasks', 'task-status-change-to-contacts', 'indonesia', 'Task Status Changed (Sent to Customer Contacts) [indonesia]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('734', 'staff', 'reminder-email-staff', 'indonesia', 'Staff Reminder Email [indonesia]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('735', 'contract', 'contract-comment-to-client', 'indonesia', 'New Comment  (Sent to Customer Contacts) [indonesia]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('736', 'contract', 'contract-comment-to-admin', 'indonesia', 'New Comment (Sent to Staff)  [indonesia]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('737', 'subscriptions', 'send-subscription', 'indonesia', 'Send Subscription to Customer [indonesia]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('738', 'subscriptions', 'subscription-payment-failed', 'indonesia', 'Subscription Payment Failed [indonesia]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('739', 'subscriptions', 'subscription-canceled', 'indonesia', 'Subscription Canceled (Sent to customer primary contact) [indonesia]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('740', 'subscriptions', 'subscription-payment-succeeded', 'indonesia', 'Subscription Payment Succeeded (Sent to customer primary contact) [indonesia]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('741', 'contract', 'contract-expiration-to-staff', 'indonesia', 'Contract Expiration Reminder (Sent to Staff) [indonesia]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('742', 'gdpr', 'gdpr-removal-request', 'indonesia', 'Removal Request From Contact (Sent to administrators) [indonesia]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('743', 'gdpr', 'gdpr-removal-request-lead', 'indonesia', 'Removal Request From Lead (Sent to administrators) [indonesia]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('744', 'client', 'client-registration-confirmed', 'indonesia', 'Customer Registration Confirmed [indonesia]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('745', 'contract', 'contract-signed-to-staff', 'indonesia', 'Contract Signed (Sent to Staff) [indonesia]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('746', 'subscriptions', 'customer-subscribed-to-staff', 'indonesia', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [indonesia]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('747', 'client', 'contact-verification-email', 'indonesia', 'Email Verification (Sent to Contact After Registration) [indonesia]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('748', 'client', 'new-customer-profile-file-uploaded-to-staff', 'indonesia', 'New Customer Profile File(s) Uploaded (Sent to Staff) [indonesia]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('749', 'staff', 'event-notification-to-staff', 'indonesia', 'Event Notification (Calendar) [indonesia]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('750', 'subscriptions', 'subscription-payment-requires-action', 'indonesia', 'Credit Card Authorization Required - SCA [indonesia]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('751', 'client', 'new-client-created', 'italian', 'New Contact Added/Registered (Welcome Email) [italian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('752', 'invoice', 'invoice-send-to-client', 'italian', 'Send Invoice to Customer [italian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('753', 'ticket', 'new-ticket-opened-admin', 'italian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [italian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('754', 'ticket', 'ticket-reply', 'italian', 'Ticket Reply (Sent to Customer) [italian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('755', 'ticket', 'ticket-autoresponse', 'italian', 'New Ticket Opened - Autoresponse [italian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('756', 'invoice', 'invoice-payment-recorded', 'italian', 'Invoice Payment Recorded (Sent to Customer) [italian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('757', 'invoice', 'invoice-overdue-notice', 'italian', 'Invoice Overdue Notice [italian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('758', 'invoice', 'invoice-already-send', 'italian', 'Invoice Already Sent to Customer [italian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('759', 'ticket', 'new-ticket-created-staff', 'italian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [italian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('760', 'estimate', 'estimate-send-to-client', 'italian', 'Send Estimate to Customer [italian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('761', 'ticket', 'ticket-reply-to-admin', 'italian', 'Ticket Reply (Sent to Staff) [italian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('762', 'estimate', 'estimate-already-send', 'italian', 'Estimate Already Sent to Customer [italian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('763', 'contract', 'contract-expiration', 'italian', 'Contract Expiration Reminder (Sent to Customer Contacts) [italian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('764', 'tasks', 'task-assigned', 'italian', 'New Task Assigned (Sent to Staff) [italian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('765', 'tasks', 'task-added-as-follower', 'italian', 'Staff Member Added as Follower on Task (Sent to Staff) [italian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('766', 'tasks', 'task-commented', 'italian', 'New Comment on Task (Sent to Staff) [italian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('767', 'tasks', 'task-added-attachment', 'italian', 'New Attachment(s) on Task (Sent to Staff) [italian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('768', 'estimate', 'estimate-declined-to-staff', 'italian', 'Estimate Declined (Sent to Staff) [italian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('769', 'estimate', 'estimate-accepted-to-staff', 'italian', 'Estimate Accepted (Sent to Staff) [italian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('770', 'proposals', 'proposal-client-accepted', 'italian', 'Customer Action - Accepted (Sent to Staff) [italian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('771', 'proposals', 'proposal-send-to-customer', 'italian', 'Send Proposal to Customer [italian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('772', 'proposals', 'proposal-client-declined', 'italian', 'Customer Action - Declined (Sent to Staff) [italian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('773', 'proposals', 'proposal-client-thank-you', 'italian', 'Thank You Email (Sent to Customer After Accept) [italian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('774', 'proposals', 'proposal-comment-to-client', 'italian', 'New Comment  (Sent to Customer/Lead) [italian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('775', 'proposals', 'proposal-comment-to-admin', 'italian', 'New Comment (Sent to Staff)  [italian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('776', 'estimate', 'estimate-thank-you-to-customer', 'italian', 'Thank You Email (Sent to Customer After Accept) [italian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('777', 'tasks', 'task-deadline-notification', 'italian', 'Task Deadline Reminder - Sent to Assigned Members [italian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('778', 'contract', 'send-contract', 'italian', 'Send Contract to Customer [italian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('779', 'invoice', 'invoice-payment-recorded-to-staff', 'italian', 'Invoice Payment Recorded (Sent to Staff) [italian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('780', 'ticket', 'auto-close-ticket', 'italian', 'Auto Close Ticket [italian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('781', 'project', 'new-project-discussion-created-to-staff', 'italian', 'New Project Discussion (Sent to Project Members) [italian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('782', 'project', 'new-project-discussion-created-to-customer', 'italian', 'New Project Discussion (Sent to Customer Contacts) [italian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('783', 'project', 'new-project-file-uploaded-to-customer', 'italian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [italian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('784', 'project', 'new-project-file-uploaded-to-staff', 'italian', 'New Project File(s) Uploaded (Sent to Project Members) [italian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('785', 'project', 'new-project-discussion-comment-to-customer', 'italian', 'New Discussion Comment  (Sent to Customer Contacts) [italian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('786', 'project', 'new-project-discussion-comment-to-staff', 'italian', 'New Discussion Comment (Sent to Project Members) [italian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('787', 'project', 'staff-added-as-project-member', 'italian', 'Staff Added as Project Member [italian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('788', 'estimate', 'estimate-expiry-reminder', 'italian', 'Estimate Expiration Reminder [italian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('789', 'proposals', 'proposal-expiry-reminder', 'italian', 'Proposal Expiration Reminder [italian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('790', 'staff', 'new-staff-created', 'italian', 'New Staff Created (Welcome Email) [italian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('791', 'client', 'contact-forgot-password', 'italian', 'Forgot Password [italian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('792', 'client', 'contact-password-reseted', 'italian', 'Password Reset - Confirmation [italian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('793', 'client', 'contact-set-password', 'italian', 'Set New Password [italian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('794', 'staff', 'staff-forgot-password', 'italian', 'Forgot Password [italian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('795', 'staff', 'staff-password-reseted', 'italian', 'Password Reset - Confirmation [italian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('796', 'project', 'assigned-to-project', 'italian', 'New Project Created (Sent to Customer Contacts) [italian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('797', 'tasks', 'task-added-attachment-to-contacts', 'italian', 'New Attachment(s) on Task (Sent to Customer Contacts) [italian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('798', 'tasks', 'task-commented-to-contacts', 'italian', 'New Comment on Task (Sent to Customer Contacts) [italian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('799', 'leads', 'new-lead-assigned', 'italian', 'New Lead Assigned to Staff Member [italian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('800', 'client', 'client-statement', 'italian', 'Statement - Account Summary [italian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('801', 'ticket', 'ticket-assigned-to-admin', 'italian', 'New Ticket Assigned (Sent to Staff) [italian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('802', 'client', 'new-client-registered-to-admin', 'italian', 'New Customer Registration (Sent to admins) [italian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('803', 'leads', 'new-web-to-lead-form-submitted', 'italian', 'Web to lead form submitted - Sent to lead [italian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('804', 'staff', 'two-factor-authentication', 'italian', 'Two Factor Authentication [italian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('805', 'project', 'project-finished-to-customer', 'italian', 'Project Marked as Finished (Sent to Customer Contacts) [italian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('806', 'credit_note', 'credit-note-send-to-client', 'italian', 'Send Credit Note To Email [italian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('807', 'tasks', 'task-status-change-to-staff', 'italian', 'Task Status Changed (Sent to Staff) [italian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('808', 'tasks', 'task-status-change-to-contacts', 'italian', 'Task Status Changed (Sent to Customer Contacts) [italian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('809', 'staff', 'reminder-email-staff', 'italian', 'Staff Reminder Email [italian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('810', 'contract', 'contract-comment-to-client', 'italian', 'New Comment  (Sent to Customer Contacts) [italian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('811', 'contract', 'contract-comment-to-admin', 'italian', 'New Comment (Sent to Staff)  [italian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('812', 'subscriptions', 'send-subscription', 'italian', 'Send Subscription to Customer [italian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('813', 'subscriptions', 'subscription-payment-failed', 'italian', 'Subscription Payment Failed [italian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('814', 'subscriptions', 'subscription-canceled', 'italian', 'Subscription Canceled (Sent to customer primary contact) [italian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('815', 'subscriptions', 'subscription-payment-succeeded', 'italian', 'Subscription Payment Succeeded (Sent to customer primary contact) [italian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('816', 'contract', 'contract-expiration-to-staff', 'italian', 'Contract Expiration Reminder (Sent to Staff) [italian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('817', 'gdpr', 'gdpr-removal-request', 'italian', 'Removal Request From Contact (Sent to administrators) [italian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('818', 'gdpr', 'gdpr-removal-request-lead', 'italian', 'Removal Request From Lead (Sent to administrators) [italian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('819', 'client', 'client-registration-confirmed', 'italian', 'Customer Registration Confirmed [italian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('820', 'contract', 'contract-signed-to-staff', 'italian', 'Contract Signed (Sent to Staff) [italian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('821', 'subscriptions', 'customer-subscribed-to-staff', 'italian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [italian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('822', 'client', 'contact-verification-email', 'italian', 'Email Verification (Sent to Contact After Registration) [italian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('823', 'client', 'new-customer-profile-file-uploaded-to-staff', 'italian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [italian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('824', 'staff', 'event-notification-to-staff', 'italian', 'Event Notification (Calendar) [italian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('825', 'subscriptions', 'subscription-payment-requires-action', 'italian', 'Credit Card Authorization Required - SCA [italian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('826', 'client', 'new-client-created', 'japanese', 'New Contact Added/Registered (Welcome Email) [japanese]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('827', 'invoice', 'invoice-send-to-client', 'japanese', 'Send Invoice to Customer [japanese]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('828', 'ticket', 'new-ticket-opened-admin', 'japanese', 'New Ticket Opened (Opened by Staff, Sent to Customer) [japanese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('829', 'ticket', 'ticket-reply', 'japanese', 'Ticket Reply (Sent to Customer) [japanese]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('830', 'ticket', 'ticket-autoresponse', 'japanese', 'New Ticket Opened - Autoresponse [japanese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('831', 'invoice', 'invoice-payment-recorded', 'japanese', 'Invoice Payment Recorded (Sent to Customer) [japanese]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('832', 'invoice', 'invoice-overdue-notice', 'japanese', 'Invoice Overdue Notice [japanese]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('833', 'invoice', 'invoice-already-send', 'japanese', 'Invoice Already Sent to Customer [japanese]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('834', 'ticket', 'new-ticket-created-staff', 'japanese', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [japanese]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('835', 'estimate', 'estimate-send-to-client', 'japanese', 'Send Estimate to Customer [japanese]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('836', 'ticket', 'ticket-reply-to-admin', 'japanese', 'Ticket Reply (Sent to Staff) [japanese]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('837', 'estimate', 'estimate-already-send', 'japanese', 'Estimate Already Sent to Customer [japanese]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('838', 'contract', 'contract-expiration', 'japanese', 'Contract Expiration Reminder (Sent to Customer Contacts) [japanese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('839', 'tasks', 'task-assigned', 'japanese', 'New Task Assigned (Sent to Staff) [japanese]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('840', 'tasks', 'task-added-as-follower', 'japanese', 'Staff Member Added as Follower on Task (Sent to Staff) [japanese]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('841', 'tasks', 'task-commented', 'japanese', 'New Comment on Task (Sent to Staff) [japanese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('842', 'tasks', 'task-added-attachment', 'japanese', 'New Attachment(s) on Task (Sent to Staff) [japanese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('843', 'estimate', 'estimate-declined-to-staff', 'japanese', 'Estimate Declined (Sent to Staff) [japanese]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('844', 'estimate', 'estimate-accepted-to-staff', 'japanese', 'Estimate Accepted (Sent to Staff) [japanese]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('845', 'proposals', 'proposal-client-accepted', 'japanese', 'Customer Action - Accepted (Sent to Staff) [japanese]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('846', 'proposals', 'proposal-send-to-customer', 'japanese', 'Send Proposal to Customer [japanese]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('847', 'proposals', 'proposal-client-declined', 'japanese', 'Customer Action - Declined (Sent to Staff) [japanese]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('848', 'proposals', 'proposal-client-thank-you', 'japanese', 'Thank You Email (Sent to Customer After Accept) [japanese]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('849', 'proposals', 'proposal-comment-to-client', 'japanese', 'New Comment  (Sent to Customer/Lead) [japanese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('850', 'proposals', 'proposal-comment-to-admin', 'japanese', 'New Comment (Sent to Staff)  [japanese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('851', 'estimate', 'estimate-thank-you-to-customer', 'japanese', 'Thank You Email (Sent to Customer After Accept) [japanese]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('852', 'tasks', 'task-deadline-notification', 'japanese', 'Task Deadline Reminder - Sent to Assigned Members [japanese]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('853', 'contract', 'send-contract', 'japanese', 'Send Contract to Customer [japanese]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('854', 'invoice', 'invoice-payment-recorded-to-staff', 'japanese', 'Invoice Payment Recorded (Sent to Staff) [japanese]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('855', 'ticket', 'auto-close-ticket', 'japanese', 'Auto Close Ticket [japanese]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('856', 'project', 'new-project-discussion-created-to-staff', 'japanese', 'New Project Discussion (Sent to Project Members) [japanese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('857', 'project', 'new-project-discussion-created-to-customer', 'japanese', 'New Project Discussion (Sent to Customer Contacts) [japanese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('858', 'project', 'new-project-file-uploaded-to-customer', 'japanese', 'New Project File(s) Uploaded (Sent to Customer Contacts) [japanese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('859', 'project', 'new-project-file-uploaded-to-staff', 'japanese', 'New Project File(s) Uploaded (Sent to Project Members) [japanese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('860', 'project', 'new-project-discussion-comment-to-customer', 'japanese', 'New Discussion Comment  (Sent to Customer Contacts) [japanese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('861', 'project', 'new-project-discussion-comment-to-staff', 'japanese', 'New Discussion Comment (Sent to Project Members) [japanese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('862', 'project', 'staff-added-as-project-member', 'japanese', 'Staff Added as Project Member [japanese]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('863', 'estimate', 'estimate-expiry-reminder', 'japanese', 'Estimate Expiration Reminder [japanese]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('864', 'proposals', 'proposal-expiry-reminder', 'japanese', 'Proposal Expiration Reminder [japanese]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('865', 'staff', 'new-staff-created', 'japanese', 'New Staff Created (Welcome Email) [japanese]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('866', 'client', 'contact-forgot-password', 'japanese', 'Forgot Password [japanese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('867', 'client', 'contact-password-reseted', 'japanese', 'Password Reset - Confirmation [japanese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('868', 'client', 'contact-set-password', 'japanese', 'Set New Password [japanese]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('869', 'staff', 'staff-forgot-password', 'japanese', 'Forgot Password [japanese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('870', 'staff', 'staff-password-reseted', 'japanese', 'Password Reset - Confirmation [japanese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('871', 'project', 'assigned-to-project', 'japanese', 'New Project Created (Sent to Customer Contacts) [japanese]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('872', 'tasks', 'task-added-attachment-to-contacts', 'japanese', 'New Attachment(s) on Task (Sent to Customer Contacts) [japanese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('873', 'tasks', 'task-commented-to-contacts', 'japanese', 'New Comment on Task (Sent to Customer Contacts) [japanese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('874', 'leads', 'new-lead-assigned', 'japanese', 'New Lead Assigned to Staff Member [japanese]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('875', 'client', 'client-statement', 'japanese', 'Statement - Account Summary [japanese]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('876', 'ticket', 'ticket-assigned-to-admin', 'japanese', 'New Ticket Assigned (Sent to Staff) [japanese]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('877', 'client', 'new-client-registered-to-admin', 'japanese', 'New Customer Registration (Sent to admins) [japanese]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('878', 'leads', 'new-web-to-lead-form-submitted', 'japanese', 'Web to lead form submitted - Sent to lead [japanese]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('879', 'staff', 'two-factor-authentication', 'japanese', 'Two Factor Authentication [japanese]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('880', 'project', 'project-finished-to-customer', 'japanese', 'Project Marked as Finished (Sent to Customer Contacts) [japanese]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('881', 'credit_note', 'credit-note-send-to-client', 'japanese', 'Send Credit Note To Email [japanese]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('882', 'tasks', 'task-status-change-to-staff', 'japanese', 'Task Status Changed (Sent to Staff) [japanese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('883', 'tasks', 'task-status-change-to-contacts', 'japanese', 'Task Status Changed (Sent to Customer Contacts) [japanese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('884', 'staff', 'reminder-email-staff', 'japanese', 'Staff Reminder Email [japanese]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('885', 'contract', 'contract-comment-to-client', 'japanese', 'New Comment  (Sent to Customer Contacts) [japanese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('886', 'contract', 'contract-comment-to-admin', 'japanese', 'New Comment (Sent to Staff)  [japanese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('887', 'subscriptions', 'send-subscription', 'japanese', 'Send Subscription to Customer [japanese]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('888', 'subscriptions', 'subscription-payment-failed', 'japanese', 'Subscription Payment Failed [japanese]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('889', 'subscriptions', 'subscription-canceled', 'japanese', 'Subscription Canceled (Sent to customer primary contact) [japanese]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('890', 'subscriptions', 'subscription-payment-succeeded', 'japanese', 'Subscription Payment Succeeded (Sent to customer primary contact) [japanese]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('891', 'contract', 'contract-expiration-to-staff', 'japanese', 'Contract Expiration Reminder (Sent to Staff) [japanese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('892', 'gdpr', 'gdpr-removal-request', 'japanese', 'Removal Request From Contact (Sent to administrators) [japanese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('893', 'gdpr', 'gdpr-removal-request-lead', 'japanese', 'Removal Request From Lead (Sent to administrators) [japanese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('894', 'client', 'client-registration-confirmed', 'japanese', 'Customer Registration Confirmed [japanese]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('895', 'contract', 'contract-signed-to-staff', 'japanese', 'Contract Signed (Sent to Staff) [japanese]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('896', 'subscriptions', 'customer-subscribed-to-staff', 'japanese', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [japanese]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('897', 'client', 'contact-verification-email', 'japanese', 'Email Verification (Sent to Contact After Registration) [japanese]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('898', 'client', 'new-customer-profile-file-uploaded-to-staff', 'japanese', 'New Customer Profile File(s) Uploaded (Sent to Staff) [japanese]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('899', 'staff', 'event-notification-to-staff', 'japanese', 'Event Notification (Calendar) [japanese]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('900', 'subscriptions', 'subscription-payment-requires-action', 'japanese', 'Credit Card Authorization Required - SCA [japanese]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('901', 'client', 'new-client-created', 'persian', 'New Contact Added/Registered (Welcome Email) [persian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('902', 'invoice', 'invoice-send-to-client', 'persian', 'Send Invoice to Customer [persian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('903', 'ticket', 'new-ticket-opened-admin', 'persian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [persian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('904', 'ticket', 'ticket-reply', 'persian', 'Ticket Reply (Sent to Customer) [persian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('905', 'ticket', 'ticket-autoresponse', 'persian', 'New Ticket Opened - Autoresponse [persian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('906', 'invoice', 'invoice-payment-recorded', 'persian', 'Invoice Payment Recorded (Sent to Customer) [persian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('907', 'invoice', 'invoice-overdue-notice', 'persian', 'Invoice Overdue Notice [persian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('908', 'invoice', 'invoice-already-send', 'persian', 'Invoice Already Sent to Customer [persian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('909', 'ticket', 'new-ticket-created-staff', 'persian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [persian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('910', 'estimate', 'estimate-send-to-client', 'persian', 'Send Estimate to Customer [persian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('911', 'ticket', 'ticket-reply-to-admin', 'persian', 'Ticket Reply (Sent to Staff) [persian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('912', 'estimate', 'estimate-already-send', 'persian', 'Estimate Already Sent to Customer [persian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('913', 'contract', 'contract-expiration', 'persian', 'Contract Expiration Reminder (Sent to Customer Contacts) [persian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('914', 'tasks', 'task-assigned', 'persian', 'New Task Assigned (Sent to Staff) [persian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('915', 'tasks', 'task-added-as-follower', 'persian', 'Staff Member Added as Follower on Task (Sent to Staff) [persian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('916', 'tasks', 'task-commented', 'persian', 'New Comment on Task (Sent to Staff) [persian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('917', 'tasks', 'task-added-attachment', 'persian', 'New Attachment(s) on Task (Sent to Staff) [persian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('918', 'estimate', 'estimate-declined-to-staff', 'persian', 'Estimate Declined (Sent to Staff) [persian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('919', 'estimate', 'estimate-accepted-to-staff', 'persian', 'Estimate Accepted (Sent to Staff) [persian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('920', 'proposals', 'proposal-client-accepted', 'persian', 'Customer Action - Accepted (Sent to Staff) [persian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('921', 'proposals', 'proposal-send-to-customer', 'persian', 'Send Proposal to Customer [persian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('922', 'proposals', 'proposal-client-declined', 'persian', 'Customer Action - Declined (Sent to Staff) [persian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('923', 'proposals', 'proposal-client-thank-you', 'persian', 'Thank You Email (Sent to Customer After Accept) [persian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('924', 'proposals', 'proposal-comment-to-client', 'persian', 'New Comment  (Sent to Customer/Lead) [persian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('925', 'proposals', 'proposal-comment-to-admin', 'persian', 'New Comment (Sent to Staff)  [persian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('926', 'estimate', 'estimate-thank-you-to-customer', 'persian', 'Thank You Email (Sent to Customer After Accept) [persian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('927', 'tasks', 'task-deadline-notification', 'persian', 'Task Deadline Reminder - Sent to Assigned Members [persian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('928', 'contract', 'send-contract', 'persian', 'Send Contract to Customer [persian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('929', 'invoice', 'invoice-payment-recorded-to-staff', 'persian', 'Invoice Payment Recorded (Sent to Staff) [persian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('930', 'ticket', 'auto-close-ticket', 'persian', 'Auto Close Ticket [persian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('931', 'project', 'new-project-discussion-created-to-staff', 'persian', 'New Project Discussion (Sent to Project Members) [persian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('932', 'project', 'new-project-discussion-created-to-customer', 'persian', 'New Project Discussion (Sent to Customer Contacts) [persian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('933', 'project', 'new-project-file-uploaded-to-customer', 'persian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [persian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('934', 'project', 'new-project-file-uploaded-to-staff', 'persian', 'New Project File(s) Uploaded (Sent to Project Members) [persian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('935', 'project', 'new-project-discussion-comment-to-customer', 'persian', 'New Discussion Comment  (Sent to Customer Contacts) [persian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('936', 'project', 'new-project-discussion-comment-to-staff', 'persian', 'New Discussion Comment (Sent to Project Members) [persian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('937', 'project', 'staff-added-as-project-member', 'persian', 'Staff Added as Project Member [persian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('938', 'estimate', 'estimate-expiry-reminder', 'persian', 'Estimate Expiration Reminder [persian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('939', 'proposals', 'proposal-expiry-reminder', 'persian', 'Proposal Expiration Reminder [persian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('940', 'staff', 'new-staff-created', 'persian', 'New Staff Created (Welcome Email) [persian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('941', 'client', 'contact-forgot-password', 'persian', 'Forgot Password [persian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('942', 'client', 'contact-password-reseted', 'persian', 'Password Reset - Confirmation [persian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('943', 'client', 'contact-set-password', 'persian', 'Set New Password [persian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('944', 'staff', 'staff-forgot-password', 'persian', 'Forgot Password [persian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('945', 'staff', 'staff-password-reseted', 'persian', 'Password Reset - Confirmation [persian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('946', 'project', 'assigned-to-project', 'persian', 'New Project Created (Sent to Customer Contacts) [persian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('947', 'tasks', 'task-added-attachment-to-contacts', 'persian', 'New Attachment(s) on Task (Sent to Customer Contacts) [persian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('948', 'tasks', 'task-commented-to-contacts', 'persian', 'New Comment on Task (Sent to Customer Contacts) [persian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('949', 'leads', 'new-lead-assigned', 'persian', 'New Lead Assigned to Staff Member [persian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('950', 'client', 'client-statement', 'persian', 'Statement - Account Summary [persian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('951', 'ticket', 'ticket-assigned-to-admin', 'persian', 'New Ticket Assigned (Sent to Staff) [persian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('952', 'client', 'new-client-registered-to-admin', 'persian', 'New Customer Registration (Sent to admins) [persian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('953', 'leads', 'new-web-to-lead-form-submitted', 'persian', 'Web to lead form submitted - Sent to lead [persian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('954', 'staff', 'two-factor-authentication', 'persian', 'Two Factor Authentication [persian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('955', 'project', 'project-finished-to-customer', 'persian', 'Project Marked as Finished (Sent to Customer Contacts) [persian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('956', 'credit_note', 'credit-note-send-to-client', 'persian', 'Send Credit Note To Email [persian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('957', 'tasks', 'task-status-change-to-staff', 'persian', 'Task Status Changed (Sent to Staff) [persian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('958', 'tasks', 'task-status-change-to-contacts', 'persian', 'Task Status Changed (Sent to Customer Contacts) [persian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('959', 'staff', 'reminder-email-staff', 'persian', 'Staff Reminder Email [persian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('960', 'contract', 'contract-comment-to-client', 'persian', 'New Comment  (Sent to Customer Contacts) [persian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('961', 'contract', 'contract-comment-to-admin', 'persian', 'New Comment (Sent to Staff)  [persian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('962', 'subscriptions', 'send-subscription', 'persian', 'Send Subscription to Customer [persian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('963', 'subscriptions', 'subscription-payment-failed', 'persian', 'Subscription Payment Failed [persian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('964', 'subscriptions', 'subscription-canceled', 'persian', 'Subscription Canceled (Sent to customer primary contact) [persian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('965', 'subscriptions', 'subscription-payment-succeeded', 'persian', 'Subscription Payment Succeeded (Sent to customer primary contact) [persian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('966', 'contract', 'contract-expiration-to-staff', 'persian', 'Contract Expiration Reminder (Sent to Staff) [persian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('967', 'gdpr', 'gdpr-removal-request', 'persian', 'Removal Request From Contact (Sent to administrators) [persian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('968', 'gdpr', 'gdpr-removal-request-lead', 'persian', 'Removal Request From Lead (Sent to administrators) [persian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('969', 'client', 'client-registration-confirmed', 'persian', 'Customer Registration Confirmed [persian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('970', 'contract', 'contract-signed-to-staff', 'persian', 'Contract Signed (Sent to Staff) [persian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('971', 'subscriptions', 'customer-subscribed-to-staff', 'persian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [persian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('972', 'client', 'contact-verification-email', 'persian', 'Email Verification (Sent to Contact After Registration) [persian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('973', 'client', 'new-customer-profile-file-uploaded-to-staff', 'persian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [persian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('974', 'staff', 'event-notification-to-staff', 'persian', 'Event Notification (Calendar) [persian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('975', 'subscriptions', 'subscription-payment-requires-action', 'persian', 'Credit Card Authorization Required - SCA [persian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('976', 'client', 'new-client-created', 'polish', 'New Contact Added/Registered (Welcome Email) [polish]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('977', 'invoice', 'invoice-send-to-client', 'polish', 'Send Invoice to Customer [polish]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('978', 'ticket', 'new-ticket-opened-admin', 'polish', 'New Ticket Opened (Opened by Staff, Sent to Customer) [polish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('979', 'ticket', 'ticket-reply', 'polish', 'Ticket Reply (Sent to Customer) [polish]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('980', 'ticket', 'ticket-autoresponse', 'polish', 'New Ticket Opened - Autoresponse [polish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('981', 'invoice', 'invoice-payment-recorded', 'polish', 'Invoice Payment Recorded (Sent to Customer) [polish]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('982', 'invoice', 'invoice-overdue-notice', 'polish', 'Invoice Overdue Notice [polish]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('983', 'invoice', 'invoice-already-send', 'polish', 'Invoice Already Sent to Customer [polish]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('984', 'ticket', 'new-ticket-created-staff', 'polish', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [polish]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('985', 'estimate', 'estimate-send-to-client', 'polish', 'Send Estimate to Customer [polish]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('986', 'ticket', 'ticket-reply-to-admin', 'polish', 'Ticket Reply (Sent to Staff) [polish]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('987', 'estimate', 'estimate-already-send', 'polish', 'Estimate Already Sent to Customer [polish]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('988', 'contract', 'contract-expiration', 'polish', 'Contract Expiration Reminder (Sent to Customer Contacts) [polish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('989', 'tasks', 'task-assigned', 'polish', 'New Task Assigned (Sent to Staff) [polish]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('990', 'tasks', 'task-added-as-follower', 'polish', 'Staff Member Added as Follower on Task (Sent to Staff) [polish]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('991', 'tasks', 'task-commented', 'polish', 'New Comment on Task (Sent to Staff) [polish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('992', 'tasks', 'task-added-attachment', 'polish', 'New Attachment(s) on Task (Sent to Staff) [polish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('993', 'estimate', 'estimate-declined-to-staff', 'polish', 'Estimate Declined (Sent to Staff) [polish]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('994', 'estimate', 'estimate-accepted-to-staff', 'polish', 'Estimate Accepted (Sent to Staff) [polish]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('995', 'proposals', 'proposal-client-accepted', 'polish', 'Customer Action - Accepted (Sent to Staff) [polish]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('996', 'proposals', 'proposal-send-to-customer', 'polish', 'Send Proposal to Customer [polish]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('997', 'proposals', 'proposal-client-declined', 'polish', 'Customer Action - Declined (Sent to Staff) [polish]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('998', 'proposals', 'proposal-client-thank-you', 'polish', 'Thank You Email (Sent to Customer After Accept) [polish]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('999', 'proposals', 'proposal-comment-to-client', 'polish', 'New Comment  (Sent to Customer/Lead) [polish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1000', 'proposals', 'proposal-comment-to-admin', 'polish', 'New Comment (Sent to Staff)  [polish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1001', 'estimate', 'estimate-thank-you-to-customer', 'polish', 'Thank You Email (Sent to Customer After Accept) [polish]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1002', 'tasks', 'task-deadline-notification', 'polish', 'Task Deadline Reminder - Sent to Assigned Members [polish]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1003', 'contract', 'send-contract', 'polish', 'Send Contract to Customer [polish]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1004', 'invoice', 'invoice-payment-recorded-to-staff', 'polish', 'Invoice Payment Recorded (Sent to Staff) [polish]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1005', 'ticket', 'auto-close-ticket', 'polish', 'Auto Close Ticket [polish]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1006', 'project', 'new-project-discussion-created-to-staff', 'polish', 'New Project Discussion (Sent to Project Members) [polish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1007', 'project', 'new-project-discussion-created-to-customer', 'polish', 'New Project Discussion (Sent to Customer Contacts) [polish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1008', 'project', 'new-project-file-uploaded-to-customer', 'polish', 'New Project File(s) Uploaded (Sent to Customer Contacts) [polish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1009', 'project', 'new-project-file-uploaded-to-staff', 'polish', 'New Project File(s) Uploaded (Sent to Project Members) [polish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1010', 'project', 'new-project-discussion-comment-to-customer', 'polish', 'New Discussion Comment  (Sent to Customer Contacts) [polish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1011', 'project', 'new-project-discussion-comment-to-staff', 'polish', 'New Discussion Comment (Sent to Project Members) [polish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1012', 'project', 'staff-added-as-project-member', 'polish', 'Staff Added as Project Member [polish]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1013', 'estimate', 'estimate-expiry-reminder', 'polish', 'Estimate Expiration Reminder [polish]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1014', 'proposals', 'proposal-expiry-reminder', 'polish', 'Proposal Expiration Reminder [polish]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1015', 'staff', 'new-staff-created', 'polish', 'New Staff Created (Welcome Email) [polish]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1016', 'client', 'contact-forgot-password', 'polish', 'Forgot Password [polish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1017', 'client', 'contact-password-reseted', 'polish', 'Password Reset - Confirmation [polish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1018', 'client', 'contact-set-password', 'polish', 'Set New Password [polish]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1019', 'staff', 'staff-forgot-password', 'polish', 'Forgot Password [polish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1020', 'staff', 'staff-password-reseted', 'polish', 'Password Reset - Confirmation [polish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1021', 'project', 'assigned-to-project', 'polish', 'New Project Created (Sent to Customer Contacts) [polish]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1022', 'tasks', 'task-added-attachment-to-contacts', 'polish', 'New Attachment(s) on Task (Sent to Customer Contacts) [polish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1023', 'tasks', 'task-commented-to-contacts', 'polish', 'New Comment on Task (Sent to Customer Contacts) [polish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1024', 'leads', 'new-lead-assigned', 'polish', 'New Lead Assigned to Staff Member [polish]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1025', 'client', 'client-statement', 'polish', 'Statement - Account Summary [polish]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1026', 'ticket', 'ticket-assigned-to-admin', 'polish', 'New Ticket Assigned (Sent to Staff) [polish]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1027', 'client', 'new-client-registered-to-admin', 'polish', 'New Customer Registration (Sent to admins) [polish]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1028', 'leads', 'new-web-to-lead-form-submitted', 'polish', 'Web to lead form submitted - Sent to lead [polish]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1029', 'staff', 'two-factor-authentication', 'polish', 'Two Factor Authentication [polish]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1030', 'project', 'project-finished-to-customer', 'polish', 'Project Marked as Finished (Sent to Customer Contacts) [polish]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1031', 'credit_note', 'credit-note-send-to-client', 'polish', 'Send Credit Note To Email [polish]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1032', 'tasks', 'task-status-change-to-staff', 'polish', 'Task Status Changed (Sent to Staff) [polish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1033', 'tasks', 'task-status-change-to-contacts', 'polish', 'Task Status Changed (Sent to Customer Contacts) [polish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1034', 'staff', 'reminder-email-staff', 'polish', 'Staff Reminder Email [polish]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1035', 'contract', 'contract-comment-to-client', 'polish', 'New Comment  (Sent to Customer Contacts) [polish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1036', 'contract', 'contract-comment-to-admin', 'polish', 'New Comment (Sent to Staff)  [polish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1037', 'subscriptions', 'send-subscription', 'polish', 'Send Subscription to Customer [polish]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1038', 'subscriptions', 'subscription-payment-failed', 'polish', 'Subscription Payment Failed [polish]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1039', 'subscriptions', 'subscription-canceled', 'polish', 'Subscription Canceled (Sent to customer primary contact) [polish]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1040', 'subscriptions', 'subscription-payment-succeeded', 'polish', 'Subscription Payment Succeeded (Sent to customer primary contact) [polish]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1041', 'contract', 'contract-expiration-to-staff', 'polish', 'Contract Expiration Reminder (Sent to Staff) [polish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1042', 'gdpr', 'gdpr-removal-request', 'polish', 'Removal Request From Contact (Sent to administrators) [polish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1043', 'gdpr', 'gdpr-removal-request-lead', 'polish', 'Removal Request From Lead (Sent to administrators) [polish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1044', 'client', 'client-registration-confirmed', 'polish', 'Customer Registration Confirmed [polish]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1045', 'contract', 'contract-signed-to-staff', 'polish', 'Contract Signed (Sent to Staff) [polish]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1046', 'subscriptions', 'customer-subscribed-to-staff', 'polish', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [polish]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1047', 'client', 'contact-verification-email', 'polish', 'Email Verification (Sent to Contact After Registration) [polish]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1048', 'client', 'new-customer-profile-file-uploaded-to-staff', 'polish', 'New Customer Profile File(s) Uploaded (Sent to Staff) [polish]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1049', 'staff', 'event-notification-to-staff', 'polish', 'Event Notification (Calendar) [polish]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1050', 'subscriptions', 'subscription-payment-requires-action', 'polish', 'Credit Card Authorization Required - SCA [polish]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1051', 'client', 'new-client-created', 'portuguese', 'New Contact Added/Registered (Welcome Email) [portuguese]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1052', 'invoice', 'invoice-send-to-client', 'portuguese', 'Send Invoice to Customer [portuguese]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1053', 'ticket', 'new-ticket-opened-admin', 'portuguese', 'New Ticket Opened (Opened by Staff, Sent to Customer) [portuguese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1054', 'ticket', 'ticket-reply', 'portuguese', 'Ticket Reply (Sent to Customer) [portuguese]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1055', 'ticket', 'ticket-autoresponse', 'portuguese', 'New Ticket Opened - Autoresponse [portuguese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1056', 'invoice', 'invoice-payment-recorded', 'portuguese', 'Invoice Payment Recorded (Sent to Customer) [portuguese]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1057', 'invoice', 'invoice-overdue-notice', 'portuguese', 'Invoice Overdue Notice [portuguese]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1058', 'invoice', 'invoice-already-send', 'portuguese', 'Invoice Already Sent to Customer [portuguese]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1059', 'ticket', 'new-ticket-created-staff', 'portuguese', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [portuguese]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1060', 'estimate', 'estimate-send-to-client', 'portuguese', 'Send Estimate to Customer [portuguese]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1061', 'ticket', 'ticket-reply-to-admin', 'portuguese', 'Ticket Reply (Sent to Staff) [portuguese]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1062', 'estimate', 'estimate-already-send', 'portuguese', 'Estimate Already Sent to Customer [portuguese]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1063', 'contract', 'contract-expiration', 'portuguese', 'Contract Expiration Reminder (Sent to Customer Contacts) [portuguese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1064', 'tasks', 'task-assigned', 'portuguese', 'New Task Assigned (Sent to Staff) [portuguese]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1065', 'tasks', 'task-added-as-follower', 'portuguese', 'Staff Member Added as Follower on Task (Sent to Staff) [portuguese]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1066', 'tasks', 'task-commented', 'portuguese', 'New Comment on Task (Sent to Staff) [portuguese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1067', 'tasks', 'task-added-attachment', 'portuguese', 'New Attachment(s) on Task (Sent to Staff) [portuguese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1068', 'estimate', 'estimate-declined-to-staff', 'portuguese', 'Estimate Declined (Sent to Staff) [portuguese]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1069', 'estimate', 'estimate-accepted-to-staff', 'portuguese', 'Estimate Accepted (Sent to Staff) [portuguese]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1070', 'proposals', 'proposal-client-accepted', 'portuguese', 'Customer Action - Accepted (Sent to Staff) [portuguese]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1071', 'proposals', 'proposal-send-to-customer', 'portuguese', 'Send Proposal to Customer [portuguese]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1072', 'proposals', 'proposal-client-declined', 'portuguese', 'Customer Action - Declined (Sent to Staff) [portuguese]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1073', 'proposals', 'proposal-client-thank-you', 'portuguese', 'Thank You Email (Sent to Customer After Accept) [portuguese]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1074', 'proposals', 'proposal-comment-to-client', 'portuguese', 'New Comment  (Sent to Customer/Lead) [portuguese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1075', 'proposals', 'proposal-comment-to-admin', 'portuguese', 'New Comment (Sent to Staff)  [portuguese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1076', 'estimate', 'estimate-thank-you-to-customer', 'portuguese', 'Thank You Email (Sent to Customer After Accept) [portuguese]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1077', 'tasks', 'task-deadline-notification', 'portuguese', 'Task Deadline Reminder - Sent to Assigned Members [portuguese]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1078', 'contract', 'send-contract', 'portuguese', 'Send Contract to Customer [portuguese]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1079', 'invoice', 'invoice-payment-recorded-to-staff', 'portuguese', 'Invoice Payment Recorded (Sent to Staff) [portuguese]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1080', 'ticket', 'auto-close-ticket', 'portuguese', 'Auto Close Ticket [portuguese]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1081', 'project', 'new-project-discussion-created-to-staff', 'portuguese', 'New Project Discussion (Sent to Project Members) [portuguese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1082', 'project', 'new-project-discussion-created-to-customer', 'portuguese', 'New Project Discussion (Sent to Customer Contacts) [portuguese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1083', 'project', 'new-project-file-uploaded-to-customer', 'portuguese', 'New Project File(s) Uploaded (Sent to Customer Contacts) [portuguese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1084', 'project', 'new-project-file-uploaded-to-staff', 'portuguese', 'New Project File(s) Uploaded (Sent to Project Members) [portuguese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1085', 'project', 'new-project-discussion-comment-to-customer', 'portuguese', 'New Discussion Comment  (Sent to Customer Contacts) [portuguese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1086', 'project', 'new-project-discussion-comment-to-staff', 'portuguese', 'New Discussion Comment (Sent to Project Members) [portuguese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1087', 'project', 'staff-added-as-project-member', 'portuguese', 'Staff Added as Project Member [portuguese]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1088', 'estimate', 'estimate-expiry-reminder', 'portuguese', 'Estimate Expiration Reminder [portuguese]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1089', 'proposals', 'proposal-expiry-reminder', 'portuguese', 'Proposal Expiration Reminder [portuguese]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1090', 'staff', 'new-staff-created', 'portuguese', 'New Staff Created (Welcome Email) [portuguese]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1091', 'client', 'contact-forgot-password', 'portuguese', 'Forgot Password [portuguese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1092', 'client', 'contact-password-reseted', 'portuguese', 'Password Reset - Confirmation [portuguese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1093', 'client', 'contact-set-password', 'portuguese', 'Set New Password [portuguese]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1094', 'staff', 'staff-forgot-password', 'portuguese', 'Forgot Password [portuguese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1095', 'staff', 'staff-password-reseted', 'portuguese', 'Password Reset - Confirmation [portuguese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1096', 'project', 'assigned-to-project', 'portuguese', 'New Project Created (Sent to Customer Contacts) [portuguese]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1097', 'tasks', 'task-added-attachment-to-contacts', 'portuguese', 'New Attachment(s) on Task (Sent to Customer Contacts) [portuguese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1098', 'tasks', 'task-commented-to-contacts', 'portuguese', 'New Comment on Task (Sent to Customer Contacts) [portuguese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1099', 'leads', 'new-lead-assigned', 'portuguese', 'New Lead Assigned to Staff Member [portuguese]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1100', 'client', 'client-statement', 'portuguese', 'Statement - Account Summary [portuguese]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1101', 'ticket', 'ticket-assigned-to-admin', 'portuguese', 'New Ticket Assigned (Sent to Staff) [portuguese]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1102', 'client', 'new-client-registered-to-admin', 'portuguese', 'New Customer Registration (Sent to admins) [portuguese]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1103', 'leads', 'new-web-to-lead-form-submitted', 'portuguese', 'Web to lead form submitted - Sent to lead [portuguese]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1104', 'staff', 'two-factor-authentication', 'portuguese', 'Two Factor Authentication [portuguese]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1105', 'project', 'project-finished-to-customer', 'portuguese', 'Project Marked as Finished (Sent to Customer Contacts) [portuguese]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1106', 'credit_note', 'credit-note-send-to-client', 'portuguese', 'Send Credit Note To Email [portuguese]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1107', 'tasks', 'task-status-change-to-staff', 'portuguese', 'Task Status Changed (Sent to Staff) [portuguese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1108', 'tasks', 'task-status-change-to-contacts', 'portuguese', 'Task Status Changed (Sent to Customer Contacts) [portuguese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1109', 'staff', 'reminder-email-staff', 'portuguese', 'Staff Reminder Email [portuguese]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1110', 'contract', 'contract-comment-to-client', 'portuguese', 'New Comment  (Sent to Customer Contacts) [portuguese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1111', 'contract', 'contract-comment-to-admin', 'portuguese', 'New Comment (Sent to Staff)  [portuguese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1112', 'subscriptions', 'send-subscription', 'portuguese', 'Send Subscription to Customer [portuguese]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1113', 'subscriptions', 'subscription-payment-failed', 'portuguese', 'Subscription Payment Failed [portuguese]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1114', 'subscriptions', 'subscription-canceled', 'portuguese', 'Subscription Canceled (Sent to customer primary contact) [portuguese]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1115', 'subscriptions', 'subscription-payment-succeeded', 'portuguese', 'Subscription Payment Succeeded (Sent to customer primary contact) [portuguese]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1116', 'contract', 'contract-expiration-to-staff', 'portuguese', 'Contract Expiration Reminder (Sent to Staff) [portuguese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1117', 'gdpr', 'gdpr-removal-request', 'portuguese', 'Removal Request From Contact (Sent to administrators) [portuguese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1118', 'gdpr', 'gdpr-removal-request-lead', 'portuguese', 'Removal Request From Lead (Sent to administrators) [portuguese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1119', 'client', 'client-registration-confirmed', 'portuguese', 'Customer Registration Confirmed [portuguese]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1120', 'contract', 'contract-signed-to-staff', 'portuguese', 'Contract Signed (Sent to Staff) [portuguese]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1121', 'subscriptions', 'customer-subscribed-to-staff', 'portuguese', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [portuguese]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1122', 'client', 'contact-verification-email', 'portuguese', 'Email Verification (Sent to Contact After Registration) [portuguese]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1123', 'client', 'new-customer-profile-file-uploaded-to-staff', 'portuguese', 'New Customer Profile File(s) Uploaded (Sent to Staff) [portuguese]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1124', 'staff', 'event-notification-to-staff', 'portuguese', 'Event Notification (Calendar) [portuguese]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1125', 'subscriptions', 'subscription-payment-requires-action', 'portuguese', 'Credit Card Authorization Required - SCA [portuguese]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1126', 'client', 'new-client-created', 'portuguese_br', 'New Contact Added/Registered (Welcome Email) [portuguese_br]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1127', 'invoice', 'invoice-send-to-client', 'portuguese_br', 'Send Invoice to Customer [portuguese_br]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1128', 'ticket', 'new-ticket-opened-admin', 'portuguese_br', 'New Ticket Opened (Opened by Staff, Sent to Customer) [portuguese_br]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1129', 'ticket', 'ticket-reply', 'portuguese_br', 'Ticket Reply (Sent to Customer) [portuguese_br]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1130', 'ticket', 'ticket-autoresponse', 'portuguese_br', 'New Ticket Opened - Autoresponse [portuguese_br]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1131', 'invoice', 'invoice-payment-recorded', 'portuguese_br', 'Invoice Payment Recorded (Sent to Customer) [portuguese_br]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1132', 'invoice', 'invoice-overdue-notice', 'portuguese_br', 'Invoice Overdue Notice [portuguese_br]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1133', 'invoice', 'invoice-already-send', 'portuguese_br', 'Invoice Already Sent to Customer [portuguese_br]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1134', 'ticket', 'new-ticket-created-staff', 'portuguese_br', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [portuguese_br]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1135', 'estimate', 'estimate-send-to-client', 'portuguese_br', 'Send Estimate to Customer [portuguese_br]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1136', 'ticket', 'ticket-reply-to-admin', 'portuguese_br', 'Ticket Reply (Sent to Staff) [portuguese_br]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1137', 'estimate', 'estimate-already-send', 'portuguese_br', 'Estimate Already Sent to Customer [portuguese_br]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1138', 'contract', 'contract-expiration', 'portuguese_br', 'Contract Expiration Reminder (Sent to Customer Contacts) [portuguese_br]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1139', 'tasks', 'task-assigned', 'portuguese_br', 'New Task Assigned (Sent to Staff) [portuguese_br]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1140', 'tasks', 'task-added-as-follower', 'portuguese_br', 'Staff Member Added as Follower on Task (Sent to Staff) [portuguese_br]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1141', 'tasks', 'task-commented', 'portuguese_br', 'New Comment on Task (Sent to Staff) [portuguese_br]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1142', 'tasks', 'task-added-attachment', 'portuguese_br', 'New Attachment(s) on Task (Sent to Staff) [portuguese_br]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1143', 'estimate', 'estimate-declined-to-staff', 'portuguese_br', 'Estimate Declined (Sent to Staff) [portuguese_br]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1144', 'estimate', 'estimate-accepted-to-staff', 'portuguese_br', 'Estimate Accepted (Sent to Staff) [portuguese_br]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1145', 'proposals', 'proposal-client-accepted', 'portuguese_br', 'Customer Action - Accepted (Sent to Staff) [portuguese_br]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1146', 'proposals', 'proposal-send-to-customer', 'portuguese_br', 'Send Proposal to Customer [portuguese_br]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1147', 'proposals', 'proposal-client-declined', 'portuguese_br', 'Customer Action - Declined (Sent to Staff) [portuguese_br]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1148', 'proposals', 'proposal-client-thank-you', 'portuguese_br', 'Thank You Email (Sent to Customer After Accept) [portuguese_br]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1149', 'proposals', 'proposal-comment-to-client', 'portuguese_br', 'New Comment  (Sent to Customer/Lead) [portuguese_br]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1150', 'proposals', 'proposal-comment-to-admin', 'portuguese_br', 'New Comment (Sent to Staff)  [portuguese_br]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1151', 'estimate', 'estimate-thank-you-to-customer', 'portuguese_br', 'Thank You Email (Sent to Customer After Accept) [portuguese_br]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1152', 'tasks', 'task-deadline-notification', 'portuguese_br', 'Task Deadline Reminder - Sent to Assigned Members [portuguese_br]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1153', 'contract', 'send-contract', 'portuguese_br', 'Send Contract to Customer [portuguese_br]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1154', 'invoice', 'invoice-payment-recorded-to-staff', 'portuguese_br', 'Invoice Payment Recorded (Sent to Staff) [portuguese_br]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1155', 'ticket', 'auto-close-ticket', 'portuguese_br', 'Auto Close Ticket [portuguese_br]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1156', 'project', 'new-project-discussion-created-to-staff', 'portuguese_br', 'New Project Discussion (Sent to Project Members) [portuguese_br]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1157', 'project', 'new-project-discussion-created-to-customer', 'portuguese_br', 'New Project Discussion (Sent to Customer Contacts) [portuguese_br]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1158', 'project', 'new-project-file-uploaded-to-customer', 'portuguese_br', 'New Project File(s) Uploaded (Sent to Customer Contacts) [portuguese_br]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1159', 'project', 'new-project-file-uploaded-to-staff', 'portuguese_br', 'New Project File(s) Uploaded (Sent to Project Members) [portuguese_br]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1160', 'project', 'new-project-discussion-comment-to-customer', 'portuguese_br', 'New Discussion Comment  (Sent to Customer Contacts) [portuguese_br]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1161', 'project', 'new-project-discussion-comment-to-staff', 'portuguese_br', 'New Discussion Comment (Sent to Project Members) [portuguese_br]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1162', 'project', 'staff-added-as-project-member', 'portuguese_br', 'Staff Added as Project Member [portuguese_br]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1163', 'estimate', 'estimate-expiry-reminder', 'portuguese_br', 'Estimate Expiration Reminder [portuguese_br]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1164', 'proposals', 'proposal-expiry-reminder', 'portuguese_br', 'Proposal Expiration Reminder [portuguese_br]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1165', 'staff', 'new-staff-created', 'portuguese_br', 'New Staff Created (Welcome Email) [portuguese_br]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1166', 'client', 'contact-forgot-password', 'portuguese_br', 'Forgot Password [portuguese_br]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1167', 'client', 'contact-password-reseted', 'portuguese_br', 'Password Reset - Confirmation [portuguese_br]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1168', 'client', 'contact-set-password', 'portuguese_br', 'Set New Password [portuguese_br]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1169', 'staff', 'staff-forgot-password', 'portuguese_br', 'Forgot Password [portuguese_br]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1170', 'staff', 'staff-password-reseted', 'portuguese_br', 'Password Reset - Confirmation [portuguese_br]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1171', 'project', 'assigned-to-project', 'portuguese_br', 'New Project Created (Sent to Customer Contacts) [portuguese_br]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1172', 'tasks', 'task-added-attachment-to-contacts', 'portuguese_br', 'New Attachment(s) on Task (Sent to Customer Contacts) [portuguese_br]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1173', 'tasks', 'task-commented-to-contacts', 'portuguese_br', 'New Comment on Task (Sent to Customer Contacts) [portuguese_br]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1174', 'leads', 'new-lead-assigned', 'portuguese_br', 'New Lead Assigned to Staff Member [portuguese_br]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1175', 'client', 'client-statement', 'portuguese_br', 'Statement - Account Summary [portuguese_br]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1176', 'ticket', 'ticket-assigned-to-admin', 'portuguese_br', 'New Ticket Assigned (Sent to Staff) [portuguese_br]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1177', 'client', 'new-client-registered-to-admin', 'portuguese_br', 'New Customer Registration (Sent to admins) [portuguese_br]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1178', 'leads', 'new-web-to-lead-form-submitted', 'portuguese_br', 'Web to lead form submitted - Sent to lead [portuguese_br]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1179', 'staff', 'two-factor-authentication', 'portuguese_br', 'Two Factor Authentication [portuguese_br]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1180', 'project', 'project-finished-to-customer', 'portuguese_br', 'Project Marked as Finished (Sent to Customer Contacts) [portuguese_br]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1181', 'credit_note', 'credit-note-send-to-client', 'portuguese_br', 'Send Credit Note To Email [portuguese_br]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1182', 'tasks', 'task-status-change-to-staff', 'portuguese_br', 'Task Status Changed (Sent to Staff) [portuguese_br]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1183', 'tasks', 'task-status-change-to-contacts', 'portuguese_br', 'Task Status Changed (Sent to Customer Contacts) [portuguese_br]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1184', 'staff', 'reminder-email-staff', 'portuguese_br', 'Staff Reminder Email [portuguese_br]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1185', 'contract', 'contract-comment-to-client', 'portuguese_br', 'New Comment  (Sent to Customer Contacts) [portuguese_br]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1186', 'contract', 'contract-comment-to-admin', 'portuguese_br', 'New Comment (Sent to Staff)  [portuguese_br]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1187', 'subscriptions', 'send-subscription', 'portuguese_br', 'Send Subscription to Customer [portuguese_br]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1188', 'subscriptions', 'subscription-payment-failed', 'portuguese_br', 'Subscription Payment Failed [portuguese_br]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1189', 'subscriptions', 'subscription-canceled', 'portuguese_br', 'Subscription Canceled (Sent to customer primary contact) [portuguese_br]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1190', 'subscriptions', 'subscription-payment-succeeded', 'portuguese_br', 'Subscription Payment Succeeded (Sent to customer primary contact) [portuguese_br]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1191', 'contract', 'contract-expiration-to-staff', 'portuguese_br', 'Contract Expiration Reminder (Sent to Staff) [portuguese_br]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1192', 'gdpr', 'gdpr-removal-request', 'portuguese_br', 'Removal Request From Contact (Sent to administrators) [portuguese_br]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1193', 'gdpr', 'gdpr-removal-request-lead', 'portuguese_br', 'Removal Request From Lead (Sent to administrators) [portuguese_br]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1194', 'client', 'client-registration-confirmed', 'portuguese_br', 'Customer Registration Confirmed [portuguese_br]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1195', 'contract', 'contract-signed-to-staff', 'portuguese_br', 'Contract Signed (Sent to Staff) [portuguese_br]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1196', 'subscriptions', 'customer-subscribed-to-staff', 'portuguese_br', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [portuguese_br]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1197', 'client', 'contact-verification-email', 'portuguese_br', 'Email Verification (Sent to Contact After Registration) [portuguese_br]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1198', 'client', 'new-customer-profile-file-uploaded-to-staff', 'portuguese_br', 'New Customer Profile File(s) Uploaded (Sent to Staff) [portuguese_br]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1199', 'staff', 'event-notification-to-staff', 'portuguese_br', 'Event Notification (Calendar) [portuguese_br]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1200', 'subscriptions', 'subscription-payment-requires-action', 'portuguese_br', 'Credit Card Authorization Required - SCA [portuguese_br]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1201', 'client', 'new-client-created', 'romanian', 'New Contact Added/Registered (Welcome Email) [romanian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1202', 'invoice', 'invoice-send-to-client', 'romanian', 'Send Invoice to Customer [romanian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1203', 'ticket', 'new-ticket-opened-admin', 'romanian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [romanian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1204', 'ticket', 'ticket-reply', 'romanian', 'Ticket Reply (Sent to Customer) [romanian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1205', 'ticket', 'ticket-autoresponse', 'romanian', 'New Ticket Opened - Autoresponse [romanian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1206', 'invoice', 'invoice-payment-recorded', 'romanian', 'Invoice Payment Recorded (Sent to Customer) [romanian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1207', 'invoice', 'invoice-overdue-notice', 'romanian', 'Invoice Overdue Notice [romanian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1208', 'invoice', 'invoice-already-send', 'romanian', 'Invoice Already Sent to Customer [romanian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1209', 'ticket', 'new-ticket-created-staff', 'romanian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [romanian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1210', 'estimate', 'estimate-send-to-client', 'romanian', 'Send Estimate to Customer [romanian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1211', 'ticket', 'ticket-reply-to-admin', 'romanian', 'Ticket Reply (Sent to Staff) [romanian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1212', 'estimate', 'estimate-already-send', 'romanian', 'Estimate Already Sent to Customer [romanian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1213', 'contract', 'contract-expiration', 'romanian', 'Contract Expiration Reminder (Sent to Customer Contacts) [romanian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1214', 'tasks', 'task-assigned', 'romanian', 'New Task Assigned (Sent to Staff) [romanian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1215', 'tasks', 'task-added-as-follower', 'romanian', 'Staff Member Added as Follower on Task (Sent to Staff) [romanian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1216', 'tasks', 'task-commented', 'romanian', 'New Comment on Task (Sent to Staff) [romanian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1217', 'tasks', 'task-added-attachment', 'romanian', 'New Attachment(s) on Task (Sent to Staff) [romanian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1218', 'estimate', 'estimate-declined-to-staff', 'romanian', 'Estimate Declined (Sent to Staff) [romanian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1219', 'estimate', 'estimate-accepted-to-staff', 'romanian', 'Estimate Accepted (Sent to Staff) [romanian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1220', 'proposals', 'proposal-client-accepted', 'romanian', 'Customer Action - Accepted (Sent to Staff) [romanian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1221', 'proposals', 'proposal-send-to-customer', 'romanian', 'Send Proposal to Customer [romanian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1222', 'proposals', 'proposal-client-declined', 'romanian', 'Customer Action - Declined (Sent to Staff) [romanian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1223', 'proposals', 'proposal-client-thank-you', 'romanian', 'Thank You Email (Sent to Customer After Accept) [romanian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1224', 'proposals', 'proposal-comment-to-client', 'romanian', 'New Comment  (Sent to Customer/Lead) [romanian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1225', 'proposals', 'proposal-comment-to-admin', 'romanian', 'New Comment (Sent to Staff)  [romanian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1226', 'estimate', 'estimate-thank-you-to-customer', 'romanian', 'Thank You Email (Sent to Customer After Accept) [romanian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1227', 'tasks', 'task-deadline-notification', 'romanian', 'Task Deadline Reminder - Sent to Assigned Members [romanian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1228', 'contract', 'send-contract', 'romanian', 'Send Contract to Customer [romanian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1229', 'invoice', 'invoice-payment-recorded-to-staff', 'romanian', 'Invoice Payment Recorded (Sent to Staff) [romanian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1230', 'ticket', 'auto-close-ticket', 'romanian', 'Auto Close Ticket [romanian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1231', 'project', 'new-project-discussion-created-to-staff', 'romanian', 'New Project Discussion (Sent to Project Members) [romanian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1232', 'project', 'new-project-discussion-created-to-customer', 'romanian', 'New Project Discussion (Sent to Customer Contacts) [romanian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1233', 'project', 'new-project-file-uploaded-to-customer', 'romanian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [romanian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1234', 'project', 'new-project-file-uploaded-to-staff', 'romanian', 'New Project File(s) Uploaded (Sent to Project Members) [romanian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1235', 'project', 'new-project-discussion-comment-to-customer', 'romanian', 'New Discussion Comment  (Sent to Customer Contacts) [romanian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1236', 'project', 'new-project-discussion-comment-to-staff', 'romanian', 'New Discussion Comment (Sent to Project Members) [romanian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1237', 'project', 'staff-added-as-project-member', 'romanian', 'Staff Added as Project Member [romanian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1238', 'estimate', 'estimate-expiry-reminder', 'romanian', 'Estimate Expiration Reminder [romanian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1239', 'proposals', 'proposal-expiry-reminder', 'romanian', 'Proposal Expiration Reminder [romanian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1240', 'staff', 'new-staff-created', 'romanian', 'New Staff Created (Welcome Email) [romanian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1241', 'client', 'contact-forgot-password', 'romanian', 'Forgot Password [romanian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1242', 'client', 'contact-password-reseted', 'romanian', 'Password Reset - Confirmation [romanian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1243', 'client', 'contact-set-password', 'romanian', 'Set New Password [romanian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1244', 'staff', 'staff-forgot-password', 'romanian', 'Forgot Password [romanian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1245', 'staff', 'staff-password-reseted', 'romanian', 'Password Reset - Confirmation [romanian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1246', 'project', 'assigned-to-project', 'romanian', 'New Project Created (Sent to Customer Contacts) [romanian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1247', 'tasks', 'task-added-attachment-to-contacts', 'romanian', 'New Attachment(s) on Task (Sent to Customer Contacts) [romanian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1248', 'tasks', 'task-commented-to-contacts', 'romanian', 'New Comment on Task (Sent to Customer Contacts) [romanian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1249', 'leads', 'new-lead-assigned', 'romanian', 'New Lead Assigned to Staff Member [romanian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1250', 'client', 'client-statement', 'romanian', 'Statement - Account Summary [romanian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1251', 'ticket', 'ticket-assigned-to-admin', 'romanian', 'New Ticket Assigned (Sent to Staff) [romanian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1252', 'client', 'new-client-registered-to-admin', 'romanian', 'New Customer Registration (Sent to admins) [romanian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1253', 'leads', 'new-web-to-lead-form-submitted', 'romanian', 'Web to lead form submitted - Sent to lead [romanian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1254', 'staff', 'two-factor-authentication', 'romanian', 'Two Factor Authentication [romanian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1255', 'project', 'project-finished-to-customer', 'romanian', 'Project Marked as Finished (Sent to Customer Contacts) [romanian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1256', 'credit_note', 'credit-note-send-to-client', 'romanian', 'Send Credit Note To Email [romanian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1257', 'tasks', 'task-status-change-to-staff', 'romanian', 'Task Status Changed (Sent to Staff) [romanian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1258', 'tasks', 'task-status-change-to-contacts', 'romanian', 'Task Status Changed (Sent to Customer Contacts) [romanian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1259', 'staff', 'reminder-email-staff', 'romanian', 'Staff Reminder Email [romanian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1260', 'contract', 'contract-comment-to-client', 'romanian', 'New Comment  (Sent to Customer Contacts) [romanian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1261', 'contract', 'contract-comment-to-admin', 'romanian', 'New Comment (Sent to Staff)  [romanian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1262', 'subscriptions', 'send-subscription', 'romanian', 'Send Subscription to Customer [romanian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1263', 'subscriptions', 'subscription-payment-failed', 'romanian', 'Subscription Payment Failed [romanian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1264', 'subscriptions', 'subscription-canceled', 'romanian', 'Subscription Canceled (Sent to customer primary contact) [romanian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1265', 'subscriptions', 'subscription-payment-succeeded', 'romanian', 'Subscription Payment Succeeded (Sent to customer primary contact) [romanian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1266', 'contract', 'contract-expiration-to-staff', 'romanian', 'Contract Expiration Reminder (Sent to Staff) [romanian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1267', 'gdpr', 'gdpr-removal-request', 'romanian', 'Removal Request From Contact (Sent to administrators) [romanian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1268', 'gdpr', 'gdpr-removal-request-lead', 'romanian', 'Removal Request From Lead (Sent to administrators) [romanian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1269', 'client', 'client-registration-confirmed', 'romanian', 'Customer Registration Confirmed [romanian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1270', 'contract', 'contract-signed-to-staff', 'romanian', 'Contract Signed (Sent to Staff) [romanian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1271', 'subscriptions', 'customer-subscribed-to-staff', 'romanian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [romanian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1272', 'client', 'contact-verification-email', 'romanian', 'Email Verification (Sent to Contact After Registration) [romanian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1273', 'client', 'new-customer-profile-file-uploaded-to-staff', 'romanian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [romanian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1274', 'staff', 'event-notification-to-staff', 'romanian', 'Event Notification (Calendar) [romanian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1275', 'subscriptions', 'subscription-payment-requires-action', 'romanian', 'Credit Card Authorization Required - SCA [romanian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1276', 'client', 'new-client-created', 'russian', 'New Contact Added/Registered (Welcome Email) [russian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1277', 'invoice', 'invoice-send-to-client', 'russian', 'Send Invoice to Customer [russian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1278', 'ticket', 'new-ticket-opened-admin', 'russian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [russian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1279', 'ticket', 'ticket-reply', 'russian', 'Ticket Reply (Sent to Customer) [russian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1280', 'ticket', 'ticket-autoresponse', 'russian', 'New Ticket Opened - Autoresponse [russian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1281', 'invoice', 'invoice-payment-recorded', 'russian', 'Invoice Payment Recorded (Sent to Customer) [russian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1282', 'invoice', 'invoice-overdue-notice', 'russian', 'Invoice Overdue Notice [russian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1283', 'invoice', 'invoice-already-send', 'russian', 'Invoice Already Sent to Customer [russian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1284', 'ticket', 'new-ticket-created-staff', 'russian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [russian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1285', 'estimate', 'estimate-send-to-client', 'russian', 'Send Estimate to Customer [russian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1286', 'ticket', 'ticket-reply-to-admin', 'russian', 'Ticket Reply (Sent to Staff) [russian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1287', 'estimate', 'estimate-already-send', 'russian', 'Estimate Already Sent to Customer [russian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1288', 'contract', 'contract-expiration', 'russian', 'Contract Expiration Reminder (Sent to Customer Contacts) [russian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1289', 'tasks', 'task-assigned', 'russian', 'New Task Assigned (Sent to Staff) [russian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1290', 'tasks', 'task-added-as-follower', 'russian', 'Staff Member Added as Follower on Task (Sent to Staff) [russian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1291', 'tasks', 'task-commented', 'russian', 'New Comment on Task (Sent to Staff) [russian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1292', 'tasks', 'task-added-attachment', 'russian', 'New Attachment(s) on Task (Sent to Staff) [russian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1293', 'estimate', 'estimate-declined-to-staff', 'russian', 'Estimate Declined (Sent to Staff) [russian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1294', 'estimate', 'estimate-accepted-to-staff', 'russian', 'Estimate Accepted (Sent to Staff) [russian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1295', 'proposals', 'proposal-client-accepted', 'russian', 'Customer Action - Accepted (Sent to Staff) [russian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1296', 'proposals', 'proposal-send-to-customer', 'russian', 'Send Proposal to Customer [russian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1297', 'proposals', 'proposal-client-declined', 'russian', 'Customer Action - Declined (Sent to Staff) [russian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1298', 'proposals', 'proposal-client-thank-you', 'russian', 'Thank You Email (Sent to Customer After Accept) [russian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1299', 'proposals', 'proposal-comment-to-client', 'russian', 'New Comment  (Sent to Customer/Lead) [russian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1300', 'proposals', 'proposal-comment-to-admin', 'russian', 'New Comment (Sent to Staff)  [russian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1301', 'estimate', 'estimate-thank-you-to-customer', 'russian', 'Thank You Email (Sent to Customer After Accept) [russian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1302', 'tasks', 'task-deadline-notification', 'russian', 'Task Deadline Reminder - Sent to Assigned Members [russian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1303', 'contract', 'send-contract', 'russian', 'Send Contract to Customer [russian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1304', 'invoice', 'invoice-payment-recorded-to-staff', 'russian', 'Invoice Payment Recorded (Sent to Staff) [russian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1305', 'ticket', 'auto-close-ticket', 'russian', 'Auto Close Ticket [russian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1306', 'project', 'new-project-discussion-created-to-staff', 'russian', 'New Project Discussion (Sent to Project Members) [russian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1307', 'project', 'new-project-discussion-created-to-customer', 'russian', 'New Project Discussion (Sent to Customer Contacts) [russian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1308', 'project', 'new-project-file-uploaded-to-customer', 'russian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [russian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1309', 'project', 'new-project-file-uploaded-to-staff', 'russian', 'New Project File(s) Uploaded (Sent to Project Members) [russian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1310', 'project', 'new-project-discussion-comment-to-customer', 'russian', 'New Discussion Comment  (Sent to Customer Contacts) [russian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1311', 'project', 'new-project-discussion-comment-to-staff', 'russian', 'New Discussion Comment (Sent to Project Members) [russian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1312', 'project', 'staff-added-as-project-member', 'russian', 'Staff Added as Project Member [russian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1313', 'estimate', 'estimate-expiry-reminder', 'russian', 'Estimate Expiration Reminder [russian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1314', 'proposals', 'proposal-expiry-reminder', 'russian', 'Proposal Expiration Reminder [russian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1315', 'staff', 'new-staff-created', 'russian', 'New Staff Created (Welcome Email) [russian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1316', 'client', 'contact-forgot-password', 'russian', 'Forgot Password [russian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1317', 'client', 'contact-password-reseted', 'russian', 'Password Reset - Confirmation [russian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1318', 'client', 'contact-set-password', 'russian', 'Set New Password [russian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1319', 'staff', 'staff-forgot-password', 'russian', 'Forgot Password [russian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1320', 'staff', 'staff-password-reseted', 'russian', 'Password Reset - Confirmation [russian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1321', 'project', 'assigned-to-project', 'russian', 'New Project Created (Sent to Customer Contacts) [russian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1322', 'tasks', 'task-added-attachment-to-contacts', 'russian', 'New Attachment(s) on Task (Sent to Customer Contacts) [russian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1323', 'tasks', 'task-commented-to-contacts', 'russian', 'New Comment on Task (Sent to Customer Contacts) [russian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1324', 'leads', 'new-lead-assigned', 'russian', 'New Lead Assigned to Staff Member [russian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1325', 'client', 'client-statement', 'russian', 'Statement - Account Summary [russian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1326', 'ticket', 'ticket-assigned-to-admin', 'russian', 'New Ticket Assigned (Sent to Staff) [russian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1327', 'client', 'new-client-registered-to-admin', 'russian', 'New Customer Registration (Sent to admins) [russian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1328', 'leads', 'new-web-to-lead-form-submitted', 'russian', 'Web to lead form submitted - Sent to lead [russian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1329', 'staff', 'two-factor-authentication', 'russian', 'Two Factor Authentication [russian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1330', 'project', 'project-finished-to-customer', 'russian', 'Project Marked as Finished (Sent to Customer Contacts) [russian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1331', 'credit_note', 'credit-note-send-to-client', 'russian', 'Send Credit Note To Email [russian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1332', 'tasks', 'task-status-change-to-staff', 'russian', 'Task Status Changed (Sent to Staff) [russian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1333', 'tasks', 'task-status-change-to-contacts', 'russian', 'Task Status Changed (Sent to Customer Contacts) [russian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1334', 'staff', 'reminder-email-staff', 'russian', 'Staff Reminder Email [russian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1335', 'contract', 'contract-comment-to-client', 'russian', 'New Comment  (Sent to Customer Contacts) [russian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1336', 'contract', 'contract-comment-to-admin', 'russian', 'New Comment (Sent to Staff)  [russian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1337', 'subscriptions', 'send-subscription', 'russian', 'Send Subscription to Customer [russian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1338', 'subscriptions', 'subscription-payment-failed', 'russian', 'Subscription Payment Failed [russian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1339', 'subscriptions', 'subscription-canceled', 'russian', 'Subscription Canceled (Sent to customer primary contact) [russian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1340', 'subscriptions', 'subscription-payment-succeeded', 'russian', 'Subscription Payment Succeeded (Sent to customer primary contact) [russian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1341', 'contract', 'contract-expiration-to-staff', 'russian', 'Contract Expiration Reminder (Sent to Staff) [russian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1342', 'gdpr', 'gdpr-removal-request', 'russian', 'Removal Request From Contact (Sent to administrators) [russian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1343', 'gdpr', 'gdpr-removal-request-lead', 'russian', 'Removal Request From Lead (Sent to administrators) [russian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1344', 'client', 'client-registration-confirmed', 'russian', 'Customer Registration Confirmed [russian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1345', 'contract', 'contract-signed-to-staff', 'russian', 'Contract Signed (Sent to Staff) [russian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1346', 'subscriptions', 'customer-subscribed-to-staff', 'russian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [russian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1347', 'client', 'contact-verification-email', 'russian', 'Email Verification (Sent to Contact After Registration) [russian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1348', 'client', 'new-customer-profile-file-uploaded-to-staff', 'russian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [russian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1349', 'staff', 'event-notification-to-staff', 'russian', 'Event Notification (Calendar) [russian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1350', 'subscriptions', 'subscription-payment-requires-action', 'russian', 'Credit Card Authorization Required - SCA [russian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1351', 'client', 'new-client-created', 'slovak', 'New Contact Added/Registered (Welcome Email) [slovak]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1352', 'invoice', 'invoice-send-to-client', 'slovak', 'Send Invoice to Customer [slovak]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1353', 'ticket', 'new-ticket-opened-admin', 'slovak', 'New Ticket Opened (Opened by Staff, Sent to Customer) [slovak]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1354', 'ticket', 'ticket-reply', 'slovak', 'Ticket Reply (Sent to Customer) [slovak]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1355', 'ticket', 'ticket-autoresponse', 'slovak', 'New Ticket Opened - Autoresponse [slovak]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1356', 'invoice', 'invoice-payment-recorded', 'slovak', 'Invoice Payment Recorded (Sent to Customer) [slovak]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1357', 'invoice', 'invoice-overdue-notice', 'slovak', 'Invoice Overdue Notice [slovak]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1358', 'invoice', 'invoice-already-send', 'slovak', 'Invoice Already Sent to Customer [slovak]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1359', 'ticket', 'new-ticket-created-staff', 'slovak', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [slovak]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1360', 'estimate', 'estimate-send-to-client', 'slovak', 'Send Estimate to Customer [slovak]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1361', 'ticket', 'ticket-reply-to-admin', 'slovak', 'Ticket Reply (Sent to Staff) [slovak]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1362', 'estimate', 'estimate-already-send', 'slovak', 'Estimate Already Sent to Customer [slovak]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1363', 'contract', 'contract-expiration', 'slovak', 'Contract Expiration Reminder (Sent to Customer Contacts) [slovak]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1364', 'tasks', 'task-assigned', 'slovak', 'New Task Assigned (Sent to Staff) [slovak]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1365', 'tasks', 'task-added-as-follower', 'slovak', 'Staff Member Added as Follower on Task (Sent to Staff) [slovak]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1366', 'tasks', 'task-commented', 'slovak', 'New Comment on Task (Sent to Staff) [slovak]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1367', 'tasks', 'task-added-attachment', 'slovak', 'New Attachment(s) on Task (Sent to Staff) [slovak]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1368', 'estimate', 'estimate-declined-to-staff', 'slovak', 'Estimate Declined (Sent to Staff) [slovak]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1369', 'estimate', 'estimate-accepted-to-staff', 'slovak', 'Estimate Accepted (Sent to Staff) [slovak]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1370', 'proposals', 'proposal-client-accepted', 'slovak', 'Customer Action - Accepted (Sent to Staff) [slovak]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1371', 'proposals', 'proposal-send-to-customer', 'slovak', 'Send Proposal to Customer [slovak]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1372', 'proposals', 'proposal-client-declined', 'slovak', 'Customer Action - Declined (Sent to Staff) [slovak]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1373', 'proposals', 'proposal-client-thank-you', 'slovak', 'Thank You Email (Sent to Customer After Accept) [slovak]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1374', 'proposals', 'proposal-comment-to-client', 'slovak', 'New Comment  (Sent to Customer/Lead) [slovak]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1375', 'proposals', 'proposal-comment-to-admin', 'slovak', 'New Comment (Sent to Staff)  [slovak]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1376', 'estimate', 'estimate-thank-you-to-customer', 'slovak', 'Thank You Email (Sent to Customer After Accept) [slovak]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1377', 'tasks', 'task-deadline-notification', 'slovak', 'Task Deadline Reminder - Sent to Assigned Members [slovak]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1378', 'contract', 'send-contract', 'slovak', 'Send Contract to Customer [slovak]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1379', 'invoice', 'invoice-payment-recorded-to-staff', 'slovak', 'Invoice Payment Recorded (Sent to Staff) [slovak]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1380', 'ticket', 'auto-close-ticket', 'slovak', 'Auto Close Ticket [slovak]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1381', 'project', 'new-project-discussion-created-to-staff', 'slovak', 'New Project Discussion (Sent to Project Members) [slovak]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1382', 'project', 'new-project-discussion-created-to-customer', 'slovak', 'New Project Discussion (Sent to Customer Contacts) [slovak]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1383', 'project', 'new-project-file-uploaded-to-customer', 'slovak', 'New Project File(s) Uploaded (Sent to Customer Contacts) [slovak]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1384', 'project', 'new-project-file-uploaded-to-staff', 'slovak', 'New Project File(s) Uploaded (Sent to Project Members) [slovak]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1385', 'project', 'new-project-discussion-comment-to-customer', 'slovak', 'New Discussion Comment  (Sent to Customer Contacts) [slovak]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1386', 'project', 'new-project-discussion-comment-to-staff', 'slovak', 'New Discussion Comment (Sent to Project Members) [slovak]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1387', 'project', 'staff-added-as-project-member', 'slovak', 'Staff Added as Project Member [slovak]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1388', 'estimate', 'estimate-expiry-reminder', 'slovak', 'Estimate Expiration Reminder [slovak]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1389', 'proposals', 'proposal-expiry-reminder', 'slovak', 'Proposal Expiration Reminder [slovak]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1390', 'staff', 'new-staff-created', 'slovak', 'New Staff Created (Welcome Email) [slovak]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1391', 'client', 'contact-forgot-password', 'slovak', 'Forgot Password [slovak]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1392', 'client', 'contact-password-reseted', 'slovak', 'Password Reset - Confirmation [slovak]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1393', 'client', 'contact-set-password', 'slovak', 'Set New Password [slovak]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1394', 'staff', 'staff-forgot-password', 'slovak', 'Forgot Password [slovak]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1395', 'staff', 'staff-password-reseted', 'slovak', 'Password Reset - Confirmation [slovak]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1396', 'project', 'assigned-to-project', 'slovak', 'New Project Created (Sent to Customer Contacts) [slovak]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1397', 'tasks', 'task-added-attachment-to-contacts', 'slovak', 'New Attachment(s) on Task (Sent to Customer Contacts) [slovak]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1398', 'tasks', 'task-commented-to-contacts', 'slovak', 'New Comment on Task (Sent to Customer Contacts) [slovak]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1399', 'leads', 'new-lead-assigned', 'slovak', 'New Lead Assigned to Staff Member [slovak]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1400', 'client', 'client-statement', 'slovak', 'Statement - Account Summary [slovak]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1401', 'ticket', 'ticket-assigned-to-admin', 'slovak', 'New Ticket Assigned (Sent to Staff) [slovak]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1402', 'client', 'new-client-registered-to-admin', 'slovak', 'New Customer Registration (Sent to admins) [slovak]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1403', 'leads', 'new-web-to-lead-form-submitted', 'slovak', 'Web to lead form submitted - Sent to lead [slovak]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1404', 'staff', 'two-factor-authentication', 'slovak', 'Two Factor Authentication [slovak]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1405', 'project', 'project-finished-to-customer', 'slovak', 'Project Marked as Finished (Sent to Customer Contacts) [slovak]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1406', 'credit_note', 'credit-note-send-to-client', 'slovak', 'Send Credit Note To Email [slovak]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1407', 'tasks', 'task-status-change-to-staff', 'slovak', 'Task Status Changed (Sent to Staff) [slovak]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1408', 'tasks', 'task-status-change-to-contacts', 'slovak', 'Task Status Changed (Sent to Customer Contacts) [slovak]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1409', 'staff', 'reminder-email-staff', 'slovak', 'Staff Reminder Email [slovak]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1410', 'contract', 'contract-comment-to-client', 'slovak', 'New Comment  (Sent to Customer Contacts) [slovak]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1411', 'contract', 'contract-comment-to-admin', 'slovak', 'New Comment (Sent to Staff)  [slovak]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1412', 'subscriptions', 'send-subscription', 'slovak', 'Send Subscription to Customer [slovak]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1413', 'subscriptions', 'subscription-payment-failed', 'slovak', 'Subscription Payment Failed [slovak]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1414', 'subscriptions', 'subscription-canceled', 'slovak', 'Subscription Canceled (Sent to customer primary contact) [slovak]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1415', 'subscriptions', 'subscription-payment-succeeded', 'slovak', 'Subscription Payment Succeeded (Sent to customer primary contact) [slovak]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1416', 'contract', 'contract-expiration-to-staff', 'slovak', 'Contract Expiration Reminder (Sent to Staff) [slovak]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1417', 'gdpr', 'gdpr-removal-request', 'slovak', 'Removal Request From Contact (Sent to administrators) [slovak]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1418', 'gdpr', 'gdpr-removal-request-lead', 'slovak', 'Removal Request From Lead (Sent to administrators) [slovak]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1419', 'client', 'client-registration-confirmed', 'slovak', 'Customer Registration Confirmed [slovak]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1420', 'contract', 'contract-signed-to-staff', 'slovak', 'Contract Signed (Sent to Staff) [slovak]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1421', 'subscriptions', 'customer-subscribed-to-staff', 'slovak', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [slovak]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1422', 'client', 'contact-verification-email', 'slovak', 'Email Verification (Sent to Contact After Registration) [slovak]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1423', 'client', 'new-customer-profile-file-uploaded-to-staff', 'slovak', 'New Customer Profile File(s) Uploaded (Sent to Staff) [slovak]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1424', 'staff', 'event-notification-to-staff', 'slovak', 'Event Notification (Calendar) [slovak]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1425', 'subscriptions', 'subscription-payment-requires-action', 'slovak', 'Credit Card Authorization Required - SCA [slovak]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1426', 'client', 'new-client-created', 'spanish', 'New Contact Added/Registered (Welcome Email) [spanish]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1427', 'invoice', 'invoice-send-to-client', 'spanish', 'Send Invoice to Customer [spanish]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1428', 'ticket', 'new-ticket-opened-admin', 'spanish', 'New Ticket Opened (Opened by Staff, Sent to Customer) [spanish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1429', 'ticket', 'ticket-reply', 'spanish', 'Ticket Reply (Sent to Customer) [spanish]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1430', 'ticket', 'ticket-autoresponse', 'spanish', 'New Ticket Opened - Autoresponse [spanish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1431', 'invoice', 'invoice-payment-recorded', 'spanish', 'Invoice Payment Recorded (Sent to Customer) [spanish]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1432', 'invoice', 'invoice-overdue-notice', 'spanish', 'Invoice Overdue Notice [spanish]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1433', 'invoice', 'invoice-already-send', 'spanish', 'Invoice Already Sent to Customer [spanish]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1434', 'ticket', 'new-ticket-created-staff', 'spanish', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [spanish]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1435', 'estimate', 'estimate-send-to-client', 'spanish', 'Send Estimate to Customer [spanish]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1436', 'ticket', 'ticket-reply-to-admin', 'spanish', 'Ticket Reply (Sent to Staff) [spanish]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1437', 'estimate', 'estimate-already-send', 'spanish', 'Estimate Already Sent to Customer [spanish]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1438', 'contract', 'contract-expiration', 'spanish', 'Contract Expiration Reminder (Sent to Customer Contacts) [spanish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1439', 'tasks', 'task-assigned', 'spanish', 'New Task Assigned (Sent to Staff) [spanish]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1440', 'tasks', 'task-added-as-follower', 'spanish', 'Staff Member Added as Follower on Task (Sent to Staff) [spanish]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1441', 'tasks', 'task-commented', 'spanish', 'New Comment on Task (Sent to Staff) [spanish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1442', 'tasks', 'task-added-attachment', 'spanish', 'New Attachment(s) on Task (Sent to Staff) [spanish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1443', 'estimate', 'estimate-declined-to-staff', 'spanish', 'Estimate Declined (Sent to Staff) [spanish]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1444', 'estimate', 'estimate-accepted-to-staff', 'spanish', 'Estimate Accepted (Sent to Staff) [spanish]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1445', 'proposals', 'proposal-client-accepted', 'spanish', 'Customer Action - Accepted (Sent to Staff) [spanish]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1446', 'proposals', 'proposal-send-to-customer', 'spanish', 'Send Proposal to Customer [spanish]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1447', 'proposals', 'proposal-client-declined', 'spanish', 'Customer Action - Declined (Sent to Staff) [spanish]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1448', 'proposals', 'proposal-client-thank-you', 'spanish', 'Thank You Email (Sent to Customer After Accept) [spanish]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1449', 'proposals', 'proposal-comment-to-client', 'spanish', 'New Comment  (Sent to Customer/Lead) [spanish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1450', 'proposals', 'proposal-comment-to-admin', 'spanish', 'New Comment (Sent to Staff)  [spanish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1451', 'estimate', 'estimate-thank-you-to-customer', 'spanish', 'Thank You Email (Sent to Customer After Accept) [spanish]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1452', 'tasks', 'task-deadline-notification', 'spanish', 'Task Deadline Reminder - Sent to Assigned Members [spanish]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1453', 'contract', 'send-contract', 'spanish', 'Send Contract to Customer [spanish]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1454', 'invoice', 'invoice-payment-recorded-to-staff', 'spanish', 'Invoice Payment Recorded (Sent to Staff) [spanish]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1455', 'ticket', 'auto-close-ticket', 'spanish', 'Auto Close Ticket [spanish]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1456', 'project', 'new-project-discussion-created-to-staff', 'spanish', 'New Project Discussion (Sent to Project Members) [spanish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1457', 'project', 'new-project-discussion-created-to-customer', 'spanish', 'New Project Discussion (Sent to Customer Contacts) [spanish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1458', 'project', 'new-project-file-uploaded-to-customer', 'spanish', 'New Project File(s) Uploaded (Sent to Customer Contacts) [spanish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1459', 'project', 'new-project-file-uploaded-to-staff', 'spanish', 'New Project File(s) Uploaded (Sent to Project Members) [spanish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1460', 'project', 'new-project-discussion-comment-to-customer', 'spanish', 'New Discussion Comment  (Sent to Customer Contacts) [spanish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1461', 'project', 'new-project-discussion-comment-to-staff', 'spanish', 'New Discussion Comment (Sent to Project Members) [spanish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1462', 'project', 'staff-added-as-project-member', 'spanish', 'Staff Added as Project Member [spanish]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1463', 'estimate', 'estimate-expiry-reminder', 'spanish', 'Estimate Expiration Reminder [spanish]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1464', 'proposals', 'proposal-expiry-reminder', 'spanish', 'Proposal Expiration Reminder [spanish]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1465', 'staff', 'new-staff-created', 'spanish', 'New Staff Created (Welcome Email) [spanish]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1466', 'client', 'contact-forgot-password', 'spanish', 'Forgot Password [spanish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1467', 'client', 'contact-password-reseted', 'spanish', 'Password Reset - Confirmation [spanish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1468', 'client', 'contact-set-password', 'spanish', 'Set New Password [spanish]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1469', 'staff', 'staff-forgot-password', 'spanish', 'Forgot Password [spanish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1470', 'staff', 'staff-password-reseted', 'spanish', 'Password Reset - Confirmation [spanish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1471', 'project', 'assigned-to-project', 'spanish', 'New Project Created (Sent to Customer Contacts) [spanish]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1472', 'tasks', 'task-added-attachment-to-contacts', 'spanish', 'New Attachment(s) on Task (Sent to Customer Contacts) [spanish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1473', 'tasks', 'task-commented-to-contacts', 'spanish', 'New Comment on Task (Sent to Customer Contacts) [spanish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1474', 'leads', 'new-lead-assigned', 'spanish', 'New Lead Assigned to Staff Member [spanish]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1475', 'client', 'client-statement', 'spanish', 'Statement - Account Summary [spanish]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1476', 'ticket', 'ticket-assigned-to-admin', 'spanish', 'New Ticket Assigned (Sent to Staff) [spanish]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1477', 'client', 'new-client-registered-to-admin', 'spanish', 'New Customer Registration (Sent to admins) [spanish]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1478', 'leads', 'new-web-to-lead-form-submitted', 'spanish', 'Web to lead form submitted - Sent to lead [spanish]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1479', 'staff', 'two-factor-authentication', 'spanish', 'Two Factor Authentication [spanish]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1480', 'project', 'project-finished-to-customer', 'spanish', 'Project Marked as Finished (Sent to Customer Contacts) [spanish]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1481', 'credit_note', 'credit-note-send-to-client', 'spanish', 'Send Credit Note To Email [spanish]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1482', 'tasks', 'task-status-change-to-staff', 'spanish', 'Task Status Changed (Sent to Staff) [spanish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1483', 'tasks', 'task-status-change-to-contacts', 'spanish', 'Task Status Changed (Sent to Customer Contacts) [spanish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1484', 'staff', 'reminder-email-staff', 'spanish', 'Staff Reminder Email [spanish]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1485', 'contract', 'contract-comment-to-client', 'spanish', 'New Comment  (Sent to Customer Contacts) [spanish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1486', 'contract', 'contract-comment-to-admin', 'spanish', 'New Comment (Sent to Staff)  [spanish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1487', 'subscriptions', 'send-subscription', 'spanish', 'Send Subscription to Customer [spanish]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1488', 'subscriptions', 'subscription-payment-failed', 'spanish', 'Subscription Payment Failed [spanish]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1489', 'subscriptions', 'subscription-canceled', 'spanish', 'Subscription Canceled (Sent to customer primary contact) [spanish]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1490', 'subscriptions', 'subscription-payment-succeeded', 'spanish', 'Subscription Payment Succeeded (Sent to customer primary contact) [spanish]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1491', 'contract', 'contract-expiration-to-staff', 'spanish', 'Contract Expiration Reminder (Sent to Staff) [spanish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1492', 'gdpr', 'gdpr-removal-request', 'spanish', 'Removal Request From Contact (Sent to administrators) [spanish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1493', 'gdpr', 'gdpr-removal-request-lead', 'spanish', 'Removal Request From Lead (Sent to administrators) [spanish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1494', 'client', 'client-registration-confirmed', 'spanish', 'Customer Registration Confirmed [spanish]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1495', 'contract', 'contract-signed-to-staff', 'spanish', 'Contract Signed (Sent to Staff) [spanish]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1496', 'subscriptions', 'customer-subscribed-to-staff', 'spanish', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [spanish]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1497', 'client', 'contact-verification-email', 'spanish', 'Email Verification (Sent to Contact After Registration) [spanish]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1498', 'client', 'new-customer-profile-file-uploaded-to-staff', 'spanish', 'New Customer Profile File(s) Uploaded (Sent to Staff) [spanish]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1499', 'staff', 'event-notification-to-staff', 'spanish', 'Event Notification (Calendar) [spanish]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1500', 'subscriptions', 'subscription-payment-requires-action', 'spanish', 'Credit Card Authorization Required - SCA [spanish]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1501', 'client', 'new-client-created', 'swedish', 'New Contact Added/Registered (Welcome Email) [swedish]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1502', 'invoice', 'invoice-send-to-client', 'swedish', 'Send Invoice to Customer [swedish]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1503', 'ticket', 'new-ticket-opened-admin', 'swedish', 'New Ticket Opened (Opened by Staff, Sent to Customer) [swedish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1504', 'ticket', 'ticket-reply', 'swedish', 'Ticket Reply (Sent to Customer) [swedish]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1505', 'ticket', 'ticket-autoresponse', 'swedish', 'New Ticket Opened - Autoresponse [swedish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1506', 'invoice', 'invoice-payment-recorded', 'swedish', 'Invoice Payment Recorded (Sent to Customer) [swedish]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1507', 'invoice', 'invoice-overdue-notice', 'swedish', 'Invoice Overdue Notice [swedish]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1508', 'invoice', 'invoice-already-send', 'swedish', 'Invoice Already Sent to Customer [swedish]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1509', 'ticket', 'new-ticket-created-staff', 'swedish', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [swedish]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1510', 'estimate', 'estimate-send-to-client', 'swedish', 'Send Estimate to Customer [swedish]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1511', 'ticket', 'ticket-reply-to-admin', 'swedish', 'Ticket Reply (Sent to Staff) [swedish]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1512', 'estimate', 'estimate-already-send', 'swedish', 'Estimate Already Sent to Customer [swedish]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1513', 'contract', 'contract-expiration', 'swedish', 'Contract Expiration Reminder (Sent to Customer Contacts) [swedish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1514', 'tasks', 'task-assigned', 'swedish', 'New Task Assigned (Sent to Staff) [swedish]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1515', 'tasks', 'task-added-as-follower', 'swedish', 'Staff Member Added as Follower on Task (Sent to Staff) [swedish]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1516', 'tasks', 'task-commented', 'swedish', 'New Comment on Task (Sent to Staff) [swedish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1517', 'tasks', 'task-added-attachment', 'swedish', 'New Attachment(s) on Task (Sent to Staff) [swedish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1518', 'estimate', 'estimate-declined-to-staff', 'swedish', 'Estimate Declined (Sent to Staff) [swedish]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1519', 'estimate', 'estimate-accepted-to-staff', 'swedish', 'Estimate Accepted (Sent to Staff) [swedish]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1520', 'proposals', 'proposal-client-accepted', 'swedish', 'Customer Action - Accepted (Sent to Staff) [swedish]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1521', 'proposals', 'proposal-send-to-customer', 'swedish', 'Send Proposal to Customer [swedish]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1522', 'proposals', 'proposal-client-declined', 'swedish', 'Customer Action - Declined (Sent to Staff) [swedish]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1523', 'proposals', 'proposal-client-thank-you', 'swedish', 'Thank You Email (Sent to Customer After Accept) [swedish]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1524', 'proposals', 'proposal-comment-to-client', 'swedish', 'New Comment  (Sent to Customer/Lead) [swedish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1525', 'proposals', 'proposal-comment-to-admin', 'swedish', 'New Comment (Sent to Staff)  [swedish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1526', 'estimate', 'estimate-thank-you-to-customer', 'swedish', 'Thank You Email (Sent to Customer After Accept) [swedish]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1527', 'tasks', 'task-deadline-notification', 'swedish', 'Task Deadline Reminder - Sent to Assigned Members [swedish]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1528', 'contract', 'send-contract', 'swedish', 'Send Contract to Customer [swedish]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1529', 'invoice', 'invoice-payment-recorded-to-staff', 'swedish', 'Invoice Payment Recorded (Sent to Staff) [swedish]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1530', 'ticket', 'auto-close-ticket', 'swedish', 'Auto Close Ticket [swedish]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1531', 'project', 'new-project-discussion-created-to-staff', 'swedish', 'New Project Discussion (Sent to Project Members) [swedish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1532', 'project', 'new-project-discussion-created-to-customer', 'swedish', 'New Project Discussion (Sent to Customer Contacts) [swedish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1533', 'project', 'new-project-file-uploaded-to-customer', 'swedish', 'New Project File(s) Uploaded (Sent to Customer Contacts) [swedish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1534', 'project', 'new-project-file-uploaded-to-staff', 'swedish', 'New Project File(s) Uploaded (Sent to Project Members) [swedish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1535', 'project', 'new-project-discussion-comment-to-customer', 'swedish', 'New Discussion Comment  (Sent to Customer Contacts) [swedish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1536', 'project', 'new-project-discussion-comment-to-staff', 'swedish', 'New Discussion Comment (Sent to Project Members) [swedish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1537', 'project', 'staff-added-as-project-member', 'swedish', 'Staff Added as Project Member [swedish]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1538', 'estimate', 'estimate-expiry-reminder', 'swedish', 'Estimate Expiration Reminder [swedish]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1539', 'proposals', 'proposal-expiry-reminder', 'swedish', 'Proposal Expiration Reminder [swedish]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1540', 'staff', 'new-staff-created', 'swedish', 'New Staff Created (Welcome Email) [swedish]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1541', 'client', 'contact-forgot-password', 'swedish', 'Forgot Password [swedish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1542', 'client', 'contact-password-reseted', 'swedish', 'Password Reset - Confirmation [swedish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1543', 'client', 'contact-set-password', 'swedish', 'Set New Password [swedish]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1544', 'staff', 'staff-forgot-password', 'swedish', 'Forgot Password [swedish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1545', 'staff', 'staff-password-reseted', 'swedish', 'Password Reset - Confirmation [swedish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1546', 'project', 'assigned-to-project', 'swedish', 'New Project Created (Sent to Customer Contacts) [swedish]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1547', 'tasks', 'task-added-attachment-to-contacts', 'swedish', 'New Attachment(s) on Task (Sent to Customer Contacts) [swedish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1548', 'tasks', 'task-commented-to-contacts', 'swedish', 'New Comment on Task (Sent to Customer Contacts) [swedish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1549', 'leads', 'new-lead-assigned', 'swedish', 'New Lead Assigned to Staff Member [swedish]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1550', 'client', 'client-statement', 'swedish', 'Statement - Account Summary [swedish]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1551', 'ticket', 'ticket-assigned-to-admin', 'swedish', 'New Ticket Assigned (Sent to Staff) [swedish]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1552', 'client', 'new-client-registered-to-admin', 'swedish', 'New Customer Registration (Sent to admins) [swedish]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1553', 'leads', 'new-web-to-lead-form-submitted', 'swedish', 'Web to lead form submitted - Sent to lead [swedish]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1554', 'staff', 'two-factor-authentication', 'swedish', 'Two Factor Authentication [swedish]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1555', 'project', 'project-finished-to-customer', 'swedish', 'Project Marked as Finished (Sent to Customer Contacts) [swedish]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1556', 'credit_note', 'credit-note-send-to-client', 'swedish', 'Send Credit Note To Email [swedish]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1557', 'tasks', 'task-status-change-to-staff', 'swedish', 'Task Status Changed (Sent to Staff) [swedish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1558', 'tasks', 'task-status-change-to-contacts', 'swedish', 'Task Status Changed (Sent to Customer Contacts) [swedish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1559', 'staff', 'reminder-email-staff', 'swedish', 'Staff Reminder Email [swedish]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1560', 'contract', 'contract-comment-to-client', 'swedish', 'New Comment  (Sent to Customer Contacts) [swedish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1561', 'contract', 'contract-comment-to-admin', 'swedish', 'New Comment (Sent to Staff)  [swedish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1562', 'subscriptions', 'send-subscription', 'swedish', 'Send Subscription to Customer [swedish]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1563', 'subscriptions', 'subscription-payment-failed', 'swedish', 'Subscription Payment Failed [swedish]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1564', 'subscriptions', 'subscription-canceled', 'swedish', 'Subscription Canceled (Sent to customer primary contact) [swedish]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1565', 'subscriptions', 'subscription-payment-succeeded', 'swedish', 'Subscription Payment Succeeded (Sent to customer primary contact) [swedish]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1566', 'contract', 'contract-expiration-to-staff', 'swedish', 'Contract Expiration Reminder (Sent to Staff) [swedish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1567', 'gdpr', 'gdpr-removal-request', 'swedish', 'Removal Request From Contact (Sent to administrators) [swedish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1568', 'gdpr', 'gdpr-removal-request-lead', 'swedish', 'Removal Request From Lead (Sent to administrators) [swedish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1569', 'client', 'client-registration-confirmed', 'swedish', 'Customer Registration Confirmed [swedish]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1570', 'contract', 'contract-signed-to-staff', 'swedish', 'Contract Signed (Sent to Staff) [swedish]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1571', 'subscriptions', 'customer-subscribed-to-staff', 'swedish', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [swedish]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1572', 'client', 'contact-verification-email', 'swedish', 'Email Verification (Sent to Contact After Registration) [swedish]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1573', 'client', 'new-customer-profile-file-uploaded-to-staff', 'swedish', 'New Customer Profile File(s) Uploaded (Sent to Staff) [swedish]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1574', 'staff', 'event-notification-to-staff', 'swedish', 'Event Notification (Calendar) [swedish]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1575', 'subscriptions', 'subscription-payment-requires-action', 'swedish', 'Credit Card Authorization Required - SCA [swedish]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1576', 'client', 'new-client-created', 'turkish', 'New Contact Added/Registered (Welcome Email) [turkish]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1577', 'invoice', 'invoice-send-to-client', 'turkish', 'Send Invoice to Customer [turkish]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1578', 'ticket', 'new-ticket-opened-admin', 'turkish', 'New Ticket Opened (Opened by Staff, Sent to Customer) [turkish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1579', 'ticket', 'ticket-reply', 'turkish', 'Ticket Reply (Sent to Customer) [turkish]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1580', 'ticket', 'ticket-autoresponse', 'turkish', 'New Ticket Opened - Autoresponse [turkish]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1581', 'invoice', 'invoice-payment-recorded', 'turkish', 'Invoice Payment Recorded (Sent to Customer) [turkish]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1582', 'invoice', 'invoice-overdue-notice', 'turkish', 'Invoice Overdue Notice [turkish]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1583', 'invoice', 'invoice-already-send', 'turkish', 'Invoice Already Sent to Customer [turkish]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1584', 'ticket', 'new-ticket-created-staff', 'turkish', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [turkish]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1585', 'estimate', 'estimate-send-to-client', 'turkish', 'Send Estimate to Customer [turkish]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1586', 'ticket', 'ticket-reply-to-admin', 'turkish', 'Ticket Reply (Sent to Staff) [turkish]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1587', 'estimate', 'estimate-already-send', 'turkish', 'Estimate Already Sent to Customer [turkish]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1588', 'contract', 'contract-expiration', 'turkish', 'Contract Expiration Reminder (Sent to Customer Contacts) [turkish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1589', 'tasks', 'task-assigned', 'turkish', 'New Task Assigned (Sent to Staff) [turkish]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1590', 'tasks', 'task-added-as-follower', 'turkish', 'Staff Member Added as Follower on Task (Sent to Staff) [turkish]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1591', 'tasks', 'task-commented', 'turkish', 'New Comment on Task (Sent to Staff) [turkish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1592', 'tasks', 'task-added-attachment', 'turkish', 'New Attachment(s) on Task (Sent to Staff) [turkish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1593', 'estimate', 'estimate-declined-to-staff', 'turkish', 'Estimate Declined (Sent to Staff) [turkish]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1594', 'estimate', 'estimate-accepted-to-staff', 'turkish', 'Estimate Accepted (Sent to Staff) [turkish]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1595', 'proposals', 'proposal-client-accepted', 'turkish', 'Customer Action - Accepted (Sent to Staff) [turkish]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1596', 'proposals', 'proposal-send-to-customer', 'turkish', 'Send Proposal to Customer [turkish]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1597', 'proposals', 'proposal-client-declined', 'turkish', 'Customer Action - Declined (Sent to Staff) [turkish]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1598', 'proposals', 'proposal-client-thank-you', 'turkish', 'Thank You Email (Sent to Customer After Accept) [turkish]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1599', 'proposals', 'proposal-comment-to-client', 'turkish', 'New Comment  (Sent to Customer/Lead) [turkish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1600', 'proposals', 'proposal-comment-to-admin', 'turkish', 'New Comment (Sent to Staff)  [turkish]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1601', 'estimate', 'estimate-thank-you-to-customer', 'turkish', 'Thank You Email (Sent to Customer After Accept) [turkish]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1602', 'tasks', 'task-deadline-notification', 'turkish', 'Task Deadline Reminder - Sent to Assigned Members [turkish]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1603', 'contract', 'send-contract', 'turkish', 'Send Contract to Customer [turkish]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1604', 'invoice', 'invoice-payment-recorded-to-staff', 'turkish', 'Invoice Payment Recorded (Sent to Staff) [turkish]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1605', 'ticket', 'auto-close-ticket', 'turkish', 'Auto Close Ticket [turkish]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1606', 'project', 'new-project-discussion-created-to-staff', 'turkish', 'New Project Discussion (Sent to Project Members) [turkish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1607', 'project', 'new-project-discussion-created-to-customer', 'turkish', 'New Project Discussion (Sent to Customer Contacts) [turkish]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1608', 'project', 'new-project-file-uploaded-to-customer', 'turkish', 'New Project File(s) Uploaded (Sent to Customer Contacts) [turkish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1609', 'project', 'new-project-file-uploaded-to-staff', 'turkish', 'New Project File(s) Uploaded (Sent to Project Members) [turkish]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1610', 'project', 'new-project-discussion-comment-to-customer', 'turkish', 'New Discussion Comment  (Sent to Customer Contacts) [turkish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1611', 'project', 'new-project-discussion-comment-to-staff', 'turkish', 'New Discussion Comment (Sent to Project Members) [turkish]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1612', 'project', 'staff-added-as-project-member', 'turkish', 'Staff Added as Project Member [turkish]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1613', 'estimate', 'estimate-expiry-reminder', 'turkish', 'Estimate Expiration Reminder [turkish]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1614', 'proposals', 'proposal-expiry-reminder', 'turkish', 'Proposal Expiration Reminder [turkish]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1615', 'staff', 'new-staff-created', 'turkish', 'New Staff Created (Welcome Email) [turkish]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1616', 'client', 'contact-forgot-password', 'turkish', 'Forgot Password [turkish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1617', 'client', 'contact-password-reseted', 'turkish', 'Password Reset - Confirmation [turkish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1618', 'client', 'contact-set-password', 'turkish', 'Set New Password [turkish]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1619', 'staff', 'staff-forgot-password', 'turkish', 'Forgot Password [turkish]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1620', 'staff', 'staff-password-reseted', 'turkish', 'Password Reset - Confirmation [turkish]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1621', 'project', 'assigned-to-project', 'turkish', 'New Project Created (Sent to Customer Contacts) [turkish]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1622', 'tasks', 'task-added-attachment-to-contacts', 'turkish', 'New Attachment(s) on Task (Sent to Customer Contacts) [turkish]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1623', 'tasks', 'task-commented-to-contacts', 'turkish', 'New Comment on Task (Sent to Customer Contacts) [turkish]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1624', 'leads', 'new-lead-assigned', 'turkish', 'New Lead Assigned to Staff Member [turkish]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1625', 'client', 'client-statement', 'turkish', 'Statement - Account Summary [turkish]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1626', 'ticket', 'ticket-assigned-to-admin', 'turkish', 'New Ticket Assigned (Sent to Staff) [turkish]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1627', 'client', 'new-client-registered-to-admin', 'turkish', 'New Customer Registration (Sent to admins) [turkish]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1628', 'leads', 'new-web-to-lead-form-submitted', 'turkish', 'Web to lead form submitted - Sent to lead [turkish]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1629', 'staff', 'two-factor-authentication', 'turkish', 'Two Factor Authentication [turkish]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1630', 'project', 'project-finished-to-customer', 'turkish', 'Project Marked as Finished (Sent to Customer Contacts) [turkish]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1631', 'credit_note', 'credit-note-send-to-client', 'turkish', 'Send Credit Note To Email [turkish]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1632', 'tasks', 'task-status-change-to-staff', 'turkish', 'Task Status Changed (Sent to Staff) [turkish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1633', 'tasks', 'task-status-change-to-contacts', 'turkish', 'Task Status Changed (Sent to Customer Contacts) [turkish]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1634', 'staff', 'reminder-email-staff', 'turkish', 'Staff Reminder Email [turkish]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1635', 'contract', 'contract-comment-to-client', 'turkish', 'New Comment  (Sent to Customer Contacts) [turkish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1636', 'contract', 'contract-comment-to-admin', 'turkish', 'New Comment (Sent to Staff)  [turkish]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1637', 'subscriptions', 'send-subscription', 'turkish', 'Send Subscription to Customer [turkish]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1638', 'subscriptions', 'subscription-payment-failed', 'turkish', 'Subscription Payment Failed [turkish]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1639', 'subscriptions', 'subscription-canceled', 'turkish', 'Subscription Canceled (Sent to customer primary contact) [turkish]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1640', 'subscriptions', 'subscription-payment-succeeded', 'turkish', 'Subscription Payment Succeeded (Sent to customer primary contact) [turkish]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1641', 'contract', 'contract-expiration-to-staff', 'turkish', 'Contract Expiration Reminder (Sent to Staff) [turkish]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1642', 'gdpr', 'gdpr-removal-request', 'turkish', 'Removal Request From Contact (Sent to administrators) [turkish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1643', 'gdpr', 'gdpr-removal-request-lead', 'turkish', 'Removal Request From Lead (Sent to administrators) [turkish]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1644', 'client', 'client-registration-confirmed', 'turkish', 'Customer Registration Confirmed [turkish]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1645', 'contract', 'contract-signed-to-staff', 'turkish', 'Contract Signed (Sent to Staff) [turkish]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1646', 'subscriptions', 'customer-subscribed-to-staff', 'turkish', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [turkish]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1647', 'client', 'contact-verification-email', 'turkish', 'Email Verification (Sent to Contact After Registration) [turkish]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1648', 'client', 'new-customer-profile-file-uploaded-to-staff', 'turkish', 'New Customer Profile File(s) Uploaded (Sent to Staff) [turkish]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1649', 'staff', 'event-notification-to-staff', 'turkish', 'Event Notification (Calendar) [turkish]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1650', 'subscriptions', 'subscription-payment-requires-action', 'turkish', 'Credit Card Authorization Required - SCA [turkish]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1651', 'client', 'new-client-created', 'ukrainian', 'New Contact Added/Registered (Welcome Email) [ukrainian]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1652', 'invoice', 'invoice-send-to-client', 'ukrainian', 'Send Invoice to Customer [ukrainian]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1653', 'ticket', 'new-ticket-opened-admin', 'ukrainian', 'New Ticket Opened (Opened by Staff, Sent to Customer) [ukrainian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1654', 'ticket', 'ticket-reply', 'ukrainian', 'Ticket Reply (Sent to Customer) [ukrainian]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1655', 'ticket', 'ticket-autoresponse', 'ukrainian', 'New Ticket Opened - Autoresponse [ukrainian]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1656', 'invoice', 'invoice-payment-recorded', 'ukrainian', 'Invoice Payment Recorded (Sent to Customer) [ukrainian]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1657', 'invoice', 'invoice-overdue-notice', 'ukrainian', 'Invoice Overdue Notice [ukrainian]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1658', 'invoice', 'invoice-already-send', 'ukrainian', 'Invoice Already Sent to Customer [ukrainian]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1659', 'ticket', 'new-ticket-created-staff', 'ukrainian', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [ukrainian]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1660', 'estimate', 'estimate-send-to-client', 'ukrainian', 'Send Estimate to Customer [ukrainian]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1661', 'ticket', 'ticket-reply-to-admin', 'ukrainian', 'Ticket Reply (Sent to Staff) [ukrainian]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1662', 'estimate', 'estimate-already-send', 'ukrainian', 'Estimate Already Sent to Customer [ukrainian]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1663', 'contract', 'contract-expiration', 'ukrainian', 'Contract Expiration Reminder (Sent to Customer Contacts) [ukrainian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1664', 'tasks', 'task-assigned', 'ukrainian', 'New Task Assigned (Sent to Staff) [ukrainian]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1665', 'tasks', 'task-added-as-follower', 'ukrainian', 'Staff Member Added as Follower on Task (Sent to Staff) [ukrainian]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1666', 'tasks', 'task-commented', 'ukrainian', 'New Comment on Task (Sent to Staff) [ukrainian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1667', 'tasks', 'task-added-attachment', 'ukrainian', 'New Attachment(s) on Task (Sent to Staff) [ukrainian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1668', 'estimate', 'estimate-declined-to-staff', 'ukrainian', 'Estimate Declined (Sent to Staff) [ukrainian]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1669', 'estimate', 'estimate-accepted-to-staff', 'ukrainian', 'Estimate Accepted (Sent to Staff) [ukrainian]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1670', 'proposals', 'proposal-client-accepted', 'ukrainian', 'Customer Action - Accepted (Sent to Staff) [ukrainian]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1671', 'proposals', 'proposal-send-to-customer', 'ukrainian', 'Send Proposal to Customer [ukrainian]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1672', 'proposals', 'proposal-client-declined', 'ukrainian', 'Customer Action - Declined (Sent to Staff) [ukrainian]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1673', 'proposals', 'proposal-client-thank-you', 'ukrainian', 'Thank You Email (Sent to Customer After Accept) [ukrainian]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1674', 'proposals', 'proposal-comment-to-client', 'ukrainian', 'New Comment  (Sent to Customer/Lead) [ukrainian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1675', 'proposals', 'proposal-comment-to-admin', 'ukrainian', 'New Comment (Sent to Staff)  [ukrainian]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1676', 'estimate', 'estimate-thank-you-to-customer', 'ukrainian', 'Thank You Email (Sent to Customer After Accept) [ukrainian]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1677', 'tasks', 'task-deadline-notification', 'ukrainian', 'Task Deadline Reminder - Sent to Assigned Members [ukrainian]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1678', 'contract', 'send-contract', 'ukrainian', 'Send Contract to Customer [ukrainian]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1679', 'invoice', 'invoice-payment-recorded-to-staff', 'ukrainian', 'Invoice Payment Recorded (Sent to Staff) [ukrainian]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1680', 'ticket', 'auto-close-ticket', 'ukrainian', 'Auto Close Ticket [ukrainian]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1681', 'project', 'new-project-discussion-created-to-staff', 'ukrainian', 'New Project Discussion (Sent to Project Members) [ukrainian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1682', 'project', 'new-project-discussion-created-to-customer', 'ukrainian', 'New Project Discussion (Sent to Customer Contacts) [ukrainian]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1683', 'project', 'new-project-file-uploaded-to-customer', 'ukrainian', 'New Project File(s) Uploaded (Sent to Customer Contacts) [ukrainian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1684', 'project', 'new-project-file-uploaded-to-staff', 'ukrainian', 'New Project File(s) Uploaded (Sent to Project Members) [ukrainian]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1685', 'project', 'new-project-discussion-comment-to-customer', 'ukrainian', 'New Discussion Comment  (Sent to Customer Contacts) [ukrainian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1686', 'project', 'new-project-discussion-comment-to-staff', 'ukrainian', 'New Discussion Comment (Sent to Project Members) [ukrainian]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1687', 'project', 'staff-added-as-project-member', 'ukrainian', 'Staff Added as Project Member [ukrainian]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1688', 'estimate', 'estimate-expiry-reminder', 'ukrainian', 'Estimate Expiration Reminder [ukrainian]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1689', 'proposals', 'proposal-expiry-reminder', 'ukrainian', 'Proposal Expiration Reminder [ukrainian]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1690', 'staff', 'new-staff-created', 'ukrainian', 'New Staff Created (Welcome Email) [ukrainian]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1691', 'client', 'contact-forgot-password', 'ukrainian', 'Forgot Password [ukrainian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1692', 'client', 'contact-password-reseted', 'ukrainian', 'Password Reset - Confirmation [ukrainian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1693', 'client', 'contact-set-password', 'ukrainian', 'Set New Password [ukrainian]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1694', 'staff', 'staff-forgot-password', 'ukrainian', 'Forgot Password [ukrainian]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1695', 'staff', 'staff-password-reseted', 'ukrainian', 'Password Reset - Confirmation [ukrainian]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1696', 'project', 'assigned-to-project', 'ukrainian', 'New Project Created (Sent to Customer Contacts) [ukrainian]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1697', 'tasks', 'task-added-attachment-to-contacts', 'ukrainian', 'New Attachment(s) on Task (Sent to Customer Contacts) [ukrainian]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1698', 'tasks', 'task-commented-to-contacts', 'ukrainian', 'New Comment on Task (Sent to Customer Contacts) [ukrainian]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1699', 'leads', 'new-lead-assigned', 'ukrainian', 'New Lead Assigned to Staff Member [ukrainian]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1700', 'client', 'client-statement', 'ukrainian', 'Statement - Account Summary [ukrainian]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1701', 'ticket', 'ticket-assigned-to-admin', 'ukrainian', 'New Ticket Assigned (Sent to Staff) [ukrainian]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1702', 'client', 'new-client-registered-to-admin', 'ukrainian', 'New Customer Registration (Sent to admins) [ukrainian]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1703', 'leads', 'new-web-to-lead-form-submitted', 'ukrainian', 'Web to lead form submitted - Sent to lead [ukrainian]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1704', 'staff', 'two-factor-authentication', 'ukrainian', 'Two Factor Authentication [ukrainian]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1705', 'project', 'project-finished-to-customer', 'ukrainian', 'Project Marked as Finished (Sent to Customer Contacts) [ukrainian]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1706', 'credit_note', 'credit-note-send-to-client', 'ukrainian', 'Send Credit Note To Email [ukrainian]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1707', 'tasks', 'task-status-change-to-staff', 'ukrainian', 'Task Status Changed (Sent to Staff) [ukrainian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1708', 'tasks', 'task-status-change-to-contacts', 'ukrainian', 'Task Status Changed (Sent to Customer Contacts) [ukrainian]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1709', 'staff', 'reminder-email-staff', 'ukrainian', 'Staff Reminder Email [ukrainian]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1710', 'contract', 'contract-comment-to-client', 'ukrainian', 'New Comment  (Sent to Customer Contacts) [ukrainian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1711', 'contract', 'contract-comment-to-admin', 'ukrainian', 'New Comment (Sent to Staff)  [ukrainian]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1712', 'subscriptions', 'send-subscription', 'ukrainian', 'Send Subscription to Customer [ukrainian]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1713', 'subscriptions', 'subscription-payment-failed', 'ukrainian', 'Subscription Payment Failed [ukrainian]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1714', 'subscriptions', 'subscription-canceled', 'ukrainian', 'Subscription Canceled (Sent to customer primary contact) [ukrainian]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1715', 'subscriptions', 'subscription-payment-succeeded', 'ukrainian', 'Subscription Payment Succeeded (Sent to customer primary contact) [ukrainian]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1716', 'contract', 'contract-expiration-to-staff', 'ukrainian', 'Contract Expiration Reminder (Sent to Staff) [ukrainian]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1717', 'gdpr', 'gdpr-removal-request', 'ukrainian', 'Removal Request From Contact (Sent to administrators) [ukrainian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1718', 'gdpr', 'gdpr-removal-request-lead', 'ukrainian', 'Removal Request From Lead (Sent to administrators) [ukrainian]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1719', 'client', 'client-registration-confirmed', 'ukrainian', 'Customer Registration Confirmed [ukrainian]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1720', 'contract', 'contract-signed-to-staff', 'ukrainian', 'Contract Signed (Sent to Staff) [ukrainian]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1721', 'subscriptions', 'customer-subscribed-to-staff', 'ukrainian', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [ukrainian]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1722', 'client', 'contact-verification-email', 'ukrainian', 'Email Verification (Sent to Contact After Registration) [ukrainian]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1723', 'client', 'new-customer-profile-file-uploaded-to-staff', 'ukrainian', 'New Customer Profile File(s) Uploaded (Sent to Staff) [ukrainian]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1724', 'staff', 'event-notification-to-staff', 'ukrainian', 'Event Notification (Calendar) [ukrainian]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1725', 'subscriptions', 'subscription-payment-requires-action', 'ukrainian', 'Credit Card Authorization Required - SCA [ukrainian]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1726', 'client', 'new-client-created', 'vietnamese', 'New Contact Added/Registered (Welcome Email) [vietnamese]', 'Welcome aboard', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1727', 'invoice', 'invoice-send-to-client', 'vietnamese', 'Send Invoice to Customer [vietnamese]', 'Invoice with number {invoice_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1728', 'ticket', 'new-ticket-opened-admin', 'vietnamese', 'New Ticket Opened (Opened by Staff, Sent to Customer) [vietnamese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1729', 'ticket', 'ticket-reply', 'vietnamese', 'Ticket Reply (Sent to Customer) [vietnamese]', 'New Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1730', 'ticket', 'ticket-autoresponse', 'vietnamese', 'New Ticket Opened - Autoresponse [vietnamese]', 'New Support Ticket Opened', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1731', 'invoice', 'invoice-payment-recorded', 'vietnamese', 'Invoice Payment Recorded (Sent to Customer) [vietnamese]', 'Invoice Payment Recorded', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1732', 'invoice', 'invoice-overdue-notice', 'vietnamese', 'Invoice Overdue Notice [vietnamese]', 'Invoice Overdue Notice - {invoice_number}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1733', 'invoice', 'invoice-already-send', 'vietnamese', 'Invoice Already Sent to Customer [vietnamese]', 'Invoice # {invoice_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1734', 'ticket', 'new-ticket-created-staff', 'vietnamese', 'New Ticket Created (Opened by Customer, Sent to Staff Members) [vietnamese]', 'New Ticket Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1735', 'estimate', 'estimate-send-to-client', 'vietnamese', 'Send Estimate to Customer [vietnamese]', 'Estimate # {estimate_number} created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1736', 'ticket', 'ticket-reply-to-admin', 'vietnamese', 'Ticket Reply (Sent to Staff) [vietnamese]', 'New Support Ticket Reply', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1737', 'estimate', 'estimate-already-send', 'vietnamese', 'Estimate Already Sent to Customer [vietnamese]', 'Estimate # {estimate_number} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1738', 'contract', 'contract-expiration', 'vietnamese', 'Contract Expiration Reminder (Sent to Customer Contacts) [vietnamese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1739', 'tasks', 'task-assigned', 'vietnamese', 'New Task Assigned (Sent to Staff) [vietnamese]', 'New Task Assigned to You - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1740', 'tasks', 'task-added-as-follower', 'vietnamese', 'Staff Member Added as Follower on Task (Sent to Staff) [vietnamese]', 'You are added as follower on task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1741', 'tasks', 'task-commented', 'vietnamese', 'New Comment on Task (Sent to Staff) [vietnamese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1742', 'tasks', 'task-added-attachment', 'vietnamese', 'New Attachment(s) on Task (Sent to Staff) [vietnamese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1743', 'estimate', 'estimate-declined-to-staff', 'vietnamese', 'Estimate Declined (Sent to Staff) [vietnamese]', 'Customer Declined Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1744', 'estimate', 'estimate-accepted-to-staff', 'vietnamese', 'Estimate Accepted (Sent to Staff) [vietnamese]', 'Customer Accepted Estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1745', 'proposals', 'proposal-client-accepted', 'vietnamese', 'Customer Action - Accepted (Sent to Staff) [vietnamese]', 'Customer Accepted Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1746', 'proposals', 'proposal-send-to-customer', 'vietnamese', 'Send Proposal to Customer [vietnamese]', 'Proposal With Number {proposal_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1747', 'proposals', 'proposal-client-declined', 'vietnamese', 'Customer Action - Declined (Sent to Staff) [vietnamese]', 'Client Declined Proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1748', 'proposals', 'proposal-client-thank-you', 'vietnamese', 'Thank You Email (Sent to Customer After Accept) [vietnamese]', 'Thank for you accepting proposal', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1749', 'proposals', 'proposal-comment-to-client', 'vietnamese', 'New Comment  (Sent to Customer/Lead) [vietnamese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1750', 'proposals', 'proposal-comment-to-admin', 'vietnamese', 'New Comment (Sent to Staff)  [vietnamese]', 'New Proposal Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1751', 'estimate', 'estimate-thank-you-to-customer', 'vietnamese', 'Thank You Email (Sent to Customer After Accept) [vietnamese]', 'Thank for you accepting estimate', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1752', 'tasks', 'task-deadline-notification', 'vietnamese', 'Task Deadline Reminder - Sent to Assigned Members [vietnamese]', 'Task Deadline Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1753', 'contract', 'send-contract', 'vietnamese', 'Send Contract to Customer [vietnamese]', 'Contract - {contract_subject}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1754', 'invoice', 'invoice-payment-recorded-to-staff', 'vietnamese', 'Invoice Payment Recorded (Sent to Staff) [vietnamese]', 'New Invoice Payment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1755', 'ticket', 'auto-close-ticket', 'vietnamese', 'Auto Close Ticket [vietnamese]', 'Ticket Auto Closed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1756', 'project', 'new-project-discussion-created-to-staff', 'vietnamese', 'New Project Discussion (Sent to Project Members) [vietnamese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1757', 'project', 'new-project-discussion-created-to-customer', 'vietnamese', 'New Project Discussion (Sent to Customer Contacts) [vietnamese]', 'New Project Discussion Created - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1758', 'project', 'new-project-file-uploaded-to-customer', 'vietnamese', 'New Project File(s) Uploaded (Sent to Customer Contacts) [vietnamese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1759', 'project', 'new-project-file-uploaded-to-staff', 'vietnamese', 'New Project File(s) Uploaded (Sent to Project Members) [vietnamese]', 'New Project File(s) Uploaded - {project_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1760', 'project', 'new-project-discussion-comment-to-customer', 'vietnamese', 'New Discussion Comment  (Sent to Customer Contacts) [vietnamese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1761', 'project', 'new-project-discussion-comment-to-staff', 'vietnamese', 'New Discussion Comment (Sent to Project Members) [vietnamese]', 'New Discussion Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1762', 'project', 'staff-added-as-project-member', 'vietnamese', 'Staff Added as Project Member [vietnamese]', 'New project assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1763', 'estimate', 'estimate-expiry-reminder', 'vietnamese', 'Estimate Expiration Reminder [vietnamese]', 'Estimate Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1764', 'proposals', 'proposal-expiry-reminder', 'vietnamese', 'Proposal Expiration Reminder [vietnamese]', 'Proposal Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1765', 'staff', 'new-staff-created', 'vietnamese', 'New Staff Created (Welcome Email) [vietnamese]', 'You are added as staff member', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1766', 'client', 'contact-forgot-password', 'vietnamese', 'Forgot Password [vietnamese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1767', 'client', 'contact-password-reseted', 'vietnamese', 'Password Reset - Confirmation [vietnamese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1768', 'client', 'contact-set-password', 'vietnamese', 'Set New Password [vietnamese]', 'Set new password on {companyname} ', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1769', 'staff', 'staff-forgot-password', 'vietnamese', 'Forgot Password [vietnamese]', 'Create New Password', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1770', 'staff', 'staff-password-reseted', 'vietnamese', 'Password Reset - Confirmation [vietnamese]', 'Your password has been changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1771', 'project', 'assigned-to-project', 'vietnamese', 'New Project Created (Sent to Customer Contacts) [vietnamese]', 'New Project Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1772', 'tasks', 'task-added-attachment-to-contacts', 'vietnamese', 'New Attachment(s) on Task (Sent to Customer Contacts) [vietnamese]', 'New Attachment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1773', 'tasks', 'task-commented-to-contacts', 'vietnamese', 'New Comment on Task (Sent to Customer Contacts) [vietnamese]', 'New Comment on Task - {task_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1774', 'leads', 'new-lead-assigned', 'vietnamese', 'New Lead Assigned to Staff Member [vietnamese]', 'New lead assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1775', 'client', 'client-statement', 'vietnamese', 'Statement - Account Summary [vietnamese]', 'Account Statement from {statement_from} to {statement_to}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1776', 'ticket', 'ticket-assigned-to-admin', 'vietnamese', 'New Ticket Assigned (Sent to Staff) [vietnamese]', 'New support ticket has been assigned to you', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1777', 'client', 'new-client-registered-to-admin', 'vietnamese', 'New Customer Registration (Sent to admins) [vietnamese]', 'New Customer Registration', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1778', 'leads', 'new-web-to-lead-form-submitted', 'vietnamese', 'Web to lead form submitted - Sent to lead [vietnamese]', '{lead_name} - We Received Your Request', '', '{companyname} | CRM', null, '0', '0', '0');
INSERT INTO `tblemailtemplates` VALUES ('1779', 'staff', 'two-factor-authentication', 'vietnamese', 'Two Factor Authentication [vietnamese]', 'Confirm Your Login', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1780', 'project', 'project-finished-to-customer', 'vietnamese', 'Project Marked as Finished (Sent to Customer Contacts) [vietnamese]', 'Project Marked as Finished', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1781', 'credit_note', 'credit-note-send-to-client', 'vietnamese', 'Send Credit Note To Email [vietnamese]', 'Credit Note With Number #{credit_note_number} Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1782', 'tasks', 'task-status-change-to-staff', 'vietnamese', 'Task Status Changed (Sent to Staff) [vietnamese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1783', 'tasks', 'task-status-change-to-contacts', 'vietnamese', 'Task Status Changed (Sent to Customer Contacts) [vietnamese]', 'Task Status Changed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1784', 'staff', 'reminder-email-staff', 'vietnamese', 'Staff Reminder Email [vietnamese]', 'You Have a New Reminder!', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1785', 'contract', 'contract-comment-to-client', 'vietnamese', 'New Comment  (Sent to Customer Contacts) [vietnamese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1786', 'contract', 'contract-comment-to-admin', 'vietnamese', 'New Comment (Sent to Staff)  [vietnamese]', 'New Contract Comment', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1787', 'subscriptions', 'send-subscription', 'vietnamese', 'Send Subscription to Customer [vietnamese]', 'Subscription Created', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1788', 'subscriptions', 'subscription-payment-failed', 'vietnamese', 'Subscription Payment Failed [vietnamese]', 'Your most recent invoice payment failed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1789', 'subscriptions', 'subscription-canceled', 'vietnamese', 'Subscription Canceled (Sent to customer primary contact) [vietnamese]', 'Your subscription has been canceled', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1790', 'subscriptions', 'subscription-payment-succeeded', 'vietnamese', 'Subscription Payment Succeeded (Sent to customer primary contact) [vietnamese]', 'Subscription  Payment Receipt - {subscription_name}', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1791', 'contract', 'contract-expiration-to-staff', 'vietnamese', 'Contract Expiration Reminder (Sent to Staff) [vietnamese]', 'Contract Expiration Reminder', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1792', 'gdpr', 'gdpr-removal-request', 'vietnamese', 'Removal Request From Contact (Sent to administrators) [vietnamese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1793', 'gdpr', 'gdpr-removal-request-lead', 'vietnamese', 'Removal Request From Lead (Sent to administrators) [vietnamese]', 'Data Removal Request Received', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1794', 'client', 'client-registration-confirmed', 'vietnamese', 'Customer Registration Confirmed [vietnamese]', 'Your registration is confirmed', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1795', 'contract', 'contract-signed-to-staff', 'vietnamese', 'Contract Signed (Sent to Staff) [vietnamese]', 'Customer Signed a Contract', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1796', 'subscriptions', 'customer-subscribed-to-staff', 'vietnamese', 'Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [vietnamese]', 'Customer Subscribed to a Subscription', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1797', 'client', 'contact-verification-email', 'vietnamese', 'Email Verification (Sent to Contact After Registration) [vietnamese]', 'Verify Email Address', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1798', 'client', 'new-customer-profile-file-uploaded-to-staff', 'vietnamese', 'New Customer Profile File(s) Uploaded (Sent to Staff) [vietnamese]', 'Customer Uploaded New File(s) in Profile', '', '{companyname} | CRM', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1799', 'staff', 'event-notification-to-staff', 'vietnamese', 'Event Notification (Calendar) [vietnamese]', 'Upcoming Event - {event_title}', '', '', null, '0', '1', '0');
INSERT INTO `tblemailtemplates` VALUES ('1800', 'subscriptions', 'subscription-payment-requires-action', 'vietnamese', 'Credit Card Authorization Required - SCA [vietnamese]', 'Important: Confirm your subscription {subscription_name} payment', '', '{companyname} | CRM', null, '0', '1', '0');

-- ----------------------------
-- Table structure for `tblestimates`
-- ----------------------------
DROP TABLE IF EXISTS `tblestimates`;
CREATE TABLE `tblestimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text,
  `reference_no` varchar(100) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `pipeline_order` int(11) NOT NULL DEFAULT '0',
  `is_expiry_notified` int(11) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblestimates
-- ----------------------------

-- ----------------------------
-- Table structure for `tblevents`
-- ----------------------------
DROP TABLE IF EXISTS `tblevents`;
CREATE TABLE `tblevents` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext NOT NULL,
  `description` text,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '0',
  `color` varchar(10) DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT '0',
  `reminder_before` int(11) NOT NULL DEFAULT '0',
  `reminder_before_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblevents
-- ----------------------------

-- ----------------------------
-- Table structure for `tblexpenses`
-- ----------------------------
DROP TABLE IF EXISTS `tblexpenses`;
CREATE TABLE `tblexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) NOT NULL DEFAULT '0',
  `reference_no` varchar(100) DEFAULT NULL,
  `note` text,
  `expense_name` varchar(191) DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `billable` int(11) DEFAULT '0',
  `invoiceid` int(11) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `custom_recurring` int(11) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblexpenses
-- ----------------------------

-- ----------------------------
-- Table structure for `tblexpenses_categories`
-- ----------------------------
DROP TABLE IF EXISTS `tblexpenses_categories`;
CREATE TABLE `tblexpenses_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblexpenses_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `tblfiles`
-- ----------------------------
DROP TABLE IF EXISTS `tblfiles`;
CREATE TABLE `tblfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(40) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT '0',
  `attachment_key` varchar(32) DEFAULT NULL,
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text COMMENT 'For external usage',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT '0',
  `task_comment_id` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblfiles
-- ----------------------------

-- ----------------------------
-- Table structure for `tblform_questions`
-- ----------------------------
DROP TABLE IF EXISTS `tblform_questions`;
CREATE TABLE `tblform_questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblform_questions
-- ----------------------------

-- ----------------------------
-- Table structure for `tblform_question_box`
-- ----------------------------
DROP TABLE IF EXISTS `tblform_question_box`;
CREATE TABLE `tblform_question_box` (
  `boxid` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblform_question_box
-- ----------------------------

-- ----------------------------
-- Table structure for `tblform_question_box_description`
-- ----------------------------
DROP TABLE IF EXISTS `tblform_question_box_description`;
CREATE TABLE `tblform_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblform_question_box_description
-- ----------------------------

-- ----------------------------
-- Table structure for `tblform_results`
-- ----------------------------
DROP TABLE IF EXISTS `tblform_results`;
CREATE TABLE `tblform_results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `boxid` int(11) NOT NULL,
  `boxdescriptionid` int(11) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int(11) NOT NULL,
  `answer` text,
  `resultsetid` int(11) NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblform_results
-- ----------------------------

-- ----------------------------
-- Table structure for `tblgdpr_requests`
-- ----------------------------
DROP TABLE IF EXISTS `tblgdpr_requests`;
CREATE TABLE `tblgdpr_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `lead_id` int(11) NOT NULL DEFAULT '0',
  `request_type` varchar(191) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblgdpr_requests
-- ----------------------------

-- ----------------------------
-- Table structure for `tblgoals`
-- ----------------------------
DROP TABLE IF EXISTS `tblgoals`;
CREATE TABLE `tblgoals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `goal_type` int(11) NOT NULL,
  `contract_type` int(11) NOT NULL DEFAULT '0',
  `achievement` int(11) NOT NULL,
  `notify_when_fail` tinyint(1) NOT NULL DEFAULT '1',
  `notify_when_achieve` tinyint(1) NOT NULL DEFAULT '1',
  `notified` int(11) NOT NULL DEFAULT '0',
  `staff_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblgoals
-- ----------------------------

-- ----------------------------
-- Table structure for `tblinvoicepaymentrecords`
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoicepaymentrecords`;
CREATE TABLE `tblinvoicepaymentrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) DEFAULT NULL,
  `paymentmethod` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblinvoicepaymentrecords
-- ----------------------------

-- ----------------------------
-- Table structure for `tblinvoices`
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoices`;
CREATE TABLE `tblinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `status` int(11) DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `last_overdue_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int(11) NOT NULL DEFAULT '0',
  `allowed_payment_modes` mediumtext,
  `token` mediumtext,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `is_recurring_from` int(11) DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` text,
  `sale_agent` int(11) NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT '0',
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblinvoices
-- ----------------------------

-- ----------------------------
-- Table structure for `tblitemable`
-- ----------------------------
DROP TABLE IF EXISTS `tblitemable`;
CREATE TABLE `tblitemable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `description` mediumtext NOT NULL,
  `long_description` mediumtext,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblitemable
-- ----------------------------

-- ----------------------------
-- Table structure for `tblitems`
-- ----------------------------
DROP TABLE IF EXISTS `tblitems`;
CREATE TABLE `tblitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `long_description` text,
  `rate` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblitems
-- ----------------------------

-- ----------------------------
-- Table structure for `tblitems_groups`
-- ----------------------------
DROP TABLE IF EXISTS `tblitems_groups`;
CREATE TABLE `tblitems_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblitems_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `tblitem_tax`
-- ----------------------------
DROP TABLE IF EXISTS `tblitem_tax`;
CREATE TABLE `tblitem_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblitem_tax
-- ----------------------------

-- ----------------------------
-- Table structure for `tblknowedge_base_article_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tblknowedge_base_article_feedback`;
CREATE TABLE `tblknowedge_base_article_feedback` (
  `articleanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblknowedge_base_article_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `tblknowledge_base`
-- ----------------------------
DROP TABLE IF EXISTS `tblknowledge_base`;
CREATE TABLE `tblknowledge_base` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `articlegroup` int(11) NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int(11) NOT NULL DEFAULT '0',
  `staff_article` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblknowledge_base
-- ----------------------------

-- ----------------------------
-- Table structure for `tblknowledge_base_groups`
-- ----------------------------
DROP TABLE IF EXISTS `tblknowledge_base_groups`;
CREATE TABLE `tblknowledge_base_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text,
  `description` mediumtext,
  `active` tinyint(4) NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int(11) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblknowledge_base_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `tblleads`
-- ----------------------------
DROP TABLE IF EXISTS `tblleads`;
CREATE TABLE `tblleads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `description` text,
  `country` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `assigned` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `from_form_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `leadorder` int(11) DEFAULT '1',
  `phonenumber` varchar(50) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT '0',
  `junk` int(11) NOT NULL DEFAULT '0',
  `last_lead_status` int(11) NOT NULL DEFAULT '0',
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT '0',
  `email_integration_uid` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `default_language` varchar(40) DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `lead_value` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblleads
-- ----------------------------
INSERT INTO `tblleads` VALUES ('3', '8713cde176591123f9fb737b004ff634-754b131085bbc6ca37fe9077e293c7ea', 'Yufei Zhang', '', '', '', '40', 'M2J 3S1', 'North York', 'Ontario', '9 Bowhill Cres', '5', '2021-03-20 11:14:58', '0', '1', '4', '2021-03-20 11:14:58', null, null, '5', 'selinazhang2006@gmail.com', '', '1', '6474050821', null, '0', '0', '0', '0', null, '0', '', '0', '0.00');
INSERT INTO `tblleads` VALUES ('4', 'd6612e4e64ba2c293112c6125a11b54c-81ee4c30546b24f8812185d486e3e202', '张三', '', '', '', '40', 'v2n 5m9', 'richmond', 'bc', '123 11 th 89', '1', '2021-03-20 11:25:46', '0', '2', '3', '2021-03-20 11:25:46', null, null, '1', 'zhclare@126.com', '', '1', '7787796108', null, '0', '0', '0', '0', null, '0', '', '0', '0.00');

-- ----------------------------
-- Table structure for `tblleads_email_integration`
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_email_integration`;
CREATE TABLE `tblleads_email_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imap_server` varchar(100) NOT NULL,
  `password` mediumtext NOT NULL,
  `check_every` int(11) NOT NULL DEFAULT '5',
  `responsible` int(11) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `last_run` varchar(50) DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT '1',
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `mark_public` int(11) NOT NULL DEFAULT '0',
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT '1',
  `delete_after_import` int(11) NOT NULL DEFAULT '0',
  `create_task_if_customer` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblleads_email_integration
-- ----------------------------
INSERT INTO `tblleads_email_integration` VALUES ('1', '0', '', '', '', '10', '0', '0', '0', 'tls', 'INBOX', '', '1', '1', 'assigned', '', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for `tblleads_sources`
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_sources`;
CREATE TABLE `tblleads_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblleads_sources
-- ----------------------------
INSERT INTO `tblleads_sources` VALUES ('2', 'Facebook');
INSERT INTO `tblleads_sources` VALUES ('1', 'Google');
INSERT INTO `tblleads_sources` VALUES ('4', 'YouTube');
INSERT INTO `tblleads_sources` VALUES ('3', '微信');

-- ----------------------------
-- Table structure for `tblleads_status`
-- ----------------------------
DROP TABLE IF EXISTS `tblleads_status`;
CREATE TABLE `tblleads_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `isdefault` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblleads_status
-- ----------------------------
INSERT INTO `tblleads_status` VALUES ('1', 'Customer', '1000', '#7cb342', '1');
INSERT INTO `tblleads_status` VALUES ('2', '投资', '2', '#28B8DA', '0');

-- ----------------------------
-- Table structure for `tbllead_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbllead_activity_log`;
CREATE TABLE `tbllead_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leadid` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `additional_data` text,
  `date` datetime NOT NULL,
  `staffid` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbllead_activity_log
-- ----------------------------
INSERT INTO `tbllead_activity_log` VALUES ('4', '3', 'not_lead_activity_created', '', '2021-03-20 11:14:58', '5', 'zhang sekina', '0');
INSERT INTO `tbllead_activity_log` VALUES ('5', '4', 'not_lead_activity_created', '', '2021-03-20 11:25:46', '1', 'clark zhu', '0');

-- ----------------------------
-- Table structure for `tbllead_integration_emails`
-- ----------------------------
DROP TABLE IF EXISTS `tbllead_integration_emails`;
CREATE TABLE `tbllead_integration_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext,
  `body` mediumtext,
  `dateadded` datetime NOT NULL,
  `leadid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbllead_integration_emails
-- ----------------------------

-- ----------------------------
-- Table structure for `tbllistemails`
-- ----------------------------
DROP TABLE IF EXISTS `tbllistemails`;
CREATE TABLE `tbllistemails` (
  `emailid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbllistemails
-- ----------------------------

-- ----------------------------
-- Table structure for `tblmaillistscustomfields`
-- ----------------------------
DROP TABLE IF EXISTS `tblmaillistscustomfields`;
CREATE TABLE `tblmaillistscustomfields` (
  `customfieldid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `fieldslug` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmaillistscustomfields
-- ----------------------------

-- ----------------------------
-- Table structure for `tblmaillistscustomfieldvalues`
-- ----------------------------
DROP TABLE IF EXISTS `tblmaillistscustomfieldvalues`;
CREATE TABLE `tblmaillistscustomfieldvalues` (
  `customfieldvalueid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `customfieldid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldvalueid`),
  KEY `listid` (`listid`),
  KEY `customfieldid` (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmaillistscustomfieldvalues
-- ----------------------------

-- ----------------------------
-- Table structure for `tblmail_queue`
-- ----------------------------
DROP TABLE IF EXISTS `tblmail_queue`;
CREATE TABLE `tblmail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `cc` text,
  `bcc` text,
  `message` mediumtext NOT NULL,
  `alt_message` mediumtext,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text,
  `attachments` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `tblmigrations`
-- ----------------------------
DROP TABLE IF EXISTS `tblmigrations`;
CREATE TABLE `tblmigrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmigrations
-- ----------------------------
INSERT INTO `tblmigrations` VALUES ('272');

-- ----------------------------
-- Table structure for `tblmilestones`
-- ----------------------------
DROP TABLE IF EXISTS `tblmilestones`;
CREATE TABLE `tblmilestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_visible_to_customer` tinyint(1) DEFAULT '0',
  `due_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `milestone_order` int(11) NOT NULL DEFAULT '0',
  `datecreated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmilestones
-- ----------------------------

-- ----------------------------
-- Table structure for `tblmodules`
-- ----------------------------
DROP TABLE IF EXISTS `tblmodules`;
CREATE TABLE `tblmodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) NOT NULL,
  `installed_version` varchar(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblmodules
-- ----------------------------
INSERT INTO `tblmodules` VALUES ('1', 'backup', '2.3.0', '1');
INSERT INTO `tblmodules` VALUES ('2', 'goals', '2.3.0', '1');
INSERT INTO `tblmodules` VALUES ('3', 'menu_setup', '2.3.0', '1');
INSERT INTO `tblmodules` VALUES ('4', 'surveys', '2.3.0', '1');
INSERT INTO `tblmodules` VALUES ('5', 'theme_style', '2.3.0', '1');

-- ----------------------------
-- Table structure for `tblnewsfeed_comment_likes`
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_comment_likes`;
CREATE TABLE `tblnewsfeed_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnewsfeed_comment_likes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblnewsfeed_posts`
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_posts`;
CREATE TABLE `tblnewsfeed_posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `pinned` int(11) NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnewsfeed_posts
-- ----------------------------
INSERT INTO `tblnewsfeed_posts` VALUES ('1', '1', '2021-03-04 19:28:29', 'all', '', '0', null);

-- ----------------------------
-- Table structure for `tblnewsfeed_post_comments`
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_post_comments`;
CREATE TABLE `tblnewsfeed_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnewsfeed_post_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblnewsfeed_post_likes`
-- ----------------------------
DROP TABLE IF EXISTS `tblnewsfeed_post_likes`;
CREATE TABLE `tblnewsfeed_post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnewsfeed_post_likes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblnotes`
-- ----------------------------
DROP TABLE IF EXISTS `tblnotes`;
CREATE TABLE `tblnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `description` text,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblnotifications`
-- ----------------------------
DROP TABLE IF EXISTS `tblnotifications`;
CREATE TABLE `tblnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isread` int(11) NOT NULL DEFAULT '0',
  `isread_inline` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `fromuserid` int(11) NOT NULL,
  `fromclientid` int(11) NOT NULL DEFAULT '0',
  `from_fullname` varchar(100) NOT NULL,
  `touserid` int(11) NOT NULL,
  `fromcompany` int(11) DEFAULT NULL,
  `link` mediumtext,
  `additional_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblnotifications
-- ----------------------------

-- ----------------------------
-- Table structure for `tbloptions`
-- ----------------------------
DROP TABLE IF EXISTS `tbloptions`;
CREATE TABLE `tbloptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbloptions
-- ----------------------------
INSERT INTO `tbloptions` VALUES ('1', 'dateformat', 'Y-m-d|%Y-%m-%d', '1');
INSERT INTO `tbloptions` VALUES ('2', 'companyname', '', '1');
INSERT INTO `tbloptions` VALUES ('3', 'services', '1', '1');
INSERT INTO `tbloptions` VALUES ('4', 'maximum_allowed_ticket_attachments', '4', '1');
INSERT INTO `tbloptions` VALUES ('5', 'ticket_attachments_file_extensions', '.jpg,.png,.pdf,.doc,.zip,.rar', '1');
INSERT INTO `tbloptions` VALUES ('6', 'staff_access_only_assigned_departments', '1', '1');
INSERT INTO `tbloptions` VALUES ('7', 'use_knowledge_base', '1', '1');
INSERT INTO `tbloptions` VALUES ('8', 'smtp_email', '', '1');
INSERT INTO `tbloptions` VALUES ('9', 'smtp_password', '', '1');
INSERT INTO `tbloptions` VALUES ('10', 'company_info_format', '{company_name}<br />\r\r\n{address}<br />\r\r\n{city} {state}<br />\r\r\n{country_code} {zip_code}<br />\r\r\n{vat_number_with_label}', '0');
INSERT INTO `tbloptions` VALUES ('11', 'smtp_port', '', '1');
INSERT INTO `tbloptions` VALUES ('12', 'smtp_host', '', '1');
INSERT INTO `tbloptions` VALUES ('13', 'smtp_email_charset', 'utf-8', '1');
INSERT INTO `tbloptions` VALUES ('14', 'default_timezone', 'America/Vancouver', '1');
INSERT INTO `tbloptions` VALUES ('15', 'clients_default_theme', 'perfex', '1');
INSERT INTO `tbloptions` VALUES ('16', 'company_logo', '', '1');
INSERT INTO `tbloptions` VALUES ('17', 'tables_pagination_limit', '25', '1');
INSERT INTO `tbloptions` VALUES ('18', 'main_domain', '', '1');
INSERT INTO `tbloptions` VALUES ('19', 'allow_registration', '0', '1');
INSERT INTO `tbloptions` VALUES ('20', 'knowledge_base_without_registration', '1', '1');
INSERT INTO `tbloptions` VALUES ('21', 'email_signature', '', '1');
INSERT INTO `tbloptions` VALUES ('22', 'default_staff_role', '1', '1');
INSERT INTO `tbloptions` VALUES ('23', 'newsfeed_maximum_files_upload', '10', '1');
INSERT INTO `tbloptions` VALUES ('24', 'contract_expiration_before', '4', '1');
INSERT INTO `tbloptions` VALUES ('25', 'invoice_prefix', 'INV-', '1');
INSERT INTO `tbloptions` VALUES ('26', 'decimal_separator', '.', '1');
INSERT INTO `tbloptions` VALUES ('27', 'thousand_separator', ',', '1');
INSERT INTO `tbloptions` VALUES ('28', 'invoice_company_name', '', '1');
INSERT INTO `tbloptions` VALUES ('29', 'invoice_company_address', '', '1');
INSERT INTO `tbloptions` VALUES ('30', 'invoice_company_city', '', '1');
INSERT INTO `tbloptions` VALUES ('31', 'invoice_company_country_code', '', '1');
INSERT INTO `tbloptions` VALUES ('32', 'invoice_company_postal_code', '', '1');
INSERT INTO `tbloptions` VALUES ('33', 'invoice_company_phonenumber', '', '1');
INSERT INTO `tbloptions` VALUES ('34', 'view_invoice_only_logged_in', '0', '1');
INSERT INTO `tbloptions` VALUES ('35', 'invoice_number_format', '1', '1');
INSERT INTO `tbloptions` VALUES ('36', 'next_invoice_number', '1', '0');
INSERT INTO `tbloptions` VALUES ('37', 'active_language', 'chinese', '1');
INSERT INTO `tbloptions` VALUES ('38', 'invoice_number_decrement_on_delete', '1', '1');
INSERT INTO `tbloptions` VALUES ('39', 'automatically_send_invoice_overdue_reminder_after', '1', '1');
INSERT INTO `tbloptions` VALUES ('40', 'automatically_resend_invoice_overdue_reminder_after', '3', '1');
INSERT INTO `tbloptions` VALUES ('41', 'expenses_auto_operations_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('42', 'delete_only_on_last_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('43', 'delete_only_on_last_estimate', '1', '1');
INSERT INTO `tbloptions` VALUES ('44', 'create_invoice_from_recurring_only_on_paid_invoices', '0', '1');
INSERT INTO `tbloptions` VALUES ('45', 'allow_payment_amount_to_be_modified', '1', '1');
INSERT INTO `tbloptions` VALUES ('46', 'rtl_support_client', '0', '1');
INSERT INTO `tbloptions` VALUES ('47', 'limit_top_search_bar_results_to', '10', '1');
INSERT INTO `tbloptions` VALUES ('48', 'estimate_prefix', 'EST-', '1');
INSERT INTO `tbloptions` VALUES ('49', 'next_estimate_number', '1', '0');
INSERT INTO `tbloptions` VALUES ('50', 'estimate_number_decrement_on_delete', '1', '1');
INSERT INTO `tbloptions` VALUES ('51', 'estimate_number_format', '1', '1');
INSERT INTO `tbloptions` VALUES ('52', 'estimate_auto_convert_to_invoice_on_client_accept', '1', '1');
INSERT INTO `tbloptions` VALUES ('53', 'exclude_estimate_from_client_area_with_draft_status', '1', '1');
INSERT INTO `tbloptions` VALUES ('54', 'rtl_support_admin', '0', '1');
INSERT INTO `tbloptions` VALUES ('55', 'last_cron_run', '1606474741', '1');
INSERT INTO `tbloptions` VALUES ('56', 'show_sale_agent_on_estimates', '1', '1');
INSERT INTO `tbloptions` VALUES ('57', 'show_sale_agent_on_invoices', '1', '1');
INSERT INTO `tbloptions` VALUES ('58', 'predefined_terms_invoice', '', '1');
INSERT INTO `tbloptions` VALUES ('59', 'predefined_terms_estimate', '', '1');
INSERT INTO `tbloptions` VALUES ('60', 'default_task_priority', '2', '1');
INSERT INTO `tbloptions` VALUES ('61', 'dropbox_app_key', '', '1');
INSERT INTO `tbloptions` VALUES ('62', 'show_expense_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('63', 'only_show_contact_tickets', '1', '1');
INSERT INTO `tbloptions` VALUES ('64', 'predefined_clientnote_invoice', '', '1');
INSERT INTO `tbloptions` VALUES ('65', 'predefined_clientnote_estimate', '', '1');
INSERT INTO `tbloptions` VALUES ('66', 'custom_pdf_logo_image_url', '', '1');
INSERT INTO `tbloptions` VALUES ('67', 'favicon', '', '1');
INSERT INTO `tbloptions` VALUES ('68', 'invoice_due_after', '30', '1');
INSERT INTO `tbloptions` VALUES ('69', 'google_api_key', '', '1');
INSERT INTO `tbloptions` VALUES ('70', 'google_calendar_main_calendar', '', '1');
INSERT INTO `tbloptions` VALUES ('71', 'default_tax', 'a:0:{}', '1');
INSERT INTO `tbloptions` VALUES ('72', 'show_invoices_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('73', 'show_estimates_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('74', 'show_contracts_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('75', 'show_tasks_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('76', 'show_customer_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('77', 'output_client_pdfs_from_admin_area_in_client_language', '0', '1');
INSERT INTO `tbloptions` VALUES ('78', 'show_lead_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('79', 'send_estimate_expiry_reminder_before', '4', '1');
INSERT INTO `tbloptions` VALUES ('80', 'leads_default_source', '', '1');
INSERT INTO `tbloptions` VALUES ('81', 'leads_default_status', '', '1');
INSERT INTO `tbloptions` VALUES ('82', 'proposal_expiry_reminder_enabled', '1', '1');
INSERT INTO `tbloptions` VALUES ('83', 'send_proposal_expiry_reminder_before', '4', '1');
INSERT INTO `tbloptions` VALUES ('84', 'default_contact_permissions', 'a:6:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";}', '1');
INSERT INTO `tbloptions` VALUES ('85', 'pdf_logo_width', '150', '1');
INSERT INTO `tbloptions` VALUES ('86', 'access_tickets_to_none_staff_members', '0', '1');
INSERT INTO `tbloptions` VALUES ('87', 'customer_default_country', '', '1');
INSERT INTO `tbloptions` VALUES ('88', 'view_estimate_only_logged_in', '0', '1');
INSERT INTO `tbloptions` VALUES ('89', 'show_status_on_pdf_ei', '1', '1');
INSERT INTO `tbloptions` VALUES ('90', 'email_piping_only_replies', '0', '1');
INSERT INTO `tbloptions` VALUES ('91', 'email_piping_only_registered', '0', '1');
INSERT INTO `tbloptions` VALUES ('92', 'default_view_calendar', 'month', '1');
INSERT INTO `tbloptions` VALUES ('93', 'email_piping_default_priority', '2', '1');
INSERT INTO `tbloptions` VALUES ('94', 'total_to_words_lowercase', '0', '1');
INSERT INTO `tbloptions` VALUES ('95', 'show_tax_per_item', '1', '1');
INSERT INTO `tbloptions` VALUES ('96', 'total_to_words_enabled', '0', '1');
INSERT INTO `tbloptions` VALUES ('97', 'receive_notification_on_new_ticket', '1', '0');
INSERT INTO `tbloptions` VALUES ('98', 'autoclose_tickets_after', '0', '1');
INSERT INTO `tbloptions` VALUES ('99', 'media_max_file_size_upload', '10', '1');
INSERT INTO `tbloptions` VALUES ('100', 'client_staff_add_edit_delete_task_comments_first_hour', '0', '1');
INSERT INTO `tbloptions` VALUES ('101', 'show_projects_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('102', 'leads_kanban_limit', '50', '1');
INSERT INTO `tbloptions` VALUES ('103', 'tasks_reminder_notification_before', '2', '1');
INSERT INTO `tbloptions` VALUES ('104', 'pdf_font', 'freesans', '1');
INSERT INTO `tbloptions` VALUES ('105', 'pdf_table_heading_color', '#323a45', '1');
INSERT INTO `tbloptions` VALUES ('106', 'pdf_table_heading_text_color', '#ffffff', '1');
INSERT INTO `tbloptions` VALUES ('107', 'pdf_font_size', '10', '1');
INSERT INTO `tbloptions` VALUES ('108', 'default_leads_kanban_sort', 'leadorder', '1');
INSERT INTO `tbloptions` VALUES ('109', 'default_leads_kanban_sort_type', 'asc', '1');
INSERT INTO `tbloptions` VALUES ('110', 'allowed_files', '.png,.jpg,.pdf,.doc,.docx,.xls,.xlsx,.zip,.rar,.txt', '1');
INSERT INTO `tbloptions` VALUES ('111', 'show_all_tasks_for_project_member', '1', '1');
INSERT INTO `tbloptions` VALUES ('112', 'email_protocol', 'smtp', '1');
INSERT INTO `tbloptions` VALUES ('113', 'calendar_first_day', '0', '1');
INSERT INTO `tbloptions` VALUES ('114', 'recaptcha_secret_key', '', '1');
INSERT INTO `tbloptions` VALUES ('115', 'show_help_on_setup_menu', '1', '1');
INSERT INTO `tbloptions` VALUES ('116', 'show_proposals_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('117', 'smtp_encryption', '', '1');
INSERT INTO `tbloptions` VALUES ('118', 'recaptcha_site_key', '', '1');
INSERT INTO `tbloptions` VALUES ('119', 'smtp_username', '', '1');
INSERT INTO `tbloptions` VALUES ('120', 'auto_stop_tasks_timers_on_new_timer', '1', '1');
INSERT INTO `tbloptions` VALUES ('121', 'notification_when_customer_pay_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('122', 'calendar_invoice_color', '#FF6F00', '1');
INSERT INTO `tbloptions` VALUES ('123', 'calendar_estimate_color', '#FF6F00', '1');
INSERT INTO `tbloptions` VALUES ('124', 'calendar_proposal_color', '#84c529', '1');
INSERT INTO `tbloptions` VALUES ('125', 'new_task_auto_assign_current_member', '1', '1');
INSERT INTO `tbloptions` VALUES ('126', 'calendar_reminder_color', '#03A9F4', '1');
INSERT INTO `tbloptions` VALUES ('127', 'calendar_contract_color', '#B72974', '1');
INSERT INTO `tbloptions` VALUES ('128', 'calendar_project_color', '#B72974', '1');
INSERT INTO `tbloptions` VALUES ('129', 'update_info_message', '', '1');
INSERT INTO `tbloptions` VALUES ('130', 'show_estimate_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('131', 'show_invoice_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('132', 'show_proposal_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('133', 'proposal_due_after', '7', '1');
INSERT INTO `tbloptions` VALUES ('134', 'allow_customer_to_change_ticket_status', '0', '1');
INSERT INTO `tbloptions` VALUES ('135', 'lead_lock_after_convert_to_customer', '0', '1');
INSERT INTO `tbloptions` VALUES ('136', 'default_proposals_pipeline_sort', 'pipeline_order', '1');
INSERT INTO `tbloptions` VALUES ('137', 'default_proposals_pipeline_sort_type', 'asc', '1');
INSERT INTO `tbloptions` VALUES ('138', 'default_estimates_pipeline_sort', 'pipeline_order', '1');
INSERT INTO `tbloptions` VALUES ('139', 'default_estimates_pipeline_sort_type', 'asc', '1');
INSERT INTO `tbloptions` VALUES ('140', 'use_recaptcha_customers_area', '0', '1');
INSERT INTO `tbloptions` VALUES ('141', 'remove_decimals_on_zero', '0', '1');
INSERT INTO `tbloptions` VALUES ('142', 'remove_tax_name_from_item_table', '0', '1');
INSERT INTO `tbloptions` VALUES ('143', 'pdf_format_invoice', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('144', 'pdf_format_estimate', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('145', 'pdf_format_proposal', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('146', 'pdf_format_payment', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('147', 'pdf_format_contract', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('148', 'swap_pdf_info', '0', '1');
INSERT INTO `tbloptions` VALUES ('149', 'exclude_invoice_from_client_area_with_draft_status', '1', '1');
INSERT INTO `tbloptions` VALUES ('150', 'cron_has_run_from_cli', '1', '1');
INSERT INTO `tbloptions` VALUES ('151', 'hide_cron_is_required_message', '0', '0');
INSERT INTO `tbloptions` VALUES ('152', 'auto_assign_customer_admin_after_lead_convert', '1', '1');
INSERT INTO `tbloptions` VALUES ('153', 'show_transactions_on_invoice_pdf', '1', '1');
INSERT INTO `tbloptions` VALUES ('154', 'show_pay_link_to_invoice_pdf', '1', '1');
INSERT INTO `tbloptions` VALUES ('155', 'tasks_kanban_limit', '50', '1');
INSERT INTO `tbloptions` VALUES ('156', 'purchase_key', '', '1');
INSERT INTO `tbloptions` VALUES ('157', 'estimates_pipeline_limit', '50', '1');
INSERT INTO `tbloptions` VALUES ('158', 'proposals_pipeline_limit', '50', '1');
INSERT INTO `tbloptions` VALUES ('159', 'proposal_number_prefix', 'PRO-', '1');
INSERT INTO `tbloptions` VALUES ('160', 'number_padding_prefixes', '6', '1');
INSERT INTO `tbloptions` VALUES ('161', 'show_page_number_on_pdf', '0', '1');
INSERT INTO `tbloptions` VALUES ('162', 'calendar_events_limit', '4', '1');
INSERT INTO `tbloptions` VALUES ('163', 'show_setup_menu_item_only_on_hover', '0', '1');
INSERT INTO `tbloptions` VALUES ('164', 'company_requires_vat_number_field', '1', '1');
INSERT INTO `tbloptions` VALUES ('165', 'company_is_required', '1', '1');
INSERT INTO `tbloptions` VALUES ('166', 'allow_contact_to_delete_files', '0', '1');
INSERT INTO `tbloptions` VALUES ('167', 'company_vat', '', '1');
INSERT INTO `tbloptions` VALUES ('168', 'di', '1614322011', '1');
INSERT INTO `tbloptions` VALUES ('169', 'invoice_auto_operations_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('170', 'use_minified_files', '1', '1');
INSERT INTO `tbloptions` VALUES ('171', 'only_own_files_contacts', '0', '1');
INSERT INTO `tbloptions` VALUES ('172', 'allow_primary_contact_to_view_edit_billing_and_shipping', '0', '1');
INSERT INTO `tbloptions` VALUES ('173', 'estimate_due_after', '7', '1');
INSERT INTO `tbloptions` VALUES ('174', 'staff_members_open_tickets_to_all_contacts', '1', '1');
INSERT INTO `tbloptions` VALUES ('175', 'time_format', '24', '1');
INSERT INTO `tbloptions` VALUES ('176', 'delete_activity_log_older_then', '1', '1');
INSERT INTO `tbloptions` VALUES ('177', 'disable_language', '0', '1');
INSERT INTO `tbloptions` VALUES ('178', 'company_state', '', '1');
INSERT INTO `tbloptions` VALUES ('179', 'email_header', '<!doctype html>\r\n                            <html>\r\n                            <head>\r\n                              <meta name=\"viewport\" content=\"width=device-width\" />\r\n                              <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n                              <style>\r\n                                body {\r\n                                 background-color: #f6f6f6;\r\n                                 font-family: sans-serif;\r\n                                 -webkit-font-smoothing: antialiased;\r\n                                 font-size: 14px;\r\n                                 line-height: 1.4;\r\n                                 margin: 0;\r\n                                 padding: 0;\r\n                                 -ms-text-size-adjust: 100%;\r\n                                 -webkit-text-size-adjust: 100%;\r\n                               }\r\n                               table {\r\n                                 border-collapse: separate;\r\n                                 mso-table-lspace: 0pt;\r\n                                 mso-table-rspace: 0pt;\r\n                                 width: 100%;\r\n                               }\r\n                               table td {\r\n                                 font-family: sans-serif;\r\n                                 font-size: 14px;\r\n                                 vertical-align: top;\r\n                               }\r\n                                   /* -------------------------------------\r\n                                     BODY & CONTAINER\r\n                                     ------------------------------------- */\r\n                                     .body {\r\n                                       background-color: #f6f6f6;\r\n                                       width: 100%;\r\n                                     }\r\n                                     /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n\r\n                                     .container {\r\n                                       display: block;\r\n                                       margin: 0 auto !important;\r\n                                       /* makes it centered */\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                       width: 680px;\r\n                                     }\r\n                                     /* This should also be a block element, so that it will fill 100% of the .container */\r\n\r\n                                     .content {\r\n                                       box-sizing: border-box;\r\n                                       display: block;\r\n                                       margin: 0 auto;\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     HEADER, FOOTER, MAIN\r\n                                     ------------------------------------- */\r\n\r\n                                     .main {\r\n                                       background: #fff;\r\n                                       border-radius: 3px;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .wrapper {\r\n                                       box-sizing: border-box;\r\n                                       padding: 20px;\r\n                                     }\r\n                                     .footer {\r\n                                       clear: both;\r\n                                       padding-top: 10px;\r\n                                       text-align: center;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .footer td,\r\n                                     .footer p,\r\n                                     .footer span,\r\n                                     .footer a {\r\n                                       color: #999999;\r\n                                       font-size: 12px;\r\n                                       text-align: center;\r\n                                     }\r\n                                     hr {\r\n                                       border: 0;\r\n                                       border-bottom: 1px solid #f6f6f6;\r\n                                       margin: 20px 0;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     RESPONSIVE AND MOBILE FRIENDLY STYLES\r\n                                     ------------------------------------- */\r\n\r\n                                     @media only screen and (max-width: 620px) {\r\n                                       table[class=body] .content {\r\n                                         padding: 0 !important;\r\n                                       }\r\n                                       table[class=body] .container {\r\n                                         padding: 0 !important;\r\n                                         width: 100% !important;\r\n                                       }\r\n                                       table[class=body] .main {\r\n                                         border-left-width: 0 !important;\r\n                                         border-radius: 0 !important;\r\n                                         border-right-width: 0 !important;\r\n                                       }\r\n                                     }\r\n                                   </style>\r\n                                 </head>\r\n                                 <body class=\"\">\r\n                                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\r\n                                    <tr>\r\n                                     <td>&nbsp;</td>\r\n                                     <td class=\"container\">\r\n                                      <div class=\"content\">\r\n                                        <!-- START CENTERED WHITE CONTAINER -->\r\n                                        <table class=\"main\">\r\n                                          <!-- START MAIN CONTENT AREA -->\r\n                                          <tr>\r\n                                           <td class=\"wrapper\">\r\n                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                              <tr>\r\n                                               <td>', '1');
INSERT INTO `tbloptions` VALUES ('180', 'show_pdf_signature_invoice', '1', '0');
INSERT INTO `tbloptions` VALUES ('181', 'show_pdf_signature_estimate', '1', '0');
INSERT INTO `tbloptions` VALUES ('182', 'signature_image', '', '0');
INSERT INTO `tbloptions` VALUES ('183', 'scroll_responsive_tables', '0', '1');
INSERT INTO `tbloptions` VALUES ('184', 'email_footer', '</td>\r\n                             </tr>\r\n                           </table>\r\n                         </td>\r\n                       </tr>\r\n                       <!-- END MAIN CONTENT AREA -->\r\n                     </table>\r\n                     <!-- START FOOTER -->\r\n                     <div class=\"footer\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                          <td class=\"content-block\">\r\n                            <span>{companyname}</span>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </div>\r\n                    <!-- END FOOTER -->\r\n                    <!-- END CENTERED WHITE CONTAINER -->\r\n                  </div>\r\n                </td>\r\n                <td>&nbsp;</td>\r\n              </tr>\r\n            </table>\r\n            </body>\r\n            </html>', '1');
INSERT INTO `tbloptions` VALUES ('185', 'exclude_proposal_from_client_area_with_draft_status', '1', '1');
INSERT INTO `tbloptions` VALUES ('186', 'pusher_app_key', '', '1');
INSERT INTO `tbloptions` VALUES ('187', 'pusher_app_secret', '', '1');
INSERT INTO `tbloptions` VALUES ('188', 'pusher_app_id', '', '1');
INSERT INTO `tbloptions` VALUES ('189', 'pusher_realtime_notifications', '0', '1');
INSERT INTO `tbloptions` VALUES ('190', 'pdf_format_statement', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('191', 'pusher_cluster', '', '1');
INSERT INTO `tbloptions` VALUES ('192', 'show_table_export_button', 'to_all', '1');
INSERT INTO `tbloptions` VALUES ('193', 'allow_staff_view_proposals_assigned', '1', '1');
INSERT INTO `tbloptions` VALUES ('194', 'show_cloudflare_notice', '1', '0');
INSERT INTO `tbloptions` VALUES ('195', 'task_modal_class', 'modal-lg', '1');
INSERT INTO `tbloptions` VALUES ('196', 'lead_modal_class', 'modal-lg', '1');
INSERT INTO `tbloptions` VALUES ('197', 'show_timesheets_overview_all_members_notice_admins', '1', '0');
INSERT INTO `tbloptions` VALUES ('198', 'desktop_notifications', '0', '1');
INSERT INTO `tbloptions` VALUES ('199', 'hide_notified_reminders_from_calendar', '1', '0');
INSERT INTO `tbloptions` VALUES ('200', 'customer_info_format', '{company_name}<br />\r\r\n{street}<br />\r\r\n{city} {state}<br />\r\r\n{country_code} {zip_code}<br />\r\r\n{vat_number_with_label}', '0');
INSERT INTO `tbloptions` VALUES ('201', 'timer_started_change_status_in_progress', '1', '0');
INSERT INTO `tbloptions` VALUES ('202', 'default_ticket_reply_status', '3', '1');
INSERT INTO `tbloptions` VALUES ('203', 'default_task_status', 'auto', '1');
INSERT INTO `tbloptions` VALUES ('204', 'email_queue_skip_with_attachments', '1', '1');
INSERT INTO `tbloptions` VALUES ('205', 'email_queue_enabled', '0', '1');
INSERT INTO `tbloptions` VALUES ('206', 'last_email_queue_retry', '1606474741', '1');
INSERT INTO `tbloptions` VALUES ('207', 'auto_dismiss_desktop_notifications_after', '0', '1');
INSERT INTO `tbloptions` VALUES ('208', 'proposal_info_format', '{proposal_to}<br />\r\r\n{address}<br />\r\r\n{city} {state}<br />\r\r\n{country_code} {zip_code}<br />\r\r\n{phone}<br />\r\r\n{email}', '0');
INSERT INTO `tbloptions` VALUES ('209', 'ticket_replies_order', 'asc', '1');
INSERT INTO `tbloptions` VALUES ('210', 'new_recurring_invoice_action', 'generate_and_send', '0');
INSERT INTO `tbloptions` VALUES ('211', 'bcc_emails', '', '0');
INSERT INTO `tbloptions` VALUES ('212', 'email_templates_language_checks', 'a:1725:{s:28:\"new-client-created-bulgarian\";i:1;s:32:\"invoice-send-to-client-bulgarian\";i:1;s:33:\"new-ticket-opened-admin-bulgarian\";i:1;s:22:\"ticket-reply-bulgarian\";i:1;s:29:\"ticket-autoresponse-bulgarian\";i:1;s:34:\"invoice-payment-recorded-bulgarian\";i:1;s:32:\"invoice-overdue-notice-bulgarian\";i:1;s:30:\"invoice-already-send-bulgarian\";i:1;s:34:\"new-ticket-created-staff-bulgarian\";i:1;s:33:\"estimate-send-to-client-bulgarian\";i:1;s:31:\"ticket-reply-to-admin-bulgarian\";i:1;s:31:\"estimate-already-send-bulgarian\";i:1;s:29:\"contract-expiration-bulgarian\";i:1;s:23:\"task-assigned-bulgarian\";i:1;s:32:\"task-added-as-follower-bulgarian\";i:1;s:24:\"task-commented-bulgarian\";i:1;s:31:\"task-added-attachment-bulgarian\";i:1;s:36:\"estimate-declined-to-staff-bulgarian\";i:1;s:36:\"estimate-accepted-to-staff-bulgarian\";i:1;s:34:\"proposal-client-accepted-bulgarian\";i:1;s:35:\"proposal-send-to-customer-bulgarian\";i:1;s:34:\"proposal-client-declined-bulgarian\";i:1;s:35:\"proposal-client-thank-you-bulgarian\";i:1;s:36:\"proposal-comment-to-client-bulgarian\";i:1;s:35:\"proposal-comment-to-admin-bulgarian\";i:1;s:40:\"estimate-thank-you-to-customer-bulgarian\";i:1;s:36:\"task-deadline-notification-bulgarian\";i:1;s:23:\"send-contract-bulgarian\";i:1;s:43:\"invoice-payment-recorded-to-staff-bulgarian\";i:1;s:27:\"auto-close-ticket-bulgarian\";i:1;s:49:\"new-project-discussion-created-to-staff-bulgarian\";i:1;s:52:\"new-project-discussion-created-to-customer-bulgarian\";i:1;s:47:\"new-project-file-uploaded-to-customer-bulgarian\";i:1;s:44:\"new-project-file-uploaded-to-staff-bulgarian\";i:1;s:52:\"new-project-discussion-comment-to-customer-bulgarian\";i:1;s:49:\"new-project-discussion-comment-to-staff-bulgarian\";i:1;s:39:\"staff-added-as-project-member-bulgarian\";i:1;s:34:\"estimate-expiry-reminder-bulgarian\";i:1;s:34:\"proposal-expiry-reminder-bulgarian\";i:1;s:27:\"new-staff-created-bulgarian\";i:1;s:33:\"contact-forgot-password-bulgarian\";i:1;s:34:\"contact-password-reseted-bulgarian\";i:1;s:30:\"contact-set-password-bulgarian\";i:1;s:31:\"staff-forgot-password-bulgarian\";i:1;s:32:\"staff-password-reseted-bulgarian\";i:1;s:29:\"assigned-to-project-bulgarian\";i:1;s:43:\"task-added-attachment-to-contacts-bulgarian\";i:1;s:36:\"task-commented-to-contacts-bulgarian\";i:1;s:27:\"new-lead-assigned-bulgarian\";i:1;s:26:\"client-statement-bulgarian\";i:1;s:34:\"ticket-assigned-to-admin-bulgarian\";i:1;s:40:\"new-client-registered-to-admin-bulgarian\";i:1;s:40:\"new-web-to-lead-form-submitted-bulgarian\";i:1;s:35:\"two-factor-authentication-bulgarian\";i:1;s:38:\"project-finished-to-customer-bulgarian\";i:1;s:36:\"credit-note-send-to-client-bulgarian\";i:1;s:37:\"task-status-change-to-staff-bulgarian\";i:1;s:40:\"task-status-change-to-contacts-bulgarian\";i:1;s:30:\"reminder-email-staff-bulgarian\";i:1;s:36:\"contract-comment-to-client-bulgarian\";i:1;s:35:\"contract-comment-to-admin-bulgarian\";i:1;s:27:\"send-subscription-bulgarian\";i:1;s:37:\"subscription-payment-failed-bulgarian\";i:1;s:31:\"subscription-canceled-bulgarian\";i:1;s:40:\"subscription-payment-succeeded-bulgarian\";i:1;s:38:\"contract-expiration-to-staff-bulgarian\";i:1;s:30:\"gdpr-removal-request-bulgarian\";i:1;s:35:\"gdpr-removal-request-lead-bulgarian\";i:1;s:39:\"client-registration-confirmed-bulgarian\";i:1;s:34:\"contract-signed-to-staff-bulgarian\";i:1;s:38:\"customer-subscribed-to-staff-bulgarian\";i:1;s:36:\"contact-verification-email-bulgarian\";i:1;s:53:\"new-customer-profile-file-uploaded-to-staff-bulgarian\";i:1;s:37:\"event-notification-to-staff-bulgarian\";i:1;s:46:\"subscription-payment-requires-action-bulgarian\";i:1;s:26:\"new-client-created-catalan\";i:1;s:30:\"invoice-send-to-client-catalan\";i:1;s:31:\"new-ticket-opened-admin-catalan\";i:1;s:20:\"ticket-reply-catalan\";i:1;s:27:\"ticket-autoresponse-catalan\";i:1;s:32:\"invoice-payment-recorded-catalan\";i:1;s:30:\"invoice-overdue-notice-catalan\";i:1;s:28:\"invoice-already-send-catalan\";i:1;s:32:\"new-ticket-created-staff-catalan\";i:1;s:31:\"estimate-send-to-client-catalan\";i:1;s:29:\"ticket-reply-to-admin-catalan\";i:1;s:29:\"estimate-already-send-catalan\";i:1;s:27:\"contract-expiration-catalan\";i:1;s:21:\"task-assigned-catalan\";i:1;s:30:\"task-added-as-follower-catalan\";i:1;s:22:\"task-commented-catalan\";i:1;s:29:\"task-added-attachment-catalan\";i:1;s:34:\"estimate-declined-to-staff-catalan\";i:1;s:34:\"estimate-accepted-to-staff-catalan\";i:1;s:32:\"proposal-client-accepted-catalan\";i:1;s:33:\"proposal-send-to-customer-catalan\";i:1;s:32:\"proposal-client-declined-catalan\";i:1;s:33:\"proposal-client-thank-you-catalan\";i:1;s:34:\"proposal-comment-to-client-catalan\";i:1;s:33:\"proposal-comment-to-admin-catalan\";i:1;s:38:\"estimate-thank-you-to-customer-catalan\";i:1;s:34:\"task-deadline-notification-catalan\";i:1;s:21:\"send-contract-catalan\";i:1;s:41:\"invoice-payment-recorded-to-staff-catalan\";i:1;s:25:\"auto-close-ticket-catalan\";i:1;s:47:\"new-project-discussion-created-to-staff-catalan\";i:1;s:50:\"new-project-discussion-created-to-customer-catalan\";i:1;s:45:\"new-project-file-uploaded-to-customer-catalan\";i:1;s:42:\"new-project-file-uploaded-to-staff-catalan\";i:1;s:50:\"new-project-discussion-comment-to-customer-catalan\";i:1;s:47:\"new-project-discussion-comment-to-staff-catalan\";i:1;s:37:\"staff-added-as-project-member-catalan\";i:1;s:32:\"estimate-expiry-reminder-catalan\";i:1;s:32:\"proposal-expiry-reminder-catalan\";i:1;s:25:\"new-staff-created-catalan\";i:1;s:31:\"contact-forgot-password-catalan\";i:1;s:32:\"contact-password-reseted-catalan\";i:1;s:28:\"contact-set-password-catalan\";i:1;s:29:\"staff-forgot-password-catalan\";i:1;s:30:\"staff-password-reseted-catalan\";i:1;s:27:\"assigned-to-project-catalan\";i:1;s:41:\"task-added-attachment-to-contacts-catalan\";i:1;s:34:\"task-commented-to-contacts-catalan\";i:1;s:25:\"new-lead-assigned-catalan\";i:1;s:24:\"client-statement-catalan\";i:1;s:32:\"ticket-assigned-to-admin-catalan\";i:1;s:38:\"new-client-registered-to-admin-catalan\";i:1;s:38:\"new-web-to-lead-form-submitted-catalan\";i:1;s:33:\"two-factor-authentication-catalan\";i:1;s:36:\"project-finished-to-customer-catalan\";i:1;s:34:\"credit-note-send-to-client-catalan\";i:1;s:35:\"task-status-change-to-staff-catalan\";i:1;s:38:\"task-status-change-to-contacts-catalan\";i:1;s:28:\"reminder-email-staff-catalan\";i:1;s:34:\"contract-comment-to-client-catalan\";i:1;s:33:\"contract-comment-to-admin-catalan\";i:1;s:25:\"send-subscription-catalan\";i:1;s:35:\"subscription-payment-failed-catalan\";i:1;s:29:\"subscription-canceled-catalan\";i:1;s:38:\"subscription-payment-succeeded-catalan\";i:1;s:36:\"contract-expiration-to-staff-catalan\";i:1;s:28:\"gdpr-removal-request-catalan\";i:1;s:33:\"gdpr-removal-request-lead-catalan\";i:1;s:37:\"client-registration-confirmed-catalan\";i:1;s:32:\"contract-signed-to-staff-catalan\";i:1;s:36:\"customer-subscribed-to-staff-catalan\";i:1;s:34:\"contact-verification-email-catalan\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-catalan\";i:1;s:35:\"event-notification-to-staff-catalan\";i:1;s:44:\"subscription-payment-requires-action-catalan\";i:1;s:26:\"new-client-created-chinese\";i:1;s:30:\"invoice-send-to-client-chinese\";i:1;s:31:\"new-ticket-opened-admin-chinese\";i:1;s:20:\"ticket-reply-chinese\";i:1;s:27:\"ticket-autoresponse-chinese\";i:1;s:32:\"invoice-payment-recorded-chinese\";i:1;s:30:\"invoice-overdue-notice-chinese\";i:1;s:28:\"invoice-already-send-chinese\";i:1;s:32:\"new-ticket-created-staff-chinese\";i:1;s:31:\"estimate-send-to-client-chinese\";i:1;s:29:\"ticket-reply-to-admin-chinese\";i:1;s:29:\"estimate-already-send-chinese\";i:1;s:27:\"contract-expiration-chinese\";i:1;s:21:\"task-assigned-chinese\";i:1;s:30:\"task-added-as-follower-chinese\";i:1;s:22:\"task-commented-chinese\";i:1;s:29:\"task-added-attachment-chinese\";i:1;s:34:\"estimate-declined-to-staff-chinese\";i:1;s:34:\"estimate-accepted-to-staff-chinese\";i:1;s:32:\"proposal-client-accepted-chinese\";i:1;s:33:\"proposal-send-to-customer-chinese\";i:1;s:32:\"proposal-client-declined-chinese\";i:1;s:33:\"proposal-client-thank-you-chinese\";i:1;s:34:\"proposal-comment-to-client-chinese\";i:1;s:33:\"proposal-comment-to-admin-chinese\";i:1;s:38:\"estimate-thank-you-to-customer-chinese\";i:1;s:34:\"task-deadline-notification-chinese\";i:1;s:21:\"send-contract-chinese\";i:1;s:41:\"invoice-payment-recorded-to-staff-chinese\";i:1;s:25:\"auto-close-ticket-chinese\";i:1;s:47:\"new-project-discussion-created-to-staff-chinese\";i:1;s:50:\"new-project-discussion-created-to-customer-chinese\";i:1;s:45:\"new-project-file-uploaded-to-customer-chinese\";i:1;s:42:\"new-project-file-uploaded-to-staff-chinese\";i:1;s:50:\"new-project-discussion-comment-to-customer-chinese\";i:1;s:47:\"new-project-discussion-comment-to-staff-chinese\";i:1;s:37:\"staff-added-as-project-member-chinese\";i:1;s:32:\"estimate-expiry-reminder-chinese\";i:1;s:32:\"proposal-expiry-reminder-chinese\";i:1;s:25:\"new-staff-created-chinese\";i:1;s:31:\"contact-forgot-password-chinese\";i:1;s:32:\"contact-password-reseted-chinese\";i:1;s:28:\"contact-set-password-chinese\";i:1;s:29:\"staff-forgot-password-chinese\";i:1;s:30:\"staff-password-reseted-chinese\";i:1;s:27:\"assigned-to-project-chinese\";i:1;s:41:\"task-added-attachment-to-contacts-chinese\";i:1;s:34:\"task-commented-to-contacts-chinese\";i:1;s:25:\"new-lead-assigned-chinese\";i:1;s:24:\"client-statement-chinese\";i:1;s:32:\"ticket-assigned-to-admin-chinese\";i:1;s:38:\"new-client-registered-to-admin-chinese\";i:1;s:38:\"new-web-to-lead-form-submitted-chinese\";i:1;s:33:\"two-factor-authentication-chinese\";i:1;s:36:\"project-finished-to-customer-chinese\";i:1;s:34:\"credit-note-send-to-client-chinese\";i:1;s:35:\"task-status-change-to-staff-chinese\";i:1;s:38:\"task-status-change-to-contacts-chinese\";i:1;s:28:\"reminder-email-staff-chinese\";i:1;s:34:\"contract-comment-to-client-chinese\";i:1;s:33:\"contract-comment-to-admin-chinese\";i:1;s:25:\"send-subscription-chinese\";i:1;s:35:\"subscription-payment-failed-chinese\";i:1;s:29:\"subscription-canceled-chinese\";i:1;s:38:\"subscription-payment-succeeded-chinese\";i:1;s:36:\"contract-expiration-to-staff-chinese\";i:1;s:28:\"gdpr-removal-request-chinese\";i:1;s:33:\"gdpr-removal-request-lead-chinese\";i:1;s:37:\"client-registration-confirmed-chinese\";i:1;s:32:\"contract-signed-to-staff-chinese\";i:1;s:36:\"customer-subscribed-to-staff-chinese\";i:1;s:34:\"contact-verification-email-chinese\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-chinese\";i:1;s:35:\"event-notification-to-staff-chinese\";i:1;s:44:\"subscription-payment-requires-action-chinese\";i:1;s:24:\"new-client-created-czech\";i:1;s:28:\"invoice-send-to-client-czech\";i:1;s:29:\"new-ticket-opened-admin-czech\";i:1;s:18:\"ticket-reply-czech\";i:1;s:25:\"ticket-autoresponse-czech\";i:1;s:30:\"invoice-payment-recorded-czech\";i:1;s:28:\"invoice-overdue-notice-czech\";i:1;s:26:\"invoice-already-send-czech\";i:1;s:30:\"new-ticket-created-staff-czech\";i:1;s:29:\"estimate-send-to-client-czech\";i:1;s:27:\"ticket-reply-to-admin-czech\";i:1;s:27:\"estimate-already-send-czech\";i:1;s:25:\"contract-expiration-czech\";i:1;s:19:\"task-assigned-czech\";i:1;s:28:\"task-added-as-follower-czech\";i:1;s:20:\"task-commented-czech\";i:1;s:27:\"task-added-attachment-czech\";i:1;s:32:\"estimate-declined-to-staff-czech\";i:1;s:32:\"estimate-accepted-to-staff-czech\";i:1;s:30:\"proposal-client-accepted-czech\";i:1;s:31:\"proposal-send-to-customer-czech\";i:1;s:30:\"proposal-client-declined-czech\";i:1;s:31:\"proposal-client-thank-you-czech\";i:1;s:32:\"proposal-comment-to-client-czech\";i:1;s:31:\"proposal-comment-to-admin-czech\";i:1;s:36:\"estimate-thank-you-to-customer-czech\";i:1;s:32:\"task-deadline-notification-czech\";i:1;s:19:\"send-contract-czech\";i:1;s:39:\"invoice-payment-recorded-to-staff-czech\";i:1;s:23:\"auto-close-ticket-czech\";i:1;s:45:\"new-project-discussion-created-to-staff-czech\";i:1;s:48:\"new-project-discussion-created-to-customer-czech\";i:1;s:43:\"new-project-file-uploaded-to-customer-czech\";i:1;s:40:\"new-project-file-uploaded-to-staff-czech\";i:1;s:48:\"new-project-discussion-comment-to-customer-czech\";i:1;s:45:\"new-project-discussion-comment-to-staff-czech\";i:1;s:35:\"staff-added-as-project-member-czech\";i:1;s:30:\"estimate-expiry-reminder-czech\";i:1;s:30:\"proposal-expiry-reminder-czech\";i:1;s:23:\"new-staff-created-czech\";i:1;s:29:\"contact-forgot-password-czech\";i:1;s:30:\"contact-password-reseted-czech\";i:1;s:26:\"contact-set-password-czech\";i:1;s:27:\"staff-forgot-password-czech\";i:1;s:28:\"staff-password-reseted-czech\";i:1;s:25:\"assigned-to-project-czech\";i:1;s:39:\"task-added-attachment-to-contacts-czech\";i:1;s:32:\"task-commented-to-contacts-czech\";i:1;s:23:\"new-lead-assigned-czech\";i:1;s:22:\"client-statement-czech\";i:1;s:30:\"ticket-assigned-to-admin-czech\";i:1;s:36:\"new-client-registered-to-admin-czech\";i:1;s:36:\"new-web-to-lead-form-submitted-czech\";i:1;s:31:\"two-factor-authentication-czech\";i:1;s:34:\"project-finished-to-customer-czech\";i:1;s:32:\"credit-note-send-to-client-czech\";i:1;s:33:\"task-status-change-to-staff-czech\";i:1;s:36:\"task-status-change-to-contacts-czech\";i:1;s:26:\"reminder-email-staff-czech\";i:1;s:32:\"contract-comment-to-client-czech\";i:1;s:31:\"contract-comment-to-admin-czech\";i:1;s:23:\"send-subscription-czech\";i:1;s:33:\"subscription-payment-failed-czech\";i:1;s:27:\"subscription-canceled-czech\";i:1;s:36:\"subscription-payment-succeeded-czech\";i:1;s:34:\"contract-expiration-to-staff-czech\";i:1;s:26:\"gdpr-removal-request-czech\";i:1;s:31:\"gdpr-removal-request-lead-czech\";i:1;s:35:\"client-registration-confirmed-czech\";i:1;s:30:\"contract-signed-to-staff-czech\";i:1;s:34:\"customer-subscribed-to-staff-czech\";i:1;s:32:\"contact-verification-email-czech\";i:1;s:49:\"new-customer-profile-file-uploaded-to-staff-czech\";i:1;s:33:\"event-notification-to-staff-czech\";i:1;s:42:\"subscription-payment-requires-action-czech\";i:1;s:24:\"new-client-created-dutch\";i:1;s:28:\"invoice-send-to-client-dutch\";i:1;s:29:\"new-ticket-opened-admin-dutch\";i:1;s:18:\"ticket-reply-dutch\";i:1;s:25:\"ticket-autoresponse-dutch\";i:1;s:30:\"invoice-payment-recorded-dutch\";i:1;s:28:\"invoice-overdue-notice-dutch\";i:1;s:26:\"invoice-already-send-dutch\";i:1;s:30:\"new-ticket-created-staff-dutch\";i:1;s:29:\"estimate-send-to-client-dutch\";i:1;s:27:\"ticket-reply-to-admin-dutch\";i:1;s:27:\"estimate-already-send-dutch\";i:1;s:25:\"contract-expiration-dutch\";i:1;s:19:\"task-assigned-dutch\";i:1;s:28:\"task-added-as-follower-dutch\";i:1;s:20:\"task-commented-dutch\";i:1;s:27:\"task-added-attachment-dutch\";i:1;s:32:\"estimate-declined-to-staff-dutch\";i:1;s:32:\"estimate-accepted-to-staff-dutch\";i:1;s:30:\"proposal-client-accepted-dutch\";i:1;s:31:\"proposal-send-to-customer-dutch\";i:1;s:30:\"proposal-client-declined-dutch\";i:1;s:31:\"proposal-client-thank-you-dutch\";i:1;s:32:\"proposal-comment-to-client-dutch\";i:1;s:31:\"proposal-comment-to-admin-dutch\";i:1;s:36:\"estimate-thank-you-to-customer-dutch\";i:1;s:32:\"task-deadline-notification-dutch\";i:1;s:19:\"send-contract-dutch\";i:1;s:39:\"invoice-payment-recorded-to-staff-dutch\";i:1;s:23:\"auto-close-ticket-dutch\";i:1;s:45:\"new-project-discussion-created-to-staff-dutch\";i:1;s:48:\"new-project-discussion-created-to-customer-dutch\";i:1;s:43:\"new-project-file-uploaded-to-customer-dutch\";i:1;s:40:\"new-project-file-uploaded-to-staff-dutch\";i:1;s:48:\"new-project-discussion-comment-to-customer-dutch\";i:1;s:45:\"new-project-discussion-comment-to-staff-dutch\";i:1;s:35:\"staff-added-as-project-member-dutch\";i:1;s:30:\"estimate-expiry-reminder-dutch\";i:1;s:30:\"proposal-expiry-reminder-dutch\";i:1;s:23:\"new-staff-created-dutch\";i:1;s:29:\"contact-forgot-password-dutch\";i:1;s:30:\"contact-password-reseted-dutch\";i:1;s:26:\"contact-set-password-dutch\";i:1;s:27:\"staff-forgot-password-dutch\";i:1;s:28:\"staff-password-reseted-dutch\";i:1;s:25:\"assigned-to-project-dutch\";i:1;s:39:\"task-added-attachment-to-contacts-dutch\";i:1;s:32:\"task-commented-to-contacts-dutch\";i:1;s:23:\"new-lead-assigned-dutch\";i:1;s:22:\"client-statement-dutch\";i:1;s:30:\"ticket-assigned-to-admin-dutch\";i:1;s:36:\"new-client-registered-to-admin-dutch\";i:1;s:36:\"new-web-to-lead-form-submitted-dutch\";i:1;s:31:\"two-factor-authentication-dutch\";i:1;s:34:\"project-finished-to-customer-dutch\";i:1;s:32:\"credit-note-send-to-client-dutch\";i:1;s:33:\"task-status-change-to-staff-dutch\";i:1;s:36:\"task-status-change-to-contacts-dutch\";i:1;s:26:\"reminder-email-staff-dutch\";i:1;s:32:\"contract-comment-to-client-dutch\";i:1;s:31:\"contract-comment-to-admin-dutch\";i:1;s:23:\"send-subscription-dutch\";i:1;s:33:\"subscription-payment-failed-dutch\";i:1;s:27:\"subscription-canceled-dutch\";i:1;s:36:\"subscription-payment-succeeded-dutch\";i:1;s:34:\"contract-expiration-to-staff-dutch\";i:1;s:26:\"gdpr-removal-request-dutch\";i:1;s:31:\"gdpr-removal-request-lead-dutch\";i:1;s:35:\"client-registration-confirmed-dutch\";i:1;s:30:\"contract-signed-to-staff-dutch\";i:1;s:34:\"customer-subscribed-to-staff-dutch\";i:1;s:32:\"contact-verification-email-dutch\";i:1;s:49:\"new-customer-profile-file-uploaded-to-staff-dutch\";i:1;s:33:\"event-notification-to-staff-dutch\";i:1;s:42:\"subscription-payment-requires-action-dutch\";i:1;s:25:\"new-client-created-french\";i:1;s:29:\"invoice-send-to-client-french\";i:1;s:30:\"new-ticket-opened-admin-french\";i:1;s:19:\"ticket-reply-french\";i:1;s:26:\"ticket-autoresponse-french\";i:1;s:31:\"invoice-payment-recorded-french\";i:1;s:29:\"invoice-overdue-notice-french\";i:1;s:27:\"invoice-already-send-french\";i:1;s:31:\"new-ticket-created-staff-french\";i:1;s:30:\"estimate-send-to-client-french\";i:1;s:28:\"ticket-reply-to-admin-french\";i:1;s:28:\"estimate-already-send-french\";i:1;s:26:\"contract-expiration-french\";i:1;s:20:\"task-assigned-french\";i:1;s:29:\"task-added-as-follower-french\";i:1;s:21:\"task-commented-french\";i:1;s:28:\"task-added-attachment-french\";i:1;s:33:\"estimate-declined-to-staff-french\";i:1;s:33:\"estimate-accepted-to-staff-french\";i:1;s:31:\"proposal-client-accepted-french\";i:1;s:32:\"proposal-send-to-customer-french\";i:1;s:31:\"proposal-client-declined-french\";i:1;s:32:\"proposal-client-thank-you-french\";i:1;s:33:\"proposal-comment-to-client-french\";i:1;s:32:\"proposal-comment-to-admin-french\";i:1;s:37:\"estimate-thank-you-to-customer-french\";i:1;s:33:\"task-deadline-notification-french\";i:1;s:20:\"send-contract-french\";i:1;s:40:\"invoice-payment-recorded-to-staff-french\";i:1;s:24:\"auto-close-ticket-french\";i:1;s:46:\"new-project-discussion-created-to-staff-french\";i:1;s:49:\"new-project-discussion-created-to-customer-french\";i:1;s:44:\"new-project-file-uploaded-to-customer-french\";i:1;s:41:\"new-project-file-uploaded-to-staff-french\";i:1;s:49:\"new-project-discussion-comment-to-customer-french\";i:1;s:46:\"new-project-discussion-comment-to-staff-french\";i:1;s:36:\"staff-added-as-project-member-french\";i:1;s:31:\"estimate-expiry-reminder-french\";i:1;s:31:\"proposal-expiry-reminder-french\";i:1;s:24:\"new-staff-created-french\";i:1;s:30:\"contact-forgot-password-french\";i:1;s:31:\"contact-password-reseted-french\";i:1;s:27:\"contact-set-password-french\";i:1;s:28:\"staff-forgot-password-french\";i:1;s:29:\"staff-password-reseted-french\";i:1;s:26:\"assigned-to-project-french\";i:1;s:40:\"task-added-attachment-to-contacts-french\";i:1;s:33:\"task-commented-to-contacts-french\";i:1;s:24:\"new-lead-assigned-french\";i:1;s:23:\"client-statement-french\";i:1;s:31:\"ticket-assigned-to-admin-french\";i:1;s:37:\"new-client-registered-to-admin-french\";i:1;s:37:\"new-web-to-lead-form-submitted-french\";i:1;s:32:\"two-factor-authentication-french\";i:1;s:35:\"project-finished-to-customer-french\";i:1;s:33:\"credit-note-send-to-client-french\";i:1;s:34:\"task-status-change-to-staff-french\";i:1;s:37:\"task-status-change-to-contacts-french\";i:1;s:27:\"reminder-email-staff-french\";i:1;s:33:\"contract-comment-to-client-french\";i:1;s:32:\"contract-comment-to-admin-french\";i:1;s:24:\"send-subscription-french\";i:1;s:34:\"subscription-payment-failed-french\";i:1;s:28:\"subscription-canceled-french\";i:1;s:37:\"subscription-payment-succeeded-french\";i:1;s:35:\"contract-expiration-to-staff-french\";i:1;s:27:\"gdpr-removal-request-french\";i:1;s:32:\"gdpr-removal-request-lead-french\";i:1;s:36:\"client-registration-confirmed-french\";i:1;s:31:\"contract-signed-to-staff-french\";i:1;s:35:\"customer-subscribed-to-staff-french\";i:1;s:33:\"contact-verification-email-french\";i:1;s:50:\"new-customer-profile-file-uploaded-to-staff-french\";i:1;s:34:\"event-notification-to-staff-french\";i:1;s:43:\"subscription-payment-requires-action-french\";i:1;s:25:\"new-client-created-german\";i:1;s:29:\"invoice-send-to-client-german\";i:1;s:30:\"new-ticket-opened-admin-german\";i:1;s:19:\"ticket-reply-german\";i:1;s:26:\"ticket-autoresponse-german\";i:1;s:31:\"invoice-payment-recorded-german\";i:1;s:29:\"invoice-overdue-notice-german\";i:1;s:27:\"invoice-already-send-german\";i:1;s:31:\"new-ticket-created-staff-german\";i:1;s:30:\"estimate-send-to-client-german\";i:1;s:28:\"ticket-reply-to-admin-german\";i:1;s:28:\"estimate-already-send-german\";i:1;s:26:\"contract-expiration-german\";i:1;s:20:\"task-assigned-german\";i:1;s:29:\"task-added-as-follower-german\";i:1;s:21:\"task-commented-german\";i:1;s:28:\"task-added-attachment-german\";i:1;s:33:\"estimate-declined-to-staff-german\";i:1;s:33:\"estimate-accepted-to-staff-german\";i:1;s:31:\"proposal-client-accepted-german\";i:1;s:32:\"proposal-send-to-customer-german\";i:1;s:31:\"proposal-client-declined-german\";i:1;s:32:\"proposal-client-thank-you-german\";i:1;s:33:\"proposal-comment-to-client-german\";i:1;s:32:\"proposal-comment-to-admin-german\";i:1;s:37:\"estimate-thank-you-to-customer-german\";i:1;s:33:\"task-deadline-notification-german\";i:1;s:20:\"send-contract-german\";i:1;s:40:\"invoice-payment-recorded-to-staff-german\";i:1;s:24:\"auto-close-ticket-german\";i:1;s:46:\"new-project-discussion-created-to-staff-german\";i:1;s:49:\"new-project-discussion-created-to-customer-german\";i:1;s:44:\"new-project-file-uploaded-to-customer-german\";i:1;s:41:\"new-project-file-uploaded-to-staff-german\";i:1;s:49:\"new-project-discussion-comment-to-customer-german\";i:1;s:46:\"new-project-discussion-comment-to-staff-german\";i:1;s:36:\"staff-added-as-project-member-german\";i:1;s:31:\"estimate-expiry-reminder-german\";i:1;s:31:\"proposal-expiry-reminder-german\";i:1;s:24:\"new-staff-created-german\";i:1;s:30:\"contact-forgot-password-german\";i:1;s:31:\"contact-password-reseted-german\";i:1;s:27:\"contact-set-password-german\";i:1;s:28:\"staff-forgot-password-german\";i:1;s:29:\"staff-password-reseted-german\";i:1;s:26:\"assigned-to-project-german\";i:1;s:40:\"task-added-attachment-to-contacts-german\";i:1;s:33:\"task-commented-to-contacts-german\";i:1;s:24:\"new-lead-assigned-german\";i:1;s:23:\"client-statement-german\";i:1;s:31:\"ticket-assigned-to-admin-german\";i:1;s:37:\"new-client-registered-to-admin-german\";i:1;s:37:\"new-web-to-lead-form-submitted-german\";i:1;s:32:\"two-factor-authentication-german\";i:1;s:35:\"project-finished-to-customer-german\";i:1;s:33:\"credit-note-send-to-client-german\";i:1;s:34:\"task-status-change-to-staff-german\";i:1;s:37:\"task-status-change-to-contacts-german\";i:1;s:27:\"reminder-email-staff-german\";i:1;s:33:\"contract-comment-to-client-german\";i:1;s:32:\"contract-comment-to-admin-german\";i:1;s:24:\"send-subscription-german\";i:1;s:34:\"subscription-payment-failed-german\";i:1;s:28:\"subscription-canceled-german\";i:1;s:37:\"subscription-payment-succeeded-german\";i:1;s:35:\"contract-expiration-to-staff-german\";i:1;s:27:\"gdpr-removal-request-german\";i:1;s:32:\"gdpr-removal-request-lead-german\";i:1;s:36:\"client-registration-confirmed-german\";i:1;s:31:\"contract-signed-to-staff-german\";i:1;s:35:\"customer-subscribed-to-staff-german\";i:1;s:33:\"contact-verification-email-german\";i:1;s:50:\"new-customer-profile-file-uploaded-to-staff-german\";i:1;s:34:\"event-notification-to-staff-german\";i:1;s:43:\"subscription-payment-requires-action-german\";i:1;s:24:\"new-client-created-greek\";i:1;s:28:\"invoice-send-to-client-greek\";i:1;s:29:\"new-ticket-opened-admin-greek\";i:1;s:18:\"ticket-reply-greek\";i:1;s:25:\"ticket-autoresponse-greek\";i:1;s:30:\"invoice-payment-recorded-greek\";i:1;s:28:\"invoice-overdue-notice-greek\";i:1;s:26:\"invoice-already-send-greek\";i:1;s:30:\"new-ticket-created-staff-greek\";i:1;s:29:\"estimate-send-to-client-greek\";i:1;s:27:\"ticket-reply-to-admin-greek\";i:1;s:27:\"estimate-already-send-greek\";i:1;s:25:\"contract-expiration-greek\";i:1;s:19:\"task-assigned-greek\";i:1;s:28:\"task-added-as-follower-greek\";i:1;s:20:\"task-commented-greek\";i:1;s:27:\"task-added-attachment-greek\";i:1;s:32:\"estimate-declined-to-staff-greek\";i:1;s:32:\"estimate-accepted-to-staff-greek\";i:1;s:30:\"proposal-client-accepted-greek\";i:1;s:31:\"proposal-send-to-customer-greek\";i:1;s:30:\"proposal-client-declined-greek\";i:1;s:31:\"proposal-client-thank-you-greek\";i:1;s:32:\"proposal-comment-to-client-greek\";i:1;s:31:\"proposal-comment-to-admin-greek\";i:1;s:36:\"estimate-thank-you-to-customer-greek\";i:1;s:32:\"task-deadline-notification-greek\";i:1;s:19:\"send-contract-greek\";i:1;s:39:\"invoice-payment-recorded-to-staff-greek\";i:1;s:23:\"auto-close-ticket-greek\";i:1;s:45:\"new-project-discussion-created-to-staff-greek\";i:1;s:48:\"new-project-discussion-created-to-customer-greek\";i:1;s:43:\"new-project-file-uploaded-to-customer-greek\";i:1;s:40:\"new-project-file-uploaded-to-staff-greek\";i:1;s:48:\"new-project-discussion-comment-to-customer-greek\";i:1;s:45:\"new-project-discussion-comment-to-staff-greek\";i:1;s:35:\"staff-added-as-project-member-greek\";i:1;s:30:\"estimate-expiry-reminder-greek\";i:1;s:30:\"proposal-expiry-reminder-greek\";i:1;s:23:\"new-staff-created-greek\";i:1;s:29:\"contact-forgot-password-greek\";i:1;s:30:\"contact-password-reseted-greek\";i:1;s:26:\"contact-set-password-greek\";i:1;s:27:\"staff-forgot-password-greek\";i:1;s:28:\"staff-password-reseted-greek\";i:1;s:25:\"assigned-to-project-greek\";i:1;s:39:\"task-added-attachment-to-contacts-greek\";i:1;s:32:\"task-commented-to-contacts-greek\";i:1;s:23:\"new-lead-assigned-greek\";i:1;s:22:\"client-statement-greek\";i:1;s:30:\"ticket-assigned-to-admin-greek\";i:1;s:36:\"new-client-registered-to-admin-greek\";i:1;s:36:\"new-web-to-lead-form-submitted-greek\";i:1;s:31:\"two-factor-authentication-greek\";i:1;s:34:\"project-finished-to-customer-greek\";i:1;s:32:\"credit-note-send-to-client-greek\";i:1;s:33:\"task-status-change-to-staff-greek\";i:1;s:36:\"task-status-change-to-contacts-greek\";i:1;s:26:\"reminder-email-staff-greek\";i:1;s:32:\"contract-comment-to-client-greek\";i:1;s:31:\"contract-comment-to-admin-greek\";i:1;s:23:\"send-subscription-greek\";i:1;s:33:\"subscription-payment-failed-greek\";i:1;s:27:\"subscription-canceled-greek\";i:1;s:36:\"subscription-payment-succeeded-greek\";i:1;s:34:\"contract-expiration-to-staff-greek\";i:1;s:26:\"gdpr-removal-request-greek\";i:1;s:31:\"gdpr-removal-request-lead-greek\";i:1;s:35:\"client-registration-confirmed-greek\";i:1;s:30:\"contract-signed-to-staff-greek\";i:1;s:34:\"customer-subscribed-to-staff-greek\";i:1;s:32:\"contact-verification-email-greek\";i:1;s:49:\"new-customer-profile-file-uploaded-to-staff-greek\";i:1;s:33:\"event-notification-to-staff-greek\";i:1;s:42:\"subscription-payment-requires-action-greek\";i:1;s:28:\"new-client-created-indonesia\";i:1;s:32:\"invoice-send-to-client-indonesia\";i:1;s:33:\"new-ticket-opened-admin-indonesia\";i:1;s:22:\"ticket-reply-indonesia\";i:1;s:29:\"ticket-autoresponse-indonesia\";i:1;s:34:\"invoice-payment-recorded-indonesia\";i:1;s:32:\"invoice-overdue-notice-indonesia\";i:1;s:30:\"invoice-already-send-indonesia\";i:1;s:34:\"new-ticket-created-staff-indonesia\";i:1;s:33:\"estimate-send-to-client-indonesia\";i:1;s:31:\"ticket-reply-to-admin-indonesia\";i:1;s:31:\"estimate-already-send-indonesia\";i:1;s:29:\"contract-expiration-indonesia\";i:1;s:23:\"task-assigned-indonesia\";i:1;s:32:\"task-added-as-follower-indonesia\";i:1;s:24:\"task-commented-indonesia\";i:1;s:31:\"task-added-attachment-indonesia\";i:1;s:36:\"estimate-declined-to-staff-indonesia\";i:1;s:36:\"estimate-accepted-to-staff-indonesia\";i:1;s:34:\"proposal-client-accepted-indonesia\";i:1;s:35:\"proposal-send-to-customer-indonesia\";i:1;s:34:\"proposal-client-declined-indonesia\";i:1;s:35:\"proposal-client-thank-you-indonesia\";i:1;s:36:\"proposal-comment-to-client-indonesia\";i:1;s:35:\"proposal-comment-to-admin-indonesia\";i:1;s:40:\"estimate-thank-you-to-customer-indonesia\";i:1;s:36:\"task-deadline-notification-indonesia\";i:1;s:23:\"send-contract-indonesia\";i:1;s:43:\"invoice-payment-recorded-to-staff-indonesia\";i:1;s:27:\"auto-close-ticket-indonesia\";i:1;s:49:\"new-project-discussion-created-to-staff-indonesia\";i:1;s:52:\"new-project-discussion-created-to-customer-indonesia\";i:1;s:47:\"new-project-file-uploaded-to-customer-indonesia\";i:1;s:44:\"new-project-file-uploaded-to-staff-indonesia\";i:1;s:52:\"new-project-discussion-comment-to-customer-indonesia\";i:1;s:49:\"new-project-discussion-comment-to-staff-indonesia\";i:1;s:39:\"staff-added-as-project-member-indonesia\";i:1;s:34:\"estimate-expiry-reminder-indonesia\";i:1;s:34:\"proposal-expiry-reminder-indonesia\";i:1;s:27:\"new-staff-created-indonesia\";i:1;s:33:\"contact-forgot-password-indonesia\";i:1;s:34:\"contact-password-reseted-indonesia\";i:1;s:30:\"contact-set-password-indonesia\";i:1;s:31:\"staff-forgot-password-indonesia\";i:1;s:32:\"staff-password-reseted-indonesia\";i:1;s:29:\"assigned-to-project-indonesia\";i:1;s:43:\"task-added-attachment-to-contacts-indonesia\";i:1;s:36:\"task-commented-to-contacts-indonesia\";i:1;s:27:\"new-lead-assigned-indonesia\";i:1;s:26:\"client-statement-indonesia\";i:1;s:34:\"ticket-assigned-to-admin-indonesia\";i:1;s:40:\"new-client-registered-to-admin-indonesia\";i:1;s:40:\"new-web-to-lead-form-submitted-indonesia\";i:1;s:35:\"two-factor-authentication-indonesia\";i:1;s:38:\"project-finished-to-customer-indonesia\";i:1;s:36:\"credit-note-send-to-client-indonesia\";i:1;s:37:\"task-status-change-to-staff-indonesia\";i:1;s:40:\"task-status-change-to-contacts-indonesia\";i:1;s:30:\"reminder-email-staff-indonesia\";i:1;s:36:\"contract-comment-to-client-indonesia\";i:1;s:35:\"contract-comment-to-admin-indonesia\";i:1;s:27:\"send-subscription-indonesia\";i:1;s:37:\"subscription-payment-failed-indonesia\";i:1;s:31:\"subscription-canceled-indonesia\";i:1;s:40:\"subscription-payment-succeeded-indonesia\";i:1;s:38:\"contract-expiration-to-staff-indonesia\";i:1;s:30:\"gdpr-removal-request-indonesia\";i:1;s:35:\"gdpr-removal-request-lead-indonesia\";i:1;s:39:\"client-registration-confirmed-indonesia\";i:1;s:34:\"contract-signed-to-staff-indonesia\";i:1;s:38:\"customer-subscribed-to-staff-indonesia\";i:1;s:36:\"contact-verification-email-indonesia\";i:1;s:53:\"new-customer-profile-file-uploaded-to-staff-indonesia\";i:1;s:37:\"event-notification-to-staff-indonesia\";i:1;s:46:\"subscription-payment-requires-action-indonesia\";i:1;s:26:\"new-client-created-italian\";i:1;s:30:\"invoice-send-to-client-italian\";i:1;s:31:\"new-ticket-opened-admin-italian\";i:1;s:20:\"ticket-reply-italian\";i:1;s:27:\"ticket-autoresponse-italian\";i:1;s:32:\"invoice-payment-recorded-italian\";i:1;s:30:\"invoice-overdue-notice-italian\";i:1;s:28:\"invoice-already-send-italian\";i:1;s:32:\"new-ticket-created-staff-italian\";i:1;s:31:\"estimate-send-to-client-italian\";i:1;s:29:\"ticket-reply-to-admin-italian\";i:1;s:29:\"estimate-already-send-italian\";i:1;s:27:\"contract-expiration-italian\";i:1;s:21:\"task-assigned-italian\";i:1;s:30:\"task-added-as-follower-italian\";i:1;s:22:\"task-commented-italian\";i:1;s:29:\"task-added-attachment-italian\";i:1;s:34:\"estimate-declined-to-staff-italian\";i:1;s:34:\"estimate-accepted-to-staff-italian\";i:1;s:32:\"proposal-client-accepted-italian\";i:1;s:33:\"proposal-send-to-customer-italian\";i:1;s:32:\"proposal-client-declined-italian\";i:1;s:33:\"proposal-client-thank-you-italian\";i:1;s:34:\"proposal-comment-to-client-italian\";i:1;s:33:\"proposal-comment-to-admin-italian\";i:1;s:38:\"estimate-thank-you-to-customer-italian\";i:1;s:34:\"task-deadline-notification-italian\";i:1;s:21:\"send-contract-italian\";i:1;s:41:\"invoice-payment-recorded-to-staff-italian\";i:1;s:25:\"auto-close-ticket-italian\";i:1;s:47:\"new-project-discussion-created-to-staff-italian\";i:1;s:50:\"new-project-discussion-created-to-customer-italian\";i:1;s:45:\"new-project-file-uploaded-to-customer-italian\";i:1;s:42:\"new-project-file-uploaded-to-staff-italian\";i:1;s:50:\"new-project-discussion-comment-to-customer-italian\";i:1;s:47:\"new-project-discussion-comment-to-staff-italian\";i:1;s:37:\"staff-added-as-project-member-italian\";i:1;s:32:\"estimate-expiry-reminder-italian\";i:1;s:32:\"proposal-expiry-reminder-italian\";i:1;s:25:\"new-staff-created-italian\";i:1;s:31:\"contact-forgot-password-italian\";i:1;s:32:\"contact-password-reseted-italian\";i:1;s:28:\"contact-set-password-italian\";i:1;s:29:\"staff-forgot-password-italian\";i:1;s:30:\"staff-password-reseted-italian\";i:1;s:27:\"assigned-to-project-italian\";i:1;s:41:\"task-added-attachment-to-contacts-italian\";i:1;s:34:\"task-commented-to-contacts-italian\";i:1;s:25:\"new-lead-assigned-italian\";i:1;s:24:\"client-statement-italian\";i:1;s:32:\"ticket-assigned-to-admin-italian\";i:1;s:38:\"new-client-registered-to-admin-italian\";i:1;s:38:\"new-web-to-lead-form-submitted-italian\";i:1;s:33:\"two-factor-authentication-italian\";i:1;s:36:\"project-finished-to-customer-italian\";i:1;s:34:\"credit-note-send-to-client-italian\";i:1;s:35:\"task-status-change-to-staff-italian\";i:1;s:38:\"task-status-change-to-contacts-italian\";i:1;s:28:\"reminder-email-staff-italian\";i:1;s:34:\"contract-comment-to-client-italian\";i:1;s:33:\"contract-comment-to-admin-italian\";i:1;s:25:\"send-subscription-italian\";i:1;s:35:\"subscription-payment-failed-italian\";i:1;s:29:\"subscription-canceled-italian\";i:1;s:38:\"subscription-payment-succeeded-italian\";i:1;s:36:\"contract-expiration-to-staff-italian\";i:1;s:28:\"gdpr-removal-request-italian\";i:1;s:33:\"gdpr-removal-request-lead-italian\";i:1;s:37:\"client-registration-confirmed-italian\";i:1;s:32:\"contract-signed-to-staff-italian\";i:1;s:36:\"customer-subscribed-to-staff-italian\";i:1;s:34:\"contact-verification-email-italian\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-italian\";i:1;s:35:\"event-notification-to-staff-italian\";i:1;s:44:\"subscription-payment-requires-action-italian\";i:1;s:27:\"new-client-created-japanese\";i:1;s:31:\"invoice-send-to-client-japanese\";i:1;s:32:\"new-ticket-opened-admin-japanese\";i:1;s:21:\"ticket-reply-japanese\";i:1;s:28:\"ticket-autoresponse-japanese\";i:1;s:33:\"invoice-payment-recorded-japanese\";i:1;s:31:\"invoice-overdue-notice-japanese\";i:1;s:29:\"invoice-already-send-japanese\";i:1;s:33:\"new-ticket-created-staff-japanese\";i:1;s:32:\"estimate-send-to-client-japanese\";i:1;s:30:\"ticket-reply-to-admin-japanese\";i:1;s:30:\"estimate-already-send-japanese\";i:1;s:28:\"contract-expiration-japanese\";i:1;s:22:\"task-assigned-japanese\";i:1;s:31:\"task-added-as-follower-japanese\";i:1;s:23:\"task-commented-japanese\";i:1;s:30:\"task-added-attachment-japanese\";i:1;s:35:\"estimate-declined-to-staff-japanese\";i:1;s:35:\"estimate-accepted-to-staff-japanese\";i:1;s:33:\"proposal-client-accepted-japanese\";i:1;s:34:\"proposal-send-to-customer-japanese\";i:1;s:33:\"proposal-client-declined-japanese\";i:1;s:34:\"proposal-client-thank-you-japanese\";i:1;s:35:\"proposal-comment-to-client-japanese\";i:1;s:34:\"proposal-comment-to-admin-japanese\";i:1;s:39:\"estimate-thank-you-to-customer-japanese\";i:1;s:35:\"task-deadline-notification-japanese\";i:1;s:22:\"send-contract-japanese\";i:1;s:42:\"invoice-payment-recorded-to-staff-japanese\";i:1;s:26:\"auto-close-ticket-japanese\";i:1;s:48:\"new-project-discussion-created-to-staff-japanese\";i:1;s:51:\"new-project-discussion-created-to-customer-japanese\";i:1;s:46:\"new-project-file-uploaded-to-customer-japanese\";i:1;s:43:\"new-project-file-uploaded-to-staff-japanese\";i:1;s:51:\"new-project-discussion-comment-to-customer-japanese\";i:1;s:48:\"new-project-discussion-comment-to-staff-japanese\";i:1;s:38:\"staff-added-as-project-member-japanese\";i:1;s:33:\"estimate-expiry-reminder-japanese\";i:1;s:33:\"proposal-expiry-reminder-japanese\";i:1;s:26:\"new-staff-created-japanese\";i:1;s:32:\"contact-forgot-password-japanese\";i:1;s:33:\"contact-password-reseted-japanese\";i:1;s:29:\"contact-set-password-japanese\";i:1;s:30:\"staff-forgot-password-japanese\";i:1;s:31:\"staff-password-reseted-japanese\";i:1;s:28:\"assigned-to-project-japanese\";i:1;s:42:\"task-added-attachment-to-contacts-japanese\";i:1;s:35:\"task-commented-to-contacts-japanese\";i:1;s:26:\"new-lead-assigned-japanese\";i:1;s:25:\"client-statement-japanese\";i:1;s:33:\"ticket-assigned-to-admin-japanese\";i:1;s:39:\"new-client-registered-to-admin-japanese\";i:1;s:39:\"new-web-to-lead-form-submitted-japanese\";i:1;s:34:\"two-factor-authentication-japanese\";i:1;s:37:\"project-finished-to-customer-japanese\";i:1;s:35:\"credit-note-send-to-client-japanese\";i:1;s:36:\"task-status-change-to-staff-japanese\";i:1;s:39:\"task-status-change-to-contacts-japanese\";i:1;s:29:\"reminder-email-staff-japanese\";i:1;s:35:\"contract-comment-to-client-japanese\";i:1;s:34:\"contract-comment-to-admin-japanese\";i:1;s:26:\"send-subscription-japanese\";i:1;s:36:\"subscription-payment-failed-japanese\";i:1;s:30:\"subscription-canceled-japanese\";i:1;s:39:\"subscription-payment-succeeded-japanese\";i:1;s:37:\"contract-expiration-to-staff-japanese\";i:1;s:29:\"gdpr-removal-request-japanese\";i:1;s:34:\"gdpr-removal-request-lead-japanese\";i:1;s:38:\"client-registration-confirmed-japanese\";i:1;s:33:\"contract-signed-to-staff-japanese\";i:1;s:37:\"customer-subscribed-to-staff-japanese\";i:1;s:35:\"contact-verification-email-japanese\";i:1;s:52:\"new-customer-profile-file-uploaded-to-staff-japanese\";i:1;s:36:\"event-notification-to-staff-japanese\";i:1;s:45:\"subscription-payment-requires-action-japanese\";i:1;s:26:\"new-client-created-persian\";i:1;s:30:\"invoice-send-to-client-persian\";i:1;s:31:\"new-ticket-opened-admin-persian\";i:1;s:20:\"ticket-reply-persian\";i:1;s:27:\"ticket-autoresponse-persian\";i:1;s:32:\"invoice-payment-recorded-persian\";i:1;s:30:\"invoice-overdue-notice-persian\";i:1;s:28:\"invoice-already-send-persian\";i:1;s:32:\"new-ticket-created-staff-persian\";i:1;s:31:\"estimate-send-to-client-persian\";i:1;s:29:\"ticket-reply-to-admin-persian\";i:1;s:29:\"estimate-already-send-persian\";i:1;s:27:\"contract-expiration-persian\";i:1;s:21:\"task-assigned-persian\";i:1;s:30:\"task-added-as-follower-persian\";i:1;s:22:\"task-commented-persian\";i:1;s:29:\"task-added-attachment-persian\";i:1;s:34:\"estimate-declined-to-staff-persian\";i:1;s:34:\"estimate-accepted-to-staff-persian\";i:1;s:32:\"proposal-client-accepted-persian\";i:1;s:33:\"proposal-send-to-customer-persian\";i:1;s:32:\"proposal-client-declined-persian\";i:1;s:33:\"proposal-client-thank-you-persian\";i:1;s:34:\"proposal-comment-to-client-persian\";i:1;s:33:\"proposal-comment-to-admin-persian\";i:1;s:38:\"estimate-thank-you-to-customer-persian\";i:1;s:34:\"task-deadline-notification-persian\";i:1;s:21:\"send-contract-persian\";i:1;s:41:\"invoice-payment-recorded-to-staff-persian\";i:1;s:25:\"auto-close-ticket-persian\";i:1;s:47:\"new-project-discussion-created-to-staff-persian\";i:1;s:50:\"new-project-discussion-created-to-customer-persian\";i:1;s:45:\"new-project-file-uploaded-to-customer-persian\";i:1;s:42:\"new-project-file-uploaded-to-staff-persian\";i:1;s:50:\"new-project-discussion-comment-to-customer-persian\";i:1;s:47:\"new-project-discussion-comment-to-staff-persian\";i:1;s:37:\"staff-added-as-project-member-persian\";i:1;s:32:\"estimate-expiry-reminder-persian\";i:1;s:32:\"proposal-expiry-reminder-persian\";i:1;s:25:\"new-staff-created-persian\";i:1;s:31:\"contact-forgot-password-persian\";i:1;s:32:\"contact-password-reseted-persian\";i:1;s:28:\"contact-set-password-persian\";i:1;s:29:\"staff-forgot-password-persian\";i:1;s:30:\"staff-password-reseted-persian\";i:1;s:27:\"assigned-to-project-persian\";i:1;s:41:\"task-added-attachment-to-contacts-persian\";i:1;s:34:\"task-commented-to-contacts-persian\";i:1;s:25:\"new-lead-assigned-persian\";i:1;s:24:\"client-statement-persian\";i:1;s:32:\"ticket-assigned-to-admin-persian\";i:1;s:38:\"new-client-registered-to-admin-persian\";i:1;s:38:\"new-web-to-lead-form-submitted-persian\";i:1;s:33:\"two-factor-authentication-persian\";i:1;s:36:\"project-finished-to-customer-persian\";i:1;s:34:\"credit-note-send-to-client-persian\";i:1;s:35:\"task-status-change-to-staff-persian\";i:1;s:38:\"task-status-change-to-contacts-persian\";i:1;s:28:\"reminder-email-staff-persian\";i:1;s:34:\"contract-comment-to-client-persian\";i:1;s:33:\"contract-comment-to-admin-persian\";i:1;s:25:\"send-subscription-persian\";i:1;s:35:\"subscription-payment-failed-persian\";i:1;s:29:\"subscription-canceled-persian\";i:1;s:38:\"subscription-payment-succeeded-persian\";i:1;s:36:\"contract-expiration-to-staff-persian\";i:1;s:28:\"gdpr-removal-request-persian\";i:1;s:33:\"gdpr-removal-request-lead-persian\";i:1;s:37:\"client-registration-confirmed-persian\";i:1;s:32:\"contract-signed-to-staff-persian\";i:1;s:36:\"customer-subscribed-to-staff-persian\";i:1;s:34:\"contact-verification-email-persian\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-persian\";i:1;s:35:\"event-notification-to-staff-persian\";i:1;s:44:\"subscription-payment-requires-action-persian\";i:1;s:25:\"new-client-created-polish\";i:1;s:29:\"invoice-send-to-client-polish\";i:1;s:30:\"new-ticket-opened-admin-polish\";i:1;s:19:\"ticket-reply-polish\";i:1;s:26:\"ticket-autoresponse-polish\";i:1;s:31:\"invoice-payment-recorded-polish\";i:1;s:29:\"invoice-overdue-notice-polish\";i:1;s:27:\"invoice-already-send-polish\";i:1;s:31:\"new-ticket-created-staff-polish\";i:1;s:30:\"estimate-send-to-client-polish\";i:1;s:28:\"ticket-reply-to-admin-polish\";i:1;s:28:\"estimate-already-send-polish\";i:1;s:26:\"contract-expiration-polish\";i:1;s:20:\"task-assigned-polish\";i:1;s:29:\"task-added-as-follower-polish\";i:1;s:21:\"task-commented-polish\";i:1;s:28:\"task-added-attachment-polish\";i:1;s:33:\"estimate-declined-to-staff-polish\";i:1;s:33:\"estimate-accepted-to-staff-polish\";i:1;s:31:\"proposal-client-accepted-polish\";i:1;s:32:\"proposal-send-to-customer-polish\";i:1;s:31:\"proposal-client-declined-polish\";i:1;s:32:\"proposal-client-thank-you-polish\";i:1;s:33:\"proposal-comment-to-client-polish\";i:1;s:32:\"proposal-comment-to-admin-polish\";i:1;s:37:\"estimate-thank-you-to-customer-polish\";i:1;s:33:\"task-deadline-notification-polish\";i:1;s:20:\"send-contract-polish\";i:1;s:40:\"invoice-payment-recorded-to-staff-polish\";i:1;s:24:\"auto-close-ticket-polish\";i:1;s:46:\"new-project-discussion-created-to-staff-polish\";i:1;s:49:\"new-project-discussion-created-to-customer-polish\";i:1;s:44:\"new-project-file-uploaded-to-customer-polish\";i:1;s:41:\"new-project-file-uploaded-to-staff-polish\";i:1;s:49:\"new-project-discussion-comment-to-customer-polish\";i:1;s:46:\"new-project-discussion-comment-to-staff-polish\";i:1;s:36:\"staff-added-as-project-member-polish\";i:1;s:31:\"estimate-expiry-reminder-polish\";i:1;s:31:\"proposal-expiry-reminder-polish\";i:1;s:24:\"new-staff-created-polish\";i:1;s:30:\"contact-forgot-password-polish\";i:1;s:31:\"contact-password-reseted-polish\";i:1;s:27:\"contact-set-password-polish\";i:1;s:28:\"staff-forgot-password-polish\";i:1;s:29:\"staff-password-reseted-polish\";i:1;s:26:\"assigned-to-project-polish\";i:1;s:40:\"task-added-attachment-to-contacts-polish\";i:1;s:33:\"task-commented-to-contacts-polish\";i:1;s:24:\"new-lead-assigned-polish\";i:1;s:23:\"client-statement-polish\";i:1;s:31:\"ticket-assigned-to-admin-polish\";i:1;s:37:\"new-client-registered-to-admin-polish\";i:1;s:37:\"new-web-to-lead-form-submitted-polish\";i:1;s:32:\"two-factor-authentication-polish\";i:1;s:35:\"project-finished-to-customer-polish\";i:1;s:33:\"credit-note-send-to-client-polish\";i:1;s:34:\"task-status-change-to-staff-polish\";i:1;s:37:\"task-status-change-to-contacts-polish\";i:1;s:27:\"reminder-email-staff-polish\";i:1;s:33:\"contract-comment-to-client-polish\";i:1;s:32:\"contract-comment-to-admin-polish\";i:1;s:24:\"send-subscription-polish\";i:1;s:34:\"subscription-payment-failed-polish\";i:1;s:28:\"subscription-canceled-polish\";i:1;s:37:\"subscription-payment-succeeded-polish\";i:1;s:35:\"contract-expiration-to-staff-polish\";i:1;s:27:\"gdpr-removal-request-polish\";i:1;s:32:\"gdpr-removal-request-lead-polish\";i:1;s:36:\"client-registration-confirmed-polish\";i:1;s:31:\"contract-signed-to-staff-polish\";i:1;s:35:\"customer-subscribed-to-staff-polish\";i:1;s:33:\"contact-verification-email-polish\";i:1;s:50:\"new-customer-profile-file-uploaded-to-staff-polish\";i:1;s:34:\"event-notification-to-staff-polish\";i:1;s:43:\"subscription-payment-requires-action-polish\";i:1;s:29:\"new-client-created-portuguese\";i:1;s:33:\"invoice-send-to-client-portuguese\";i:1;s:34:\"new-ticket-opened-admin-portuguese\";i:1;s:23:\"ticket-reply-portuguese\";i:1;s:30:\"ticket-autoresponse-portuguese\";i:1;s:35:\"invoice-payment-recorded-portuguese\";i:1;s:33:\"invoice-overdue-notice-portuguese\";i:1;s:31:\"invoice-already-send-portuguese\";i:1;s:35:\"new-ticket-created-staff-portuguese\";i:1;s:34:\"estimate-send-to-client-portuguese\";i:1;s:32:\"ticket-reply-to-admin-portuguese\";i:1;s:32:\"estimate-already-send-portuguese\";i:1;s:30:\"contract-expiration-portuguese\";i:1;s:24:\"task-assigned-portuguese\";i:1;s:33:\"task-added-as-follower-portuguese\";i:1;s:25:\"task-commented-portuguese\";i:1;s:32:\"task-added-attachment-portuguese\";i:1;s:37:\"estimate-declined-to-staff-portuguese\";i:1;s:37:\"estimate-accepted-to-staff-portuguese\";i:1;s:35:\"proposal-client-accepted-portuguese\";i:1;s:36:\"proposal-send-to-customer-portuguese\";i:1;s:35:\"proposal-client-declined-portuguese\";i:1;s:36:\"proposal-client-thank-you-portuguese\";i:1;s:37:\"proposal-comment-to-client-portuguese\";i:1;s:36:\"proposal-comment-to-admin-portuguese\";i:1;s:41:\"estimate-thank-you-to-customer-portuguese\";i:1;s:37:\"task-deadline-notification-portuguese\";i:1;s:24:\"send-contract-portuguese\";i:1;s:44:\"invoice-payment-recorded-to-staff-portuguese\";i:1;s:28:\"auto-close-ticket-portuguese\";i:1;s:50:\"new-project-discussion-created-to-staff-portuguese\";i:1;s:53:\"new-project-discussion-created-to-customer-portuguese\";i:1;s:48:\"new-project-file-uploaded-to-customer-portuguese\";i:1;s:45:\"new-project-file-uploaded-to-staff-portuguese\";i:1;s:53:\"new-project-discussion-comment-to-customer-portuguese\";i:1;s:50:\"new-project-discussion-comment-to-staff-portuguese\";i:1;s:40:\"staff-added-as-project-member-portuguese\";i:1;s:35:\"estimate-expiry-reminder-portuguese\";i:1;s:35:\"proposal-expiry-reminder-portuguese\";i:1;s:28:\"new-staff-created-portuguese\";i:1;s:34:\"contact-forgot-password-portuguese\";i:1;s:35:\"contact-password-reseted-portuguese\";i:1;s:31:\"contact-set-password-portuguese\";i:1;s:32:\"staff-forgot-password-portuguese\";i:1;s:33:\"staff-password-reseted-portuguese\";i:1;s:30:\"assigned-to-project-portuguese\";i:1;s:44:\"task-added-attachment-to-contacts-portuguese\";i:1;s:37:\"task-commented-to-contacts-portuguese\";i:1;s:28:\"new-lead-assigned-portuguese\";i:1;s:27:\"client-statement-portuguese\";i:1;s:35:\"ticket-assigned-to-admin-portuguese\";i:1;s:41:\"new-client-registered-to-admin-portuguese\";i:1;s:41:\"new-web-to-lead-form-submitted-portuguese\";i:1;s:36:\"two-factor-authentication-portuguese\";i:1;s:39:\"project-finished-to-customer-portuguese\";i:1;s:37:\"credit-note-send-to-client-portuguese\";i:1;s:38:\"task-status-change-to-staff-portuguese\";i:1;s:41:\"task-status-change-to-contacts-portuguese\";i:1;s:31:\"reminder-email-staff-portuguese\";i:1;s:37:\"contract-comment-to-client-portuguese\";i:1;s:36:\"contract-comment-to-admin-portuguese\";i:1;s:28:\"send-subscription-portuguese\";i:1;s:38:\"subscription-payment-failed-portuguese\";i:1;s:32:\"subscription-canceled-portuguese\";i:1;s:41:\"subscription-payment-succeeded-portuguese\";i:1;s:39:\"contract-expiration-to-staff-portuguese\";i:1;s:31:\"gdpr-removal-request-portuguese\";i:1;s:36:\"gdpr-removal-request-lead-portuguese\";i:1;s:40:\"client-registration-confirmed-portuguese\";i:1;s:35:\"contract-signed-to-staff-portuguese\";i:1;s:39:\"customer-subscribed-to-staff-portuguese\";i:1;s:37:\"contact-verification-email-portuguese\";i:1;s:54:\"new-customer-profile-file-uploaded-to-staff-portuguese\";i:1;s:38:\"event-notification-to-staff-portuguese\";i:1;s:47:\"subscription-payment-requires-action-portuguese\";i:1;s:32:\"new-client-created-portuguese_br\";i:1;s:36:\"invoice-send-to-client-portuguese_br\";i:1;s:37:\"new-ticket-opened-admin-portuguese_br\";i:1;s:26:\"ticket-reply-portuguese_br\";i:1;s:33:\"ticket-autoresponse-portuguese_br\";i:1;s:38:\"invoice-payment-recorded-portuguese_br\";i:1;s:36:\"invoice-overdue-notice-portuguese_br\";i:1;s:34:\"invoice-already-send-portuguese_br\";i:1;s:38:\"new-ticket-created-staff-portuguese_br\";i:1;s:37:\"estimate-send-to-client-portuguese_br\";i:1;s:35:\"ticket-reply-to-admin-portuguese_br\";i:1;s:35:\"estimate-already-send-portuguese_br\";i:1;s:33:\"contract-expiration-portuguese_br\";i:1;s:27:\"task-assigned-portuguese_br\";i:1;s:36:\"task-added-as-follower-portuguese_br\";i:1;s:28:\"task-commented-portuguese_br\";i:1;s:35:\"task-added-attachment-portuguese_br\";i:1;s:40:\"estimate-declined-to-staff-portuguese_br\";i:1;s:40:\"estimate-accepted-to-staff-portuguese_br\";i:1;s:38:\"proposal-client-accepted-portuguese_br\";i:1;s:39:\"proposal-send-to-customer-portuguese_br\";i:1;s:38:\"proposal-client-declined-portuguese_br\";i:1;s:39:\"proposal-client-thank-you-portuguese_br\";i:1;s:40:\"proposal-comment-to-client-portuguese_br\";i:1;s:39:\"proposal-comment-to-admin-portuguese_br\";i:1;s:44:\"estimate-thank-you-to-customer-portuguese_br\";i:1;s:40:\"task-deadline-notification-portuguese_br\";i:1;s:27:\"send-contract-portuguese_br\";i:1;s:47:\"invoice-payment-recorded-to-staff-portuguese_br\";i:1;s:31:\"auto-close-ticket-portuguese_br\";i:1;s:53:\"new-project-discussion-created-to-staff-portuguese_br\";i:1;s:56:\"new-project-discussion-created-to-customer-portuguese_br\";i:1;s:51:\"new-project-file-uploaded-to-customer-portuguese_br\";i:1;s:48:\"new-project-file-uploaded-to-staff-portuguese_br\";i:1;s:56:\"new-project-discussion-comment-to-customer-portuguese_br\";i:1;s:53:\"new-project-discussion-comment-to-staff-portuguese_br\";i:1;s:43:\"staff-added-as-project-member-portuguese_br\";i:1;s:38:\"estimate-expiry-reminder-portuguese_br\";i:1;s:38:\"proposal-expiry-reminder-portuguese_br\";i:1;s:31:\"new-staff-created-portuguese_br\";i:1;s:37:\"contact-forgot-password-portuguese_br\";i:1;s:38:\"contact-password-reseted-portuguese_br\";i:1;s:34:\"contact-set-password-portuguese_br\";i:1;s:35:\"staff-forgot-password-portuguese_br\";i:1;s:36:\"staff-password-reseted-portuguese_br\";i:1;s:33:\"assigned-to-project-portuguese_br\";i:1;s:47:\"task-added-attachment-to-contacts-portuguese_br\";i:1;s:40:\"task-commented-to-contacts-portuguese_br\";i:1;s:31:\"new-lead-assigned-portuguese_br\";i:1;s:30:\"client-statement-portuguese_br\";i:1;s:38:\"ticket-assigned-to-admin-portuguese_br\";i:1;s:44:\"new-client-registered-to-admin-portuguese_br\";i:1;s:44:\"new-web-to-lead-form-submitted-portuguese_br\";i:1;s:39:\"two-factor-authentication-portuguese_br\";i:1;s:42:\"project-finished-to-customer-portuguese_br\";i:1;s:40:\"credit-note-send-to-client-portuguese_br\";i:1;s:41:\"task-status-change-to-staff-portuguese_br\";i:1;s:44:\"task-status-change-to-contacts-portuguese_br\";i:1;s:34:\"reminder-email-staff-portuguese_br\";i:1;s:40:\"contract-comment-to-client-portuguese_br\";i:1;s:39:\"contract-comment-to-admin-portuguese_br\";i:1;s:31:\"send-subscription-portuguese_br\";i:1;s:41:\"subscription-payment-failed-portuguese_br\";i:1;s:35:\"subscription-canceled-portuguese_br\";i:1;s:44:\"subscription-payment-succeeded-portuguese_br\";i:1;s:42:\"contract-expiration-to-staff-portuguese_br\";i:1;s:34:\"gdpr-removal-request-portuguese_br\";i:1;s:39:\"gdpr-removal-request-lead-portuguese_br\";i:1;s:43:\"client-registration-confirmed-portuguese_br\";i:1;s:38:\"contract-signed-to-staff-portuguese_br\";i:1;s:42:\"customer-subscribed-to-staff-portuguese_br\";i:1;s:40:\"contact-verification-email-portuguese_br\";i:1;s:57:\"new-customer-profile-file-uploaded-to-staff-portuguese_br\";i:1;s:41:\"event-notification-to-staff-portuguese_br\";i:1;s:50:\"subscription-payment-requires-action-portuguese_br\";i:1;s:27:\"new-client-created-romanian\";i:1;s:31:\"invoice-send-to-client-romanian\";i:1;s:32:\"new-ticket-opened-admin-romanian\";i:1;s:21:\"ticket-reply-romanian\";i:1;s:28:\"ticket-autoresponse-romanian\";i:1;s:33:\"invoice-payment-recorded-romanian\";i:1;s:31:\"invoice-overdue-notice-romanian\";i:1;s:29:\"invoice-already-send-romanian\";i:1;s:33:\"new-ticket-created-staff-romanian\";i:1;s:32:\"estimate-send-to-client-romanian\";i:1;s:30:\"ticket-reply-to-admin-romanian\";i:1;s:30:\"estimate-already-send-romanian\";i:1;s:28:\"contract-expiration-romanian\";i:1;s:22:\"task-assigned-romanian\";i:1;s:31:\"task-added-as-follower-romanian\";i:1;s:23:\"task-commented-romanian\";i:1;s:30:\"task-added-attachment-romanian\";i:1;s:35:\"estimate-declined-to-staff-romanian\";i:1;s:35:\"estimate-accepted-to-staff-romanian\";i:1;s:33:\"proposal-client-accepted-romanian\";i:1;s:34:\"proposal-send-to-customer-romanian\";i:1;s:33:\"proposal-client-declined-romanian\";i:1;s:34:\"proposal-client-thank-you-romanian\";i:1;s:35:\"proposal-comment-to-client-romanian\";i:1;s:34:\"proposal-comment-to-admin-romanian\";i:1;s:39:\"estimate-thank-you-to-customer-romanian\";i:1;s:35:\"task-deadline-notification-romanian\";i:1;s:22:\"send-contract-romanian\";i:1;s:42:\"invoice-payment-recorded-to-staff-romanian\";i:1;s:26:\"auto-close-ticket-romanian\";i:1;s:48:\"new-project-discussion-created-to-staff-romanian\";i:1;s:51:\"new-project-discussion-created-to-customer-romanian\";i:1;s:46:\"new-project-file-uploaded-to-customer-romanian\";i:1;s:43:\"new-project-file-uploaded-to-staff-romanian\";i:1;s:51:\"new-project-discussion-comment-to-customer-romanian\";i:1;s:48:\"new-project-discussion-comment-to-staff-romanian\";i:1;s:38:\"staff-added-as-project-member-romanian\";i:1;s:33:\"estimate-expiry-reminder-romanian\";i:1;s:33:\"proposal-expiry-reminder-romanian\";i:1;s:26:\"new-staff-created-romanian\";i:1;s:32:\"contact-forgot-password-romanian\";i:1;s:33:\"contact-password-reseted-romanian\";i:1;s:29:\"contact-set-password-romanian\";i:1;s:30:\"staff-forgot-password-romanian\";i:1;s:31:\"staff-password-reseted-romanian\";i:1;s:28:\"assigned-to-project-romanian\";i:1;s:42:\"task-added-attachment-to-contacts-romanian\";i:1;s:35:\"task-commented-to-contacts-romanian\";i:1;s:26:\"new-lead-assigned-romanian\";i:1;s:25:\"client-statement-romanian\";i:1;s:33:\"ticket-assigned-to-admin-romanian\";i:1;s:39:\"new-client-registered-to-admin-romanian\";i:1;s:39:\"new-web-to-lead-form-submitted-romanian\";i:1;s:34:\"two-factor-authentication-romanian\";i:1;s:37:\"project-finished-to-customer-romanian\";i:1;s:35:\"credit-note-send-to-client-romanian\";i:1;s:36:\"task-status-change-to-staff-romanian\";i:1;s:39:\"task-status-change-to-contacts-romanian\";i:1;s:29:\"reminder-email-staff-romanian\";i:1;s:35:\"contract-comment-to-client-romanian\";i:1;s:34:\"contract-comment-to-admin-romanian\";i:1;s:26:\"send-subscription-romanian\";i:1;s:36:\"subscription-payment-failed-romanian\";i:1;s:30:\"subscription-canceled-romanian\";i:1;s:39:\"subscription-payment-succeeded-romanian\";i:1;s:37:\"contract-expiration-to-staff-romanian\";i:1;s:29:\"gdpr-removal-request-romanian\";i:1;s:34:\"gdpr-removal-request-lead-romanian\";i:1;s:38:\"client-registration-confirmed-romanian\";i:1;s:33:\"contract-signed-to-staff-romanian\";i:1;s:37:\"customer-subscribed-to-staff-romanian\";i:1;s:35:\"contact-verification-email-romanian\";i:1;s:52:\"new-customer-profile-file-uploaded-to-staff-romanian\";i:1;s:36:\"event-notification-to-staff-romanian\";i:1;s:45:\"subscription-payment-requires-action-romanian\";i:1;s:26:\"new-client-created-russian\";i:1;s:30:\"invoice-send-to-client-russian\";i:1;s:31:\"new-ticket-opened-admin-russian\";i:1;s:20:\"ticket-reply-russian\";i:1;s:27:\"ticket-autoresponse-russian\";i:1;s:32:\"invoice-payment-recorded-russian\";i:1;s:30:\"invoice-overdue-notice-russian\";i:1;s:28:\"invoice-already-send-russian\";i:1;s:32:\"new-ticket-created-staff-russian\";i:1;s:31:\"estimate-send-to-client-russian\";i:1;s:29:\"ticket-reply-to-admin-russian\";i:1;s:29:\"estimate-already-send-russian\";i:1;s:27:\"contract-expiration-russian\";i:1;s:21:\"task-assigned-russian\";i:1;s:30:\"task-added-as-follower-russian\";i:1;s:22:\"task-commented-russian\";i:1;s:29:\"task-added-attachment-russian\";i:1;s:34:\"estimate-declined-to-staff-russian\";i:1;s:34:\"estimate-accepted-to-staff-russian\";i:1;s:32:\"proposal-client-accepted-russian\";i:1;s:33:\"proposal-send-to-customer-russian\";i:1;s:32:\"proposal-client-declined-russian\";i:1;s:33:\"proposal-client-thank-you-russian\";i:1;s:34:\"proposal-comment-to-client-russian\";i:1;s:33:\"proposal-comment-to-admin-russian\";i:1;s:38:\"estimate-thank-you-to-customer-russian\";i:1;s:34:\"task-deadline-notification-russian\";i:1;s:21:\"send-contract-russian\";i:1;s:41:\"invoice-payment-recorded-to-staff-russian\";i:1;s:25:\"auto-close-ticket-russian\";i:1;s:47:\"new-project-discussion-created-to-staff-russian\";i:1;s:50:\"new-project-discussion-created-to-customer-russian\";i:1;s:45:\"new-project-file-uploaded-to-customer-russian\";i:1;s:42:\"new-project-file-uploaded-to-staff-russian\";i:1;s:50:\"new-project-discussion-comment-to-customer-russian\";i:1;s:47:\"new-project-discussion-comment-to-staff-russian\";i:1;s:37:\"staff-added-as-project-member-russian\";i:1;s:32:\"estimate-expiry-reminder-russian\";i:1;s:32:\"proposal-expiry-reminder-russian\";i:1;s:25:\"new-staff-created-russian\";i:1;s:31:\"contact-forgot-password-russian\";i:1;s:32:\"contact-password-reseted-russian\";i:1;s:28:\"contact-set-password-russian\";i:1;s:29:\"staff-forgot-password-russian\";i:1;s:30:\"staff-password-reseted-russian\";i:1;s:27:\"assigned-to-project-russian\";i:1;s:41:\"task-added-attachment-to-contacts-russian\";i:1;s:34:\"task-commented-to-contacts-russian\";i:1;s:25:\"new-lead-assigned-russian\";i:1;s:24:\"client-statement-russian\";i:1;s:32:\"ticket-assigned-to-admin-russian\";i:1;s:38:\"new-client-registered-to-admin-russian\";i:1;s:38:\"new-web-to-lead-form-submitted-russian\";i:1;s:33:\"two-factor-authentication-russian\";i:1;s:36:\"project-finished-to-customer-russian\";i:1;s:34:\"credit-note-send-to-client-russian\";i:1;s:35:\"task-status-change-to-staff-russian\";i:1;s:38:\"task-status-change-to-contacts-russian\";i:1;s:28:\"reminder-email-staff-russian\";i:1;s:34:\"contract-comment-to-client-russian\";i:1;s:33:\"contract-comment-to-admin-russian\";i:1;s:25:\"send-subscription-russian\";i:1;s:35:\"subscription-payment-failed-russian\";i:1;s:29:\"subscription-canceled-russian\";i:1;s:38:\"subscription-payment-succeeded-russian\";i:1;s:36:\"contract-expiration-to-staff-russian\";i:1;s:28:\"gdpr-removal-request-russian\";i:1;s:33:\"gdpr-removal-request-lead-russian\";i:1;s:37:\"client-registration-confirmed-russian\";i:1;s:32:\"contract-signed-to-staff-russian\";i:1;s:36:\"customer-subscribed-to-staff-russian\";i:1;s:34:\"contact-verification-email-russian\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-russian\";i:1;s:35:\"event-notification-to-staff-russian\";i:1;s:44:\"subscription-payment-requires-action-russian\";i:1;s:25:\"new-client-created-slovak\";i:1;s:29:\"invoice-send-to-client-slovak\";i:1;s:30:\"new-ticket-opened-admin-slovak\";i:1;s:19:\"ticket-reply-slovak\";i:1;s:26:\"ticket-autoresponse-slovak\";i:1;s:31:\"invoice-payment-recorded-slovak\";i:1;s:29:\"invoice-overdue-notice-slovak\";i:1;s:27:\"invoice-already-send-slovak\";i:1;s:31:\"new-ticket-created-staff-slovak\";i:1;s:30:\"estimate-send-to-client-slovak\";i:1;s:28:\"ticket-reply-to-admin-slovak\";i:1;s:28:\"estimate-already-send-slovak\";i:1;s:26:\"contract-expiration-slovak\";i:1;s:20:\"task-assigned-slovak\";i:1;s:29:\"task-added-as-follower-slovak\";i:1;s:21:\"task-commented-slovak\";i:1;s:28:\"task-added-attachment-slovak\";i:1;s:33:\"estimate-declined-to-staff-slovak\";i:1;s:33:\"estimate-accepted-to-staff-slovak\";i:1;s:31:\"proposal-client-accepted-slovak\";i:1;s:32:\"proposal-send-to-customer-slovak\";i:1;s:31:\"proposal-client-declined-slovak\";i:1;s:32:\"proposal-client-thank-you-slovak\";i:1;s:33:\"proposal-comment-to-client-slovak\";i:1;s:32:\"proposal-comment-to-admin-slovak\";i:1;s:37:\"estimate-thank-you-to-customer-slovak\";i:1;s:33:\"task-deadline-notification-slovak\";i:1;s:20:\"send-contract-slovak\";i:1;s:40:\"invoice-payment-recorded-to-staff-slovak\";i:1;s:24:\"auto-close-ticket-slovak\";i:1;s:46:\"new-project-discussion-created-to-staff-slovak\";i:1;s:49:\"new-project-discussion-created-to-customer-slovak\";i:1;s:44:\"new-project-file-uploaded-to-customer-slovak\";i:1;s:41:\"new-project-file-uploaded-to-staff-slovak\";i:1;s:49:\"new-project-discussion-comment-to-customer-slovak\";i:1;s:46:\"new-project-discussion-comment-to-staff-slovak\";i:1;s:36:\"staff-added-as-project-member-slovak\";i:1;s:31:\"estimate-expiry-reminder-slovak\";i:1;s:31:\"proposal-expiry-reminder-slovak\";i:1;s:24:\"new-staff-created-slovak\";i:1;s:30:\"contact-forgot-password-slovak\";i:1;s:31:\"contact-password-reseted-slovak\";i:1;s:27:\"contact-set-password-slovak\";i:1;s:28:\"staff-forgot-password-slovak\";i:1;s:29:\"staff-password-reseted-slovak\";i:1;s:26:\"assigned-to-project-slovak\";i:1;s:40:\"task-added-attachment-to-contacts-slovak\";i:1;s:33:\"task-commented-to-contacts-slovak\";i:1;s:24:\"new-lead-assigned-slovak\";i:1;s:23:\"client-statement-slovak\";i:1;s:31:\"ticket-assigned-to-admin-slovak\";i:1;s:37:\"new-client-registered-to-admin-slovak\";i:1;s:37:\"new-web-to-lead-form-submitted-slovak\";i:1;s:32:\"two-factor-authentication-slovak\";i:1;s:35:\"project-finished-to-customer-slovak\";i:1;s:33:\"credit-note-send-to-client-slovak\";i:1;s:34:\"task-status-change-to-staff-slovak\";i:1;s:37:\"task-status-change-to-contacts-slovak\";i:1;s:27:\"reminder-email-staff-slovak\";i:1;s:33:\"contract-comment-to-client-slovak\";i:1;s:32:\"contract-comment-to-admin-slovak\";i:1;s:24:\"send-subscription-slovak\";i:1;s:34:\"subscription-payment-failed-slovak\";i:1;s:28:\"subscription-canceled-slovak\";i:1;s:37:\"subscription-payment-succeeded-slovak\";i:1;s:35:\"contract-expiration-to-staff-slovak\";i:1;s:27:\"gdpr-removal-request-slovak\";i:1;s:32:\"gdpr-removal-request-lead-slovak\";i:1;s:36:\"client-registration-confirmed-slovak\";i:1;s:31:\"contract-signed-to-staff-slovak\";i:1;s:35:\"customer-subscribed-to-staff-slovak\";i:1;s:33:\"contact-verification-email-slovak\";i:1;s:50:\"new-customer-profile-file-uploaded-to-staff-slovak\";i:1;s:34:\"event-notification-to-staff-slovak\";i:1;s:43:\"subscription-payment-requires-action-slovak\";i:1;s:26:\"new-client-created-spanish\";i:1;s:30:\"invoice-send-to-client-spanish\";i:1;s:31:\"new-ticket-opened-admin-spanish\";i:1;s:20:\"ticket-reply-spanish\";i:1;s:27:\"ticket-autoresponse-spanish\";i:1;s:32:\"invoice-payment-recorded-spanish\";i:1;s:30:\"invoice-overdue-notice-spanish\";i:1;s:28:\"invoice-already-send-spanish\";i:1;s:32:\"new-ticket-created-staff-spanish\";i:1;s:31:\"estimate-send-to-client-spanish\";i:1;s:29:\"ticket-reply-to-admin-spanish\";i:1;s:29:\"estimate-already-send-spanish\";i:1;s:27:\"contract-expiration-spanish\";i:1;s:21:\"task-assigned-spanish\";i:1;s:30:\"task-added-as-follower-spanish\";i:1;s:22:\"task-commented-spanish\";i:1;s:29:\"task-added-attachment-spanish\";i:1;s:34:\"estimate-declined-to-staff-spanish\";i:1;s:34:\"estimate-accepted-to-staff-spanish\";i:1;s:32:\"proposal-client-accepted-spanish\";i:1;s:33:\"proposal-send-to-customer-spanish\";i:1;s:32:\"proposal-client-declined-spanish\";i:1;s:33:\"proposal-client-thank-you-spanish\";i:1;s:34:\"proposal-comment-to-client-spanish\";i:1;s:33:\"proposal-comment-to-admin-spanish\";i:1;s:38:\"estimate-thank-you-to-customer-spanish\";i:1;s:34:\"task-deadline-notification-spanish\";i:1;s:21:\"send-contract-spanish\";i:1;s:41:\"invoice-payment-recorded-to-staff-spanish\";i:1;s:25:\"auto-close-ticket-spanish\";i:1;s:47:\"new-project-discussion-created-to-staff-spanish\";i:1;s:50:\"new-project-discussion-created-to-customer-spanish\";i:1;s:45:\"new-project-file-uploaded-to-customer-spanish\";i:1;s:42:\"new-project-file-uploaded-to-staff-spanish\";i:1;s:50:\"new-project-discussion-comment-to-customer-spanish\";i:1;s:47:\"new-project-discussion-comment-to-staff-spanish\";i:1;s:37:\"staff-added-as-project-member-spanish\";i:1;s:32:\"estimate-expiry-reminder-spanish\";i:1;s:32:\"proposal-expiry-reminder-spanish\";i:1;s:25:\"new-staff-created-spanish\";i:1;s:31:\"contact-forgot-password-spanish\";i:1;s:32:\"contact-password-reseted-spanish\";i:1;s:28:\"contact-set-password-spanish\";i:1;s:29:\"staff-forgot-password-spanish\";i:1;s:30:\"staff-password-reseted-spanish\";i:1;s:27:\"assigned-to-project-spanish\";i:1;s:41:\"task-added-attachment-to-contacts-spanish\";i:1;s:34:\"task-commented-to-contacts-spanish\";i:1;s:25:\"new-lead-assigned-spanish\";i:1;s:24:\"client-statement-spanish\";i:1;s:32:\"ticket-assigned-to-admin-spanish\";i:1;s:38:\"new-client-registered-to-admin-spanish\";i:1;s:38:\"new-web-to-lead-form-submitted-spanish\";i:1;s:33:\"two-factor-authentication-spanish\";i:1;s:36:\"project-finished-to-customer-spanish\";i:1;s:34:\"credit-note-send-to-client-spanish\";i:1;s:35:\"task-status-change-to-staff-spanish\";i:1;s:38:\"task-status-change-to-contacts-spanish\";i:1;s:28:\"reminder-email-staff-spanish\";i:1;s:34:\"contract-comment-to-client-spanish\";i:1;s:33:\"contract-comment-to-admin-spanish\";i:1;s:25:\"send-subscription-spanish\";i:1;s:35:\"subscription-payment-failed-spanish\";i:1;s:29:\"subscription-canceled-spanish\";i:1;s:38:\"subscription-payment-succeeded-spanish\";i:1;s:36:\"contract-expiration-to-staff-spanish\";i:1;s:28:\"gdpr-removal-request-spanish\";i:1;s:33:\"gdpr-removal-request-lead-spanish\";i:1;s:37:\"client-registration-confirmed-spanish\";i:1;s:32:\"contract-signed-to-staff-spanish\";i:1;s:36:\"customer-subscribed-to-staff-spanish\";i:1;s:34:\"contact-verification-email-spanish\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-spanish\";i:1;s:35:\"event-notification-to-staff-spanish\";i:1;s:44:\"subscription-payment-requires-action-spanish\";i:1;s:26:\"new-client-created-swedish\";i:1;s:30:\"invoice-send-to-client-swedish\";i:1;s:31:\"new-ticket-opened-admin-swedish\";i:1;s:20:\"ticket-reply-swedish\";i:1;s:27:\"ticket-autoresponse-swedish\";i:1;s:32:\"invoice-payment-recorded-swedish\";i:1;s:30:\"invoice-overdue-notice-swedish\";i:1;s:28:\"invoice-already-send-swedish\";i:1;s:32:\"new-ticket-created-staff-swedish\";i:1;s:31:\"estimate-send-to-client-swedish\";i:1;s:29:\"ticket-reply-to-admin-swedish\";i:1;s:29:\"estimate-already-send-swedish\";i:1;s:27:\"contract-expiration-swedish\";i:1;s:21:\"task-assigned-swedish\";i:1;s:30:\"task-added-as-follower-swedish\";i:1;s:22:\"task-commented-swedish\";i:1;s:29:\"task-added-attachment-swedish\";i:1;s:34:\"estimate-declined-to-staff-swedish\";i:1;s:34:\"estimate-accepted-to-staff-swedish\";i:1;s:32:\"proposal-client-accepted-swedish\";i:1;s:33:\"proposal-send-to-customer-swedish\";i:1;s:32:\"proposal-client-declined-swedish\";i:1;s:33:\"proposal-client-thank-you-swedish\";i:1;s:34:\"proposal-comment-to-client-swedish\";i:1;s:33:\"proposal-comment-to-admin-swedish\";i:1;s:38:\"estimate-thank-you-to-customer-swedish\";i:1;s:34:\"task-deadline-notification-swedish\";i:1;s:21:\"send-contract-swedish\";i:1;s:41:\"invoice-payment-recorded-to-staff-swedish\";i:1;s:25:\"auto-close-ticket-swedish\";i:1;s:47:\"new-project-discussion-created-to-staff-swedish\";i:1;s:50:\"new-project-discussion-created-to-customer-swedish\";i:1;s:45:\"new-project-file-uploaded-to-customer-swedish\";i:1;s:42:\"new-project-file-uploaded-to-staff-swedish\";i:1;s:50:\"new-project-discussion-comment-to-customer-swedish\";i:1;s:47:\"new-project-discussion-comment-to-staff-swedish\";i:1;s:37:\"staff-added-as-project-member-swedish\";i:1;s:32:\"estimate-expiry-reminder-swedish\";i:1;s:32:\"proposal-expiry-reminder-swedish\";i:1;s:25:\"new-staff-created-swedish\";i:1;s:31:\"contact-forgot-password-swedish\";i:1;s:32:\"contact-password-reseted-swedish\";i:1;s:28:\"contact-set-password-swedish\";i:1;s:29:\"staff-forgot-password-swedish\";i:1;s:30:\"staff-password-reseted-swedish\";i:1;s:27:\"assigned-to-project-swedish\";i:1;s:41:\"task-added-attachment-to-contacts-swedish\";i:1;s:34:\"task-commented-to-contacts-swedish\";i:1;s:25:\"new-lead-assigned-swedish\";i:1;s:24:\"client-statement-swedish\";i:1;s:32:\"ticket-assigned-to-admin-swedish\";i:1;s:38:\"new-client-registered-to-admin-swedish\";i:1;s:38:\"new-web-to-lead-form-submitted-swedish\";i:1;s:33:\"two-factor-authentication-swedish\";i:1;s:36:\"project-finished-to-customer-swedish\";i:1;s:34:\"credit-note-send-to-client-swedish\";i:1;s:35:\"task-status-change-to-staff-swedish\";i:1;s:38:\"task-status-change-to-contacts-swedish\";i:1;s:28:\"reminder-email-staff-swedish\";i:1;s:34:\"contract-comment-to-client-swedish\";i:1;s:33:\"contract-comment-to-admin-swedish\";i:1;s:25:\"send-subscription-swedish\";i:1;s:35:\"subscription-payment-failed-swedish\";i:1;s:29:\"subscription-canceled-swedish\";i:1;s:38:\"subscription-payment-succeeded-swedish\";i:1;s:36:\"contract-expiration-to-staff-swedish\";i:1;s:28:\"gdpr-removal-request-swedish\";i:1;s:33:\"gdpr-removal-request-lead-swedish\";i:1;s:37:\"client-registration-confirmed-swedish\";i:1;s:32:\"contract-signed-to-staff-swedish\";i:1;s:36:\"customer-subscribed-to-staff-swedish\";i:1;s:34:\"contact-verification-email-swedish\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-swedish\";i:1;s:35:\"event-notification-to-staff-swedish\";i:1;s:44:\"subscription-payment-requires-action-swedish\";i:1;s:26:\"new-client-created-turkish\";i:1;s:30:\"invoice-send-to-client-turkish\";i:1;s:31:\"new-ticket-opened-admin-turkish\";i:1;s:20:\"ticket-reply-turkish\";i:1;s:27:\"ticket-autoresponse-turkish\";i:1;s:32:\"invoice-payment-recorded-turkish\";i:1;s:30:\"invoice-overdue-notice-turkish\";i:1;s:28:\"invoice-already-send-turkish\";i:1;s:32:\"new-ticket-created-staff-turkish\";i:1;s:31:\"estimate-send-to-client-turkish\";i:1;s:29:\"ticket-reply-to-admin-turkish\";i:1;s:29:\"estimate-already-send-turkish\";i:1;s:27:\"contract-expiration-turkish\";i:1;s:21:\"task-assigned-turkish\";i:1;s:30:\"task-added-as-follower-turkish\";i:1;s:22:\"task-commented-turkish\";i:1;s:29:\"task-added-attachment-turkish\";i:1;s:34:\"estimate-declined-to-staff-turkish\";i:1;s:34:\"estimate-accepted-to-staff-turkish\";i:1;s:32:\"proposal-client-accepted-turkish\";i:1;s:33:\"proposal-send-to-customer-turkish\";i:1;s:32:\"proposal-client-declined-turkish\";i:1;s:33:\"proposal-client-thank-you-turkish\";i:1;s:34:\"proposal-comment-to-client-turkish\";i:1;s:33:\"proposal-comment-to-admin-turkish\";i:1;s:38:\"estimate-thank-you-to-customer-turkish\";i:1;s:34:\"task-deadline-notification-turkish\";i:1;s:21:\"send-contract-turkish\";i:1;s:41:\"invoice-payment-recorded-to-staff-turkish\";i:1;s:25:\"auto-close-ticket-turkish\";i:1;s:47:\"new-project-discussion-created-to-staff-turkish\";i:1;s:50:\"new-project-discussion-created-to-customer-turkish\";i:1;s:45:\"new-project-file-uploaded-to-customer-turkish\";i:1;s:42:\"new-project-file-uploaded-to-staff-turkish\";i:1;s:50:\"new-project-discussion-comment-to-customer-turkish\";i:1;s:47:\"new-project-discussion-comment-to-staff-turkish\";i:1;s:37:\"staff-added-as-project-member-turkish\";i:1;s:32:\"estimate-expiry-reminder-turkish\";i:1;s:32:\"proposal-expiry-reminder-turkish\";i:1;s:25:\"new-staff-created-turkish\";i:1;s:31:\"contact-forgot-password-turkish\";i:1;s:32:\"contact-password-reseted-turkish\";i:1;s:28:\"contact-set-password-turkish\";i:1;s:29:\"staff-forgot-password-turkish\";i:1;s:30:\"staff-password-reseted-turkish\";i:1;s:27:\"assigned-to-project-turkish\";i:1;s:41:\"task-added-attachment-to-contacts-turkish\";i:1;s:34:\"task-commented-to-contacts-turkish\";i:1;s:25:\"new-lead-assigned-turkish\";i:1;s:24:\"client-statement-turkish\";i:1;s:32:\"ticket-assigned-to-admin-turkish\";i:1;s:38:\"new-client-registered-to-admin-turkish\";i:1;s:38:\"new-web-to-lead-form-submitted-turkish\";i:1;s:33:\"two-factor-authentication-turkish\";i:1;s:36:\"project-finished-to-customer-turkish\";i:1;s:34:\"credit-note-send-to-client-turkish\";i:1;s:35:\"task-status-change-to-staff-turkish\";i:1;s:38:\"task-status-change-to-contacts-turkish\";i:1;s:28:\"reminder-email-staff-turkish\";i:1;s:34:\"contract-comment-to-client-turkish\";i:1;s:33:\"contract-comment-to-admin-turkish\";i:1;s:25:\"send-subscription-turkish\";i:1;s:35:\"subscription-payment-failed-turkish\";i:1;s:29:\"subscription-canceled-turkish\";i:1;s:38:\"subscription-payment-succeeded-turkish\";i:1;s:36:\"contract-expiration-to-staff-turkish\";i:1;s:28:\"gdpr-removal-request-turkish\";i:1;s:33:\"gdpr-removal-request-lead-turkish\";i:1;s:37:\"client-registration-confirmed-turkish\";i:1;s:32:\"contract-signed-to-staff-turkish\";i:1;s:36:\"customer-subscribed-to-staff-turkish\";i:1;s:34:\"contact-verification-email-turkish\";i:1;s:51:\"new-customer-profile-file-uploaded-to-staff-turkish\";i:1;s:35:\"event-notification-to-staff-turkish\";i:1;s:44:\"subscription-payment-requires-action-turkish\";i:1;s:28:\"new-client-created-ukrainian\";i:1;s:32:\"invoice-send-to-client-ukrainian\";i:1;s:33:\"new-ticket-opened-admin-ukrainian\";i:1;s:22:\"ticket-reply-ukrainian\";i:1;s:29:\"ticket-autoresponse-ukrainian\";i:1;s:34:\"invoice-payment-recorded-ukrainian\";i:1;s:32:\"invoice-overdue-notice-ukrainian\";i:1;s:30:\"invoice-already-send-ukrainian\";i:1;s:34:\"new-ticket-created-staff-ukrainian\";i:1;s:33:\"estimate-send-to-client-ukrainian\";i:1;s:31:\"ticket-reply-to-admin-ukrainian\";i:1;s:31:\"estimate-already-send-ukrainian\";i:1;s:29:\"contract-expiration-ukrainian\";i:1;s:23:\"task-assigned-ukrainian\";i:1;s:32:\"task-added-as-follower-ukrainian\";i:1;s:24:\"task-commented-ukrainian\";i:1;s:31:\"task-added-attachment-ukrainian\";i:1;s:36:\"estimate-declined-to-staff-ukrainian\";i:1;s:36:\"estimate-accepted-to-staff-ukrainian\";i:1;s:34:\"proposal-client-accepted-ukrainian\";i:1;s:35:\"proposal-send-to-customer-ukrainian\";i:1;s:34:\"proposal-client-declined-ukrainian\";i:1;s:35:\"proposal-client-thank-you-ukrainian\";i:1;s:36:\"proposal-comment-to-client-ukrainian\";i:1;s:35:\"proposal-comment-to-admin-ukrainian\";i:1;s:40:\"estimate-thank-you-to-customer-ukrainian\";i:1;s:36:\"task-deadline-notification-ukrainian\";i:1;s:23:\"send-contract-ukrainian\";i:1;s:43:\"invoice-payment-recorded-to-staff-ukrainian\";i:1;s:27:\"auto-close-ticket-ukrainian\";i:1;s:49:\"new-project-discussion-created-to-staff-ukrainian\";i:1;s:52:\"new-project-discussion-created-to-customer-ukrainian\";i:1;s:47:\"new-project-file-uploaded-to-customer-ukrainian\";i:1;s:44:\"new-project-file-uploaded-to-staff-ukrainian\";i:1;s:52:\"new-project-discussion-comment-to-customer-ukrainian\";i:1;s:49:\"new-project-discussion-comment-to-staff-ukrainian\";i:1;s:39:\"staff-added-as-project-member-ukrainian\";i:1;s:34:\"estimate-expiry-reminder-ukrainian\";i:1;s:34:\"proposal-expiry-reminder-ukrainian\";i:1;s:27:\"new-staff-created-ukrainian\";i:1;s:33:\"contact-forgot-password-ukrainian\";i:1;s:34:\"contact-password-reseted-ukrainian\";i:1;s:30:\"contact-set-password-ukrainian\";i:1;s:31:\"staff-forgot-password-ukrainian\";i:1;s:32:\"staff-password-reseted-ukrainian\";i:1;s:29:\"assigned-to-project-ukrainian\";i:1;s:43:\"task-added-attachment-to-contacts-ukrainian\";i:1;s:36:\"task-commented-to-contacts-ukrainian\";i:1;s:27:\"new-lead-assigned-ukrainian\";i:1;s:26:\"client-statement-ukrainian\";i:1;s:34:\"ticket-assigned-to-admin-ukrainian\";i:1;s:40:\"new-client-registered-to-admin-ukrainian\";i:1;s:40:\"new-web-to-lead-form-submitted-ukrainian\";i:1;s:35:\"two-factor-authentication-ukrainian\";i:1;s:38:\"project-finished-to-customer-ukrainian\";i:1;s:36:\"credit-note-send-to-client-ukrainian\";i:1;s:37:\"task-status-change-to-staff-ukrainian\";i:1;s:40:\"task-status-change-to-contacts-ukrainian\";i:1;s:30:\"reminder-email-staff-ukrainian\";i:1;s:36:\"contract-comment-to-client-ukrainian\";i:1;s:35:\"contract-comment-to-admin-ukrainian\";i:1;s:27:\"send-subscription-ukrainian\";i:1;s:37:\"subscription-payment-failed-ukrainian\";i:1;s:31:\"subscription-canceled-ukrainian\";i:1;s:40:\"subscription-payment-succeeded-ukrainian\";i:1;s:38:\"contract-expiration-to-staff-ukrainian\";i:1;s:30:\"gdpr-removal-request-ukrainian\";i:1;s:35:\"gdpr-removal-request-lead-ukrainian\";i:1;s:39:\"client-registration-confirmed-ukrainian\";i:1;s:34:\"contract-signed-to-staff-ukrainian\";i:1;s:38:\"customer-subscribed-to-staff-ukrainian\";i:1;s:36:\"contact-verification-email-ukrainian\";i:1;s:53:\"new-customer-profile-file-uploaded-to-staff-ukrainian\";i:1;s:37:\"event-notification-to-staff-ukrainian\";i:1;s:46:\"subscription-payment-requires-action-ukrainian\";i:1;s:29:\"new-client-created-vietnamese\";i:1;s:33:\"invoice-send-to-client-vietnamese\";i:1;s:34:\"new-ticket-opened-admin-vietnamese\";i:1;s:23:\"ticket-reply-vietnamese\";i:1;s:30:\"ticket-autoresponse-vietnamese\";i:1;s:35:\"invoice-payment-recorded-vietnamese\";i:1;s:33:\"invoice-overdue-notice-vietnamese\";i:1;s:31:\"invoice-already-send-vietnamese\";i:1;s:35:\"new-ticket-created-staff-vietnamese\";i:1;s:34:\"estimate-send-to-client-vietnamese\";i:1;s:32:\"ticket-reply-to-admin-vietnamese\";i:1;s:32:\"estimate-already-send-vietnamese\";i:1;s:30:\"contract-expiration-vietnamese\";i:1;s:24:\"task-assigned-vietnamese\";i:1;s:33:\"task-added-as-follower-vietnamese\";i:1;s:25:\"task-commented-vietnamese\";i:1;s:32:\"task-added-attachment-vietnamese\";i:1;s:37:\"estimate-declined-to-staff-vietnamese\";i:1;s:37:\"estimate-accepted-to-staff-vietnamese\";i:1;s:35:\"proposal-client-accepted-vietnamese\";i:1;s:36:\"proposal-send-to-customer-vietnamese\";i:1;s:35:\"proposal-client-declined-vietnamese\";i:1;s:36:\"proposal-client-thank-you-vietnamese\";i:1;s:37:\"proposal-comment-to-client-vietnamese\";i:1;s:36:\"proposal-comment-to-admin-vietnamese\";i:1;s:41:\"estimate-thank-you-to-customer-vietnamese\";i:1;s:37:\"task-deadline-notification-vietnamese\";i:1;s:24:\"send-contract-vietnamese\";i:1;s:44:\"invoice-payment-recorded-to-staff-vietnamese\";i:1;s:28:\"auto-close-ticket-vietnamese\";i:1;s:50:\"new-project-discussion-created-to-staff-vietnamese\";i:1;s:53:\"new-project-discussion-created-to-customer-vietnamese\";i:1;s:48:\"new-project-file-uploaded-to-customer-vietnamese\";i:1;s:45:\"new-project-file-uploaded-to-staff-vietnamese\";i:1;s:53:\"new-project-discussion-comment-to-customer-vietnamese\";i:1;s:50:\"new-project-discussion-comment-to-staff-vietnamese\";i:1;s:40:\"staff-added-as-project-member-vietnamese\";i:1;s:35:\"estimate-expiry-reminder-vietnamese\";i:1;s:35:\"proposal-expiry-reminder-vietnamese\";i:1;s:28:\"new-staff-created-vietnamese\";i:1;s:34:\"contact-forgot-password-vietnamese\";i:1;s:35:\"contact-password-reseted-vietnamese\";i:1;s:31:\"contact-set-password-vietnamese\";i:1;s:32:\"staff-forgot-password-vietnamese\";i:1;s:33:\"staff-password-reseted-vietnamese\";i:1;s:30:\"assigned-to-project-vietnamese\";i:1;s:44:\"task-added-attachment-to-contacts-vietnamese\";i:1;s:37:\"task-commented-to-contacts-vietnamese\";i:1;s:28:\"new-lead-assigned-vietnamese\";i:1;s:27:\"client-statement-vietnamese\";i:1;s:35:\"ticket-assigned-to-admin-vietnamese\";i:1;s:41:\"new-client-registered-to-admin-vietnamese\";i:1;s:41:\"new-web-to-lead-form-submitted-vietnamese\";i:1;s:36:\"two-factor-authentication-vietnamese\";i:1;s:39:\"project-finished-to-customer-vietnamese\";i:1;s:37:\"credit-note-send-to-client-vietnamese\";i:1;s:38:\"task-status-change-to-staff-vietnamese\";i:1;s:41:\"task-status-change-to-contacts-vietnamese\";i:1;s:31:\"reminder-email-staff-vietnamese\";i:1;s:37:\"contract-comment-to-client-vietnamese\";i:1;s:36:\"contract-comment-to-admin-vietnamese\";i:1;s:28:\"send-subscription-vietnamese\";i:1;s:38:\"subscription-payment-failed-vietnamese\";i:1;s:32:\"subscription-canceled-vietnamese\";i:1;s:41:\"subscription-payment-succeeded-vietnamese\";i:1;s:39:\"contract-expiration-to-staff-vietnamese\";i:1;s:31:\"gdpr-removal-request-vietnamese\";i:1;s:36:\"gdpr-removal-request-lead-vietnamese\";i:1;s:40:\"client-registration-confirmed-vietnamese\";i:1;s:35:\"contract-signed-to-staff-vietnamese\";i:1;s:39:\"customer-subscribed-to-staff-vietnamese\";i:1;s:37:\"contact-verification-email-vietnamese\";i:1;s:54:\"new-customer-profile-file-uploaded-to-staff-vietnamese\";i:1;s:38:\"event-notification-to-staff-vietnamese\";i:1;s:47:\"subscription-payment-requires-action-vietnamese\";i:1;}', '0');
INSERT INTO `tbloptions` VALUES ('213', 'proposal_accept_identity_confirmation', '1', '0');
INSERT INTO `tbloptions` VALUES ('214', 'estimate_accept_identity_confirmation', '1', '0');
INSERT INTO `tbloptions` VALUES ('215', 'new_task_auto_follower_current_member', '0', '1');
INSERT INTO `tbloptions` VALUES ('216', 'task_biillable_checked_on_creation', '1', '1');
INSERT INTO `tbloptions` VALUES ('217', 'predefined_clientnote_credit_note', '', '1');
INSERT INTO `tbloptions` VALUES ('218', 'predefined_terms_credit_note', '', '1');
INSERT INTO `tbloptions` VALUES ('219', 'next_credit_note_number', '1', '1');
INSERT INTO `tbloptions` VALUES ('220', 'credit_note_prefix', 'CN-', '1');
INSERT INTO `tbloptions` VALUES ('221', 'credit_note_number_decrement_on_delete', '1', '1');
INSERT INTO `tbloptions` VALUES ('222', 'pdf_format_credit_note', 'A4-PORTRAIT', '1');
INSERT INTO `tbloptions` VALUES ('223', 'show_pdf_signature_credit_note', '1', '0');
INSERT INTO `tbloptions` VALUES ('224', 'show_credit_note_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('225', 'show_amount_due_on_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('226', 'show_total_paid_on_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('227', 'show_credits_applied_on_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('228', 'staff_members_create_inline_lead_status', '1', '1');
INSERT INTO `tbloptions` VALUES ('229', 'staff_members_create_inline_customer_groups', '1', '1');
INSERT INTO `tbloptions` VALUES ('230', 'staff_members_create_inline_ticket_services', '1', '1');
INSERT INTO `tbloptions` VALUES ('231', 'staff_members_save_tickets_predefined_replies', '1', '1');
INSERT INTO `tbloptions` VALUES ('232', 'staff_members_create_inline_contract_types', '1', '1');
INSERT INTO `tbloptions` VALUES ('233', 'staff_members_create_inline_expense_categories', '1', '1');
INSERT INTO `tbloptions` VALUES ('234', 'show_project_on_credit_note', '1', '1');
INSERT INTO `tbloptions` VALUES ('235', 'proposals_auto_operations_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('236', 'estimates_auto_operations_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('237', 'contracts_auto_operations_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('238', 'credit_note_number_format', '1', '1');
INSERT INTO `tbloptions` VALUES ('239', 'allow_non_admin_members_to_import_leads', '0', '1');
INSERT INTO `tbloptions` VALUES ('240', 'e_sign_legal_text', 'By clicking on \"Sign\", I consent to be legally bound by this electronic representation of my signature.', '1');
INSERT INTO `tbloptions` VALUES ('241', 'show_pdf_signature_contract', '1', '1');
INSERT INTO `tbloptions` VALUES ('242', 'view_contract_only_logged_in', '0', '1');
INSERT INTO `tbloptions` VALUES ('243', 'show_subscriptions_in_customers_area', '1', '1');
INSERT INTO `tbloptions` VALUES ('244', 'calendar_only_assigned_tasks', '0', '1');
INSERT INTO `tbloptions` VALUES ('245', 'after_subscription_payment_captured', 'send_invoice_and_receipt', '1');
INSERT INTO `tbloptions` VALUES ('246', 'mail_engine', 'phpmailer', '1');
INSERT INTO `tbloptions` VALUES ('247', 'gdpr_enable_terms_and_conditions', '0', '1');
INSERT INTO `tbloptions` VALUES ('248', 'privacy_policy', '', '1');
INSERT INTO `tbloptions` VALUES ('249', 'terms_and_conditions', '', '1');
INSERT INTO `tbloptions` VALUES ('250', 'gdpr_enable_terms_and_conditions_lead_form', '0', '1');
INSERT INTO `tbloptions` VALUES ('251', 'gdpr_enable_terms_and_conditions_ticket_form', '0', '1');
INSERT INTO `tbloptions` VALUES ('252', 'gdpr_contact_enable_right_to_be_forgotten', '0', '1');
INSERT INTO `tbloptions` VALUES ('253', 'show_gdpr_in_customers_menu', '1', '1');
INSERT INTO `tbloptions` VALUES ('254', 'show_gdpr_link_in_footer', '1', '1');
INSERT INTO `tbloptions` VALUES ('255', 'enable_gdpr', '1', '1');
INSERT INTO `tbloptions` VALUES ('256', 'gdpr_on_forgotten_remove_invoices_credit_notes', '0', '1');
INSERT INTO `tbloptions` VALUES ('257', 'gdpr_on_forgotten_remove_estimates', '0', '1');
INSERT INTO `tbloptions` VALUES ('258', 'gdpr_enable_consent_for_contacts', '0', '1');
INSERT INTO `tbloptions` VALUES ('259', 'gdpr_consent_public_page_top_block', '', '1');
INSERT INTO `tbloptions` VALUES ('260', 'gdpr_page_top_information_block', '', '1');
INSERT INTO `tbloptions` VALUES ('261', 'gdpr_enable_lead_public_form', '0', '1');
INSERT INTO `tbloptions` VALUES ('262', 'gdpr_show_lead_custom_fields_on_public_form', '0', '1');
INSERT INTO `tbloptions` VALUES ('263', 'gdpr_lead_attachments_on_public_form', '0', '1');
INSERT INTO `tbloptions` VALUES ('264', 'gdpr_enable_consent_for_leads', '0', '1');
INSERT INTO `tbloptions` VALUES ('265', 'gdpr_lead_enable_right_to_be_forgotten', '0', '1');
INSERT INTO `tbloptions` VALUES ('266', 'allow_staff_view_invoices_assigned', '1', '1');
INSERT INTO `tbloptions` VALUES ('267', 'gdpr_data_portability_leads', '0', '1');
INSERT INTO `tbloptions` VALUES ('268', 'gdpr_lead_data_portability_allowed', '', '1');
INSERT INTO `tbloptions` VALUES ('269', 'gdpr_contact_data_portability_allowed', '', '1');
INSERT INTO `tbloptions` VALUES ('270', 'gdpr_data_portability_contacts', '0', '1');
INSERT INTO `tbloptions` VALUES ('271', 'allow_staff_view_estimates_assigned', '1', '1');
INSERT INTO `tbloptions` VALUES ('272', 'gdpr_after_lead_converted_delete', '0', '1');
INSERT INTO `tbloptions` VALUES ('273', 'gdpr_show_terms_and_conditions_in_footer', '0', '1');
INSERT INTO `tbloptions` VALUES ('274', 'save_last_order_for_tables', '0', '1');
INSERT INTO `tbloptions` VALUES ('275', 'company_logo_dark', '', '1');
INSERT INTO `tbloptions` VALUES ('276', 'customers_register_require_confirmation', '0', '1');
INSERT INTO `tbloptions` VALUES ('277', 'allow_non_admin_staff_to_delete_ticket_attachments', '0', '1');
INSERT INTO `tbloptions` VALUES ('278', 'receive_notification_on_new_ticket_replies', '1', '0');
INSERT INTO `tbloptions` VALUES ('279', 'google_client_id', '', '1');
INSERT INTO `tbloptions` VALUES ('280', 'enable_google_picker', '1', '1');
INSERT INTO `tbloptions` VALUES ('281', 'show_ticket_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('282', 'ticket_import_reply_only', '0', '1');
INSERT INTO `tbloptions` VALUES ('283', 'visible_customer_profile_tabs', 'all', '0');
INSERT INTO `tbloptions` VALUES ('284', 'show_project_on_invoice', '1', '1');
INSERT INTO `tbloptions` VALUES ('285', 'show_project_on_estimate', '1', '1');
INSERT INTO `tbloptions` VALUES ('286', 'staff_members_create_inline_lead_source', '1', '1');
INSERT INTO `tbloptions` VALUES ('287', 'lead_unique_validation', '[\"email\"]', '1');
INSERT INTO `tbloptions` VALUES ('288', 'last_upgrade_copy_data', '', '1');
INSERT INTO `tbloptions` VALUES ('289', 'custom_js_admin_scripts', '', '1');
INSERT INTO `tbloptions` VALUES ('290', 'custom_js_customer_scripts', '0', '1');
INSERT INTO `tbloptions` VALUES ('291', 'stripe_webhook_id', '', '1');
INSERT INTO `tbloptions` VALUES ('292', 'stripe_webhook_signing_secret', '', '1');
INSERT INTO `tbloptions` VALUES ('293', 'stripe_ideal_webhook_id', '', '1');
INSERT INTO `tbloptions` VALUES ('294', 'stripe_ideal_webhook_signing_secret', '', '1');
INSERT INTO `tbloptions` VALUES ('295', 'show_php_version_notice', '1', '0');
INSERT INTO `tbloptions` VALUES ('296', 'recaptcha_ignore_ips', '', '1');
INSERT INTO `tbloptions` VALUES ('297', 'show_task_reminders_on_calendar', '1', '1');
INSERT INTO `tbloptions` VALUES ('298', 'customer_settings', 'true', '1');
INSERT INTO `tbloptions` VALUES ('299', 'tasks_reminder_notification_hour', '21', '1');
INSERT INTO `tbloptions` VALUES ('300', 'allow_primary_contact_to_manage_other_contacts', '0', '1');
INSERT INTO `tbloptions` VALUES ('301', 'upgraded_from_version', '', '0');
INSERT INTO `tbloptions` VALUES ('302', 'items_table_amounts_exclude_currency_symbol', '1', '1');
INSERT INTO `tbloptions` VALUES ('303', 'round_off_task_timer_option', '0', '1');
INSERT INTO `tbloptions` VALUES ('304', 'round_off_task_timer_time', '5', '1');
INSERT INTO `tbloptions` VALUES ('305', 'sms_clickatell_api_key', '', '1');
INSERT INTO `tbloptions` VALUES ('306', 'sms_clickatell_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('307', 'sms_clickatell_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('308', 'sms_msg91_sender_id', '', '1');
INSERT INTO `tbloptions` VALUES ('309', 'sms_msg91_api_type', 'api', '1');
INSERT INTO `tbloptions` VALUES ('310', 'sms_msg91_auth_key', '', '1');
INSERT INTO `tbloptions` VALUES ('311', 'sms_msg91_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('312', 'sms_msg91_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('313', 'sms_twilio_account_sid', '', '1');
INSERT INTO `tbloptions` VALUES ('314', 'sms_twilio_auth_token', '', '1');
INSERT INTO `tbloptions` VALUES ('315', 'sms_twilio_phone_number', '', '1');
INSERT INTO `tbloptions` VALUES ('316', 'sms_twilio_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('317', 'sms_twilio_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('318', 'paymentmethod_paypal_braintree_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('319', 'paymentmethod_paypal_braintree_label', 'Braintree', '1');
INSERT INTO `tbloptions` VALUES ('320', 'paymentmethod_paypal_braintree_merchant_id', '', '0');
INSERT INTO `tbloptions` VALUES ('321', 'paymentmethod_paypal_braintree_api_public_key', '', '0');
INSERT INTO `tbloptions` VALUES ('322', 'paymentmethod_paypal_braintree_api_private_key', '', '0');
INSERT INTO `tbloptions` VALUES ('323', 'paymentmethod_paypal_braintree_currencies', 'USD', '0');
INSERT INTO `tbloptions` VALUES ('324', 'paymentmethod_paypal_braintree_paypal_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('325', 'paymentmethod_paypal_braintree_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('326', 'paymentmethod_paypal_braintree_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('327', 'paymentmethod_paypal_braintree_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('328', 'paymentmethod_paypal_checkout_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('329', 'paymentmethod_paypal_checkout_label', 'Paypal Smart Checkout', '1');
INSERT INTO `tbloptions` VALUES ('330', 'paymentmethod_paypal_checkout_client_id', '', '0');
INSERT INTO `tbloptions` VALUES ('331', 'paymentmethod_paypal_checkout_secret', '', '0');
INSERT INTO `tbloptions` VALUES ('332', 'paymentmethod_paypal_checkout_payment_description', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('333', 'paymentmethod_paypal_checkout_currencies', 'USD,CAD,EUR', '0');
INSERT INTO `tbloptions` VALUES ('334', 'paymentmethod_paypal_checkout_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('335', 'paymentmethod_paypal_checkout_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('336', 'paymentmethod_paypal_checkout_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('337', 'paymentmethod_paypal_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('338', 'paymentmethod_paypal_label', 'Paypal', '1');
INSERT INTO `tbloptions` VALUES ('339', 'paymentmethod_paypal_username', '', '0');
INSERT INTO `tbloptions` VALUES ('340', 'paymentmethod_paypal_password', '', '0');
INSERT INTO `tbloptions` VALUES ('341', 'paymentmethod_paypal_signature', '', '0');
INSERT INTO `tbloptions` VALUES ('342', 'paymentmethod_paypal_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('343', 'paymentmethod_paypal_currencies', 'EUR,USD', '0');
INSERT INTO `tbloptions` VALUES ('344', 'paymentmethod_paypal_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('345', 'paymentmethod_paypal_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('346', 'paymentmethod_paypal_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('347', 'paymentmethod_payu_money_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('348', 'paymentmethod_payu_money_label', 'PayU Money', '1');
INSERT INTO `tbloptions` VALUES ('349', 'paymentmethod_payu_money_key', '', '0');
INSERT INTO `tbloptions` VALUES ('350', 'paymentmethod_payu_money_salt', '', '0');
INSERT INTO `tbloptions` VALUES ('351', 'paymentmethod_payu_money_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('352', 'paymentmethod_payu_money_currencies', 'INR', '0');
INSERT INTO `tbloptions` VALUES ('353', 'paymentmethod_payu_money_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('354', 'paymentmethod_payu_money_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('355', 'paymentmethod_payu_money_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('356', 'paymentmethod_stripe_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('357', 'paymentmethod_stripe_label', 'Stripe Checkout', '1');
INSERT INTO `tbloptions` VALUES ('358', 'paymentmethod_stripe_api_secret_key', '', '0');
INSERT INTO `tbloptions` VALUES ('359', 'paymentmethod_stripe_api_publishable_key', '', '0');
INSERT INTO `tbloptions` VALUES ('360', 'paymentmethod_stripe_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('361', 'paymentmethod_stripe_currencies', 'USD,CAD', '0');
INSERT INTO `tbloptions` VALUES ('362', 'paymentmethod_stripe_allow_primary_contact_to_update_credit_card', '1', '0');
INSERT INTO `tbloptions` VALUES ('363', 'paymentmethod_stripe_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('364', 'paymentmethod_stripe_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('365', 'paymentmethod_stripe_ideal_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('366', 'paymentmethod_stripe_ideal_label', 'Stripe iDEAL', '1');
INSERT INTO `tbloptions` VALUES ('367', 'paymentmethod_stripe_ideal_api_secret_key', '', '0');
INSERT INTO `tbloptions` VALUES ('368', 'paymentmethod_stripe_ideal_api_publishable_key', '', '0');
INSERT INTO `tbloptions` VALUES ('369', 'paymentmethod_stripe_ideal_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('370', 'paymentmethod_stripe_ideal_statement_descriptor', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('371', 'paymentmethod_stripe_ideal_currencies', 'EUR', '0');
INSERT INTO `tbloptions` VALUES ('372', 'paymentmethod_stripe_ideal_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('373', 'paymentmethod_stripe_ideal_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('374', 'paymentmethod_two_checkout_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('375', 'paymentmethod_two_checkout_label', '2Checkout', '1');
INSERT INTO `tbloptions` VALUES ('376', 'paymentmethod_two_checkout_merchant_code', '', '0');
INSERT INTO `tbloptions` VALUES ('377', 'paymentmethod_two_checkout_secret_key', '', '0');
INSERT INTO `tbloptions` VALUES ('378', 'paymentmethod_two_checkout_description', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('379', 'paymentmethod_two_checkout_currencies', 'USD, EUR, GBP', '0');
INSERT INTO `tbloptions` VALUES ('380', 'paymentmethod_two_checkout_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('381', 'paymentmethod_two_checkout_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('382', 'paymentmethod_two_checkout_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('383', 'paymentmethod_authorize_acceptjs_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('384', 'paymentmethod_authorize_acceptjs_label', 'Authorize.net Accept.js', '1');
INSERT INTO `tbloptions` VALUES ('385', 'paymentmethod_authorize_acceptjs_public_key', '', '0');
INSERT INTO `tbloptions` VALUES ('386', 'paymentmethod_authorize_acceptjs_api_login_id', '', '0');
INSERT INTO `tbloptions` VALUES ('387', 'paymentmethod_authorize_acceptjs_api_transaction_key', '', '0');
INSERT INTO `tbloptions` VALUES ('388', 'paymentmethod_authorize_acceptjs_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('389', 'paymentmethod_authorize_acceptjs_currencies', 'USD', '0');
INSERT INTO `tbloptions` VALUES ('390', 'paymentmethod_authorize_acceptjs_test_mode_enabled', '0', '0');
INSERT INTO `tbloptions` VALUES ('391', 'paymentmethod_authorize_acceptjs_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('392', 'paymentmethod_authorize_acceptjs_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('393', 'paymentmethod_instamojo_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('394', 'paymentmethod_instamojo_label', 'Instamojo', '1');
INSERT INTO `tbloptions` VALUES ('395', 'paymentmethod_instamojo_api_key', '', '0');
INSERT INTO `tbloptions` VALUES ('396', 'paymentmethod_instamojo_auth_token', '', '0');
INSERT INTO `tbloptions` VALUES ('397', 'paymentmethod_instamojo_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('398', 'paymentmethod_instamojo_currencies', 'INR', '0');
INSERT INTO `tbloptions` VALUES ('399', 'paymentmethod_instamojo_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('400', 'paymentmethod_instamojo_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('401', 'paymentmethod_instamojo_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('402', 'paymentmethod_mollie_active', '0', '1');
INSERT INTO `tbloptions` VALUES ('403', 'paymentmethod_mollie_label', 'Mollie', '1');
INSERT INTO `tbloptions` VALUES ('404', 'paymentmethod_mollie_api_key', '', '0');
INSERT INTO `tbloptions` VALUES ('405', 'paymentmethod_mollie_description_dashboard', 'Payment for Invoice {invoice_number}', '0');
INSERT INTO `tbloptions` VALUES ('406', 'paymentmethod_mollie_currencies', 'EUR', '0');
INSERT INTO `tbloptions` VALUES ('407', 'paymentmethod_mollie_test_mode_enabled', '1', '0');
INSERT INTO `tbloptions` VALUES ('408', 'paymentmethod_mollie_default_selected', '1', '1');
INSERT INTO `tbloptions` VALUES ('409', 'paymentmethod_mollie_initialized', '1', '1');
INSERT INTO `tbloptions` VALUES ('410', 'auto_backup_enabled', '0', '1');
INSERT INTO `tbloptions` VALUES ('411', 'auto_backup_every', '7', '1');
INSERT INTO `tbloptions` VALUES ('412', 'last_auto_backup', '', '1');
INSERT INTO `tbloptions` VALUES ('413', 'delete_backups_older_then', '0', '1');
INSERT INTO `tbloptions` VALUES ('414', 'aside_menu_active', '[]', '1');
INSERT INTO `tbloptions` VALUES ('415', 'setup_menu_active', '[]', '1');
INSERT INTO `tbloptions` VALUES ('416', 'survey_send_emails_per_cron_run', '100', '1');
INSERT INTO `tbloptions` VALUES ('417', 'last_survey_send_cron', '', '1');
INSERT INTO `tbloptions` VALUES ('418', 'theme_style', '[]', '1');
INSERT INTO `tbloptions` VALUES ('419', 'theme_style_custom_admin_area', '', '1');
INSERT INTO `tbloptions` VALUES ('420', 'theme_style_custom_clients_area', '', '1');
INSERT INTO `tbloptions` VALUES ('421', 'theme_style_custom_clients_and_admin_area', '', '1');
INSERT INTO `tbloptions` VALUES ('422', 'sms_trigger_invoice_overdue_notice', '', '0');
INSERT INTO `tbloptions` VALUES ('423', 'sms_trigger_invoice_payment_recorded', '', '0');
INSERT INTO `tbloptions` VALUES ('424', 'sms_trigger_estimate_expiration_reminder', '', '0');
INSERT INTO `tbloptions` VALUES ('425', 'sms_trigger_proposal_expiration_reminder', '', '0');
INSERT INTO `tbloptions` VALUES ('426', 'sms_trigger_proposal_new_comment_to_customer', '', '0');
INSERT INTO `tbloptions` VALUES ('427', 'sms_trigger_proposal_new_comment_to_staff', '', '0');
INSERT INTO `tbloptions` VALUES ('428', 'sms_trigger_contract_new_comment_to_customer', '', '0');
INSERT INTO `tbloptions` VALUES ('429', 'sms_trigger_contract_new_comment_to_staff', '', '0');
INSERT INTO `tbloptions` VALUES ('430', 'sms_trigger_contract_expiration_reminder', '', '0');
INSERT INTO `tbloptions` VALUES ('431', 'sms_trigger_staff_reminder', '', '0');

-- ----------------------------
-- Table structure for `tblpayment_modes`
-- ----------------------------
DROP TABLE IF EXISTS `tblpayment_modes`;
CREATE TABLE `tblpayment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `show_on_pdf` int(11) NOT NULL DEFAULT '0',
  `invoices_only` int(11) NOT NULL DEFAULT '0',
  `expenses_only` int(11) NOT NULL DEFAULT '0',
  `selected_by_default` int(11) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblpayment_modes
-- ----------------------------
INSERT INTO `tblpayment_modes` VALUES ('1', 'Bank', null, '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `tblpinned_projects`
-- ----------------------------
DROP TABLE IF EXISTS `tblpinned_projects`;
CREATE TABLE `tblpinned_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblpinned_projects
-- ----------------------------

-- ----------------------------
-- Table structure for `tblprojectdiscussioncomments`
-- ----------------------------
DROP TABLE IF EXISTS `tblprojectdiscussioncomments`;
CREATE TABLE `tblprojectdiscussioncomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL,
  `discussion_type` varchar(10) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT '0',
  `fullname` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_mime_type` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblprojectdiscussioncomments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblprojectdiscussions`
-- ----------------------------
DROP TABLE IF EXISTS `tblprojectdiscussions`;
CREATE TABLE `tblprojectdiscussions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblprojectdiscussions
-- ----------------------------

-- ----------------------------
-- Table structure for `tblprojects`
-- ----------------------------
DROP TABLE IF EXISTS `tblprojects`;
CREATE TABLE `tblprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `clientid` int(11) NOT NULL,
  `billing_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int(11) DEFAULT '0',
  `progress_from_tasks` int(11) NOT NULL DEFAULT '1',
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblprojects
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproject_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_activity`;
CREATE TABLE `tblproject_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(100) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT '0',
  `description_key` varchar(191) NOT NULL COMMENT 'Language file key',
  `additional_data` text,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproject_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproject_files`
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_files`;
CREATE TABLE `tblproject_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` text,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT '0',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproject_files
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproject_members`
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_members`;
CREATE TABLE `tblproject_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproject_members
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproject_notes`
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_notes`;
CREATE TABLE `tblproject_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproject_notes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproject_settings`
-- ----------------------------
DROP TABLE IF EXISTS `tblproject_settings`;
CREATE TABLE `tblproject_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproject_settings
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproposals`
-- ----------------------------
DROP TABLE IF EXISTS `tblproposals`;
CREATE TABLE `tblproposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `content` longtext,
  `addedfrom` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `show_quantity_as` int(11) NOT NULL DEFAULT '1',
  `currency` int(11) NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(40) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `proposal_to` varchar(191) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int(11) NOT NULL DEFAULT '0',
  `is_expiry_notified` int(11) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproposals
-- ----------------------------

-- ----------------------------
-- Table structure for `tblproposal_comments`
-- ----------------------------
DROP TABLE IF EXISTS `tblproposal_comments`;
CREATE TABLE `tblproposal_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `proposalid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblproposal_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblrelated_items`
-- ----------------------------
DROP TABLE IF EXISTS `tblrelated_items`;
CREATE TABLE `tblrelated_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblrelated_items
-- ----------------------------

-- ----------------------------
-- Table structure for `tblreminders`
-- ----------------------------
DROP TABLE IF EXISTS `tblreminders`;
CREATE TABLE `tblreminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `date` datetime NOT NULL,
  `isnotified` int(11) NOT NULL DEFAULT '0',
  `rel_id` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `notify_by_email` int(11) NOT NULL DEFAULT '1',
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblreminders
-- ----------------------------

-- ----------------------------
-- Table structure for `tblroles`
-- ----------------------------
DROP TABLE IF EXISTS `tblroles`;
CREATE TABLE `tblroles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `permissions` longtext,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblroles
-- ----------------------------
INSERT INTO `tblroles` VALUES ('1', 'Employee', null);
INSERT INTO `tblroles` VALUES ('2', '开发组组长', 'a:19:{s:17:\"bulk_pdf_exporter\";a:1:{i:0;s:4:\"view\";}s:9:\"contracts\";a:1:{i:0;s:8:\"view_own\";}s:12:\"credit_notes\";a:4:{i:0;s:8:\"view_own\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:9:\"customers\";a:1:{i:0;s:4:\"view\";}s:15:\"email_templates\";a:1:{i:0;s:4:\"edit\";}s:9:\"estimates\";a:1:{i:0;s:4:\"view\";}s:5:\"items\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:14:\"knowledge_base\";a:3:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}s:8:\"projects\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:9:\"proposals\";a:1:{i:0;s:8:\"view_own\";}s:7:\"reports\";a:1:{i:0;s:4:\"view\";}s:5:\"roles\";a:3:{i:0;s:6:\"create\";i:1;s:4:\"edit\";i:2;s:6:\"delete\";}s:8:\"settings\";a:1:{i:0;s:4:\"edit\";}s:5:\"staff\";a:3:{i:0;s:6:\"create\";i:1;s:4:\"edit\";i:2;s:6:\"delete\";}s:13:\"subscriptions\";a:3:{i:0;s:6:\"create\";i:1;s:4:\"edit\";i:2;s:6:\"delete\";}s:5:\"tasks\";a:3:{i:0;s:6:\"create\";i:1;s:4:\"edit\";i:2;s:6:\"delete\";}s:19:\"checklist_templates\";a:2:{i:0;s:6:\"create\";i:1;s:6:\"delete\";}s:5:\"goals\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:7:\"surveys\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}}');
INSERT INTO `tblroles` VALUES ('3', '开发组成员', 'a:11:{s:17:\"bulk_pdf_exporter\";a:1:{i:0;s:4:\"view\";}s:9:\"contracts\";a:1:{i:0;s:8:\"view_own\";}s:12:\"credit_notes\";a:3:{i:0;s:8:\"view_own\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}s:9:\"customers\";a:1:{i:0;s:4:\"view\";}s:15:\"email_templates\";a:1:{i:0;s:4:\"view\";}s:5:\"items\";a:1:{i:0;s:4:\"view\";}s:8:\"projects\";a:1:{i:0;s:4:\"view\";}s:5:\"staff\";a:1:{i:0;s:4:\"view\";}s:5:\"tasks\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:5:\"goals\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:7:\"surveys\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}}');

-- ----------------------------
-- Table structure for `tblsales_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tblsales_activity`;
CREATE TABLE `tblsales_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `additional_data` text,
  `staffid` varchar(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsales_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `tblscheduled_emails`
-- ----------------------------
DROP TABLE IF EXISTS `tblscheduled_emails`;
CREATE TABLE `tblscheduled_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `contacts` varchar(197) NOT NULL,
  `cc` text,
  `attach_pdf` tinyint(1) NOT NULL DEFAULT '1',
  `template` varchar(197) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblscheduled_emails
-- ----------------------------

-- ----------------------------
-- Table structure for `tblservices`
-- ----------------------------
DROP TABLE IF EXISTS `tblservices`;
CREATE TABLE `tblservices` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblservices
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsessions`
-- ----------------------------
DROP TABLE IF EXISTS `tblsessions`;
CREATE TABLE `tblsessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsessions
-- ----------------------------
INSERT INTO `tblsessions` VALUES ('0i1jv803t3pmtlq9ker0v1trvnnam8gp', '108.162.245.235', '1614352990', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323938393B69735F6D6F62696C657C623A313B7265645F75726C7C733A33363A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E2F70726F6A65637473223B);
INSERT INTO `tblsessions` VALUES ('0q8dntc0jfrl8297h33liipeu9orl589', '162.158.126.141', '1615076320', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353037363332303B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('0qgdq29j81q9ut8h80n101adgoab5qf2', '192.168.1.70', '1614913383', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931333338333B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B6C656164735F6B616E62616E5F766965777C733A343A2274727565223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A303A7B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343931323933333B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('16rv5et8r1dsls2g875a51s16ub33p6b', '173.245.54.85', '1616125075', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363132353037343B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('1b50l99622oorkdjv1j59177cdk8cq9j', '162.158.255.37', '1615920453', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932303435333B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('1kkc56j68vo6pbdd4e3dgjqq2j31qq4m', '162.158.107.194', '1615906257', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353930363235373B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('2divn20bli3ae7k0jj9vtasq8uak9qk8', '172.68.189.136', '1614912701', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323730313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('3d0vu4cbra6ocl54mt34lp5ldm2qnt98', '172.69.22.83', '1614322364', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323336343B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('3gv8e6p52bvliijucinfmrg90643r41k', '192.168.1.70', '1614837342', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373234313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226561373461663464643462326239383338623963613138643365646137633264223B613A31323A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A383A227A68752D74657374223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343833373330383B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('4454a6keef85nbscj0g63ruqm12b84c7', '108.162.245.241', '1615240405', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353234303237303B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B);
INSERT INTO `tblsessions` VALUES ('4csksiah54nik6r14k0csp8baro1kg9l', '172.69.33.148', '1614322669', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323636383B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('4og2rclvgn2rr4eebka1vop6btiml7nn', '172.69.63.176', '1614837258', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373235373B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('548oejblci5jbci3a56e63bivvo4uncd', '192.168.1.70', '1614913045', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931333034353B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B6C656164735F6B616E62616E5F766965777C733A343A2274727565223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A303A7B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343931323933333B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('59018jatctud7604mudl4ako9k543369', '162.158.165.203', '1614323355', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333335353B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('6qgch2b8n651ptnb9kjlruln63c0gdfi', '172.68.132.202', '1615929084', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932393038343B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('6rl44vosursj8nd3498klm12pj918c3n', '172.68.142.92', '1616027737', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363032373733373B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('6soq3omm661f6ipdbb05ocg8nlh4d4bf', '162.158.165.203', '1614322667', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323636373B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('6tiv1td228rb7udfulv66bs0hr1h4vtp', '172.68.174.135', '1615320727', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353332303732373B73746166665F757365725F69647C733A313A2233223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('71n9uuhpes0j2o1a5598l4geh93ubffv', '162.158.146.175', '1614322898', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323736393B69735F6D6F62696C657C623A313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('7unbgjsos6j99t78t9srq1sn2rhatblf', '162.158.255.183', '1615310769', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353331303631353B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B);
INSERT INTO `tblsessions` VALUES ('8j1ernj598l13cp07o2cgpt6ohb3p0sn', '162.158.107.202', '1615228040', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353232383034303B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B6D6573736167652D737563636573737C733A32303A22E8A792E889B220E6B7BBE58AA0E68890E58A9F2E223B5F5F63695F766172737C613A313A7B733A31353A226D6573736167652D73756363657373223B733A333A226F6C64223B7D);
INSERT INTO `tblsessions` VALUES ('9r2e470n7kc44v0vop6t92pr0vo375qj', '108.162.241.16', '1616264595', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343539353B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('a0cirjas3iofaa5h1udinpbspm9kdctb', '162.158.7.50', '1614322730', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323732393B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('a57jv0gej6qnq9bbtaspdsb24nekoa17', '162.158.255.180', '1614719192', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343731393138343B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('b6alollpba1t5fo29fjj60irh78prqce', '162.158.212.217', '1615920094', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932303039343B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('breh4iguir4t831ccldn26cqafns73ur', '172.69.35.92', '1615994360', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353939343335373B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('bss67piiaquujkto6iao1vqollft9i4a', '172.68.143.129', '1614985531', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343938353532393B7265645F75726C7C733A33363A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E2F70726F6A65637473223B);
INSERT INTO `tblsessions` VALUES ('bssek7amh872bburfvr922o99n5o2ap0', '162.158.255.219', '1614323040', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333034303B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B6C656164735F6B616E62616E5F766965777C733A343A2274727565223B);
INSERT INTO `tblsessions` VALUES ('cdeobd39gc4mauu0j9ktl3d5c51b9q77', '172.68.189.148', '1614352172', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323137323B69735F6D6F62696C657C623A313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('cffom6v80vcs4stum9hvpoe0kdtrukbs', '172.69.33.122', '1614352348', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323334373B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('cg4ljk1n79g85ugeji1dflel744ba6mv', '162.158.119.180', '1614352280', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323238303B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('citrft3tjtl5o0nk6uh2j3s1aqio1d1v', '172.68.142.56', '1616033908', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363033333930313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('clmv00refmgq623mud4dih6dj0m6jmcl', '108.162.245.235', '1615320225', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353332303232353B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B);
INSERT INTO `tblsessions` VALUES ('d0oijrl17is7tahdjdau0qe5fje6npm6', '162.158.255.181', '1615927221', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932373231373B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('d5udhl2e2ujn2s9pbknqi38d7dkcont1', '192.168.1.70', '1614455553', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343435353439353B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B);
INSERT INTO `tblsessions` VALUES ('dbh7ul6h0h0947ednf9blmtmbr4iqksi', '108.162.245.235', '1614617799', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343631373739383B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('ddvvvq6hu7brqur60ef36ggvm1bokeng', '192.168.1.70', '1616264714', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343731343B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A223430333738643638636536336237373764653130373761303434393563396563223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A223335386235616435383663346638326131646631646233623166353661636537223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631353932393333363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A353A226D65646961223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A323A7B733A33313A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D65646961223B623A313B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A313B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631363236343433313B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('e1b8fdutbucs78cp3jnhqpub821q10dg', '172.69.22.59', '1616033901', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363033333930313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('e8s7nop6krvr6m464d0d4h18pak3pjib', '192.168.1.70', '1616264380', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343338303B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ehfnftc8p18fh7l43csnlcfrui665rpk', '172.68.132.58', '1615907342', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353930373238323B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('eqgp93nbmv6r66huu020u197qrue62lt', '162.158.146.205', '1615516597', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353531363539343B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('f6m6kl22bjarku61ss83bom85n7a37ag', '162.158.74.110', '1614345058', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343334353035383B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('fq3h96isuu5vkd86b2pivg7um784pq56', '162.158.107.194', '1615906580', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353930363538303B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('g4046a3j7s4jb95m6a565jera87e6odb', '173.245.54.184', '1614912799', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323739393B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('gci6fij166qf0n9dsj4julfn7g9o0jab', '172.68.142.32', '1615920805', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932303830353B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ggvr056vg8naq8e7jade204v618mutle', '162.158.255.127', '1615929709', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932393730313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A223430333738643638636536336237373764653130373761303434393563396563223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A223335386235616435383663346638326131646631646233623166353661636537223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631353932393333363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A353A226D65646961223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A323A7B733A33313A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D65646961223B623A313B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A313B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631353932393337313B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('gt7pm220ab6ovcraodi5ulaus833o7eh', '172.69.33.246', '1614323354', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333334363B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('h0vt2vpvsl81t5cehag1751h1mfqsm95', '172.69.33.32', '1614323990', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333939303B69735F6D6F62696C657C623A313B);
INSERT INTO `tblsessions` VALUES ('h71i17gisi4a6e8q7oimnasbj3mif6br', '172.69.22.59', '1614912891', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323832323B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('hdi013q43oeg9q1cbsk81kvd520u4jqp', '172.68.142.32', '1614631625', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343633313631383B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('hhb87pncl3k167t4i8bdpum6t3a1nuvh', '108.162.241.17', '1616075307', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363037353239393B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('hprer27l184qp9otbmes4l9edlfr6cbf', '162.158.255.219', '1614323168', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333034303B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B6C656164735F6B616E62616E5F766965777C733A343A2274727565223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226561373461663464643462326239383338623963613138643365646137633264223B613A31323A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A383A227A68752D74657374223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A303B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343332333134303B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('i0e337kq0l8jm77kv16jt38np9cl2to3', '172.68.132.148', '1614322690', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323639303B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('i5p05b2vjv617b9d3jtk8c1fdrg3u95a', '162.158.79.22', '1614837263', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373236333B);
INSERT INTO `tblsessions` VALUES ('ia1ii956e6d3cn93u1tvrvher23sncff', '162.158.107.172', '1615907282', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353930373238323B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('il354vvmudrodkid341a2350csrln4l3', '162.158.255.37', '1615929701', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932393730313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A223430333738643638636536336237373764653130373761303434393563396563223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A223335386235616435383663346638326131646631646233623166353661636537223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631353932393333363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A353A226D65646961223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A323A7B733A33313A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D65646961223B623A313B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A313B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631353932393337313B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('in0o063us94l1hq4a7o36akaos5brn22', '172.69.33.38', '1614323897', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333839373B69735F6D6F62696C657C623A313B);
INSERT INTO `tblsessions` VALUES ('iqgp4fffi26c72nr5g25d5oqpebqokn4', '172.69.33.244', '1614345129', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343334353132393B69735F6D6F62696C657C623A313B);
INSERT INTO `tblsessions` VALUES ('j4oabmllk8v3vpa0i08d1ocegu226huh', '172.69.33.6', '1614322731', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323733313B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('jpbmbk4ma9h26j0v4h7gi4p5101hftcn', '162.158.107.172', '1615326533', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353332363533303B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('k3f0p6rf9riqcv4ibjscnge93t5fvl6l', '192.168.1.70', '1614914555', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931343535353B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C623A313B);
INSERT INTO `tblsessions` VALUES ('kfse7p3d1s1p0c96851s12c3nvm4fqnb', '162.158.166.227', '1614583393', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343538333339313B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('kir52ekt0endas9gj208mbr295cm67kt', '108.162.245.9', '1615240191', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353234303139313B73746166665F757365725F69647C733A313A2233223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ko48abnuffsvod4enqv5pffv9ltbj9d2', '172.68.65.179', '1614837262', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373236313B);
INSERT INTO `tblsessions` VALUES ('l5kgj67l823dpvrauf46po29f271slf4', '108.162.245.61', '1615320987', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353332303839323B73746166665F757365725F69647C733A313A2234223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('lev74pe4jhcmp6bsrb8ku8uisa9rsvpg', '162.158.79.116', '1614912855', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323831313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ln7h6n84i9mfmq4eh68tf51do3f5lrla', '108.162.241.61', '1616264893', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343539353B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('mnq66obea076r98bqi5jfd7duo3fo915', '172.68.174.135', '1614352171', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323137313B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('mujfs7inl0eekb2nlchep8mfg25vp1qo', '192.168.1.70', '1614914859', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931343835393B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('n444hnnr0aerk54utvl3rjrkuh70938n', '172.69.23.48', '1615929387', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353932393338373B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A223430333738643638636536336237373764653130373761303434393563396563223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A223335386235616435383663346638326131646631646233623166353661636537223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631353932393333363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A353A226D65646961223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A323A7B733A33313A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D65646961223B623A313B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A313B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631353932393337313B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('n5bu9kdnh706s22kp4khl6f5v63kinau', '172.69.33.38', '1614913496', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931333439333B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('n7he6cr6lr6rokre39mlpgglrorpj3fn', '162.158.78.191', '1614912846', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323739383B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('nl261oapc5262mp87hm9l42nfr4tf3c4', '162.158.166.198', '1614583394', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343538333339343B69735F6D6F62696C657C623A313B);
INSERT INTO `tblsessions` VALUES ('oav1fueipea1sgchmres33ucf2au0nci', '172.68.142.56', '1616028161', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363032383136313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('oglapk83mmkd0s5ripgk3t6rp7lkineo', '108.162.241.61', '1616336837', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363333363833343B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('onmm5anh3lssvrhspgghj00hcvm8sl2n', '108.162.245.235', '1614389357', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343338393236353B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A303A7B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343338393334383B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('pkpggaf3cfhma4uiqbte8navves0uv1f', '108.162.241.71', '1616264174', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343137343B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ppoahkrj78nvjhtih82afeiaei2953l1', '192.168.1.70', '1614914120', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931343132303B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B6C656164735F6B616E62616E5F766965777C733A343A2274727565223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A226161343632633838313366336231656235333163633065656536633839373031223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A313A7B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A303B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A303A7B7D733A373A2273756264697273223B613A303A7B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631343931323933333B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('ptt52gru7mlm7e8kqe9efu6h2dk9oahm', '172.68.132.252', '1614921680', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343932313638303B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('q90btikv4101ioub2l512nt358fv267j', '108.162.241.61', '1616130646', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363133303634313B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('qakgrtrorptqrpqeol2jitvj4c7kv1tq', '162.158.79.22', '1614837258', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373235383B);
INSERT INTO `tblsessions` VALUES ('qd9miqjdoho1ifp1tpvtq96u2822ltv4', '108.162.245.241', '1614921680', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343932313638303B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('qgn78oosrni3ibclbohg6t83ha5fhe5g', '172.69.33.32', '1614323270', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333236383B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('r8hgk3astdv56j63falocatg4msn6s6p', '108.162.241.71', '1615326533', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353332363533333B);
INSERT INTO `tblsessions` VALUES ('r9rhnkuc52kmglliorvlf04l30hckvag', '192.168.1.70', '1616264894', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236343731343B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B656C46696E6465724361636865737C613A363A7B733A383A225F6F7074734D4435223B733A33323A223430333738643638636536336237373764653130373761303434393563396563223B733A333A226C315F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A223335386235616435383663346638326131646631646233623166353661636537223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631353932393333363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C315F5841223B733A343A226E616D65223B733A353A226D65646961223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C315F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A323A7B733A33313A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D65646961223B623A313B733A34303A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7A68752D74657374223B623A313B7D7D733A393A22617263686976657273223B613A323A7B733A363A22637265617465223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A333A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A343A222D636866223B733A333A22657874223B733A333A22746172223B7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31333A227A6970417263686976655A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D733A373A2265787472616374223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B613A353A7B733A333A22636D64223B733A333A22746172223B733A343A2261726763223B733A333A222D7866223B733A333A22657874223B733A333A22746172223B733A363A22746F53706563223B733A333A222D4320223B733A373A2267657473697A65223B613A343A7B733A343A2261726763223B733A343A222D787666223B733A363A22746F53706563223B733A31373A222D2D746F2D7374646F75747C7763202D63223B733A353A227265676578223B733A34383A222F5E2E2B283F3A5C725C6E7C5C6E7C5C72295B5E5C725C6E302D395D2A285B302D395D2B295B5E5C725C6E5D2A242F73223B733A373A227265706C616365223B733A323A222431223B7D7D733A31353A226170706C69636174696F6E2F7A6970223B613A333A7B733A333A22636D64223B733A31313A2270687066756E6374696F6E223B733A343A2261726763223B613A323A7B693A303B733A343A2273656C66223B693A313B733A31353A227A697041726368697665556E7A6970223B7D733A333A22657874223B733A333A227A6970223B7D7D7D733A383A22766964656F4C6962223B733A303A22223B733A333A226C325F223B613A323A7B733A383A22726F6F7473746174223B613A313A7B733A33323A226664333338363236363938386366653438643734373433643933373734353664223B613A31333A7B733A373A2269736F776E6572223B623A303B733A323A227473223B693A313631343332333133363B733A343A226D696D65223B733A393A226469726563746F7279223B733A343A2272656164223B693A313B733A353A227772697465223B693A313B733A343A2273697A65223B693A303B733A343A2268617368223B733A353A226C325F5841223B733A343A226E616D65223B733A363A227075626C6963223B733A373A22726F6F74526576223B733A303A22223B733A373A226F7074696F6E73223B613A32323A7B733A343A2270617468223B733A303A22223B733A333A2275726C223B733A303A22223B733A363A22746D6255726C223B733A303A22223B733A383A2264697361626C6564223B613A303A7B7D733A393A22736570617261746F72223B733A313A225C223B733A31333A22636F70794F7665727772697465223B693A313B733A31353A2275706C6F61644F7665727772697465223B693A313B733A31333A2275706C6F61644D617853697A65223B693A31303438353736303B733A31333A2275706C6F61644D6178436F6E6E223B693A333B733A31303A2275706C6F61644D696D65223B613A333A7B733A31303A2266697273744F72646572223B733A343A2264656E79223B733A353A22616C6C6F77223B613A303A7B7D733A343A2264656E79223B613A31343A7B693A303B733A32333A226170706C69636174696F6E2F782D68747470642D706870223B693A313B733A31353A226170706C69636174696F6E2F706870223B693A323B733A31373A226170706C69636174696F6E2F782D706870223B693A333B733A383A22746578742F706870223B693A343B733A31303A22746578742F782D706870223B693A353B733A33303A226170706C69636174696F6E2F782D68747470642D7068702D736F75726365223B693A363B733A31363A226170706C69636174696F6E2F7065726C223B693A373B733A31383A226170706C69636174696F6E2F782D7065726C223B693A383B733A32303A226170706C69636174696F6E2F782D707974686F6E223B693A393B733A31383A226170706C69636174696F6E2F707974686F6E223B693A31303B733A32393A226170706C69636174696F6E2F782D62797465636F64652E707974686F6E223B693A31313B733A32393A226170706C69636174696F6E2F782D707974686F6E2D62797465636F6465223B693A31323B733A32353A226170706C69636174696F6E2F782D707974686F6E2D636F6465223B693A31333B733A31383A227777777365727665722F7368656C6C636769223B7D7D733A31353A2264697370496E6C696E655265676578223B733A3131303A225E283F3A283F3A766964656F7C617564696F297C696D6167652F283F212E2B5C2B786D6C297C6170706C69636174696F6E2F283F3A6F67677C782D6D70656755524C7C646173685C2B786D6C297C283F3A746578742F706C61696E7C6170706C69636174696F6E2F706466292429223B733A31303A226A70675175616C697479223B693A3130303B733A393A22617263686976657273223B613A333A7B733A363A22637265617465223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A373A2265787472616374223B613A323A7B693A303B733A31373A226170706C69636174696F6E2F782D746172223B693A313B733A31353A226170706C69636174696F6E2F7A6970223B7D733A393A22637265617465657874223B613A323A7B733A31373A226170706C69636174696F6E2F782D746172223B733A333A22746172223B733A31353A226170706C69636174696F6E2F7A6970223B733A333A227A6970223B7D7D733A383A227569436D644D6170223B613A303A7B7D733A31313A2273796E6343686B41735473223B693A313B733A393A2273796E634D696E4D73223B693A303B733A31343A226931386E466F6C6465724E616D65223B693A303B733A373A22746D6243726F70223B693A313B733A31363A22746D62526571437573746F6D44617461223B623A303B733A31333A2273756273746974757465496D67223B623A313B733A31303A226F6E6574696D6555726C223B623A313B733A363A22637373636C73223B733A32363A22656C66696E6465722D6E61766261722D726F6F742D6C6F63616C223B7D733A383A22766F6C756D656964223B733A333A226C325F223B733A363A226C6F636B6564223B693A313B733A343A2264697273223B693A313B7D7D733A373A2273756264697273223B613A313A7B733A33383A22443A5C776562726F6F745C63726D2E7765646F6572702E63615C6D656469615C7075626C6963223B623A313B7D7D733A31343A223A4C4153545F4143544956495459223B693A313631363236343433313B7D656C46696E6465724E6574566F6C756D65737C613A303A7B7D);
INSERT INTO `tblsessions` VALUES ('rm871apjl34e4fddeimu9i1i8sv4vr9l', '108.162.245.93', '1615076323', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353037363039323B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('rmfuhttphjkqukg3tveku1ud83vgmb6n', '162.158.62.116', '1614912958', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931323930303B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('rs1v3a726bjvoh2kauq582n6lbl7vd38', '172.69.22.82', '1614322607', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323539343B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('sb5rearv1hi5vckrudqum3ddsar4tcu1', '172.69.63.44', '1614837264', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343833373236343B);
INSERT INTO `tblsessions` VALUES ('sd8ojt2rb77mjvki2hcid52aml5ohg40', '172.69.35.34', '1614323887', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333838303B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('sgof06u1ml9insrqoucpipcipl2t55rq', '108.162.241.71', '1616263844', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631363236333834343B73746166665F757365725F69647C733A313A2235223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('sve3v6ato738kf76bd7mrfsdp8211eag', '162.158.107.196', '1614352304', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343335323137323B69735F6D6F62696C657C623A313B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('trvf6fb8m4jdshi4crs08kgotci3t34k', '172.69.34.5', '1614913475', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931333437323B69735F6D6F62696C657C623A313B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);
INSERT INTO `tblsessions` VALUES ('tumqu9p3kai0j37fhjigpk7kun97vkug', '192.168.1.70', '1614914921', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343931343835393B73746166665F757365725F69647C733A313A2231223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('ut5499gvoaieakbe76611k06hfhf7ev5', '172.68.132.252', '1614820103', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343832303130333B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('v0otqal90ab60mhoe8s73a1i17rrnkpc', '108.162.241.23', '1614323207', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332333230363B69735F6D6F62696C657C623A313B7265645F75726C7C733A32323A22687474703A2F2F63726D2E7765646F6572702E63612F223B);
INSERT INTO `tblsessions` VALUES ('v3fqs7ik1ngrjii2hj8f1ml2grbp2f6u', '172.68.142.92', '1614820113', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343832303130333B73746166665F757365725F69647C733A313A2232223B73746166665F6C6F676765645F696E7C623A313B73657475702D6D656E752D6F70656E7C733A303A22223B);
INSERT INTO `tblsessions` VALUES ('v4r4tv78jjkhnai3lebi0c3aal6kqutr', '172.69.33.246', '1614322730', 0x5F5F63695F6C6173745F726567656E65726174657C693A313631343332323733303B7265645F75726C7C733A32373A22687474703A2F2F63726D2E7765646F6572702E63612F61646D696E223B);

-- ----------------------------
-- Table structure for `tblshared_customer_files`
-- ----------------------------
DROP TABLE IF EXISTS `tblshared_customer_files`;
CREATE TABLE `tblshared_customer_files` (
  `file_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblshared_customer_files
-- ----------------------------

-- ----------------------------
-- Table structure for `tblspam_filters`
-- ----------------------------
DROP TABLE IF EXISTS `tblspam_filters`;
CREATE TABLE `tblspam_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `rel_type` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblspam_filters
-- ----------------------------

-- ----------------------------
-- Table structure for `tblstaff`
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff`;
CREATE TABLE `tblstaff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `facebook` mediumtext,
  `linkedin` mediumtext,
  `phonenumber` varchar(30) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `role` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `default_language` varchar(40) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `media_path_slug` varchar(191) DEFAULT NULL,
  `is_not_staff` int(11) NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `two_factor_auth_enabled` tinyint(1) DEFAULT '0',
  `two_factor_auth_code` varchar(100) DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` text,
  `google_auth_secret` text,
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblstaff
-- ----------------------------
INSERT INTO `tblstaff` VALUES ('1', 'naeduwedo@gmail.com', 'clark', 'zhu', '', '', '', '', '$2a$08$IQfcjLsDwwkt3Ae43EOBLu7HE2F4Zw0Twy9CHL8F7ZkW5YrTXm6Vy', '2021-02-26 14:46:51', null, '192.168.1.70', '2021-03-20 11:10:13', '2021-03-20 11:28:14', '2021-03-08 10:19:14', null, null, '1', '0', '1', '', '', null, '0', '0.00', '0', null, null, '', null);
INSERT INTO `tblstaff` VALUES ('5', 'selinazhang2006@gmail.com', 'zhang', 'sekina', '', '', '123456', '', '$2a$08$53w2mc..7oCAj4h5yMInBe97m5R6WFYSnBeo6yJjWsBYpbZ9LSgFq', '2021-03-16 08:00:22', null, '108.162.241.17', '2021-03-20 11:11:13', '2021-03-20 11:28:13', null, null, null, '1', '1', '1', '', '', 'li-sekina', '0', '0.00', '0', null, null, '', null);

-- ----------------------------
-- Table structure for `tblstaff_departments`
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff_departments`;
CREATE TABLE `tblstaff_departments` (
  `staffdepartmentid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblstaff_departments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblstaff_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `tblstaff_permissions`;
CREATE TABLE `tblstaff_permissions` (
  `staff_id` int(11) NOT NULL,
  `feature` varchar(40) NOT NULL,
  `capability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblstaff_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsubscriptions`
-- ----------------------------
DROP TABLE IF EXISTS `tblsubscriptions`;
CREATE TABLE `tblsubscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_in_item` tinyint(1) NOT NULL DEFAULT '0',
  `clientid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `terms` text,
  `currency` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `stripe_tax_id` varchar(50) DEFAULT NULL,
  `tax_id_2` int(11) NOT NULL DEFAULT '0',
  `stripe_tax_id_2` varchar(50) DEFAULT NULL,
  `stripe_plan_id` text,
  `stripe_subscription_id` text NOT NULL,
  `next_billing_cycle` bigint(20) DEFAULT NULL,
  `ends_at` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int(11) NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  `in_test_environment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsubscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsurveyresultsets`
-- ----------------------------
DROP TABLE IF EXISTS `tblsurveyresultsets`;
CREATE TABLE `tblsurveyresultsets` (
  `resultsetid` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`resultsetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsurveyresultsets
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsurveys`
-- ----------------------------
DROP TABLE IF EXISTS `tblsurveys`;
CREATE TABLE `tblsurveys` (
  `surveyid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `slug` mediumtext NOT NULL,
  `description` text NOT NULL,
  `viewdescription` text,
  `datecreated` datetime NOT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT '0',
  `onlyforloggedin` int(11) DEFAULT '0',
  `fromname` varchar(100) DEFAULT NULL,
  `iprestrict` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`surveyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsurveys
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsurveysemailsendcron`
-- ----------------------------
DROP TABLE IF EXISTS `tblsurveysemailsendcron`;
CREATE TABLE `tblsurveysemailsendcron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `emailid` int(11) DEFAULT NULL,
  `listid` varchar(11) DEFAULT NULL,
  `log_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsurveysemailsendcron
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsurveysendlog`
-- ----------------------------
DROP TABLE IF EXISTS `tblsurveysendlog`;
CREATE TABLE `tblsurveysendlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surveyid` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `iscronfinished` int(11) NOT NULL DEFAULT '0',
  `send_to_mail_lists` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblsurveysendlog
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltaggables`
-- ----------------------------
DROP TABLE IF EXISTS `tbltaggables`;
CREATE TABLE `tbltaggables` (
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `tag_order` int(11) NOT NULL DEFAULT '0',
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltaggables
-- ----------------------------
INSERT INTO `tbltaggables` VALUES ('3', 'lead', '1', '1');
INSERT INTO `tbltaggables` VALUES ('3', 'lead', '2', '2');

-- ----------------------------
-- Table structure for `tbltags`
-- ----------------------------
DROP TABLE IF EXISTS `tbltags`;
CREATE TABLE `tbltags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltags
-- ----------------------------
INSERT INTO `tbltags` VALUES ('2', '投资洛杉矶');
INSERT INTO `tbltags` VALUES ('1', '紧急');

-- ----------------------------
-- Table structure for `tbltasks`
-- ----------------------------
DROP TABLE IF EXISTS `tbltasks`;
CREATE TABLE `tbltasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `description` text,
  `priority` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT '0',
  `is_recurring_from` int(11) DEFAULT NULL,
  `cycles` int(11) NOT NULL DEFAULT '0',
  `total_cycles` int(11) NOT NULL DEFAULT '0',
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `billable` tinyint(1) NOT NULL DEFAULT '0',
  `billed` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `milestone` int(11) DEFAULT '0',
  `kanban_order` int(11) NOT NULL DEFAULT '0',
  `milestone_order` int(11) NOT NULL DEFAULT '0',
  `visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `deadline_notified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltasks
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltaskstimers`
-- ----------------------------
DROP TABLE IF EXISTS `tbltaskstimers`;
CREATE TABLE `tbltaskstimers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltaskstimers
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltasks_checklist_templates`
-- ----------------------------
DROP TABLE IF EXISTS `tbltasks_checklist_templates`;
CREATE TABLE `tbltasks_checklist_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltasks_checklist_templates
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltask_assigned`
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_assigned`;
CREATE TABLE `tbltask_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `assigned_from` int(11) NOT NULL DEFAULT '0',
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltask_assigned
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltask_checklist_items`
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_checklist_items`;
CREATE TABLE `tbltask_checklist_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `description` text NOT NULL,
  `finished` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `finished_from` int(11) DEFAULT '0',
  `list_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltask_checklist_items
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltask_comments`
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_comments`;
CREATE TABLE `tbltask_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `taskid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltask_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltask_followers`
-- ----------------------------
DROP TABLE IF EXISTS `tbltask_followers`;
CREATE TABLE `tbltask_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltask_followers
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltaxes`
-- ----------------------------
DROP TABLE IF EXISTS `tbltaxes`;
CREATE TABLE `tbltaxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltaxes
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltemplates`
-- ----------------------------
DROP TABLE IF EXISTS `tbltemplates`;
CREATE TABLE `tbltemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltemplates
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltickets`
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets`;
CREATE TABLE `tbltickets` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT,
  `adminreplying` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL DEFAULT '0',
  `email` text,
  `name` text,
  `department` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `service` int(11) DEFAULT NULL,
  `ticketkey` varchar(32) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text,
  `admin` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `lastreply` datetime DEFAULT NULL,
  `clientread` int(11) NOT NULL DEFAULT '0',
  `adminread` int(11) NOT NULL DEFAULT '0',
  `assigned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltickets
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltickets_pipe_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_pipe_log`;
CREATE TABLE `tbltickets_pipe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` mediumtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltickets_pipe_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltickets_predefined_replies`
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_predefined_replies`;
CREATE TABLE `tbltickets_predefined_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltickets_predefined_replies
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltickets_priorities`
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_priorities`;
CREATE TABLE `tbltickets_priorities` (
  `priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltickets_priorities
-- ----------------------------
INSERT INTO `tbltickets_priorities` VALUES ('1', 'Low');
INSERT INTO `tbltickets_priorities` VALUES ('2', 'Medium');
INSERT INTO `tbltickets_priorities` VALUES ('3', 'High');

-- ----------------------------
-- Table structure for `tbltickets_status`
-- ----------------------------
DROP TABLE IF EXISTS `tbltickets_status`;
CREATE TABLE `tbltickets_status` (
  `ticketstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isdefault` int(11) NOT NULL DEFAULT '0',
  `statuscolor` varchar(7) DEFAULT NULL,
  `statusorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltickets_status
-- ----------------------------
INSERT INTO `tbltickets_status` VALUES ('1', 'Open', '1', '#ff2d42', '1');
INSERT INTO `tbltickets_status` VALUES ('2', 'In progress', '1', '#84c529', '2');
INSERT INTO `tbltickets_status` VALUES ('3', 'Answered', '1', '#0000ff', '3');
INSERT INTO `tbltickets_status` VALUES ('4', 'On Hold', '1', '#c0c0c0', '4');
INSERT INTO `tbltickets_status` VALUES ('5', 'Closed', '1', '#03a9f4', '5');

-- ----------------------------
-- Table structure for `tblticket_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `tblticket_attachments`;
CREATE TABLE `tblticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `replyid` int(11) DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblticket_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for `tblticket_replies`
-- ----------------------------
DROP TABLE IF EXISTS `tblticket_replies`;
CREATE TABLE `tblticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `contactid` int(11) NOT NULL DEFAULT '0',
  `name` text,
  `email` text,
  `date` datetime NOT NULL,
  `message` text,
  `attachment` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblticket_replies
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltodos`
-- ----------------------------
DROP TABLE IF EXISTS `tbltodos`;
CREATE TABLE `tbltodos` (
  `todoid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltodos
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltracked_mails`
-- ----------------------------
DROP TABLE IF EXISTS `tbltracked_mails`;
CREATE TABLE `tbltracked_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0',
  `date_opened` datetime DEFAULT NULL,
  `subject` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltracked_mails
-- ----------------------------

-- ----------------------------
-- Table structure for `tbltwocheckout_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbltwocheckout_log`;
CREATE TABLE `tbltwocheckout_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `tbltwocheckout_log_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbltwocheckout_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tbluser_auto_login`
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_auto_login`;
CREATE TABLE `tbluser_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbluser_auto_login
-- ----------------------------

-- ----------------------------
-- Table structure for `tbluser_meta`
-- ----------------------------
DROP TABLE IF EXISTS `tbluser_meta`;
CREATE TABLE `tbluser_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `client_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `contact_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(191) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbluser_meta
-- ----------------------------
INSERT INTO `tbluser_meta` VALUES ('4', '5', '0', '0', 'recent_searches', '[\"clark\",\"ca\",\"c\'la\",\"\\u6d1b\\u6749\\u77f6\",\"6474050855\"]');

-- ----------------------------
-- Table structure for `tblvault`
-- ----------------------------
DROP TABLE IF EXISTS `tblvault`;
CREATE TABLE `tblvault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `server_address` varchar(191) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `share_in_projects` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblvault
-- ----------------------------

-- ----------------------------
-- Table structure for `tblviews_tracking`
-- ----------------------------
DROP TABLE IF EXISTS `tblviews_tracking`;
CREATE TABLE `tblviews_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblviews_tracking
-- ----------------------------

-- ----------------------------
-- Table structure for `tblweb_to_lead`
-- ----------------------------
DROP TABLE IF EXISTS `tblweb_to_lead`;
CREATE TABLE `tblweb_to_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `notify_lead_imported` int(11) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `responsible` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext,
  `recaptcha` int(11) NOT NULL DEFAULT '0',
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `success_submit_msg` text,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) NOT NULL DEFAULT '1',
  `mark_public` int(11) NOT NULL DEFAULT '0',
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tblweb_to_lead
-- ----------------------------
