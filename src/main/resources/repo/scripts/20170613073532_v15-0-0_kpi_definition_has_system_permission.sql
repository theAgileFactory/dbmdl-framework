-- // v15.0.0_kpi_has_system_level_role_type
-- Migration SQL that makes the change goes here.

CREATE TABLE `kpi_definition_has_system_permission` (
  `kpi_definition_id` BIGINT(20) NOT NULL,
  `system_permission_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (kpi_definition_id, system_permission_id),
  KEY fk_kpi_definition_has_system_permission_kpi_def_idx (kpi_definition_id),
  KEY fk_kpi_definition_has_system_permission_system_lev_idx (system_permission_id),
  CONSTRAINT fk_kpi_definition_has_system_permission_kpi_def FOREIGN KEY (kpi_definition_id) REFERENCES kpi_definition (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_kpi_definition_has_system_permission_system_lev FOREIGN KEY (system_permission_id) REFERENCES system_permission (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- //@UNDO
-- SQL to undo the change goes here.

DROP TABLE kpi_definition_has_system_permission;