package com.ming.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.BoardDao;
import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/06session/servletEx/loginProcess")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * Controller의 역할 -파라미터 수집 -페이지 전환(jsp로 요청을 위임)
	 * 
	 * 사용자의 로그인 요청을 처리 1. 파라미터 수집 (id, pw) 2. DB로부터 해당 사용자가 있는지 확인 2-1 사용자가 존재하면 로그인
	 * 처리(세션에 사용자 정보를 저장) 2-2 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메시지를 출력
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// 파라미터 수집
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pw");

		System.out.println("id: " + id);
		System.out.println("password : " + pass);

		// 사용자 정보 인증
		// DB에 사용자가 입력한 정보와 일치하는 정보가 있는지 확인
		// servlet에서 세션을 사용하기 위해서 request로부터 꺼내옵니다.
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.login(id, pass);
		dao.close();
		if (dto != null) {
			// 로그인 성공 -> session에 로그인 정보 저장 -> board.jsp로 이동
			session.setAttribute("memberDto", dto);
			session.setAttribute("userId", dto.getId());
			
			//게시글 조회 후 request에 담아 줍니다.
			//BoardDao boardDao = new BoardDao();
			
			//sendRedirect를 이용할 경우 reuqest영역이 공유되지 않기 때문에
			//list 값을 화면으로 전달할 수 없어
			//request.setAttribute("list",boardDao.getList());
			dao.close();

			//request.getRequestDispatcher("board.jsp").forward(request, response);
			response.sendRedirect("/boardList");
		} else {
			// 로그인 실패 -> loginForm 페이지로 다시 돋아감
			response.sendRedirect("loginForm.jsp?isError=1");
		}
	}
}
