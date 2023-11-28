<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//loginAction에서 userId 가져와서 리퀘스트 헤더의 쿠키에서 가져온다.
	//요청객체로부터 쿠키정보를 꺼내서 userId값을 변수에 저장합니다.
		String userId= "";
		String checked = "";
	 
		
	//16:00
		userId = CookieManager.readCookie(request, "userId");
	//userID가 비어있지 않으면 checked 아니면 빈 문자열 출력
	 	checked = !"".equals(userId)? "checked": "";
	/*	Cookie[] cookies = request.getCookies();
		//처음브라우저를 실행할 떄 쿠키가 없을 수 있으므로 null 체크
		if(cookies!=null) {
		
		//쿠키 정보 확인
		for(Cookie cookie : cookies) {
			if("userId".equals(cookie.getName())) {
				out.print("userId를 찾았어요!<br>");
				userId= cookie.getValue();
				//만약 쿠키에 userID 값이 있으면 check를 활성화해준다. checked변수를 form checkbox에 넣는다.

				checked="checked";
				break;
			}

		
		}}*/
		out.print("checked 값  : " + checked);

		
	
	
	

%>

<form action="loginAction.jsp" method="post">
<div class='loginbox'>
        <div id='login'>
            <input type="text" name="id" id="userpw" placeholder='ID를 입력해주세요.' 
            				required="required" value=<%=userId %>><br>
            				
            <input type="password" name="pw" id="userpw" value="1234" placeholder='PW를 입력해주세요.' required="required"><br>
            <input type="checkbox" <%= checked %> name="save_check" value="Y">아이디 저장하기<br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div> 
    </form>
</body>
</html>