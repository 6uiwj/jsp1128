<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//id == momo, pw == 1234 로그인성공
	//		"mommo".equals(id) 혹은 id.equals("momo") 
	// id가 존재하지 않을 수 있으므로 null인 경우도 처리해 준다.
	if("momo".equals(id) &&  "1234".equals(pw)) {
		//로그인 성공		
		//페이지 전환 -> 웹브라우저 -> 웹브라우저가 다시 요청
		//기존 요청정보가 공유되지 않는다.
		//아이디를 파라미터로 넘겨주지 않으면 id 값이 공유되지 않는다.
		//jsp로 반환하는 법
		response.sendRedirect("responseWelcome.jsp?id="+id);
	} else {
		//로그인 실패
		request.getRequestDispatcher("responseMain.jsp?loginErr=1").forward(request, response);
	}
	
	
%>
<h2>페이지를 전환 하는 방법</h2>
<p>sendRedirect</p>
<p>forward</p>


id : <%= id %> <br>
pw : <%= pw %>
</body>
</html>