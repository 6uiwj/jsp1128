<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.w-15{width:15%}
	.w-20{width:20%}
</style>


<script type="text/javascript">
window.onload = function(){
	//id 접근할 때에는 요소를 선택하지 않고도 접근할 수 있다.!!
	registerBtn.onclick = function(){
		//form요소의 이름으로 접근하여 폼을 전송 (새로운 페이지 요청)
		//등록 처리를 하고 결과페이지 출력
		regForm.action='/book/upload';
		regForm.submit();
}}
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
<form action="/regFileupload" name="regForm" method="post" enctype="multipart/form-data">
<div class="input-group flex-nowrap">
  <span class="w-15 input-group-text" id="addon-wrapping">도서명</span>
  <!--  서버에 값을 넘길 요소 -->
  <input type="text" class="form-control" placeholder="도서명을 입력해주세요" aria-label="Username" 
  aria-describedby="addon-wrapping" name="title">
</div>
<div class="input-group flex-nowrap">
  <span class="w-15 input-group-text" id="addon-wrapping">작가명</span>
  <input type="text" class="form-control" placeholder="작가명을 입력해주세요" aria-label="Username" 
  aria-describedby="addon-wrapping" name="author">
</div>

<div class="input-group flex-nowrap">
  <span class="winput-group-text" id="addon-wrapping">도서소개</span>
  <input type="text" class="form-control" placeholder="소개를 작성해주세요" aria-label="Username" 
  aria-describedby="addon-wrapping" name="content">
</div>

<div class="input-group flex-nowrap">
  <span class="input-group-text" id="addon-wrapping">파일첨부</span>
  <input type="file" class="form-control" id="inputGroupFile01" 
  aria-describedby="addon-wrapping" name="attachedFile">
</div>

<button type="button" class="btn btn-outline-primary"id="registerBtn">등록</button>

</form>


                </div></div>
</div>
<%@ include file ="/footer.jsp" %>
</body>
</html>