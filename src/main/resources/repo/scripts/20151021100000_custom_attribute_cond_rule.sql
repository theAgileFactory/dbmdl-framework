--add conditional rule filed in custom attribute definition table

ALTER TABLE `custom_attribute_definition` ADD COLUMN `conditional_rule` VARCHAR(1500) NULL DEFAULT NULL  AFTER `is_displayed` ;


--//@UNDO

ALTER TABLE `custom_attribute_definition` DROP COLUMN `conditional_rule` ;



