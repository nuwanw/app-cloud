--
--  Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
--
--    WSO2 Inc. licenses this file to you under the Apache License,
--    Version 2.0 (the "License"); you may not use this file except
--    in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing,
--    software distributed under the License is distributed on an
--    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
--    KIND, either express or implied.  See the License for the
--    specific language governing permissions and limitations
--    under the License.
--

ALTER TABLE AC_APPLICATION DROP FOREIGN KEY fk_Application_CloudType1;
ALTER TABLE AC_APPLICATION MODIFY COLUMN cloud_id VARCHAR(50) NOT NULL;
UPDATE AC_APPLICATION set cloud_id = 'app_cloud';

ALTER TABLE AC_SUBSCRIPTION_PLANS DROP FOREIGN KEY fk_SubscriptionPlans_CloudType1;
ALTER TABLE AC_SUBSCRIPTION_PLANS MODIFY COLUMN cloud_id VARCHAR(50) NOT NULL;
UPDATE AC_SUBSCRIPTION_PLANS set CLOUD_ID = 'app_cloud' WHERE PLAN_ID = 1;
UPDATE AC_SUBSCRIPTION_PLANS set CLOUD_ID = 'app_cloud' WHERE PLAN_ID = 2;
UPDATE AC_SUBSCRIPTION_PLANS set CLOUD_ID = 'integration_cloud' WHERE PLAN_ID = 3;
UPDATE AC_SUBSCRIPTION_PLANS set CLOUD_ID = 'integration_cloud' WHERE PLAN_ID = 4;

ALTER TABLE AC_WHITE_LISTED_TENANTS DROP FOREIGN KEY fk_WhiteListedTenants_CloudType1;
ALTER TABLE AC_WHITE_LISTED_TENANTS MODIFY COLUMN cloud_id VARCHAR(50) NOT NULL;
UPDATE AC_WHITE_LISTED_TENANTS set cloud_id = 'app_cloud';

ALTER TABLE AC_CLOUD_APP_TYPE DROP FOREIGN KEY fk_cloud_has_cloudAppType_cloud;
ALTER TABLE AC_CLOUD_APP_TYPE MODIFY COLUMN cloud_id VARCHAR(50) NOT NULL;
UPDATE AC_CLOUD_APP_TYPE set cloud_id = 'app_cloud';

DROP TABLE AC_CLOUD;

INSERT INTO AC_CLOUD_APP_TYPE (`cloud_id`, `app_type_id`) VALUES
('integration_cloud', 1),
('integration_cloud', 2),
('integration_cloud', 3),
('integration_cloud', 4),
('integration_cloud', 5),
('integration_cloud', 6),
('integration_cloud', 7);

CREATE TABLE IF NOT EXISTS AC_TENANT_SUBSCRIPTION (
  `tenant_id` INT NOT NULL,
  `plan` VARCHAR(50) NOT NULL,
  `max_app_count` INT(11) NOT NULL  DEFAULT -1,
  `max_database_count` INT(11) NOT NULL DEFAULT -1,
  `cloud_id` VARCHAR(50) NOT NULL,
  `max_replica_count` INT(11) NOT NULL DEFAULT -1,
  `max_memory` INT(11) NOT NULL DEFAULT -1,
  `start_date`DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  PRIMARY KEY (`tenant_id`, `cloud_id`))
ENGINE = InnoDB;





