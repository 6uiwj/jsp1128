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
	쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
	
	cookie: 쿠키를 읽을 때 사용
	header: 헤더정보를 읽을 때 사용
	initParam : web.xml에 설정한 컨텍스트 초기화 매개변수를 읽을 때 사용
	pageContext: JSP의 pageContext객체과 동일한 역할
 -->

<%
	CookieManager.makeCookie(response, "elCookie", "표현언어", 100);
	out.print("elCookie : " + CookieManager.readCookie(request, "elCookie"));
%>
<h3>쿠키 값 읽기</h3>
elCookie : ${cookie.elCookie.value}

<h3>HTTP 헤더 읽기</h3>
<ul>
	<li>host : ${header.host } </li>
	<li>user-agent : ${header['user-agent'] }</li>
	<li>cookie :${header.cookie } </li>
</ul>

<h3>컨텍스트 초기화 매개변수</h3>
initParam : ${initParam.INIT_PARAM }
initParam : ${initParam.driver }

<!-- 경로지정을 위해 종종 사용(프로젝트를 여러개 띄울 때 각각 프로젝트에 주소를 주는데,
	 이럴 때 컨텍스트 루트를 지정하기 위해 사용 -->
<h3>컨텍스트 루트 경로 읽기</h3>
${pageContext.request.contextPath } 
</body>
</html>