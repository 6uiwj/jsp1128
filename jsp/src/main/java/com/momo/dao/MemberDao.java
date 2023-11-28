package com.momo.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool{
	//public MemberDto login(MemberDto member) {
	public MemberDto login(String id, String pass) {
		MemberDto memberDto = new MemberDto();
		String sql = "select * from member \r\n"
				+ "    where id= ? and pass= ?";
		
		//입력받은 사용자 정보를 DB로부터 조회
		try {
			pstmt = con.prepareStatement(sql);
			
			//파라미터 세팅
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//로그인 성공
				memberDto.setId(rs.getString(1));
				memberDto.setName(rs.getString(3));
				memberDto.setRegidate(rs.getString(4));
				
				//사용자 정보를 Dto에 담아서 반환
				System.out.println("memberDto에 잘 담았어요~");
				return memberDto;
				
			} else {
				System.out.println("MemberDao 에서 로그인 실패했어요~");
				//로그인 실패
				return null;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		

	}
	//register.jsp
	//	public int join(String id, String pass, String name, String email) {
	public int join(MemberDto dto) {
		String sql = "insert into member (id, pass, name, regidate, email)\r\n"
				+ "    values (?, ?, ?, sysdate, ?)";
		int res =0;
		try {
			pstmt = con.prepareStatement(sql);
			//register.jsp 쿼리
			//pstmt.setString(1, id);
			//pstmt.setString(2, pass);
			//pstmt.setString(3, name);
			//pstmt.setString(4, email);
			
			//register2.jsp 쿼리
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			res = pstmt.executeUpdate();
			System.out.println(res+ "건이 삽입되었습니다.");
		} catch (SQLException e) {
			System.out.println("---MemberDao insertMember method Query error");
			e.printStackTrace();
		}
		return res;

	}
}
