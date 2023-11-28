<%@page import="com.momo.dto.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>

<%
	JobDao dao = new JobDao(application);
	List<Job> list = dao.getList();
%>


<h2>직급 목록</h2>
<div class="accordion" id="accordionExample">
<% for(Job job:list) {  %>

  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		<%= job.getJobCode() %>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
			<%= job.getJobName() %>
      </div>
    </div>
    
  </div>
 <% }  %>
</div>


</body>
</html>	