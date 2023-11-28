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
//page영역, ruquest영역에 저장
pageContext.setAttribute("attrPage", "attrPage");
request.setAttribute("attrRequest", "attrRequest");

%>
<h2>지시어와 액션태그 동작 방식 비교</h2>
<hr>
<h3>---지시어 방식---</h3>

<%@include file ="inc/OuterPage1.jsp" %>
include지시자 방식에서 선언한 변수 : <%= newVar1 %>
<br>
<p> *페이지 영역(scope),리퀘스트 영역 전부공유됨 </p>
<p> *include되는 페이지에서 생성한 변수도 공유가 됨</p>
<hr>

<h3>---액션 태그 방식---</h3>
<!-- 액션태그 방식
		페이지 영역이 공유되지 않음
		외부파일에서 생성된 변수가 공유되지 않음 -->
<jsp:include page="inc/OuterPage2.jsp"></jsp:include>
<p>*페이지 영역이 공유되지 않는다.</p>
액션태그 방식에서 선언한 변수 : Error  <%--=newVar2 --%>
<br>
컴파일 된 후 사용?
</body>
</html>