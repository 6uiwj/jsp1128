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
	<li>페이지 영역: ${pageScope.pageValue }</li>
	<li>요청 영역: ${requestScope.requestValue }</li>
	<li>세션 영역: ${sessionValue }</li>
	<li>어플리케이션 영역 : ${applicationValue }</li>
</ul>


</body>
</html>