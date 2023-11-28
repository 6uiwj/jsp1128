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


@WebServlet("/loginProcess")
public class LoginProcessContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 파라미터 수집
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pw");
		
		//2. LoginDao를 이용하여 사용자 인증(id, pw 일치하는 사용자가 있다면 member객체를 반환하고 아니면 null 반환)
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pass);
		
		//3. session영역에 memberDto를 저장
		//request.setAttribute("memberDto",dto);
		
		//웹브라우저를 닫을 때까지 세션 정보가 유지
		//세션의 만료기간이 남아 있고, 웹브라우저를 닫을 때까지 세션 정보가
		//서버에 유지
		
		//4. 페이지 전환
		//request.getRequestDispatcher("main.jsp");
		if(dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberDto", dto);
			session.setAttribute("userid", id);

			
			response.sendRedirect("/06session/main.jsp");
	} else {
		
			
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response);
		}
	}
}


