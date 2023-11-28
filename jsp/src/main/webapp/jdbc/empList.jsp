<%@page import="com.momo.dao.EmpDao"%>
<%@page import="com.momo.dto.EmpDto"%>
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
<h2>Controller를 이용해서 사원목록을 출력해 봅시다.</h2>
<%

//request.getAttribute("list")의 반환타입이 Object 타입이므로 형변환 후에 사용	
 	List<EmpDto>list = (List<EmpDto>)request.getAttribute("list");
 
/* 	
 	EmpDao empdao = new EmpDao(application);
 	List<EmpDto> list= empdao.getList();
 	empdao.close();
 	 for(EmpDto listvalue : list) {	
 		//out.print(listvalue + "<br>");
 		out.print(listvalue.getEmp_id() + " ");
 		out.print(listvalue.getEmp_name()+" ");
 		out.print(listvalue.getEmp_no()+" ");
 		out.print("<br>");

 	} 
 	 */
 	 %>

<table border=1px>
	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>주민등록번호</td>
	</tr>	
	<%for(EmpDto dto: list) { %>
	<tr>
		<td><%=dto.getEmp_id() %></td>
		<td><%=dto.getEmp_name()  %></td>
		<td><%=dto.getEmp_no() %></td>
	</tr>
	<% } %>	
</table> 	 
 	 
</body>
</html>