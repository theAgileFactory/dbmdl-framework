--table to save filter configuration

CREATE TABLE `filter_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `principal_id` bigint(20) NOT NULL,
  `data_type` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` longblob NOT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `shared_key` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_filter_configuration_1_idx` (`principal_id`),
  KEY `index3` (`data_type`(255)),
  CONSTRAINT `fk_filter_configuration_1` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--//@UNDO

drop table `filter_configuration`;


