--add the patch table which contains the last run patches

CREATE TABLE `patch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apprelease` varchar(32) NOT NULL,
  `run_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--//@UNDO

DROP TABLE `patch`;