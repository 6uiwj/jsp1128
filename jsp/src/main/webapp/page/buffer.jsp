<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i = 0; i < 100; i++) {
		out.println("abcde12345");
	}

	//버퍼 사이즈 출력
	out.println("<br>");
	out.println(out.getBufferSize());
	out.println(out.isAutoFlush());
%>
</body>
</html>