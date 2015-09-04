--preference for notification

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'NOTIFICATION_SENDING_SYSTEM_PREFERENCE',
'1'
);

INSERT INTO `custom_attribute_definition`
(`object_type`,
`configuration`,
`attribute_type`,
`uuid`,
`name`,
`description`,
`last_update`)
VALUES
(
'java.lang.Object',
'default.value=notification.sending_system.internal\nconstraint.required=true',
'SINGLE_ITEM',
'NOTIFICATION_SENDING_SYSTEM_PREFERENCE',
'preference.notification_sending_system_preference.name',
'preference.notification_sending_system_preference.description',
NOW()
);

INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('notification.sending_system.internal', (SELECT id FROM custom_attribute_definition WHERE uuid = 'NOTIFICATION_SENDING_SYSTEM_PREFERENCE'), NOW(), 1);
INSERT INTO `custom_attribute_item_option`(`name`,`custom_attribute_definition_id`,`last_update`,`order`)
VALUES('notification.sending_system.email', (SELECT id FROM custom_attribute_definition WHERE uuid = 'NOTIFICATION_SENDING_SYSTEM_PREFERENCE'), NOW(), 2);

--//@UNDO

DELETE FROM `preference` WHERE `uuid`='NOTIFICATION_SENDING_SYSTEM_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_item_option` WHERE custom_attribute_definition_id=(SELECT id FROM custom_attribute_definition WHERE uuid = 'NOTIFICATION_SENDING_SYSTEM_PREFERENCE');

DELETE FROM `custom_attribute_definition` WHERE `uuid`='NOTIFICATION_SENDING_SYSTEM_PREFERENCE' LIMIT 1;


