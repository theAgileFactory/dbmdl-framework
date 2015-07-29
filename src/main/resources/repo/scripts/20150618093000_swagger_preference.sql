--preference for swagger (base path)

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SWAGGER_API_BASEPATH_PREFERENCE',
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
'SWAGGER_API_BASEPATH_PREFERENCE',
'',
'',
NOW()
);
--//@UNDO

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SWAGGER_API_BASEPATH_PREFERENCE' LIMIT 1;

DELETE FROM `preference` WHERE `uuid`='SWAGGER_API_BASEPATH_PREFERENCE' LIMIT 1;
