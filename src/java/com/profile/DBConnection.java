package com.profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    private static final String URL = "jdbc:derby://localhost:1527/StudentProfilesDB";
    private static final String USER = "app";
    private static final String PASSWORD = "app";
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found!");
            e.printStackTrace();
        }
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("Connected to database successfully!");
        return conn;
    }
}