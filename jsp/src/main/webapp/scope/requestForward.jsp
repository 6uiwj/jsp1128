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
<h2>forward 페이지</h2>
<h3>requestMain페이지 forward!!</h3>
<%
//요청을 받는 독립된 페이지 (request영역으로 부터 값을 꺼내와야 함)
//request 영역에 있는 값이 공유되어있는지 확인
	request.getAttribute("request_person");
	request.getAttribute("request_str");
//null체크

	String request_str = "값 없음";
	Person request_person = new Person();
	
	
	if(request.getAttribute("request_str")!= null) {
		request_str = request.getAttribute("request_str").toString();
		}

		
	if(request.getAttribute("request_person") != null) {
		request_person = (Person)request.getAttribute("request_person");
		}

	//request에 있는 isRedirect 값을 가지고 올 수 있다.
	String title = request.getAttribute("isRedirect") != null ? "redirect" : "forward";
	
	
	%>
	isRedirect <br>
	getAttribute : <%=request.getAttribute("isRedirect") %> <br>
	getParameter : <%=request.getParameter("isRedirect") %> <br>
</body>
</html>