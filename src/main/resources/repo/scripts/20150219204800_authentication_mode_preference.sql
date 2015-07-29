--planning preference

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
'default.value=STANDALONE',
'STRING',
'AUTHENTICATION_MODE_PREFERENCE',
'Stores the authentication mode in use by the server',
'',
NOW()
);

--//@UNDO

DELETE FROM `custom_attribute_definition` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='AUTHENTICATION_MODE_PREFERENCE' LIMIT 1;





