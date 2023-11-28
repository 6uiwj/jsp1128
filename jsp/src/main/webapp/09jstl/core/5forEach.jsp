<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.odd{
	background-color: yellow;
	}
</style>
</head>
<body>
	<!-- 일반 for 문 형태의 forEach문 -->
	<!-- forEach 태그를 활용한 반복문
		begin : 시작값
		end   : 종료값
		step  : 증가값
		var	  : 변수  -->

	<%
	for (int i = 1; i <= 10; i = i + 2) {
		out.print("(i=" + i + ")");
	}
	%>
	<br>
	<c:forEach begin="1" end="10" step="2" var="i">
	i : ${i } /
</c:forEach>

	<!-- 
	varStatus 루프의 현재 상태를 알려주는 변수 이름
	current	: var에 지정한 현재 루프의 변수값
	index	: var에 지정한 현재 루프의 인덱스값
	count	: 실제 반복횟수(1부터 시작)
	first	: 루프의 처음일 때 true
	last	: 루프의 마지막일 때 true
 -->

	<!-- 일반 for문의 경우 current, index, var 3가지 값이 동일합니다. -->
	<table border="1">
	<!--  첫 번째 행인 경우 버튼을 출력합니다. -->
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<c:if test="${loop.first}">
				<tr>
					<td colspan="6"><button>버튼이당</button></td>
				</tr>
			</c:if>
			<tr>
				<td>i : ${i }</td>
				<td>loop.current : ${loop.current}</td>
				<td>loop.index : ${loop.index}</td>
				<td>loop.count : ${loop.count}</td>
				<td>loop.first : ${loop.first}</td>
				<td>loop.last : ${loop.last}</td>

			</tr>
			
			<!-- 마지막 행인 경우 버튼을 출력합니다. -->
			<c:if test="${loop.last}">
				<tr>
					<td colspan="6"><button>글쓰기</button></td>
			</tr>
			</c:if>
		</c:forEach>
	</table>

<h2>1~100까지 정수 중 홀수의 합을 구해봅시다.</h2>
    <c:set var="sum" value="0"/>
 <c:forEach begin="1" end="100" var="i" varStatus="loop">
    	<c:if test= "${i mod 2 eq 1}">
		 <!--   <c:set var="sum" value="${ sum = sum+ i }"/>   -->
		   ${sum=sum+i; "" }
		</c:if>
</c:forEach>
<br>
합계: ${sum }

<h2>향상된 for문 형태의 forEach 태그</h2>
<%
	String[] rgba={"red", "green", "blue", "black"};
	for(String color : rgba) {
		out.print(color + "/");
	}
%>

<table border="1" >

<!-- index : 0부터 시작
	 count : 1부터 시작 (반복한 수만큼 증가) -->
<c:forEach items="<%=rgba %>" var="color" varStatus="loop">
<c:set var="odd" value='${loop.index mod 2 eq 1 ? "odd" : "" }'></c:set>
	odd : ${odd }
	<tr class="${odd}">
		<td>color : ${color}</td>
		<td>loop.current : ${loop.current}</td>
		<td>loop.index : ${loop.index}</td>
		<td>loop.count : ${loop.count}</td>
		<td>loop.first : ${loop.first}</td>
		<td>loop.last : ${loop.last}</td>
		
	</tr>
 </c:forEach>
 </table>


<h2>List 컬렉션 사용하기</h2>
<%
	List<BoardDto> list = new ArrayList<>();

	list.add(new BoardDto("1","제목1", "내용1", "id1", "2013-11-21", "10"));
	list.add(new BoardDto("2","제목2", "내용2", "id2", "2013-11-22", "20"));
	list.add(new BoardDto("3","제목3", "내용3", "id3", "2013-11-23", "30"));
	list.add(new BoardDto("4","제목4", "내용4", "id4", "2013-11-24", "40"));
	
	//request.setAttribute("list", list);
%>
<!-- el 표현언어를 통해 사용하기 위해서
	controlloer를 통해서 화면을 출력할 경우, 내장객체의 영역에 저장해 주고 있으므로 따로 선언하지 안하도 된다. -->
<c:set var="list" value="<%=list %>"></c:set>
<ul>
<c:forEach items="${list }" var="board">
	<li>제목 : ${ board.title } / 작성자 : ${board.id } / 작성일 :  ${board.postdate }</li>
</c:forEach>
</ul>


<%
	Map<String, Object> map = new HashMap<>();
	
	map.put("boardDto", new BoardDto("1","제목1", "내용1", "id1", "2013-11-21", "10"));
	map.put("pageDto", new PageDto(1, new Criteria()));
%>
<c:set var="map" value="<%=map %>"></c:set>
<h5>BoardDto</h5>
제목 : ${map.boardDto.title }
<br>내용 : ${map.boardDto.content }

<h5>PageDto</h5>
<br>총건수: ${map.pageDto.totalCnt }
<br>다음 : ${map.pageDto.next }


<h2>forTokens 태그 사용</h2>
<!-- 
    	Token : 문법적으로 의미 있는 최소단위
    			구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복 합니다 
    	
    	items 	: 문자열(문자열만 사용가능)
    	delims 	: 구분자
    	var 	: 변수명
    	
     --> 
<%
	String rgb = "Red,Green,Blue,Black";
%>
<c:forTokens items="<%=rgb %>" delims="," var="color" >
	<span style="color:${color}">%{color}</span>
</c:forTokens>


</body>

</html>