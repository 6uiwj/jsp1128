<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>application 영역</h2>
<!--  
	웹서버가 실행시 생성되는 영역
	클라이언트가 요청하는 모든 페이지가 application 영역을 공유
	웹서버를 종료할 때 소멸
 --> 
 <%
 //Map<이름, 값>
 	Map<String, Person> map = new HashMap<>();
 	//여러명에 대한 사람의 정보 저장
 	map.put("actor1", new Person("user1",20));
 	//맵은 인덱스가 아닌 이름으로 불러올 수 있음
 	map.put("actor2", new Person("user2",30));
 	map.put("actor3", new Person("user3",40));
 	
 	//생성된 맵 속성을 application영역에 추가
 	application.setAttribute("map", map);
 	
 %>
 <p>어플리케이션 영역에 속성이 저장되었습니다.</p>
 <!--  xml 문서에 저장된 값 가져오기-->
 <p>web.xml 파일에 초기화 변수 출력</p>
 <%= application.getInitParameter("INIT_PARAM") %>
 
 <p>서버의 물리적 경로</p>
<!--  <%= application.getRealPath("") %> -->
 
 
 
</body>
</html>