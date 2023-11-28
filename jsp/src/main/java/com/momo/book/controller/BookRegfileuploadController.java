package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.service.FileUploadService;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/regFileupload")
public class BookRegfileuploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//첨부파일 저장 :객체이용
		//4가지 정보 넣어주자
		FileUploadService fileService = new FileUploadService();
		MultipartRequest mr = fileService.fileUpload(request, "imgFile", "book");
		
		//수집 후 출력
		String title = mr.getParameter("title");
		String author = mr.getParameter("author");
		System.out.println(title +"/"+author);
		
	}

}
