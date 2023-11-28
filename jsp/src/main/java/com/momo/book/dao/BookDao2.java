package com.momo.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.Criteria;
import com.momo.lib.dto.BookDto;

/**
 * DB에 접근하여 
 */
public class BookDao2 extends DBConnPool{
	
	public List<BookDto> getList(Criteria cri){
		List<BookDto> list = new ArrayList<>();
		String where = "";
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
					where = " where "+ cri.getSearchField()
						+ " like '%"+cri.getSearchWord()+"%'";
				}
		
		String sql = "select *\r\n"
				+ "            from book\r\n"
				+ "            --최신 게시물을 먼저 조회하기 위해 정렬\r\n"
				+ where
				+ "            order by no desc";
		
		try {
			//pagingQuery를 이용시 페이지 처리를 위한 파라미터 세팅을 해주어야 합니다.
			sql = pagingQuery(sql);
			System.out.println("sql\n"+sql);
			System.out.println("시작넘버: " +cri.getStartNum());
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			 
			rs= pstmt.executeQuery();
			
			//결과집합으로부터 도서의 정보를 조회 후 dto에 저장 후 리스트에 담아줍니다.
			while(rs.next()) {
				String no = rs.getString("no");
				String title = rs.getString("title");
				String author = rs.getString("author");	
				String rentYn = rs.getString("rentYn");
				
				BookDto dto = new BookDto(no, title, author,rentYn);
				list.add(dto);
			}
			System.out.println("BookDao - 자알 담았다");
			
		} catch (SQLException e) {
			System.out.println("BookDao - DB에서 쿼리 못 받아왔다...");
			e.printStackTrace();
		}
				
		return list;
	}
	
	
	/**
	 * 도서의 상세정보를 조회 후 반환합니다.
	 * @param no
	 * @return 도서정보(BookDto)
	 */
	public BookDto view(String no){
		BookDto dto = new BookDto();
		String sql = "select * from book where no = ?";
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, no);	
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setRentYn(rs.getString(3));
				dto.setAuthor(rs.getString(4));
				System.out.println("쿼리 잘 가져왔어");
			}
			
		} catch (SQLException e) {
			System.out.println("BookDao - 쿼리 못가져왔어");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * 도서의 총 건수를 조회합니다.
	 * @return
	 */
	public int getTotalCnt(Criteria cri) {
		int res = 0;
		String where = "";
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
					where = "where "+cri.getSearchField()
						+ " like '%"+cri.getSearchWord()+"%'";
				}
		String sql = "select count(*) from book" + where;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}


	public int regBook(BookDto dto) {
		String sql = "insert into book (no, title, rentyn, author)\r\n"
				+ "    values (seq_book_no1.nextval, ? , 'N', ?)";
		int res=0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getAuthor());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	

}
