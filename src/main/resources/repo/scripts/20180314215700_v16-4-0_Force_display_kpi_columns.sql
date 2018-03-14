-- // v17-0-0_Add_scriptable_custom_attribute
-- Migration SQL that makes the change goes here.

ALTER TABLE kpi_value_definition ADD COLUMN is_displayed TINYINT(1) DEFAULT 0;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE kpi_value_definition DROP COLUMN is_displayed;
