<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 	
 	if("momo".equals(id) && "1234".equals(pw)) {
 		//리퀘스트 영역이 공유되지 않기 때문에 id 값을 유지시키기 위해 쿼리스트링으로 입력
 		response.sendRedirect("loginOk.jsp?id="+id);

 	}
 	else {
 		//1번의 요청으로 페이지를 전환하므로 request 영역이 공유가 된다.
 		//원래식: 	
 		//RequestDispatcher d = request.getRequestDispatcher("main.jsp");
 		//d.forward(request, response);
 		request.getRequestDispatcher("main.jsp?loginErr=1").forward(request, response);

 	}

 		
 	 %>
</body>
</html>