-- // Refactor filter clear
-- Migration SQL that makes the change goes here.

ALTER TABLE filter_configuration
  DROP COLUMN initial_configuration;

-- //@UNDO
-- SQL to undo the change goes here.

