<%@page import="com.momo.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- main page에서 넘어올 때 어느 정보가 유지되고, 유지되지 않는지 확인 -->
<h2>sendRedirect</h2>

<%
	String str = "";
	Person person = new Person();
	
//request에 담긴 속성 꺼내오기
//만약 null이 아니면 저장
	if(request.getAttribute("request_str")!= null) {
		str = request.getAttribute("request_str").toString();
	}

//만약 request영역에 저장되어 있는 request_person의 속성이 null이 아니라면 꺼내서 변수에 저장한다.
	if(request.getAttribute("request_person")!=null) {
		//Object 타입으로 반환되기 때문에 형변환 해 준다.
		person = (Person)request.getAttribute("request_person");
	}

	%>
	
	<!-- 출력해주기 -->
	<h2>getAttribute 출력</h2>
	<p>리다이렉트시 request 영역은 공유되지 않으므로 값이 출력 되지 않음</p>
	str: <%= str %>
	<br>person : <%=person %>	
	
	
	
	<h2>queryString 출력</h2>
	<p>queryString으로 전달한 데이터는 getParameter 메서드를 이용해서 수집 <br>
	isRedirect: <%= request.getParameter("isRedirect") %>
	
	<h3>session을 이용한 값 출력</h3>
	session_str : <%= session.getAttribute("session_str") %>
	<!-- session을 사용했으면 지워주는게 좋음(서버에 부하를 주지 않기 위해 -->
	<%
	//세션에 저장도니 속성 제거
	session.removeAttribute("session_str");
	%>
<h3>세션 제거 </h3>
session_str : <%= session.getAttribute("session_str") %>
	
</body>
</html>