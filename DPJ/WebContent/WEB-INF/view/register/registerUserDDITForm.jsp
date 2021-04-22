<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 - 굿끼제먹</title>
<link href="/DPJ/assets/css/styles.css" rel="stylesheet" />

<script src="/DPJ/js/jquery-3.6.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/DPJ/assets/js/scripts.js"></script>
<script src="/DPJ/js/util/myUtils.js"></script>
<script src="/DPJ/js/util/ejyooMyutils.js"></script>
<script src="/DPJ/js/userAll/userAll.js"></script>
</head>
<body class="bg-light">
일반 회원 입력 폼
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">회원가입</h3>
							</div>
							<div class="card-body">
								<form id="fm">
								
									<div class="form-group"><!-- 아이디 시작 -->
										<label class="small mb-1" for="userId">아이디</label>
										<div class="input-group">
											<input type="text" class="form-control py-4" id="userId"
												placeholder="아이디를 입력하세요" name="userId">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button" id="userIdChk"
													onclick="chkId()">중복체크</button>
											</div>
										</div>
										<span id="spUserId" style="display:none;"></span>
									</div><!-- 아이디 종료 -->
									
									<div class="form-group"><!-- 비밀번호 시작 -->
										<label class="small mb-1" for="userPw">비밀번호</label> <input
											class="form-control py-4" id="userPw" type="password"
											placeholder="비밀번호를 입력하세요" name="userPw" />
										<span id="spUserPw" style="display:none;"></span>
									</div><!-- 비밀번호 종료 -->
									
									<div class="form-group"><!-- 이름 시작 -->
										<label class="small mb-1" for="dditName">이름</label> <input
											class="form-control py-4" id="dditName" type="text"
											placeholder="이름을 입력하세요" name="dditName" />
										<span id="spDditName" style="display:none;"></span>
									</div><!-- 이름 종료 -->
									
									<div class="form-group"><!-- 프로필 사진 시작 -->
										<label class="small mb-1" for="userPhoto">프로필사진</label> <input
											class="form-control py-4" id="userPhoto" type="text"
											placeholder="프로필사진을 선택하세요" name="userPhoto" />
										<span id="spUserPhoto" style="display:none;"></span>
									</div><!-- 프로필 사진 종료 -->
									
									<div class="form-group"><!-- 소속반 시작 -->
										<label class="small mb-1" for="dditClass">소속반</label> <input
											class="form-control py-4" id="dditClass" type="text"
											placeholder="소속반을 선택하세요" name="dditClass" />
										<span id="spDditClass" style="display:none;"></span>
									</div><!-- 소속반 종료 -->
									
									<div class="form-group"><!-- 휴대폰 번호 시작 -->
										<label class="small mb-1" for="dditHp">휴대폰 번호</label> <input
											class="form-control py-4" id="dditHp" type="text"
											placeholder="휴대폰 번호를 입력하세요(예: 010-0000-0000)" name="dditHp" />
										<span id="spDditHp" style="display:none;"></span>
									</div><!-- 휴대폰 번호 종료 -->
									
									<div class="form-group"><!-- 이메일 주소 시작 -->
										<label class="small mb-1" for="dditMail">이메일</label>
										<div class="input-group">
											<input type="email" class="form-control py-4" id="dditMail"
												placeholder="이메일을 입력하세요" name="dditMail">
											<div class="input-group-append">
												<button class="btn btn-primary" type="button" id="userIdChk"
													onclick="chkId()">중복체크</button>
											</div>
										</div>
										<span id="spDditMail" style="display:none;"></span>
									</div><!-- 이메일 주소 종료 -->
									
									<div class="form-group"><!-- 생년월일 시작 -->
										<label class="small mb-1" for="dditBir">생년월일</label> <input
											class="form-control py-4" id="dditBir" type="date" />
										<span id="spDditBir" style="display:none;"></span>
									</div><!-- 생년월일 종료 -->
									
									<div class="form-group"><!-- 이메일 수신여부 시작 -->
										<label class="small mb-1" for="recvMail">이메일 수신여부</label> <input
											class="form-control py-4" id="recvMail" type="text"
											placeholder="이메일 수신여부를 선택하세요" name="recvMail" />
										<span id="spRecvMail" style="display:none;"></span>
									</div><!-- 이메일 수신여부 종료 -->
									
									<div class="form-group text-center">
										<button type="button" class="btn btn-primary col-5"
											id="registerBtn" onclick="save()">회원가입</button>
										<button type="reset" class="btn btn-outline-primary col-5"
											id="resetBtn">초기화</button>
									</div>
									<input type="hidden" name="flag" id="formFlag">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>

	<!-- 모달영역 -->
	<div class="modal fade" id="zipModal" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">우편번호 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="small mb-1" for="inputDong">동 입력</label>
						<div class="input-group mb-3">
							<input type="text" class="form-control py-4" id="inputDong"
								placeholder="검색하실 동 이름을 입력하세요">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button" id="searchZipBtn"
									onclick="searchZip()">검색</button>
							</div>
						</div>
					</div>
					<table class="table table-hover" id="tbZipResult"
						style="display: none;">
						<thead>
							<tr>
								<th scope="col">우편번호</th>
								<th scope="col">주 소</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>