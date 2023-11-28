<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메시지 출력 후 다른 페이지를 요청하거나 뒤로가기 합니다. -->
<script type="text/javascript">
	//만약 url 값이 있다면 url 요청(location.href=url)
	//서버로부터 전달받은 메시지를 출력합니다.
	let msg = '${msg}';
	//서버로부터 전달받은 url로 이동합니다.
	//단, url이 없다면 뒤로가기를 시행합니다.
	let url = '${url}';
	if(url != '') {
		alert(msg);
		//url로 이동
		//웹브라우저객체 BOM - location
		//페이지 요청함수

	}
	
	if (url != '') {
		location.href = url;
	} else {
		//뒤로가기		
		//history.go(-1);
		history.back();
	}

</script>
</body>
</html>