<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<!-- 
	웹브라우저에서 서버에 처음 요청할 때 sessionId를 발급
	-> 응답객체의 쿠키에 담아서 웹 브라우저로 전송
	-> 웹브라우저는 응답을 받아서 쿠키에 저장
	-> 서버에 요청시 쿠키정보를 담아서 요청
	
	세션은 회원 인증 후 로그인 상태를 유지 하는 데 사용
	웹 브라우저를 닫고 다시 열게 되면 세션은 유지되지 않는다.
	
 -->
 <!-- 세션에 데이터 저장하기 -->
 
 <%
 //내장 객체이므로 바로 사용
 //setAttribute -> Object 타입을 저장하기 때문에 list도 저장 가능
 	session.setAttribute("person", new Person("momo",30));
 	List<String> list = new ArrayList<String> ();
 	list.add("list");
 	list.add("set");  //로또만들기(중복값이 제거되기 때문에)  / 새로운 숫자를 추출 -> 담아(중복 제거)
 	//비동기 방식(Ajax)에서 데이터 전송을 위해 map에 담음
 	list.add("map");
 	//리스트에 담은 문자열을 세션에 저장
 	session.setAttribute("list", list);
 	
 	
 %>
 <h2>페이지 이동 후 session영역에 저장된 값을 출력</h2>
 <a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
 
 <h2>세션 무효화</h2>
 <!-- //session.invalidate() -->
 <a href= "sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
 
 
 
</body>
</html>