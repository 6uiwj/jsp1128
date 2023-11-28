package com.ming.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.EmpDao;
import com.momo.dto.EmpDto;

/**
 * Servlet implementation class EmpListController
 */
@WebServlet("/empList")
public class EmpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//emplist가 가 호출되면 emplist.jsp로 화면전환
		//request에 list 저장 
		//-> 화면 전환해야 하므로 두번의 요청을 처리할 수 있는 forward방식
		//list출력해서 화면에 전환
		
		//emp 리스트 조회
		EmpDao dao = new EmpDao();
		List<EmpDto> list = dao.getList();
		
		//리스트를 request영역에 저장(페이지영역에 사용하기 위해)
		request.setAttribute("list", list);
		
		//view페이지 이동
		request.getRequestDispatcher("/jdbc/empList.jsp").forward(request, response);
		
		
		
	}


}
