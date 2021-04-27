<%@page import="java.util.List"%>
<%@ page import="kr.or.ddit.menu.vo.MenuVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <script src="<%=request.getContextPath() %>/assets/js/restaurant/restaurant.js"> --%>

<!-- MAP Style -->
<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>


<script>
function searchHandler(searchType,btnNum) {
	$("#searchType").val(searchType);
	$("#btnNum").val(btnNum);
	
	var fm = document.getElementById("fm");
	fm.method = "post"
	fm.action = "/DPJ/searchRest/list.do";
	fm.submit();
}
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f535229eba283a7816f699aaa287ed65"></script>

<%
	List<MenuVO> menuList = (List<MenuVO>) request.getAttribute("menuList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">식당 검색</h1>

				<!-- Blog Post -->
				<div class="card mb-4">

<!-- 					<div class="card-body"> -->
<!-- 					<table class="table col-12"> -->
<!-- 						<tr class="d-flex justify-content-start"> -->
<!-- 							<th class="col-2">가격</th> -->
<!-- 							<th class="col-2">000원</th> -->
<!-- 							<th class="col-2">거리</th> -->
<!-- 							<th class="col-2">00m</th> -->
<!-- 							<th class="col-2">분류</th> -->
<!-- 							<th class="col-2">?식 </th> -->
<!-- 						</tr> -->
<!-- 					</table> -->

<!-- 					</div> -->
					<div class="card-footer text-muted col-12">
					<h2 class="card-title">검색결과</h2>
						<table class="table col-12">
							<thead>
								<tr class="d-flex justify-content-start">
									<th class="col-1">#</th>
									<th class="col-3">식당이름</th>
									<th class="col-3">메뉴이름</th>
									<th class="col-2">가격</th>
									<th class="col-1">평점</th>
									<th class="col-2">리뷰수</th>
								</tr>
							</thead>
							<tbody class="col-12">
								<%
								int menuListSize = menuList.size();
								
								if(menuListSize > 0){
									for(int i = 0; i < menuListSize ; i++){
										String restCode = menuList.get(i).getRestCode();
										%>
										<tr class="d-flex justify-content-start">
											<td class="col-1"><%= (i+1) %></td>
											<td class="col-3"><a href="<%=request.getContextPath() %>/searchRest/detailRest.do?restCode=<%= restCode %>" ><%= menuList.get(i).getRestName() %></a></td>
											<td class="col-3"><%= menuList.get(i).getMenuName() %></td>
											<td class="col-2"><%= menuList.get(i).getMenuPrice() %></td>
											<td class="col-1"><%= menuList.get(i).getRestFavCnt() %></td>
											<td class="col-2"><%= menuList.get(i).getRestReviewCnt() %></td>
										</tr>
										<%
									}
								} else {
									%>
									<tr align="center">
										<td colspan="5"> 검색결과가 없습니다.</td>
									</tr>
									<%
								}
								%>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
						<a class="btn btn-lg btn-secondary" type="button" href="<%=request.getContextPath() %>/searchRest/list.do">다시 검색하기!!</a>
					</div>
						
					</div>
				</div>
				
				
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">맘스터치</h5>
					<img src="/DPJ/assets/img/restau/moms.jpg">
					<div class="card-body">리뉴얼 중입니다!! 리뉴얼해도 손님 잘 안오면 
					이벤트 할께요</div>
				</div>

				<div class="card my-4">
					<h5 class="card-header">세호불백 울트라 콜 2번째</h5>
					<img src="/DPJ/assets/img/restau/seho.jpg">
					<div class="card-body">대충 식당 좋으니까 먹으라는 내용</div>
				</div>
				
			</div>

		</div>
		<!-- /.row -->

	</div>
	<form id="fm">
		<input type="hidden" id="searchType">
		<input type="hidden" id="btnNum">
	</form>
	
	
	
	<!-- /.container -->
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
	