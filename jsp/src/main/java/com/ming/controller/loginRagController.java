package com.ming.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

/**
 * Servlet implementation class loginRagController
 */
@WebServlet("/loginRagController")
public class loginRagController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDao dao = new MemberDao();
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		MemberDto dto = dao.login(id, pw);
		if(dto!=null) {
			session.getAttribute(id);
			response.sendRedirect("loginSuc.jsp");
		} else {
			response.sendRedirect("loginRag.jsp");
		}
	}

	}


