package com.momo.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

/*
 * 생성자 - Connection 객체 생성
 */
public class DBConnection {
	//접근 후 연결한 다음 session 연결
	//connection이 null인 경우 오류 발생,
	//DriverManager.getConnection을 연결한 후 변수에 담지 않아서
	//재사용이 불가능하므로 null이 출력
	public Connection con;
	//쿼리 질의를 필요한 객체 생성
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnection() {
		try {
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//DB연결하기 위해 필요한 정보
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "TESTUSER";
			String pw = "1234";
			
			//DB에 연결
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결 성공(기본생성자)");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("connection 객체 생성 실패");
			e.printStackTrace();
		}
	}
	
	public DBConnection(String driver, String url, String id, String pw ) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url,id,pw);
			
			System.out.println("DB 연결 성공(인수 생성자 1)");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
		System.out.println("connction 객체 생성 실패");
			e.printStackTrace();
		}
	}
	
	public DBConnection(ServletContext application) {
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String id = application.getInitParameter("id");
		String pw = application.getInitParameter("pw");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("application 내장객체를 활용한 Conncetion 생성");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 - 라이브러리를 확인해 주세요");
			e.printStackTrace();

		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}

	}
	
	
	//자원 닫아주기(순서대로)
	public void close() {
		try {
			if( rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if (stmt != null ) stmt.close();
			if(con != null ) { con.close(); 
			System.out.println("자원 반납 성공");
			} 
		}
		catch (Exception e) {
			System.out.println("자원 반납 중 예외가 발생하였습니다.");
			e.printStackTrace();
		} 
	}
	
}
