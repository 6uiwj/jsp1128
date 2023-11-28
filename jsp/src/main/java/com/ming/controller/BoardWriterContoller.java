package com.ming.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dto.BoardDto;

/**
 * Servlet implementation class BoardWriterContoller
 */
@WebServlet("/boardWriter")
public class BoardWriterContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 체크
		doGet(request, response);
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")!=null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 게시글을 작성할 수 있습니다.')");
			out.print("</script>");
			return;
		}
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
			
		//세션정보 확인
		String id = session.getAttribute("userId").toString();
		BoardDto dto = new BoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		
		

		
	}

}
