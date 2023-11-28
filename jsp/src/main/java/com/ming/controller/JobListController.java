package com.ming.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.stax.StAXSource;

import com.momo.dao.JobDao;
import com.momo.dto.Job;

/*
 * 사용자가 /JobListController경로를 요청하면
 * 요청 URL에 매핑에 의해 서블릿이 실행
 * 
 * 요청시 전달된 메서드에 의해 실행될 메서드가 결정된다.
 * - 사용자가 지정하지 않은 경우 get 방식
 * - get 방식: 링크를 클릭했을 때, 주소창에서 직접 입력헀을 때
 * 
 *get 방식 요청에 대해서는 doGet 메서드가 실행되고
 *post 방식 요청에 대해서는 doPost 메서드가 실행된다.
 *해당 요청방식이 구현되어 있지 않은 경우, 오류가 발생한다.
 */


/**
 * Servlet implementation class JobListController
 */
@WebServlet("/jobList")
public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    /*
     *1. DB로부터 직급 목록을 조회
     *2. 화면에 직급 목록 리스트로 출력     
     */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jsp의 내장객체 application = request.getServletContext() : 
		JobDao jobDao = new JobDao(request.getServletContext());
		List<Job> list = jobDao.getList();
		System.out.println("=================== jobList");
		System.out.println(list);
		
		//담아주기
		request.setAttribute("list", list);
		//view페이지로 전환 (forward 방법)
		request.getRequestDispatcher("/jobList.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
