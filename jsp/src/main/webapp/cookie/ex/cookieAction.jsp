<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	팝업용 쿠키를 생성 후  cookieMain 페이지로 전환
	popupCookie
 -->
 <%
 	//서버에서는 response(응답객체)에 쿠키를 추가해주면 브라우저가 확인 후 쿠키에 저장
 	CookieManager.makeCookie(response, "popupCookie", "Y", 3600);
 //페이지 전환
 //redirect방식
	response.sendRedirect("cookieMain.jsp");
 
 //forward 방식 (request가 가지고 있음)
 // request.getRequestDispatcher("cookieMain.jsp").forward(request, response);
 %>
 	
</body>
</html>