--API authentication and authorization mode preference

UPDATE `custom_attribute_definition` SET `configuration`='default.value=SIGNATURE' WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE';

--//@UNDO

UPDATE `custom_attribute_definition` SET `configuration`='' WHERE `uuid`='API_AUTHZ_MODE_PREFERENCE';