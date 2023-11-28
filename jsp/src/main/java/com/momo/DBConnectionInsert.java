package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionInsert {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TESTUSER";
		String pw = "1234";
		
		Connection conn = null;
		try {
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			//3. 쿼리 생성
			String sql = "insert into job values(?,?)";
			
			//4.pstmt 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "99");
			pstmt.setString(2, "값99");
			
			//5. 인파라미터 세팅
			//쿼리상에 ?로 작성된 부분을 값으로 변경
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 생성 되었습니다.");

			
		} catch (ClassNotFoundException e) {
			//경로에 드라이브가 없는 경우 예외처리
			System.out.println("라이브러리를 확인해주세요.");
			e.printStackTrace();
			
			//sql 관련 오류 처리
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
}
