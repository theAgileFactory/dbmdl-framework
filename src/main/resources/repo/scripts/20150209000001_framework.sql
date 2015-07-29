SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `mime_type` varchar(256) DEFAULT NULL,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `path` varchar(256) DEFAULT NULL,
  `structured_document_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attachments_structured_document1_idx` (`structured_document_id`),
  KEY `objectIdIndex` (`object_id`,`object_type`),
  CONSTRAINT `fk_attachments_structured_document1` FOREIGN KEY (`structured_document_id`) REFERENCES `structured_document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `boolean_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_boolean_custom_attribute_value_custom_attribute_definiti_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_boolean_custom_attribute_value_custom_attribute_definition1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `credential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(256) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `full_name` varchar(256) NOT NULL,
  `mail` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `failed_login` int(11) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `custom_attribute_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `configuration` blob,
  `order` int(5) DEFAULT '0',
  `attribute_type` varchar(32) NOT NULL,
  `uuid` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `is_displayed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

CREATE TABLE `custom_attribute_item_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(2500) DEFAULT NULL,
  `order` int(5) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_custom_attribute_items_custom_attribute_definition1_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_custom_attribute_items_custom_attribute_definition1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `custom_attribute_multi_item_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(2500) DEFAULT NULL,
  `order` int(5) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_custom_attribute_items_custom_attribute_definition1_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_custom_attribute_items_custom_attribute_definition10` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `date_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_boolean_custom_attribute_value_custom_attribute_definiti_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_boolean_custom_attribute_value_custom_attribute_definition10` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `decimal_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_decimal_custom_attribute_value_custom_attribute_definiti_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_decimal_custom_attribute_value_custom_attribute_definition1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `dynamic_single_item_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` bigint(20) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dynamic_single_item_custom_attribute_value_custom_attrib_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_dynamic_single_item_custom_attribute_value_custom_attribut1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `help_target` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `route` varchar(256) NOT NULL,
  `target` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;

CREATE TABLE `i18n_messages` (
  `key` varchar(256) NOT NULL,
  `language` varchar(2) NOT NULL,
  `value` varchar(1500) NOT NULL,
  PRIMARY KEY (`key`(200),`language`),
  KEY `index_key_value` (`key`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `integer_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_integer_custom_attribute_value_custom_attribute_definiti_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_integer_custom_attribute_value_custom_attribute_definition1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `kpi_color_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `order` int(11) NOT NULL,
  `rule` longtext NOT NULL,
  `css_color` varchar(64) NOT NULL,
  `render_label` varchar(64) DEFAULT NULL,
  `kpi_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kpi_color_rule_1_idx` (`kpi_definition_id`),
  CONSTRAINT `fk_kpi_color_rule_1` FOREIGN KEY (`kpi_definition_id`) REFERENCES `kpi_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

CREATE TABLE `kpi_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `kpi_color_rule_id` bigint(20) DEFAULT NULL,
  `kpi_value_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kpi_data_1_idx` (`kpi_value_definition_id`),
  KEY `fk_kpi_data_2_idx` (`kpi_color_rule_id`),
  KEY `fk_kpi_data_3_idx` (`object_id`),
  KEY `fk_kpi_data_4_idx` (`kpi_value_definition_id`,`object_id`,`timestamp`),
  CONSTRAINT `fk_kpi_data_1` FOREIGN KEY (`kpi_value_definition_id`) REFERENCES `kpi_value_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kpi_data_2` FOREIGN KEY (`kpi_color_rule_id`) REFERENCES `kpi_color_rule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `kpi_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `uid` varchar(64) NOT NULL,
  `css_glyphicon` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_displayed` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL,
  `object_type` varchar(256) NOT NULL,
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `is_standard` tinyint(1) NOT NULL DEFAULT '1',
  `clazz` varchar(256) DEFAULT NULL,
  `scheduler_start_time` varchar(5) DEFAULT NULL,
  `scheduler_frequency` int(11) DEFAULT NULL,
  `scheduler_real_time` tinyint(1) DEFAULT NULL,
  `parameters` longtext,
  `main_kpi_value_definition_id` bigint(20) DEFAULT NULL,
  `additional1kpi_value_definition_id` bigint(20) DEFAULT NULL,
  `additional2kpi_value_definition_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kpi_definition_1_idx` (`main_kpi_value_definition_id`),
  KEY `fk_kpi_definition_2_idx` (`additional1kpi_value_definition_id`),
  KEY `fk_kpi_definition_3_idx` (`additional2kpi_value_definition_id`),
  KEY `fk_kpi_definition_4_idx` (`object_type`),
  CONSTRAINT `fk_kpi_definition_1` FOREIGN KEY (`main_kpi_value_definition_id`) REFERENCES `kpi_value_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kpi_definition_2` FOREIGN KEY (`additional1kpi_value_definition_id`) REFERENCES `kpi_value_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kpi_definition_3` FOREIGN KEY (`additional2kpi_value_definition_id`) REFERENCES `kpi_value_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `kpi_value_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `render_type` varchar(32) NOT NULL,
  `render_pattern` varchar(64) DEFAULT NULL,
  `computation_js_code` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

CREATE TABLE `multi_item_ca_value_has_ca_multi_item_option` (
  `multi_item_custom_attribute_value_id` bigint(20) NOT NULL,
  `custom_attribute_multi_item_option_id` bigint(20) NOT NULL,
  PRIMARY KEY (`multi_item_custom_attribute_value_id`,`custom_attribute_multi_item_option_id`),
  KEY `fk_multi_item_ca_value_has_ca_m_idx` (`custom_attribute_multi_item_option_id`),
  KEY `fk_multi_item_ca_value_has_ca_m_idx1` (`multi_item_custom_attribute_value_id`),
  CONSTRAINT `fk_multi_item_ca_value_has_ca_mul1` FOREIGN KEY (`multi_item_custom_attribute_value_id`) REFERENCES `multi_item_custom_attribute_value` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_multi_item_ca_value_has_ca_mul2` FOREIGN KEY (`custom_attribute_multi_item_option_id`) REFERENCES `custom_attribute_multi_item_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `multi_item_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_multi_ca_value_ca_definiti_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_multi_item_ca_value_ca_definition` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `is_message` tinyint(1) DEFAULT '0',
  `notification_category_id` bigint(20) DEFAULT NULL,
  `title` varchar(64) DEFAULT '',
  `message` varchar(256) NOT NULL,
  `action_link` varchar(256) DEFAULT NULL,
  `principal_id` bigint(20) NOT NULL,
  `sender_principal_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notification_principal1_idx` (`principal_id`),
  KEY `fk_notification_1_idx` (`sender_principal_id`),
  KEY `fk_notification_2_idx` (`notification_category_id`),
  CONSTRAINT `fk_notification_1` FOREIGN KEY (`sender_principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_2` FOREIGN KEY (`notification_category_id`) REFERENCES `notification_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notification_principal1` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `notification_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `bootstrap_glyphicon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_storage` mediumblob,
  `is_autostart` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_definition_id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plugin_configuration_plugin_definition1_idx` (`plugin_definition_id`),
  CONSTRAINT `fk_plugin_configuration_plugin_definition1` FOREIGN KEY (`plugin_definition_id`) REFERENCES `plugin_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_configuration_block` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `configuration_type` varchar(32) NOT NULL,
  `configuration` mediumblob NOT NULL,
  `version` varchar(45) DEFAULT '0',
  `plugin_configuration_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plugin_configuration_block_plugin_configuration1_idx` (`plugin_configuration_id`),
  CONSTRAINT `fk_plugin_configuration_block_plugin_configuration1` FOREIGN KEY (`plugin_configuration_id`) REFERENCES `plugin_configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) NOT NULL,
  `clazz` varchar(256) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_identification_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `internal_id` bigint(20) NOT NULL,
  `external_id` varchar(256) NOT NULL,
  `link_type` varchar(32) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `plugin_configuration_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plugin_identification_link_plugin_configuration1_idx` (`plugin_configuration_id`),
  KEY `indexOnInternalId` (`internal_id`),
  KEY `indexOnExternalId` (`external_id`),
  KEY `fk_plugin_identification_link_1_idx` (`parent_id`),
  CONSTRAINT `fk_plugin_identification_link_1` FOREIGN KEY (`parent_id`) REFERENCES `plugin_identification_link` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plugin_identification_link_plugin_configuration1` FOREIGN KEY (`plugin_configuration_id`) REFERENCES `plugin_configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(64) DEFAULT NULL,
  `event` varchar(32) NOT NULL,
  `data_type` varchar(256) DEFAULT NULL,
  `internal_id` bigint(20) DEFAULT NULL,
  `external_id` varchar(256) DEFAULT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `log_message` varchar(1500) NOT NULL,
  `last_update` datetime NOT NULL,
  `plugin_configuration_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plugin_log_plugin_configuration1_idx` (`plugin_configuration_id`),
  CONSTRAINT `fk_plugin_log_plugin_configuration1` FOREIGN KEY (`plugin_configuration_id`) REFERENCES `plugin_configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_type` varchar(256) NOT NULL,
  `internal_id` bigint(20) NOT NULL,
  `configuration_properties` mediumblob,
  `plugin_configuration_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plugin_registration_plugin_configuration1_idx` (`plugin_configuration_id`),
  CONSTRAINT `fk_plugin_registration_plugin_configuration1` FOREIGN KEY (`plugin_configuration_id`) REFERENCES `plugin_configuration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `preference` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `uuid` varchar(256) NOT NULL,
  `system_preference` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `preference_has_system_permission` (
  `preference_id` bigint(20) NOT NULL,
  `system_permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`preference_id`,`system_permission_id`),
  KEY `fk_preference_has_system_permission_system_permission1_idx` (`system_permission_id`),
  KEY `fk_preference_has_system_permission_preference1_idx` (`preference_id`),
  CONSTRAINT `fk_preference_has_system_permission_preference1` FOREIGN KEY (`preference_id`) REFERENCES `preference` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_has_system_permission_system_permission1` FOREIGN KEY (`system_permission_id`) REFERENCES `system_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `principal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(256) DEFAULT NULL,
  `preferred_language` varchar(2) DEFAULT 'EN',
  `is_active` tinyint(1) DEFAULT '0',
  `is_pending` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `validation_key` varchar(256) DEFAULT NULL,
  `validation_data` varchar(256) DEFAULT NULL,
  `validation_key_creation_date` datetime DEFAULT NULL,
  `is_displayed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `scheduler_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_uuid` varchar(256) NOT NULL,
  `is_running` tinyint(1) DEFAULT '0',
  `transaction_id` varchar(64) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `shortcut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `route` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shortcut_2_idx` (`principal_id`,`route`),
  KEY `fk_shortcut_1_idx` (`principal_id`),
  CONSTRAINT `fk_shortcut_1` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `single_item_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  `value_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_decimal_custom_attribute_value_custom_attribute_definiti_idx` (`custom_attribute_definition_id`),
  KEY `fk_single_item_custom_attribute_value_custom_attribute_item_idx` (`value_id`),
  CONSTRAINT `fk_decimal_custom_attribute_value_custom_attribute_definition10` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_single_item_custom_attribute_value_custom_attribute_item_o1` FOREIGN KEY (`value_id`) REFERENCES `custom_attribute_item_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `string_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_string_custom_attribute_value_custom_attribute_definitio_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_string_custom_attribute_value_custom_attribute_definition1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `structured_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` mediumblob NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `system_level_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_enabled` tinyint(1) DEFAULT '0',
  `system_level_role_type_id` bigint(20) NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_system_level_role_systemLevelRoleType_21` (`system_level_role_type_id`),
  KEY `fk_system_level_role_principal_idx` (`principal_id`),
  CONSTRAINT `fk_system_level_role_systemLevelRoleType_21` FOREIGN KEY (`system_level_role_type_id`) REFERENCES `system_level_role_type` (`id`),
  CONSTRAINT `fk_system_level_role_principal` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `system_level_role_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `selectable` tinyint(1) DEFAULT '1',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `system_level_role_type_has_system_permission` (
  `system_level_role_type_id` bigint(20) NOT NULL,
  `system_permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`system_level_role_type_id`,`system_permission_id`),
  KEY `fk_system_level_role_type_has_system_permission_system_perm_idx` (`system_permission_id`),
  KEY `fk_system_level_role_type_has_system_permission_system_leve_idx` (`system_level_role_type_id`),
  CONSTRAINT `fk_system_level_role_type_has_system_permission_system_level_1` FOREIGN KEY (`system_level_role_type_id`) REFERENCES `system_level_role_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_system_level_role_type_has_system_permission_system_permis1` FOREIGN KEY (`system_permission_id`) REFERENCES `system_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `system_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `selectable` tinyint(1) DEFAULT '1',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

CREATE TABLE `text_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value` blob,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` datetime NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectRef` (`object_type`,`object_id`),
  KEY `fk_text_custom_attribute_value_1_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_text_custom_attribute_value_1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--//@UNDO


