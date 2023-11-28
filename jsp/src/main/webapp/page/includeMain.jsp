<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 지시어는 <!@ 로 시작 -->
    <!-- 같은 경로일 경우 file 로 시작, 경로가 다를 경우 경로까지 입력 -->
    <!-- 다른 jsp 파일을 포함 -->
<%@ include file = "includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>include 지시어</h1>
오늘날짜 : <%=today %>
<hr>
선언부(jsp가 클래스로 변환이 될 때 클래스 내부에 생성 -> 메서드 작성이 가능) <br>
    - 표현방법: <%!  %> <br>
<hr>
스크립틀릿(메서드 내부에 생성 -> 메서드 작성이 불가능) <br>
	- 자바코드 <br>
	- 표현방법: <% %> <br>
	<hr>
	
표현식 <br>
	- 실행 결과 하나의 값을 출력 <br>
	- 상수, 변수, 연산자, 수식 <br>
	- 값이 있는 메서드 <br>
	- <%= 10+20 %> -> 연산의 결과가 출력 <br>
	- <%= "오늘 날짜는" + today %> <br>

<%@ include file="includeFooter.jsp" %>
</body>
</html>