--authentication mode preference

DELETE FROM `custom_attribute_definition` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'AUTHENTICATION_MODE_PREFERENCE',
'1'
);
INSERT INTO `custom_attribute_definition`(`object_type`,`order`,`attribute_type`,`uuid`,`name`,`description`,`last_update`)
VALUES('java.lang.Object',0,'SINGLE_ITEM','AUTHENTICATION_MODE_PREFERENCE','AUTHENTICATION_MODE_PREFERENCE','The level of complexity of the initiative', NOW());
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('CAS_MASTER', (SELECT id FROM custom_attribute_definition WHERE uuid = 'AUTHENTICATION_MODE_PREFERENCE'), NOW(), 1);
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('CAS_SLAVE', (SELECT id FROM custom_attribute_definition WHERE uuid = 'AUTHENTICATION_MODE_PREFERENCE'), NOW(), 2);
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('STANDALONE', (SELECT id FROM custom_attribute_definition WHERE uuid = 'AUTHENTICATION_MODE_PREFERENCE'), NOW(), 3);
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('FEDERATED', (SELECT id FROM custom_attribute_definition WHERE uuid = 'AUTHENTICATION_MODE_PREFERENCE'), NOW(), 4);

--//@UNDO

DELETE FROM `preference` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_item_option` WHERE custom_attribute_definition_id=(SELECT id FROM custom_attribute_definition WHERE uuid = 'AUTHENTICATION_MODE_PREFERENCE');

DELETE FROM `custom_attribute_definition` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;