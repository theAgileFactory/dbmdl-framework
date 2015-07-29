--API authentication and authorization mode preference

DELETE FROM `custom_attribute_definition` WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE' LIMIT 1;

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'API_AUTHZ_MODE_PREFERENCE',
'1'
);
INSERT INTO `custom_attribute_definition`(`object_type`,`order`,`attribute_type`,`uuid`,`name`,`description`,`last_update`)
VALUES('java.lang.Object',0,'SINGLE_ITEM','API_AUTHZ_MODE_PREFERENCE','preference.api_authz_mode_preference.name','preference.api_authz_mode_preference.description', NOW());
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('APPLICATION_KEY_ONLY', (SELECT id FROM custom_attribute_definition WHERE uuid = 'API_AUTHZ_MODE_PREFERENCE'), NOW(), 1);
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('SIGNATURE', (SELECT id FROM custom_attribute_definition WHERE uuid = 'API_AUTHZ_MODE_PREFERENCE'), NOW(), 2);

--//@UNDO

DELETE FROM `preference` WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_item_option` WHERE custom_attribute_definition_id=(SELECT id FROM custom_attribute_definition WHERE uuid = 'API_AUTHZ_MODE_PREFERENCE');

DELETE FROM `custom_attribute_definition` WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE' LIMIT 1;