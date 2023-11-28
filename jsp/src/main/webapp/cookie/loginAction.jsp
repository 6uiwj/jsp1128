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
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//save_check값이 null이 아니라면 (체크박스는 값이 선택된 경우에만 넘어옵니다!!) id를 쿠키에 저장하기
//check가 되어있는지 확인
//체크박스의 값을 수집
String save_check = request.getParameter("save_check");
out.print("save_check : " +save_check);

if( save_check !=null) {
	//쿠키에 데이터 저장
	//CookieManager 클래스에서 만든 메서드로 쿠키를 만들어줘보자.
	CookieManager.makeCookie(response, "userId", id, 3600);
	
	
//	Cookie cookie = new Cookie("userId", id);
//	cookie.setMaxAge(3600);
	//쿠키를 웹브라우저에 전송해서 저장
//	response.addCookie(cookie);
	out.print("아이디를 쿠키에 저장했습니다.");

}
if(true) {
//if("momo".equals(id) && "1234".equals(pw)) {
	out.print("<h2>로그인 성공</h2>");
} else {
	String script = 
			"<script type = 'text/javascript'>"
		+"alert('id/pw를 확인해주세요');"
		+"history.go(-1);"
		+"</script>";
	out.print(script);
	
%>

<!-- 
<script type = "text/javascript">
	alert('id/pw를 확인해주세요');
	//이전 페이지로 이동
	history.go(-1);
</script>

<%
}
%>
 -->
</body>
</html>