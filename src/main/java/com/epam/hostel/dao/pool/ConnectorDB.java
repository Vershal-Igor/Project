/*
package com.epam.hostel.dao.pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;


class ConnectorDB {
    static Connection getConnection() throws SQLException {
        ResourceBundle resource = ResourceBundle.getBundle("db");
        String url = resource.getString("jdbc.url");
        String user = resource.getString("jdbc.username");
        String pass = resource.getString("jdbc.password");
        return DriverManager.getConnection(url, user, pass);
    }
}
*/
