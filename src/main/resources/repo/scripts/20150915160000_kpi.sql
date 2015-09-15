--add is trend displayed flag in value definition

ALTER TABLE `kpi_value_definition` ADD COLUMN `is_trend_displayed` TINYINT(1) NOT NULL DEFAULT 1  AFTER `computation_js_code`;

UPDATE `kpi_value_definition` SET `is_trend_displayed` = '0' WHERE `name` LIKE 'kpi.%.additional1.name' OR `name` like 'kpi.%.additional2.name';

--//@UNDO

ALTER TABLE `kpi_value_definition` DROP COLUMN `is_trend_displayed` ;


