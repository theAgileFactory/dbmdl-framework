--Dashboard objects

DROP TABLE IF EXISTS `dashboard_widget`;
DROP TABLE IF EXISTS `dashboard_page`;

-- -----------------------------------------------------
-- Table `dashboard_page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dashboard_page` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `is_home` TINYINT(1) DEFAULT '0',
  `name` VARCHAR(32) NOT NULL ,
  `layout` MEDIUMBLOB,
  `principal_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dashboard_page_principal_idx` (`dashboard_page_id` ASC) ,
  CONSTRAINT `fk_dashboard_page_principal`
    FOREIGN KEY (`principal_id` )
    REFERENCES `principal` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dashboard_widget`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dashboard_widget` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `identifier` VARCHAR(64) NOT NULL ,
  `title` VARCHAR(64) NOT NULL ,
  `color` VARCHAR(32) NOT NULL ,
  `config` MEDIUMBLOB,
  `dashboard_page_id` BIGINT(20) NOT NULL ,
  `plugin_configuration_id` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_dashboard_widget_dashboard_page1_idx` (`dashboard_page_id` ASC) ,
  INDEX `fk_dashboard_widget_plugin_configuration1_idx` (`plugin_configuration_id` ASC) ,
  CONSTRAINT `fk_dashboard_widget_dashboard_page1`
    FOREIGN KEY (`dashboard_page_id` )
    REFERENCES `dashboard_page` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dashboard_widget_plugin_configuration1`
    FOREIGN KEY (`plugin_configuration_id` )
    REFERENCES `plugin_configuration` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--//@UNDO

DROP TABLE `dashboard_widget`;
DROP TABLE `dashboard_page`;
