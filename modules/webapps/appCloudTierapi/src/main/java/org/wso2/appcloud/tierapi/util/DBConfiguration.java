/*
* Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package org.wso2.appcloud.tierapi.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.appcloud.core.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConfiguration {

    private static final Log log = LogFactory.getLog(DBConfiguration.class);

    public Connection getConnection() throws SQLException {
        try {
            return DBUtil.getDBConnection();
        } catch (Exception e) {
            String msg = "Error while connecting to Data Base ";
            log.error(msg, e);
            throw new SQLException(msg, e);
        }
    }
}