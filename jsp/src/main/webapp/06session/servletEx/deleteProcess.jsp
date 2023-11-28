<%@page import="com.momo.utils.JSFunction"%>
<%@page import="com.momo.dao.BoardDao"%>
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
if(request.getParameter("num") != null ){
	String num = request.getParameter("num").toString();
	BoardDao dao = new BoardDao();
	if(dao.deleteBoard(num) !=1) {
		JSFunction.alertBack("존재하지 않은 게시글입니다.", out);
	}
	JSFunction.alertLocation("삭제 되었습니다.", "/boardList", out);
	
} else {
	/*
	out.print("<script type='text/javascript'>");
	out.print("alert('게시물 번호를 확인할 수 없습니다.');");
	//뒤로가기
	//out.print("history.back()")
	out.print("</script>");
	*/
	JSFunction.alertBack("게시물번호(num)를 확인할 수 없습니다.", out);
}
%>

</body>
</html>