--the current perspective preference

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'CURRENT_PERSPECTIVE_PREFERENCE',
'0'
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
'models.framework_models.account.Principal',
'',
'STRING',
'CURRENT_PERSPECTIVE_PREFERENCE',
'The current perspective preference',
'',
NOW()
);

--//@UNDO

DELETE FROM `custom_attribute_definition` WHERE `uuid`='CURRENT_PERSPECTIVE_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='CURRENT_PERSPECTIVE_PREFERENCE' LIMIT 1;





