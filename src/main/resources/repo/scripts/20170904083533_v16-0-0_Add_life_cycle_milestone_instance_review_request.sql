-- // v16-0-0_Add_life_cycle_milestone_instance_review_request
-- Migration SQL that makes the change goes here.

CREATE TABLE `life_cycle_milestone_review_request` (
  `portfolio_entry_id` BIGINT(20) NOT NULL,
  `life_cycle_milestone_id` BIGINT(20) NOT NULL,
  `process_transition_request_id` BIGINT(20) NOT NULL,
  `approval_date` DATETIME NOT NULL,
  PRIMARY KEY (portfolio_entry_id, life_cycle_milestone_id, process_transition_request_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- //@UNDO
-- SQL to undo the change goes here.

DROP TABLE life_cycle_milestone_review_request;
