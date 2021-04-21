<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- js -->
	<script type="text/javascript" src="/MiddleProjectTest/js/jquery-3.6.0.js"></script> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/MiddleProjectTest/js/member/loginForm.js"></script>
	<title>로그인 페이지</title>
</head>
<body>
<!-- keyup할 때마다 포맷팅을 바꿀 수 있는 이벤트가 있음 -->
  <div class="container">
    <h2>로그인 페이지 </h2>
    <form class="form-horizontal" id="fm">
      <div class="form-group"><!-- start ID DIV -->
        <label class="control-label col-sm-2" for="memId">아이디 : </label>
        <div class="col-sm-10 form-inline">
          <input type="text" class="form-control" id="memId"
            placeholder="id를 입력하세요" name="memId" required>
        </div>
      </div><!-- close ID DIV -->
      
      <div class="form-group"><!-- start 비밀번호 DIV -->
        <label class="control-label col-sm-2" for="memPass">비밀번호 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memPass"
            placeholder="비밀번호를 입력하세요" name="memPass" required>
        </div>
      </div><!-- close 비밀번호 DIV -->
      
      <input type="hidden" name="flag" id="formFlag">
    </form>
    
    <div class="form-button text-center">
      <button type="button" class="btn btn-primary" onclick="login('/MiddleProjectTest/member/loginForm.do')">로그인</button>
      <button type="button" class="btn btn-default" onclick="reset()">초기화</button>
      <button type="button" class="btn btn-default" onclick="goToBack()">이전으로</button>
    </div>
  </div>
  
  <form id="tmpFm">
    <input type="hidden" name="action" id="actionTmlFm">
    <input type="hidden" name="memId" id="selectedMemId">
    <input type="hidden" name="targetUrl" id="targetUrl">
  </form>
  <!-- 본문영역 끝 -->
</body>
</html>