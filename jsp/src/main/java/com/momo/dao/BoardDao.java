package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

//DBConnPool : 톰캣에서 제공해주는 기능을 사용하여 커넥편풀이라는
// 				공간에 커넥션 객체를 미리 생성해놓고 사용하는 객체
// 메인 메서드 사용이 불가능
//톰캣이 실행중일 때만 사용 가능
//만약, main 메서드를 이용해서 테스트를 하고 싶다면 DBConnection으로
//변경해야 함

/**
 * 한건의 게시글을 조회 후 반납합니다.
 * @Return BoardDto
 */
public class BoardDao extends DBConnPool {
	
	public BoardDao(){}
	
	/**
	 * 게시글의 조회수를 1 증가시켜 줍니다.
	 * insert, update, delete의 반환 타입은 int(몇 건이 처리되었는지 반환)
	 */
	
	public int visitcountUp(String num) {
		String sql = "update board\r\n"
				+ "set visitcount = visitcount+1\r\n"
				+ "where num= ?";
		int res=0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;

	}
	
	public int deleteBoard(String num) {
		String sql =  "delete from board where num = ?\r\n"
				+ "";
		int res=0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;

	}
	
	
	public BoardDto getOne(String num) {	
		//null로 해놓고 데이터가 있을 때만 생성
		BoardDto dto = null;
		String sql = "select * from board where num= ?";
			try {
				pstmt  = con.prepareStatement(sql);
				pstmt.setString(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new BoardDto();
					dto.setContent(rs.getString("content"));
					dto.setId(rs.getString("id"));
					dto.setNum(rs.getString("num"));
					dto.setPostdate(rs.getString("postdate"));
					dto.setTitle(rs.getString("title"));
					dto.setVisitcount(rs.getString("visitcount"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto;
	}
	public List<BoardDto> getList(Criteria cri) {
		List<BoardDto> list = new ArrayList<>();
		String where="";
		try {
			//where문장은 검색어와 검색필드에 값이 들어있다면 조건 문장을 생성
			if(!"".equals(cri.getSearchField())
					&& !"".equals(cri.getSearchWord())) {
				where = "where " + cri.getSearchField()
							+" like'%" + cri.getSearchWord() + "%'";
			}
			System.out.println("BoardDao - where : " + where);
			pstmt  = con.prepareStatement("  select * from ( \r\n"
					+ "            select rownum rnum, b.* \r\n"
					+ "            from ( \r\n"
					+ "                select * \r\n"
					+ "                from board \r\n"
					+ where
					+ "                order by num desc\r\n"
					+ "        )b \r\n"
					+ "        )\r\n"
					+ "    where rnum between ? and ?");
			//stmt = con.createStatement();
			//String sql = "select * from board";
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery();
			System.out.println("BoardDao - pstmt" + pstmt );
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getString("postDate"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));

				list.add(dto);
				
			}
			System.out.println("=========="+list);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	/**
	 * 게시글의 총 건수를 조회 후 반환
	 * - 집계함수를 이용하여 게시글의 총 건 수를 구해봅시다.
	 * @return 게시글의 총 건수
	 */
	public int  getTotalCnt(Criteria cri) {
		int res = 0;
		String where="";
		
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField()
						+" like'%" + cri.getSearchWord() + "%'";
		}
		String sql = "select count(*) from board";
		System.out.println("sql : " + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
			System.out.println("총게시물 건수(BoarDao에서 실행)" + res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
}
