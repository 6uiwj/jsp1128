<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dao.BoardDao"%>
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
</head>
<body>
<!-- 목록 태그를 이용해서 메뉴를 -->
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
			
			
		//select 요소의 옵션을 선택하는 방법
		var searchField = '${pageDto.cri.searchField }';
		console.log("searchField : ", searchField);
		var options = searchForm.searchField.options;
		
		//select 요소 옵션의 selected 속성을 제거
		for(let i = 0; i<options.length; i++){
			options[i].removeAttribute("selected");
		}
		
		for(var i = 0; i< searchForm.searchField.options.length; i++){
			console.log(searchForm.searchField.options[i].value);
			if(searchForm.searchField.options[i].value == searchField){
				searchForm.searchField.options[i].setAttribute("selected", "selected");
			}
		}
		
		}
	//함수는 onload 함수 외부에 작성합니다.
	/**
	* 입력받은 페이지 번호로 이동합니다.
	*/
	function goPage(pageNo){
		//파라미터로 넘어온 페이지 번호를 searchForm에 pageNo에 입력
		searchForm.action = '/boardList'
		searchForm.pageNo.value = pageNo;
		searchForm.submit();
	}	
	
	/*페이지 넘버가 아닌 게시글 넘버가 필요*/
	function goDetail(num){
		//파라미터로 넘어온 페이지 번호를 searchForm에 pageNo에 입력
		/*
			/boardRead?num=${dto.num}
						&pageNo=${pageDto.cri.pageNo}
						&searchWord=${pageDto.cri.searchWord}
						&searchField=${pageDto.cri.searchField}"
		*/
		searchForm.action = '/boardRead';
		searchForm.num.value=num;
		searchForm.submit();
	}
	
	/**
	* 폼을 (전송)요청합니다.
	*/
	function formSubmit(){
		//1.폼을 선택 - 폼의 이름을 불러줍니다.
		//2. 폼의 요소를 선택 - 폼이름.요소의 이름
		searchForm.pageNo.value = '페이지 번호';

		//3. 폼 전송하기 - form의 action속성에 정의된 url을 요청합니다.
		//			  - 폼 안의 요소들을 파라미터로 전달
		searchForm.submit();
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

<%@ include file="header.jsp" %>



<table width="90%" align="center">
	<tr>
		<td>

<h2>게시글 목록</h2>

<!-- 검색폼 -->
<!-- pageDto : ${pageDto }
<br>cri : ${pageDto.cri }
<br>pageNo : ${pageDto.cri.pageNo }
<br>searahField : ${pageDto.cri.searchField }
<br>searchWord : ${pageDto.cri.searchWord }
 -->


<form name="searchForm">
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
num : <input type="text" name="num" value="">

<div class="input-group">
  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">	
 	<option value="title"
 		${pageDto.cri.searchField  eq 'title'? 'selected' : ''}
 	>제목</option>
	<option value="id" 
		${pageDto.cri.searchField  eq 'id'? 'selected' : ''}
		>작성자</option>
	<option value="content"
		${pageDto.cri.searchField  eq 'content'? 'selected' : ''}
		>내용</option>			
  </select>
  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" class="form-control" aria-label="Text input with dropdown button">
  <button class="btn btn-outline-secondary" type="submit">검색</button>
</div>
</form>
	
	<table border="1" class="table">
		<tr>
			<th>일련번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<!--  만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다를 출력 
	  만약 리스트의 사이즈가 0이 아니라면 목록을 출력-->
		<c:if test="${empty list }" var="result">
			<tr>
				<td colspan="6">조회된 데이터가 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.num}</td>
				<td><a onclick="goDetail(${dto.num})">${dto.title }</a></td>
				<td>${dto.content}</td>
				<td>${dto.id}</td>
				<td>${dto.postdate}</td>
				<td>${dto.visitcount}</td>
			</tr>

		</c:forEach>
	</table>
		<!-- 페이지 네비게이션 작성
   		-페이지 번호 : pageNo
   		-페이지블럭 당 페이지 수 ?
   			페이지블럭의 시작번호 ~ 페이지블럭의 끝번호
   			
   		-총 게시물의 수 : totalCnt
   		-페이지당 게시물의 수  : amount
			진짜 블럭의 끝번호

-->
		<%=request.getAttribute("pageDto")%>

		<!-- pageNavi include -->
		<%@include file="pageNavi.jsp"%>
		
				</td>
	</tr>
</table>
</body>
</html>