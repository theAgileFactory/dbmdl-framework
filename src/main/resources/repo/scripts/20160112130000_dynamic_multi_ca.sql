

CREATE TABLE `dynamic_multi_item_custom_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `values` varchar(1500) NOT NULL,
  `last_update` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `object_type` varchar(256) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `custom_attribute_definition_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dynamic_multi_item_custom_attribute_value_custom_attrib_idx` (`custom_attribute_definition_id`),
  CONSTRAINT `fk_dynamic_multi_item_custom_attribute_value_custom_attribut1` FOREIGN KEY (`custom_attribute_definition_id`) REFERENCES `custom_attribute_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--//@UNDO


drop table `dynamic_multi_item_custom_attribute_value`;


