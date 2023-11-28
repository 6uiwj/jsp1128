<%@page import="java.util.List"%>
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
<h2>session 영역의 속성 읽기</h2>
<%
//person을 꺼내와 변수에 저장해보자.(null처리 해준 후 형변환해서 담기)
//null은 try catch로 처리해주기보다는 null값을 직접 초기화해줘서 값을 정해주는 방식을 사용하는 것이 낫다.
	if(session.getAttribute("person") !=null) {
		Person p = (Person)session.getAttribute("person");
		out.print(p);
	} else {
		out.print("session에 저장된 person 객체는 존재하지 않습니다.");
	}
//list 꺼내오기
	if(session.getAttribute("list") != null) {
		List<String> list = (List)session.getAttribute("list");
		out.print("<br>");
		for(String str : list ) {
			out.print(str + "<br>");
		}
	}

%>
</body>
</html>