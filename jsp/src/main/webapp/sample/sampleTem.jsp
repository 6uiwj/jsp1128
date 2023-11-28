<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
	let registerBtn = document.querySelector("#registerBtn");
	registerBtn.onclick = function(){
		alert('클릭');
}
</script>
</head>
<body>
<h3>도서등록</h3>
<%@ include file="/header.jsp" %>
<!-- 메인컨텐츠 영역 시작 -->
        <!-- Begin Page Content -->
        <div class="container-fluid">
</div>
<!-- 메인컨텐츠 영역 끝 -->

<div>
    <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">도서 등록</h6>
                </div>
                <div class="card-body">
<form>
<input type="text" id="title" name="title" placeholder="제목을 입력해주세요"> 
<input type =text" id = "author" name="author" placeholder="작가를 입력해주세요">
<button id="registerBtn" type="submit">등록</button>
</form>
                </div></div>
</div>
<%@ include file ="/footer.jsp" %>
</body>
</html>