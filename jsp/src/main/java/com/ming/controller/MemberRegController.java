package com.ming.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

/**
 * Servlet implementation class MemberRegController
 */
@WebServlet("/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		System.err.println(id);
		MemberDao dao = new MemberDao(); 
		dao.join(id, pw, name, email);
		
		request.getRequestDispatcher("/loginRag.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
