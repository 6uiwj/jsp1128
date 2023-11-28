package com.momo;

import java.sql.SQLException;

import com.momo.common.DBConnection;

//메인 메서드를 이용하여 데이터를 만들어 줄 것이기 때문에 DBConnection 상속
//DBConnPool은 서버를 이용하기 때문에 메인 이용 불가
/**
 * JDBC를 활용한 테스트 데이터 생성
 * board테이블에 테스트 데이터를 생성합니다.
 */
public class MakeTestData extends DBConnection{ 
	
	/**
	 * board 테이블에 데이터를 삽입
	 */
	public void insert() {
		String sql = "insert into board values \r\n"
				+ "(seq_board_num.nextval,'제목'||seq_board_num.nextval, \r\n"
				+ "'내용'||seq_board_num.nextval,'test',sysdate,0)";
		try {
			pstmt = con.prepareStatement(sql);
			//파라미터 세팅
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 입력 되었습니다.");
			//입력 실행
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/**
	 * 자바 프로그램 실행
	 * @param args
	 */
	public static void main(String[] args) {
		MakeTestData d = new MakeTestData();
		for(int i=0; i<100; i++) {
			d.insert();		
		}
		//자원 반납
		d.close();
	}
}
