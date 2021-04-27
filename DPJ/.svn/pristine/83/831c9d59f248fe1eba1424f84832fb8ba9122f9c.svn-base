<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <script src="<%=request.getContextPath() %>/assets/js/restaurant/restaurant.js"> --%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-7">
				<h1 class="my-4">식당 검색</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<h2 class="card-title">가격</h2>
						<div class="d-flex justify-content-start col-md-12">
							 <select id="selectMenuPrice" class="form-control" data-style="btn-primary">
								<option value="5000">5,000원</option>
								<option value="6000">6,000원</option>
								<option value="7000">7,000원</option>
								<option value="8000">8,000원</option>
								<option value="9000">9,000원</option>
								<option value="10000" selected>10,000원 이상</option>
							</select>
						</div>
						<hr>
						<h2 class="card-title">거리</h2>
						<div class="d-flex justify-content-start col-md-12">
							<select id="selectRestDistance" class="form-control">
								<option value="1">3분(100m)</option>
								<option value="2">5분(300m)</option>
								<option value="3">10분(600m)</option>
								<option value="4">15분(900m)</option>
							</select>
						</div>
						
						<hr>
						<h2 class="card-title">분류</h2>
						<div class="d-flex justify-content-start col-md-12">
							<select id="selectRestType" class="form-control">
								<option value="1">한식</option>
								<option value="2">양식</option>
								<option value="3">중식</option>
								<option value="4">일식</option>
							</select>
						</div>
						
						<form id="fm">
							<input type="hidden" id="menuPrice" name="menuPrice">
							<input type="hidden" id="restDistance" name="restDistance">
							<input type="hidden" id="restType" name="restType">
							<input type="hidden" id="restName" name="restName">
						</form>
						
						
						
					</div>
				</div>
					<div class="card-footer d-flex justify-content-center">
						<a class="btn btn-lg btn-secondary" type="button" href="#" onclick="searchMenuHandler()">검색하기!!</a>
					</div>
				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="식당 이름 검색하기" id="inputrestName" name="inputrestName">
							<span class="input-group-append">
								<button class="btn btn-secondary" type="button" onclick="searchNameHandler()">Go!</button>
							</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">김밥천국</h5>
					<img src="assets/img/logos/1.jpg">
					<div class="card-body">대충 식당 좋으니까 먹으라는 내용</div>
				</div>

				<div class="card my-4">
					<h5 class="card-header">울트라 콜 2번째</h5>
					<img src="assets/img/logos/1.jpg">
					<div class="card-body">대충 식당 좋으니까 먹으라는 내용</div>
				</div>

				<div class="card my-4">
					<h5 class="card-header">울트라 콜 2번째</h5>
					<div class="card-body">대충 식당 좋으니까 먹으라는 내용</div>
				</div>
				
			</div>

		</div>
		<!-- /.row -->

	</div>
	
	<!-- /.container -->
<%@include file="/WEB-INF/view/common/bottom.jsp"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
	function searchMenuHandler() {
		var menuPrice = $("#selectMenuPrice option:selected").val();
		var restDistance = $("#selectRestDistance option:selected").val();
		var restType = $("#selectRestType option:selected").val();
		$("#menuPrice").val(menuPrice);
		$("#restDistance").val(restDistance);
		$("#restType").val(restType);
		
		var fm = document.getElementById("fm");
		fm.method = "post"
		fm.action = "/DPJ/searchRest/listSearch.do?searchType=menu";
		fm.submit();
	}
	
	function searchNameHandler() {
		var inputrestName = $("#inputrestName").val();
		
		$("#restName").val(inputrestName);
		
		var fm = document.getElementById("fm")
		fm.method = "post"
		fm.action = "/DPJ/searchRest/listSearch.do?searchType=name";
		fm.submit();
	}
</script>
