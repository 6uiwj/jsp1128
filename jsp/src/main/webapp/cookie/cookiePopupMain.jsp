<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:white;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style> 
</head>
<body>
<h2>쿠키를 이용한 팝업창 제어 ver 1.0 </h2>

<!-- script: 화면에 대한 동적인 처리 -->
<script>
//window의 객체의 onload 이벤트가 발생하면 실행
//window.onload: html 요소가 모두 생성된 상태에서 실행(아직 popup생성 전이므로)
window.onload =	function () {
	
	//팝업클로즈 쿠키의 값이 'Y'인지 확인, Y이면 팝업창을 화면에서 숨김처리
	
	
//**********복사한 부분\
<%
//String popupClose = CookieManager.readCookie(request, "popupClose");
//팝업클로즈의 값이 Y가 아니면 화면에 팝업을 생성
	//if(!"Y".equals(popupClose)) {
		 %>


		 //요소를 선택 후 화면에서 숨김 처리		
		 //document.querySelector("#popup").style.display='none';
		 <%
	//}
%>
	
	
	//버튼에 이벤트 등록
	closeBtn.onclick = function() {
		alert('버튼이 클릭되었습니다.');
		   if(document.querySelector('#inactiveToday').checked==true){ 
			 //  alert('체크박스가 선택되었습니다.');
			 
			 console.log("체크박스가 선택 되었습니다.");
			 
				popupForm.submit();
			
			    } 
		     console.log("체크박스가 선택되지 않았습니다.");	
			 popup.style.display='none';


		   
		   
		   //display 속성을 none로 설정하면 화면에서 숨김처리
	}
	//체크박스가 체크되어 있으면 체크박스가 선택되었습니다 메시지 출력
	
		//서버에 요청 방법
		//1. href : querySting을 이용해서 파라미터를 전달
		//2. form submit : form안에 요소들을 가지고 이동
 
}
</script>

<!-- 
	1.닫기 버튼을 클릭하면 cookiePopupAction.jsp 파일을 호출
		-팝업닫힘 쿠키를 생성
		
	2. 팝업닫힘쿠키가 생성이 되어 있다면, 더이상 팝업창을 보여주지 않도록 처리 
		
 -->

<form action="cookiePopupAction.jsp" name = "popupForm">
<!-- 붙여넣기한 부분 -->
<%
String popupClose = CookieManager.readCookie(request, "popupClose");
//팝업클로즈의 값이 Y가 아니면 화면에 팝업을 생성
	if(!"Y".equals(popupClose)) {

%>
	<div id="popup" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" value="Y" checked/> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
    </div> 
    <% } %>
    </form>
</body>
</html>