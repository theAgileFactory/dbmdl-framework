

CREATE TABLE `action_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `principal_id` bigint(20) NOT NULL,
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `action` varchar(64) NOT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_action_log_1_idx` (`principal_id`),
  CONSTRAINT `fk_action_log_1` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--//@UNDO

drop table `action_log`;


