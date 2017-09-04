-- // 16.0.0_Change_french_locale
-- Migration SQL that makes the change goes here.

ALTER TABLE i18n_messages MODIFY COLUMN language VARCHAR(6) NOT NULL;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE i18n_messages MODIFY COLUMN language VARCHAR(2) NOT NULL;