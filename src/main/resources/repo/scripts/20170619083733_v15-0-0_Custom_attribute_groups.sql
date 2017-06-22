-- // v15-0-0 Custom attribute groups
-- Migration SQL that makes the change goes here.

CREATE TABLE `custom_attribute_group` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `object_type` VARCHAR(256),
    `order` INT(5),
    `name` VARCHAR(64) NOT NULL,
    `label` VARCHAR(64) NOT NULL,
    `last_update` DATETIME,
    `deleted` TINYINT(1),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE custom_attribute_definition
    ADD COLUMN `custom_attribute_group_id` BIGINT(20) AFTER object_type,
    ADD KEY fk_custom_attribute_definition_has_group_idx (custom_attribute_group_id),
    ADD CONSTRAINT fk_custom_attribute_definition_has_group FOREIGN KEY (custom_attribute_group_id) REFERENCES custom_attribute_group (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE custom_attribute_definition DROP FOREIGN KEY fk_custom_attribute_definition_has_group;
DROP INDEX fk_custom_attribute_definition_has_group_idx ON custom_attribute_definition;
ALTER TABLE custom_attribute_definition DROP custom_attribute_group_id;

DROP TABLE custom_attribute_group;