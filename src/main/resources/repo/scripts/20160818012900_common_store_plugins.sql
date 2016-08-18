--Create a data store for the plugins (generic store to share data)

CREATE TABLE `plugin_shared_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `small_data_storage` VARCHAR(1500),
  `big_data_storage` mediumblob,
  `name` varchar(256) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--//@UNDO

DROP TABLE `plugin_shared_record`; 

