<%@page import="com.ming.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<ul>
	<li>데이터 전송 방식 : <%=request.getMethod() %></li>
	<li>URL : <%=request.getRequestURL() %></li>
	<li>프로토콜 : <%=request.getProtocol() %></li>
	<li>서버명 : <%=request.getServerName() %></li>
	<li>포트번호 : <%=request.getServerPort() %></li>
	<li>클라이언트 IP : <%=request.getRemoteAddr() %></li>
	<!-- url뒤에 ?로 데이터값을 주는 것 
			url?이름=값%이름=값
			이름: 태그(요소)의 name속성-->
	<li>쿼리스트링 : <%=request.getQueryString() %></li> 
	<li>파라미터 : <%=request.getParameter("eng"+"han") %></li>
	
 	<%
	UserVO user = new UserVO();
	String age =request.getParameter("age");
	user.setAge(Integer.parseInt(age));
	user.setName(request.getParameter("name"));

	%>  
	
</ul>
</body>
</html>