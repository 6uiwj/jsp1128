package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionDelete {
public static void main(String[] args) {
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "TESTUSER";
	String pw = "1234";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, id, pw);
		conn.createStatement();
		String sql = "delete from job where job_code = '99'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int res = pstmt.executeUpdate();
		System.out.println(res + "건 삭제 되었습니다.");
		
	} catch (ClassNotFoundException e) {
		System.out.println("라이브러리를 확인해주세요.");
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}
