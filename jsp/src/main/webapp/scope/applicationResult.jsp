<%@page import="java.util.Set"%>
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
<!-- 어플리케이션 영역에 저장 된 맵 객체를 가져오기. -->
<%
	if(application.getAttribute("map") != null) {
		
		//브라우저를 닫았다가 다시 열어도 값이 유지가 됩니다.
		//서버를 종료 후 다시 실행시 제거되는 것을 확인할 수 있습니다.
		//이 페이지에서 변수 선언
		Map<String, Person> map = (Map<String, Person>)application.getAttribute("map");
		//맵의 모든 값을 출력하기(킷값을 알면 값 출력 가능) keyset이용
		//맵에 담겨진 데이터의 킷값을 조회합니다.
		//keySet() : 키의 집합을 set타입으로 반환합니다.
		//킷값을 모를 때
		Set<String> keys = map.keySet();
		//map은 key, value가 쌍으로 저장되는 컬렉션 타입입니다.
		//get(key) : 키값을 이용하여 value 값을 반환 받습니다.
		for(String key : keys ) {
			//person 객체 반환
			Person p = map.get(key);
			out.print(p+"<br>");
		}
	} else {
		out.print("map이 존재하지 않습니다.");
	}

%>
</body>
</html>