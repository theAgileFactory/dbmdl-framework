-- -----------------------------------------------------
-- Table `maf`.`workspace`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `workspace` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(256) NOT NULL ,
  `description` VARCHAR(1500) NULL ,
  `is_active` TINYINT(1) NULL DEFAULT '0' ,
  `deleted` TINYINT(1) NULL DEFAULT '0' ,
  `last_update` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `maf`.`workspace_member`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `workspace_member` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `admin` TINYINT(1) NULL DEFAULT '0' ,
  `workspace_id` BIGINT(20) NOT NULL ,
  `principal_id` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_workspace_member_workspace1_idx` (`workspace_id` ASC) ,
  INDEX `fk_workspace_member_principal1_idx` (`principal_id` ASC) ,
  CONSTRAINT `fk_workspace_member_workspace1`
    FOREIGN KEY (`workspace_id` )
    REFERENCES `workspace` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workspace_member_principal1`
    FOREIGN KEY (`principal_id` )
    REFERENCES `principal` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--//@UNDO

DROP TABLE `workspace_member`;
DROP TABLE `workspace`;

