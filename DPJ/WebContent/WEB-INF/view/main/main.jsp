<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<!-- js -->
<script type="text/javascript" src="/DPJ/js/jquery-3.6.0.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/DPJ/js/main/main.js"></script>

</head>
<body>
	<div>
	메인화면 영역(나중에 원래 메인화면으로 이동해야함.)
	</div>
	<!-- 세션 출력 영역 -->
	<%
		String userId = (String) session.getAttribute("USERID");
		String userType = (String) session.getAttribute("USERTYPE");
		if(userId == null){
			%>
			<button type="button" class="btn btn-primary" onclick="movePageByGet('/DPJ/logInOut/login.do')">로그인</button>
			<%
		} else {
			%>
			<div>
			<%=userType %>(<%=userId %>)로 로그인 하였습니다.
			</div>
			<button type="button" class="btn btn-dark" onclick="logout('/DPJ/logInOut/logout.do')">로그아웃</button>
			<%
		}
	%>
</body>
</html>