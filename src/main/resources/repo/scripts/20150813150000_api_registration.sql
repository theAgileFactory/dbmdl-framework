--add a is_displayed flag for the api key

ALTER TABLE `api_registration` ADD COLUMN `is_displayed` TINYINT(1) NOT NULL DEFAULT 1  AFTER `description` ;

--//@UNDO

ALTER TABLE `api_registration` DROP COLUMN `is_displayed` ;






