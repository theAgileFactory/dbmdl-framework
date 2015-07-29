--preferences for smtp

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_HOST_PREFERENCE',
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
'SMTP_HOST_PREFERENCE',
'preference.smtp_host_preference.name',
'preference.smtp_host_preference.description',
NOW()
);

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_PORT_PREFERENCE',
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
'INTEGER',
'SMTP_PORT_PREFERENCE',
'preference.smtp_port_preference.name',
'preference.smtp_port_preference.description',
NOW()
);

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_SSL_PREFERENCE',
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
'BOOLEAN',
'SMTP_SSL_PREFERENCE',
'preference.smtp_ssl_preference.name',
'preference.smtp_ssl_preference.description',
NOW()
);

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_TLS_PREFERENCE',
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
'BOOLEAN',
'SMTP_TLS_PREFERENCE',
'preference.smtp_tls_preference.name',
'preference.smtp_tls_preference.description',
NOW()
);

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_USER_PREFERENCE',
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
'SMTP_USER_PREFERENCE',
'preference.smtp_user_preference.name',
'preference.smtp_user_preference.description',
NOW()
);

INSERT INTO `preference`
(
`last_update`,
`uuid`,
`system_preference`)
VALUES
(
NOW(),
'SMTP_PASSWORD_PREFERENCE',
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
'SMTP_PASSWORD_PREFERENCE',
'preference.smtp_password_preference.name',
'preference.smtp_password_preference.description',
NOW()
);

--//@UNDO

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_HOST_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_HOST_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_PORT_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_PORT_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_SSL_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_SSL_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_TLS_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_TLS_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_USER_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_USER_PREFERENCE' LIMIT 1;

DELETE FROM `custom_attribute_definition` WHERE `uuid`='SMTP_PASSWORD_PREFERENCE' LIMIT 1;
DELETE FROM `preference` WHERE `uuid`='SMTP_PASSWORD_PREFERENCE' LIMIT 1;


