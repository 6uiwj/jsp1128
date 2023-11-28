package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.momo.dto.Job;

public class DBConnectionSelf {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TESTUSER";
		String pw = "1234";
		
		Connection con = null; 
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Job> list = new ArrayList<>();
		//1.드라이버 로딩
		try {
			//1.라이브러리 확인 (예외처리 필요)
			//드라이버가 있는지 확인 후 예외처리하기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("오라클 드라이버 확인");
			
			//2.커넥션 객체를 생성
			//데이터베이스에 연결하는 코드	(예외처리 필요)		
			//아래 con  객체 생성에 실패할 경우 예외처리할 부분 입력
			con = DriverManager.getConnection(url, id, pw);
			//3.쿼리 문장 준비
			String sql = "SELECT * FROM JOB";
			//SQL쿼리를 DB로 전송하고 실행하기 위한 객체 생성
			stmt = con.createStatement();
			
			//쿼리문을 실행하고 resultSet에 담기
			rs= stmt.executeQuery(sql);
			
			//3.쿼리 문장 준비
			//while문으로 출력
			while(rs.next()) {
				Job job = new Job();
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				System.out.print(rs.getString(1)+ " ");
				System.out.print(rs.getString(2));
				System.out.println();
				
				list.add(job);
				
			}
			
			
		} catch (ClassNotFoundException e) {
			//class.forName을 찾을 수 없을 때 어떻게 처리해줄 건지 입력
			System.out.println("드라이버 로딩 실패 - 라이브러리를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			//con객체 예외처리 부분
			System.out.println("Connection 객체 생성 실패");
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
	

