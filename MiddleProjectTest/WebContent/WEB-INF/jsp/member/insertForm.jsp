<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과제</title>
  <!-- css -->
  <link rel="stylesheet" type="text/css" href="/MiddleProjectTest/css/listcss.css?v=1">
  
  
  <!-- js -->
  <script type="text/javascript" src="/MiddleProjectTest/js/jquery-3.6.0.js"></script> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/MiddleProjectTest/js/common/myutils.js"></script>
  <script type="text/javascript" src="/MiddleProjectTest/js/member/insertForm.js"></script>
</head>
<body>
<!-- keyup할 때마다 포맷팅을 바꿀 수 있는 이벤트가 있음 -->
  <div class="container">
    <h2>회원 등록 페이지</h2>
    <form class="form-horizontal" id="fm">
      <div class="form-group"><!-- start ID DIV -->
        <label class="control-label col-sm-2" for="memId">아이디 : </label>
        <div class="col-sm-10 form-inline">
          <input type="text" class="form-control" id="memId"
            placeholder="id를 입력하세요" name="memId" required>
          <button type="button" class="btn btn-info btn-md" id="btnMemId" onclick="chkId()">중복검사</button>
          <span id="spMemId" style="display:none;">영어 소문자와 숫자 사용 가능. 3~10자리</span>
        </div>
      </div><!-- close ID DIV -->
      
      <div class="form-group"><!-- start 비밀번호 DIV -->
        <label class="control-label col-sm-2" for="memPass">비밀번호 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memPass"
            placeholder="비밀번호를 입력하세요" name="memPass" required>
          <span id="spMemPass" style="display: none;">영어와 숫자를 포함한 8~15자리</span>
        </div>
      </div><!-- close 비밀번호 DIV -->
      
	  <div class="form-group"><!-- start 이름 DIV -->
        <label class="control-label col-sm-2" for="memName">이름 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memName"
            placeholder="이름을 입력하세요" name="memName" required>
          <span id="spMemName" style="display: none;">영어 대문자와 한글 사용 가능. 2~20자리</span>
        </div>
      </div><!-- close 이름 DIV -->

      <div class="form-group">
        <label class="control-label col-sm-2" for="memBir">생년월일 : </label>
        <div class="col-sm-10">
          <input type="date" class="form-control" id="memBir" name="memBir"
            placeholder="생년월일을 입력하세요" required>
          <span id="spMemBir" style="display: none;">생년월일 형식이 바르지 않습니다.</span>
        </div>
      </div><!-- 이메일 종료 -->
      
      <div class="form-group"><!-- start 우편번호 DIV -->
        <label class="control-label col-sm-2" for="memZip">우편번호 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memZip" name="memZip"
            placeholder="우편번호 입력하세요" required>
        </div>
      </div><!-- close 우편번호 DIV -->
      
      <div class="form-group"><!-- start 상세주소1 DIV -->
        <label class="control-label col-sm-2" for="memAdd1">상세주소1 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memAdd1" name="memAdd1"
            placeholder="상세주소1 입력하세요" required>
        </div>
      </div><!-- close 상세주소1 DIV -->
      
      <div class="form-group"><!-- start 상세주소2 DIV -->
        <label class="control-label col-sm-2" for="memAdd2">상세주소2 : </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="memAdd2" name="memAdd2"
            placeholder="상세주소2 입력하세요" required>
        </div>
      </div><!-- close 상세주소2 DIV -->
      
      <input type="hidden" name="flag" id="formFlag">
    </form>
    
    <div class="form-button text-center">
      <button type="button" class="btn btn-primary" onclick="save()">저장</button>
      <button type="button" class="btn btn-default" onclick="reset()">초기화</button>
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