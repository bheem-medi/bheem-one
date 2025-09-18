package com.bheemas.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;
import java.io.IOException;

public class DatabaseUtil {
    private static Connection connection = null;
    
    public static Connection getConnection() {
        if (connection != null) {
            return connection;
        } else {
            try {
                // First try to get from environment variables (for Docker)
                String dbUrl = System.getenv("DB_URL");
                String dbUser = System.getenv("DB_USER");
                String dbPassword = System.getenv("DB_PASSWORD");
                
                // If not found in environment, try properties file (for local development)
                if (dbUrl == null || dbUser == null || dbPassword == null) {
                    try {
                        Properties prop = new Properties();
                        InputStream inputStream = DatabaseUtil.class.getClassLoader()
                                .getResourceAsStream("database.properties");
                        
                        if (inputStream != null) {
                            prop.load(inputStream);
                            dbUrl = prop.getProperty("url");
                            dbUser = prop.getProperty("user");
                            dbPassword = prop.getProperty("password");
                        }
                    } catch (IOException e) {
                        System.out.println("database.properties not found, using environment variables");
                    }
                }
                
                // Default values if nothing is configured
                if (dbUrl == null) dbUrl = "jdbc:mysql://localhost:3306/bheemas_food_truck";
                if (dbUser == null) dbUser = "appuser";
                if (dbPassword == null) dbPassword = "apppassword";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                System.out.println("Database connection established to: " + dbUrl);
                
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Database connection failed: " + e.getMessage());
            }
            return connection;
        }
    }
}
