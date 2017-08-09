-- // v16-0-0_Add_initial_filter_configuration_column
-- Migration SQL that makes the change goes here.

ALTER TABLE filter_configuration ADD COLUMN initial_configuration LONGBLOB;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE filter_configuration DROP COLUMN initial_configuration;
