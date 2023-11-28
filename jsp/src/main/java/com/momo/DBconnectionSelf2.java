package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnectionSelf2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin@localhost:1521:orcl";
		String id = "TESTUSER";
		String pw = "1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			DriverManager.getConnection(url, id, pw);
			String sql = "SELECT * FROM JOB";
			DriverManager.getConnection(url, id, pw).createStatement();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
