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
	//String isError = request.getParameter("isError");
	//if("1".equals(isError)) {
	//	out.print("로그인 정보가 일치하지 않습니다.");
	//}
	
	
	String isError = request.getParameter("isError");
	//out.print(isError);
	if("1".equals(isError)){
		out.print("아이디, 비밀번호를 확인해주세요.");
	}
	%>

<form action="loginProcess" method="post" name="loginForm">
        아이디 : <input type="text" name="user_id" required="required" value="test"/><br />
        패스워드 : <input type="password" name="user_pw" required="required" value="1234"/><br />
        <input type="submit" value="로그인하기" />
    </form> 
</body>
</html>