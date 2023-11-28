package com.momo.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnPool() {
		 
		try {
			//JNDI를 통해 커넥션풀 얻어오기(Java Naming and Directory Interface)
			//서버 과부하 방지를 위해 conn을 그때그떄 가져오지 않고 connection pool에 담아 뒀다가 필요할 때 꺼내 옴
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
			//커넥션풀을 통해 연결 객체 얻고, 멤버변수 con에 담기
			con = ds.getConnection();
			System.out.println("JNDI를 통해 커넥션풀에서 커넥션 얻어오기");
		} catch (NamingException e) {
			System.out.println("================DBConnPool NamingException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("================DBConnPool SQLException");
			e.printStackTrace();
		}
	
	}	public void close() {
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
	/**
	 * 페이지쿼리를 생성해주는 메서드
	 * @param sql
	 * @return
	 */
	public String pagingQuery(String sql) {
		String before = "select * from (\r\n"
				+ "    select t.*, ROWNUM rnum from (";
		
		String after="    )t ) where rnum between ? and ?";
		return before + sql + after;
	}
	
	
	
}
