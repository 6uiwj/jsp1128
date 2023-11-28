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

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/boardRead")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		System.out.println("요청 게시글 번호: "+num);
		
		BoardDao dao = new BoardDao();
		dao.visitcountUp(num);
		//dao.deleteBoard(num);
		
		BoardDto dto = dao.getOne(num);
		request.setAttribute("dto", dto);
		dao.close();
		request.getRequestDispatcher("/06session/ex/boardReadEl.jsp").forward(request, response);
		
	}

	
}
