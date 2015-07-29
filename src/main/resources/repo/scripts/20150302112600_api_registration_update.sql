-- -----------------------------------------------------
-- Table `api_registration`
-- -----------------------------------------------------
ALTER TABLE `api_registration` CHANGE COLUMN `name` `name` VARCHAR(64) NOT NULL;
ALTER TABLE `api_registration` ADD COLUMN `description` VARCHAR(1500) NOT NULL;

--//@UNDO

ALTER TABLE `api_registration` CHANGE COLUMN `name` `name` VARCHAR(256) NOT NULL;
ALTER TABLE `api_registration` DROP COLUMN `description` , CHANGE COLUMN `name` `name` VARCHAR(256) NOT NULL  ;

