<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dao.BoardDao"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>


	<script type="text/javascript">
		//화면에 동적인 처리
		window.onload = function() {
			console.log('onload event================');
			let logoutBtn = document.querySelector("#logoutBtn");
			let loginBtn = document.querySelector("#loginBtn");

			//login/logout 버튼이 클릭되었을 때 다음의 페이지로 가라
			if (logoutBtn != null) {
				//하나의 이벤트만 적용 가능(옛날방식)
				logoutBtn.onclick = function() {
					//로그아웃
					loginForm.action = "/logout";
					loginForm.submit();

				}
			}
			if (loginBtn != null) {
				//addEventListener -> 파라미터 : '이벤트 이름', 함수
				//-> 여러이벤트 적용 가능
				loginBtn.addEventListener('click', function() {
					//로그인페이지로 이동
					loginForm.action = "/06session/servletEx/loginForm.jsp";
					loginForm.submit();

				});
			}
		}
	</script>




	<!-- 로그인 여부를 체크 -->
	<!--	로그인을 했을 때 = session에 userId가 저장되어 있는가? = 로그인을 했다.
						- 로그아웃 버튼을 출력
				   session에 userID가 없으면 
				   		- 로그인 버튼을 출력

세션에서 먼저 정보를 가져오기
세션정보는 Object 타입으로 반환되기 때문에 형변환 필요
 -->

	<!-- submit : form의 요소들을 파라미터로 가지고 서버에 요청 
      action : 서버에 요청할 url 주소
      method : 요청 방식
      			 	get : 조회용 파라미터
      			 	post : 등록, 수정용 파라미터(보안)
      *버튼을 생성했더라도 form 안에 버튼이 하나밖에 없다면 해당 버튼은 submit 버튼이 된다.
      			 	-->


	<form action="" method="get" name="loginForm">
		<%
		//getAttribute 반환 타입은 Object 이므로 형변환이 필요합니다.
		//NPE 오류를 방지하기 위해 null인지 아닌지 또는 빈 문자열인지 아닌지 판단
		if (session.getAttribute("userId") != null && !"".equals(session.getAttribute("userId").toString())) {
			//null이 아니면 로그인한 사용자 -> 세션을 만료시키고 로그인페이지로 이동
		%>
		<%=session.getAttribute("userId")%>님 환영합니다.
		<button id="logoutBtn">로그아웃</button>

		<%
		} else {
		//null이면 로그인하지 않은 사용자 -> 로그인 버튼 출력 -> 로그인 페이지로 이동
		%>
		<button id="loginBtn">로그인</button>
		<%
		}
		%>
	</form>

<%List<BoardDto>list = (List<BoardDto>)request.getAttribute("list"); %>
	리스트 : ${list } <br>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!-- 변수를 4개의 영역에 저장 -->
<hr>

	<h2>게시글 목록</h2>
<table border=1>
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	
<c:forEach items="${list }" var="boardDto"> 
	<tr>
		<td>${boardDto.title }</td>
		<td>${boardDto.id }</td>
		<td>${boardDto.postdate }</td>
		<td>${boardDto.visitcount }</td>
	</tr>
	</c:forEach>
</table>	
<table>
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<% for (BoardDto dto : list){ %>
   <tr>
      <td>${dto.num }</td>
      <td>${dto.title }</td>
      <td><a href="/boardRead?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
      <td>${dto.content }</td>
      <td>${dto.id }</td>
      <td><%=dto.getPostdate() %></td>
      <td><%=dto.getVisitcount() %></td>
   </tr>
   <%} %>
	
</table>

<!--  만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 
	  만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
<c:if test="${empty list }" var="result">
	조회된 데이터가 없습니다.<br>
</c:if>
<c:if test="${empty list eq false}" var="result">
	${list } <br>
</c:if>

<!-- 페이지 네비게이션 작성
   		-페이지 번호 : pageNo
   		-페이지블럭 당 페이지 수 ?
   			페이지블럭의 시작번호 ~ 페이지블럭의 끝번호
   			
   		-총 게시물의 수 : totalCnt
   		-페이지당 게시물의 수  : amount
			진짜 블럭의 끝번호

-->
<%= request.getAttribute("pageDto") %>

<!-- pageNavi include -->
<%@include file="pageNavi.jsp" %>



</body>
</html>