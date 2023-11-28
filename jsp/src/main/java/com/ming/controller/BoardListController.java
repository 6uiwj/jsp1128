package com.ming.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("검색어" + request.getParameter("searchWord"));
		System.out.println("검색필드" + request.getParameter("searchField"));

		Criteria cri = new Criteria(request.getParameter("pageNo")
					, request.getParameter("amount")
					, request.getParameter("searchField")
					, request.getParameter("searchWord"));
		
		System.out.println("boardListController 파일: "+ cri.getPageNo());
		
		
		//페이지 블럭을 생성하기 위해 필요한 정보를 저장
		BoardDao dao = new BoardDao();
		List<BoardDto> list = dao.getList(cri);
		request.setAttribute("list",list);
		
		//페이지 조회에 필요한 정보를 수집합니다.
		//pageNo : 요청 페이지 번호
		//amount : 페이지당 게시물의 수
		//리스트 조회 후 리퀘스트 영역에 저장
		//cri: 요청 페이지 번호, 페이지다 게시물 수
		
		//페이지 블럭을 생성하기 위해 필요한 정보를 저장
		//조회조건을 세팅하지 않으면 조회되는 게시글의 건수와 페이지블럭이 다르게 표시될 수 있다.
		int totalCnt = dao.getTotalCnt(cri);
		PageDto pageDto = new PageDto(totalCnt, cri);
		request.setAttribute("pageDto", pageDto);
		dao.close();

		//페이지 전환 forward방식으로 전환하므로 request영역이 공유됨
		request.getRequestDispatcher("/06session/servletEx/board.jsp").forward(request, response);
	}


}
