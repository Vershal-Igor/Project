package com.epam.hostel.jdbc;


import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/*Просто проверял базу*/

public class DataSource {
    Connection connection = null;
    BasicDataSource bdSource = new BasicDataSource();

    public DataSource() {
        bdSource.setDriverClassName("com.mysql.jdbc.Driver");
        bdSource.setUrl("jdbc:mysql://localhost:3306/hostel");
        bdSource.setUsername("root");
        bdSource.setPassword("ig933l3l3");
    }

    public Connection createConnection() {
        Connection con = null;
        try {
            if (connection != null) {
                System.out.println("Cant create a New Connection");
            } else {
                con = bdSource.getConnection();
                System.out.println("Connection Done successfully");
            }
        } catch (Exception e) {
            System.out.println("Error Occured " + e.toString());
        }
        return con;
    }

    public static void main(String args[]) throws Exception {
        DataSource dsExample = new DataSource();
        Connection con = dsExample.createConnection();
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM user";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            System.out.println("Name- " + rs.getString("name") + ", Role= "
                    + rs.getInt("role") + ", surname= "
                    + rs.getString("surname") + ", password= "
                    + rs.getString("password")+ ", login= "
                    + rs.getString("login")+ ", status= "
                    + rs.getString("status"));
        }
        con.close();
        stmt.close();
        rs.close();
    }
}
