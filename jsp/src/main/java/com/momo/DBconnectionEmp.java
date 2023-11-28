package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnectionEmp {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TESTUSER";
		String pw = "1234";
		
		Connection con = null;
		//정적 쿼리 실행객체
		Statement stmt = null;
		ResultSet rs = null;
		/*
		 * 1. 드라이버 로딩
		 * 		DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		 * 
		 * 2. 커넥션 객체를 생성
		 * */
		try {
			//드라이버가 있는지 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");						
			//System.out.println("오라클드라이버 확인");
			//Connection 및 error처리
			con = DriverManager.getConnection(url, id, pw);
			
			int empId = 210;
			
			//3. 쿼리 문장 준비
			String sql = "SELECT EMP_ID, EMP_NAME, EMP_NO"+
							" FROM EMPLOYEE where emp_id > " + empId;
			
			//4. 쿼리 문장 실행(connection으로부터 createStatment객체 생성)
			stmt = con.createStatement();
			//stmt.executeQuery(sql)
			//	select를 실행할 경우 ResultSet을 반환합니다.
			//stmt.executeUpdate(sql)
			//	uqdqte, insert, delete의 경우 int 타입을 반환합니다.
			//	->실행결과 몇 건이 처리되었는지
			//실행한 쿼리문 장을 resultset에 담는다.
			rs = stmt.executeQuery(sql);
			//stmt.executeUpdate(sql);
			//System.out.println(con);
			//rs.getString(숫자 또는 결과집합의 컬럼명)
			//숫자를 입력할 경우 1부터
			//System.out.println(rs.getString(1));
			while(rs.next()) {
			System.out.print(rs.getString("emp_id")+ " ");
			System.out.print(rs.getString("emp_name")+ " ");
			System.out.println(rs.getString("emp_no"));

			//System.out.print(rs.getString(1)+ " ");
			//System.out.print(rs.getString(2)+ " ");
			//System.out.println(rs.getString(3));

			//또는 rs.getString("SYSDATE");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이러 로딩실패 - 라이브러리를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connetction 객체 생성 실패");
			e.printStackTrace();
		} finally {
			try {
				//자원 닫기 - null 체크 포함, 순서대로 닫기
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
				
				 
			} catch(Exception e) {
				System.out.println("자원 해제 중 예외사항이 발생하였습니다.");
				e.printStackTrace();
			}
		}

	}
}

