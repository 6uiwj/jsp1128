package com.momo.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao2;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;
import com.momo.lib.dto.BookDto;

/**
 * Servlet implementation class BookListController2
 */
@WebServlet("/book/list")
public class BookListController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자의 요청 정보 수집
		Criteria cri = new Criteria(
						request.getParameter("pageNo") //요청 페이지 번호(기본값 : 1)
						,request.getParameter("amount")
						,request.getParameter("searchField") //요청 페이지 번호(기본값:1)
						,request.getParameter("searchWord") //페이지당 보여줄 게시물의 수 (기본값 : 10)
						); //페이지당 보여줄 게시물의 수 (기본값: 10)

		System.out.println(cri);
		
		//도서 목록 조회 후 request영역에 담아줍니다. -> 화면에 출력하기 위해서
		BookDao2 dao = new BookDao2();
		List<BookDto> list = dao.getList(cri);
		request.setAttribute("list", list);
		
		//페이지 블럭을 생성하기 위한 객체
		int totalCnt = dao.getTotalCnt(cri);

		PageDto pageDto = new PageDto(totalCnt,cri);	
		
		request.setAttribute("pageDto", pageDto);
		dao.close();
		
		System.out.println("BookListController2 - Dao에서 리퀘스트영역으로 리스트 잘 담아왔따");
		//JSP 화면으로 전환(forward 방식 <- request영역을 공유하고 싶기 때문에)
		request.getRequestDispatcher("/book/list.jsp").forward(request, response);
	}


}
