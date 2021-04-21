<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="/MiddleProjectTest/css/listcss.css?v=1">


<!-- js -->
<script type="text/javascript" src="/MiddleProjectTest/js/jquery-3.6.0.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/MiddleProjectTest/js/member/memberList.js"></script>
<script type="text/javascript" src="/MiddleProjectTest/js/common/myutils.js"></script>

<title>회원 목록 조회</title>
</head>
<body>
<!-- 세션 출력 영역 -->
<% 
	String userType = (String) session.getAttribute("USERTYPE");
	String memId = (String) session.getAttribute("MEMID");
%>
<!-- 본문영역 시작 -->
	<main id="content">
		<div></div>
		<div><%=userType%>(<%=memId%>)로 로그인 하였습니다. </div>
		<!-- 검색영역 -->
		<article class="search-wrap">
			<header class="search-wrap-header">
				<h4>검색조건</h4>
			</header>
			<div class="search-wrap-body">
				<form id="fm">
					<dl>
						<dt>ID</dt>
						<dd>
							<input type="text" name="memId" id="memId">
						</dd>
						<dt>이름</dt>
						<dd>
							<input type="text" name="memName" id="memName">
						</dd>
					</dl>
					<div class="btn-box-center">
						<button class="btn btn-search" type="button" id="btnSearch"><i class="ico-search-w"></i>검색</button>
						<button class="btn btn-reset" type="reset" id="btnReset"><i class="ico-reset-w"></i>초기화</button>
					</div>
					<input type="hidden" name="flag" value="L">
				</form>
			</div>
		</article>
		<!-- 그리드 목록 -->
		<article class="grid-wrap">
			<header class="grid-wrap-header">
				<h4>회원목록</h4>
				<div class="btn-box-right">
					<div class="btn-group">
						<button type="button" class="btn btn-outline" id="btnExcel1"><i class="ico-download2"></i>엑셀다운로드</button>
						<button type="button" class="btn btn-outline" id="btnExcel2"><i class="ico-excel2"></i>엑셀(상세)다운로드</button>
					</div>
					<button type="reset" class="btn btn-outline"><i class="ico-sms"></i>SMS보내기</button>
				</div>
			</header>
			<div class="grid-wrap-body">
				<table class="gridtbl tbl" id="tbResult">
					<caption>회원 목록</caption>
					<colgroup>
						<col style="width:60px">
						<col style="width:80px">
						<col style="width:12%">
						<col style="width:12%">
						<col style="width:110px">
						<col style="width:160px">
						<col style="width:auto">
						<col style="width:70px">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>비밀번호</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>메일</th>
							<th>직업</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="9">검색 버튼을 클릭하세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="grid-wrap-footer">
				<div class="btn-box-right">
					<button type="button" class="btn btn-dark" onclick="movePageByGet('/MiddleProjectTest/member/insertForm.do')">신규등록</button>
					<button type="button" class="btn btn-dark" onclick="movePageByGet('/MiddleProjectTest/member/loginForm.do')">로그인</button>
					<button type="button" class="btn btn-dark" onclick="logout()">로그아웃</button>
					<button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#myModal">Open Modal</button>
				</div>
			</div>
		</article>
		<form id="tmpFm">
			<input type="hidden" name="action" value="R">
			<input type="hidden" name="memId" id="selectedMemId">
			<input type="hidden" name="targetUrl" id="targetUrl">
		</form>
	</main>
	<!-- 본문영역 끝 -->
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p id="tbZipResult">Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>