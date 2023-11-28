<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl의 core태그를 사용하기 위해 태그라이브러리 지시자를 추가합니다. -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- 마우스가 손 모양으로? -->
<style type="text/css">
	.pointer {
		cursor : pointer;
		}

</style>
<script type="text/javascript" >
/* 
	스크립트에서 함수 정의하는 방법
	function 함수명 (파람0, 파람1, ...){
	
	}
	함수의 호출
	함수명(파람0, 파람1,....);
*/
window.onload = function(){
	let regBtn = document.querySelector("#regBtn");
	regBtn.addEventListener('click', function(){
		location.href='/book/reg.jsp';
	})
	
	searchBtn.addEventListener('click',function(){
		searchForm.action = "/book/list";
		searchForm.submit();
	})
}
function msg(str){
	alert(str);
	
}


function view(no) {
	//화면 요청
	location.href="/book/view?no=" + no;
	
}
</script>

</head>
<body>
<%@ include file ="/header.jsp" %>

		<!--  메인컨텐츠 영역 -->
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">이대 도서관</h1>
            <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                For more information about DataTables, please visit the <a target="_blank"
                    href="https://datatables.net">official DataTables documentation</a>.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">도서 목록</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
<%-- 				pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
				num : <input type="text" name="no" value="">
				amount : 	<input name="amount" value="1">
     --%>            
                 <!--  form submit() 
                 	폼이 가지고 있는 요소를 파라미터로 서버에 요청(action)을 하는 것      -->                                                
                <form name="searchForm" action="/book/list" >
						                                     

				<div class="input-group">
				  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">	
				
				 	<option value="title"
				 		${pageDto.cri.searchField  eq 'title'? 'selected' : ''}
				 	>도서명</option>
					<option value="author" 
						${pageDto.cri.searchField  eq 'author'? 'selected' : ''}
						>작가</option>
				
				  </select>
				  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" class="form-control" aria-label="Text input with dropdown button">
				  <button class="btn btn-outline-secondary" type="submit" id="searchBtn">검색</button>
				</div>
				</form>
				

	
                   <p> <button type="button" class="btn btn-dark" id="regBtn">도서등록</button></p>
                    
                    
                    
                    
                    <!-- id="dataTalbe을 삭제해봐 일단....스크립트에서 페이징처리하는 게 작동된다. -->
                        <table class="table table-bordered"  width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                      <th scope="col">도서번호</th>
     								 <th scope="col">도서명</th>
     								 <th scope="col">작가</th>
   									  <th scope="col">대여여부</th>
                                </tr>
                            </thead>
                      
                            <tbody>
                             <c:if test="${empty list }" var="res">
								  	<tr>
								  		<td colspan="4">도서목록이 존재하지 않습니다.</td>
								  	</tr> 
								  </c:if>
								  
								  <!-- 리스트가 비어있지 않다면 도서목록을 출력 -->
								  <c:if test="${not res }">
								  <c:forEach items="${ list}"  var="dto"> 
								    <tr>
								      <th scope="row">${dto.no }</th>
								      <td class= "pointer" 
								      		onclick="view(${dto.no})">
								      		${dto.title }
								      </td>
								      <td>${dto.author }</td>
								      <!--  Y/N 대여중 -->
								      <td>${dto.rentYnStr }</td>
								    </tr>
								    </c:forEach>
								   </c:if> 
								   
                            </tbody>
                        </table>
<!-- page navi -->
<!-- pageDto가 request영역에 저장 되어 있으면 페이지 블럭을 출력 합니다. -->
   <%@include file = "/06session/servletEx/pageNavi.jsp" %>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
        <!--  메인컨텐츠 영역 끝-->

 
    

 


<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<%@ include file ="/footer.jsp" %>

</body>
</html>