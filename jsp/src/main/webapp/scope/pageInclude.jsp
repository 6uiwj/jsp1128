<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 변수가 유지되는가?  -->
 <ul>
 	 <li>String : <%= //page_str %></li>
 	 <li>int : <%=//page_int %></li>
 	 <li>person : <%=//page_p.getAge() %>/<%=//page_p.getName() %></li>
 	
 </ul>

<!-- 페이지 스코프가 유지되는가  -->
 <ul>
 <!-- tostring 메서드가 재정의 되어있어서 정상 출력 -->
 	 <li>String : <%= pageContext.getAttribute("page") %></li>
 	 <li>int : <%=pageContext.getAttribute("page_int") %></li>
 	 <!-- object 는 재정의 되어있지 않으므로 주소가 출력 -->
 	 <li>person : <%=pageContext.getAttribute("pagePerson") %></li>
 	
 </ul>
 
</body>
</html>