package com.yuu.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public Connection getDBConnection() {
		Connection conn = null;
		final String url = "jdbc:mysql://localhost:3306/yuubook";
		final String user = "root";
		final String password = "123456";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("Database connected!");
			return conn;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		DBConnection db = new DBConnection();
		db.getDBConnection();
	}
}
