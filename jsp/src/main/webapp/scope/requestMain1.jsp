<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sendRedirect</h2>
<p>request 영역은 하나의 요청에 대한 응답이 완료될 때 소멸된다. </p>
<!-- 리퀘스트 영역에 데이터 저장하기 -->
<%
	//리퀘스트 영역에 공유가 되는지 확인하기 위해 2개의 데이터 값을 저장
	//redirect방싱으로 request 영역을 이용시 값이 유지되지 않으므로 다른 방법을 이용해야 함
	request.setAttribute("request_str", "request_str");
	//객체를 저장(객체를 이용해 데이터를 주고 받기 위해)
	request.setAttribute("request_person", new Person("momo", 30));

	
	//session 영역에 값을 저장
	session.setAttribute("session_str", "session_str");
%>
	//redirect 로 데이터 넘기기 (데이터 유지가 잘 안됨), 쿼리스트링 넘기기
	//다른페이지 요청
	//queryString을 통해 파라미터 전달
	response.sendRedirect("requestRedirect.jsp?isRedirect=1");



</body>
</html>