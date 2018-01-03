-- // v17-0-0_Add_scriptable_custom_attribute
-- Migration SQL that makes the change goes here.

CREATE TABLE script_custom_attribute_value (
  id                              BIGINT(20) NOT NULL,
  custom_attribute_definition_id  BIGINT(20) NOT NULL,
  object_type                     VARCHAR(256) NOT NULL,
  object_id                       BIGINT(20) NOT NULL,
  value                           BLOB,
  deleted                         TINYINT(1),
  last_update                     DATETIME,
  PRIMARY KEY (id)
);

ALTER TABLE script_custom_attribute_value
ADD KEY scav_cad_idx (custom_attribute_definition_id),
ADD CONSTRAINT scav_cad_fk FOREIGN KEY (custom_attribute_definition_id) REFERENCES custom_attribute_definition (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE script_custom_attribute_value DROP FOREIGN KEY scav_cad_fk;
DROP INDEX scav_cad_idx ON script_custom_attribute_value;
DROP TABLE script_custom_attribute_value;
