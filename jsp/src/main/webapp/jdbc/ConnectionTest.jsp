<%@page import="com.momo.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="com.momo.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 테스트1</h2>
<%
	//connction 객체 생성 -> 객체를 생성했으므로 생성자 안에 정의되어있던 내용들이 실행 됨
	DBConnection dbcon = new DBConnection();
//10시 22분
	dbcon.stmt = dbcon.con.createStatement();
	dbcon.rs = dbcon.stmt.executeQuery("select sysdate from dual");
	
	dbcon.rs.next();
	out.print("데이터베이스 시간: " + dbcon.rs.getString(1));
	
	out.print("<br>init param: "+ application.getInitParameter("INIT_PARAM"));
	out.print("<br>init param: "+ application.getInitParameter("driver"));
	out.print("<br>init param: "+ application.getInitParameter("url"));
	out.print("<br>init param: "+ application.getInitParameter("id"));
	out.print("<br>init param: "+ application.getInitParameter("pw"));
	dbcon.close();

%>

<h2>JDBC 테스트2</h2>
<%
	DBConnection dbcon2 = new DBConnection(			
			application.getInitParameter("driver"),
			application.getInitParameter("url"),
			application.getInitParameter("id"),
			application.getInitParameter("pw")
			);

	dbcon2.close();

%>

<h3>JDBC 테스트3</h3>
<%
	DBConnection dbcon3 = new DBConnection(application);
	dbcon3.close();
%>

<h2>empDao.getList()</h2>

<%
EmpDao empDao = new EmpDao();
List<EmpDto> list = empDao.getList();
for(EmpDto listvalue : list) {	
//out.print(listvalue + "<br>");
listvalue.getEmp_id();
listvalue.getEmp_name();
listvalue.getEmp_no();

}

//out.print(list);
%>
	


<table>
	<tr>
		<td>사원ID</td>
		<td>사원ID</td>
		<td>사원ID</td>
		
	</tr>
	<% 
	for(EmpDto listvalue : list) {
		%>
	<tr>
		<td><%=listvalue.getEmp_id()  %></td>
		<td><%=listvalue.getEmp_name()  %></td>
		<td><%=listvalue.getEmp_no()  %></td>
		
	</tr>
<% }	%>
</table>


</body>
</html>