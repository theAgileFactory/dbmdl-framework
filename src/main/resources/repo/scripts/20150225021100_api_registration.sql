-- -----------------------------------------------------
-- Table `api_registration`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `api_registration` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(256) NOT NULL ,
  `application_key` VARCHAR(1500) NOT NULL ,
  `shared_secret` VARCHAR(1500) NOT NULL ,
  `api_authorization` MEDIUMBLOB NOT NULL ,
  `deleted` tinyint(1) DEFAULT '0',
  `last_update` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

--//@UNDO

DROP TABLE `api_registration`;