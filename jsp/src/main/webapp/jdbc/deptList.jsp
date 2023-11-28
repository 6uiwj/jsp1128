<%@page import="com.momo.dto.DeptDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>부서목록</h2>
<% 

//jsp를 단독으로 실행할 경우 null이 출력될 수 있다.
//request.getAttribute 로 받아왔기 때문에 서블릿을 실행해줘야 한다.
 	List<DeptDto>list = (List<DeptDto>)request.getAttribute("list");
 	out.print(list);
%>
 	
 	<%


/* 
DeptDao deptDao = new DeptDao(application);
List<DeptDto> list= deptDao.getList();
deptDao.close();
 for(DeptDto listvalue : list) {	
	//out.print(listvalue + "<br>");
	out.print(listvalue.getDept_id() + " ");
	out.print(listvalue.getDept_title()+" ");
	out.print(listvalue.getLocation_id()+" ");
	out.print(listvalue.getLocal_code()+" ");
	out.print(listvalue.getNational_code()+" ");
	out.print(listvalue.getLocal_name()+" ");
	out.print("<br>");
} 
*/
//out.print(list);
//list.get
%>
</body>
</html>