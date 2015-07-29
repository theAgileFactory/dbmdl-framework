--preferences to overload the base configurations

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'PUBLIC_URL_PREFERENCE',
'1'
);
INSERT INTO `custom_attribute_definition`
(`object_type`,
`attribute_type`,
`uuid`,
`name`,
`description`,
`last_update`)
VALUES
(
'java.lang.Object',
'STRING',
'PUBLIC_URL_PREFERENCE',
'',
'',
NOW()
);

--//@UNDO

DELETE FROM `custom_attribute_definition` WHERE `uuid`='PUBLIC_URL_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='PUBLIC_URL_PREFERENCE' LIMIT 1;

