<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  id: momo pw:1234이면 loginOK로 페이지 전환, 아니면 오류 메시지를 출력할 수 있도록 파라미터를 전달 -->
<%

String isError = request.getParameter("loginErr");
String id = "momo";
if(request.getParameter("id") != null) {
	id=request.getParameter("id");
}

%>

<%= "1".equals(isError)? "아이디 비빌번호를 확인해주세요": "" %>

<!-- 주소표시줄에 정보가 노출되지 않게 post.방식 이용 -->
<form action = "./login.jsp" method="post">
	아이디 <input type = "text" name="id" value="<%=id%>"/>
	비밀번호 <input type = "password" name="pw" value="1234">
	<button>확인</button>
</form>
</body>
</html>