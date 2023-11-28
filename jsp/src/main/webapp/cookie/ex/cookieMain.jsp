<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--여러개를 지정해주고 싶을 때 . 으로 클래스 생성-->

<style>
	.none {display:none}
</style>
</head>
<body>
<%
	String none = "none";
	String str = "안녕하세요";
%>
<script type="text/javascript">
	//alert("none");


	//alert("안녕하세요");
	//alert("<%=str%>");
	
	
	//요소에 접근
	//1. id 가져오기: popup
	/* 2. docoument.querySelect("선택자");
		<선택자>
			. : 클래스
			# :아이디
			  : 태그명
	*/
	window.onload = function() {
		//popupCookie 쿠키가 없으면 압업을 화면에 출력
		<% 
		String display = "none";
		//if(CookieManager.readCookie(request, "popupCookie").equals("Y")) {
		if(!CookieManager.readCookie(request, "popupCookie").equals("Y")) {

			display="block";	
		}
		
		%>
		
		//화면에 출력
		document.querySelector("#popup").style.display='<%=display%>';
		

			//닫기 버튼을 클릭하면 form을 전송
			//=docoument.querySelector("#closeBtn").onclick = function)()
			
			//closeBtn.onclick 
			document.querySelector("#closeBtn").onclick= function () {
				//체크박스에 체크가 되어있다면 전송
				if(document.querySelector("#inactiveToday").checked==true) {
						popupForm.submit();
		} else {
			//팝업 창 닫기
			document.querySelector("#popup").style.display='none';

		}

		}
	}
/*
  	querySelector : 하나의 요소 선택
  	quertSelectorAll - 여러개의 요소를 선택할 때 사용
  					 - nodeList를 반환하여 리스트와 같이 방번호([0])를 이용해 접근이 가능하다
 
 */
	

</script>

<h2 class="none">쿠키 - 팝업 연습</h2>
<!-- 태크의 속성을 정의할 때 홑따옴표 또는 쌍따옴표로 감싸주는 것은
	해당 속성의 값이 어디까지인지를 정의하는 것(속성의 시작과 끝을 알려주는 것) 
	
	class 속성에 값을 정의할 수 있는데, 여러개 값을 정의할 수 있어요. -> 공백을 값으로 이용할 수 있다.
	class="none w30"-->
	
<!-- 만약에 쿠키가 등록되어 있으면 보여주고 싶어! -->
<form action="cookieAction.jsp" method = "get" name="popupForm">
	<div id="popup" class= "none" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" checked/> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
    </div> 
    
</form>
</body>
</html>