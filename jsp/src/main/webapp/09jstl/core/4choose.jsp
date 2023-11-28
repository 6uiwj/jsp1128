<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function(){
		submitBtn.addEventListener('click',function(){
			//콘솔에 로그를 찍을 때 ,로 연결하세요
			//'test'+ event (+로 연결하면 안됨)
			//스크립트는 이벤트에 의해서 동작되는 경우가 많다.
			console.log('event',event);
			console.log('event'+event);
			console.log("===========================");
			
			//기본이벤트를 제거하는 함수
			event.preventDefault();
			console.log('기본이벤트를 제거하였습니다');
	
			//유효성 검사
			let res = validateForm(testForm);
			if(res){
				//폼 전송
				testForm.submit();
			}
			
		});
	}
	
		//form요소를 매개변수로 받아서 form이 가지고 있는 요소의 값을 체크
		//함수 정의
		//type 매개변수명
		//function 함수 이름(매개변수) {}
		function validateForm(form){
			//유효성검사 validation check
			//유효성검사 결과 testForm을 submit 시킵시다.
			//check로직을 모두 통과하였다면 submit, 통과하지 못했다면 메시지 출력
			if(form.kor.value== ''){
				alert('국어점수를 입력해주세요');
				form.kor.focus();
				return false;
			}
			
			if(form.eng.value== ''){
				alert('영어점수를 입력해주세요');
				form.eng.focus();
				return false;

			}
		
			if(form.math.value== ''){
				alert('수학점수를 입력 해주세요');
				form.math.focus();
				return false;

			}
			return true;
		}
	
</script>

</head>
<body>
<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>
<!-- 변수선언 -->
<c:set var="num" value="101"/>

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${num mod 2 eq 0}">
		num(${num })은 짝수입니다.
	</c:when>
	
	<c:otherwise>
		num(${num })은 홀수입니다.
	</c:otherwise>
</c:choose>

<!-- from에 action을 주지 않은 경우, 동일한 페이지를 다시 요청합니다. -->		
<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<p>form, input(국,영,수 성적), 학점구하기 button	</p>
<form name="testForm">
이름:<input type = "text" name="name", value="ming"><br>
국어:<input type = "text" name="kor" value="100"> <br>
영어:<input type = "text" name="eng" value="100"> <br>
수학:<input type = "text" name="math" value="100"> <br>
<!-- 폼에 버튼이 하나만 있다면 이 버튼은 서브밋 버튼이됩니다.
	서브밋버튼은 폼을 전송하는 기본이벤트가 정의되어 있습니다. 
	
	유효성검사(validaton체크)를 진행하기 위해서는 
	기본이벤트를 제거하는 작업을 해야 합니다.-->
<button id="submitBtn">학점 구하기</button>

</form>	

<hr>
<h2>입력받은 값</h2>
<!-- 국어,영어, 수학 점수가 전부 입력되었을 경우에만 출력하기 -->

<c:if test="${ not (empty param.kor or empty param.eng or empty param.math)}" >

이름 : ${param.name} <br>
국어 점수: ${param.kor} <br>
영어 점수: ${param.eng} <br>
수학 점수: ${param.math} <br>
합계 : ${param.kor + param.eng + param.math} <br>
평균 : ${result = (param.kor + param.eng + param.math)/3} <br>

<p> >=90 : A학점, >=80 : B, >= 70 : C, >=60 : D, <60 : F </p>

<c:set var="avg" value="${(param.kor + param.eng + param.math)/3}"/>
${param.name }님의 학점은
<c:choose>
	<c:when test="${result ge 90 }">
	A학점
	</c:when>
	<c:when test="${result ge 80 }">
	B학점
	</c:when>
	<c:when test="${result ge 70 }">
	C학점
	</c:when>
	<c:when test="${result ge 60 }">
	D학점
	</c:when>
	<c:otherwise>F학점</c:otherwise>

</c:choose>
</c:if>
입니다.
<br>

<form name="testForm1">
	국어:<input type = "text" name="kor" value=""> <br>
	영어:<input type = "text" name="eng" value="100"> <br>
	수학:<input type = "text" name="math" value="100"> <br>
	<button onclick="return validateForm(testForm1);">전송</button>
</form>
 <br>
<form name="testForm2"  onsubmit="return validateForm(testForm2);">
	국어:<input type = "text" name="kor" value=""> <br>
	영어:<input type = "text" name="eng" value="100"> <br>
	수학:<input type = "text" name="math" value="100"> <br>
	<button>전송</button>
</form>

		
</body>
</html>