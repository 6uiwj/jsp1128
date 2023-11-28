<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키 값 확인</h2>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		//쿠키 정보 확인
		for(Cookie cookie : cookies) {
			String name = cookie.getName();
			String value = cookie.getValue();
			
			out.print("쿠키명 : " + name + "/쿠키값 : " + value + "<br>");
		}
	}
%>
</body>
</html>