package com.ming.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;

/**
 * Servlet implementation class DeptListController
 */
//@WebServlet : URL매핑('/deptList' 페이지를 요청하면 실행)
//요청 메서드에 따라서 실행되는 메서드가 결정
//주소표시줄, 링크 -> get방식 -> doGet()메서드 호출
/**
 * Controller 
 *  -사용자의 요청 정보 수집
 *  -비즈니스 로직 호출(데이터베이스 입출력, 전처리, 후처리 작업)
 *  -view로 페이지 전환
 */
@WebServlet("/deptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeptListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext());
		List<DeptDto> list = dao.getList();
		//데이터 저장
		request.setAttribute("list", list);
		//페이지 전환
		//controller에서 화면을 구성하는 태그를 작성하는 것은
		///매우 번거롭기 때문에 JSP를 이용해서 화면을 작성 후 페이지를 전환합니다.
		request.getRequestDispatcher("/jdbc/deptList.jsp").forward(request, response);
		
		
		//PrintWriter out = response.getWriter();
		//out.print("<h2>안녕하세요<h2>");
	}


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
