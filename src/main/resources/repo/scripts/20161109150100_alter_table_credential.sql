-- // add first and last planned lcmi in pe
-- Migration SQL that makes the change goes here.

ALTER TABLE `credential`
	ADD COLUMN `last_login_date` DATETIME NULL DEFAULT NULL AFTER `last_update`;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE `credential`
DROP COLUMN `last_login_date`;
