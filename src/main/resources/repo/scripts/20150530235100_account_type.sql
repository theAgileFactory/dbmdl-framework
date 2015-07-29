--AccountType

ALTER TABLE `principal` ADD COLUMN `account_type` VARCHAR(64) NOT NULL DEFAULT 'STANDARD';
ALTER TABLE `system_level_role_type` ADD COLUMN `account_type_defaults` VARCHAR(1500) NULL;

--//@UNDO

ALTER TABLE `principal` DROP COLUMN `account_type`;
ALTER TABLE `system_level_role_type` DROP COLUMN `account_type_defaults`;

