<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.restInfo.vo.RestInfoVO"%>
<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<EventVO> eventList = (List<EventVO>)request.getAttribute("eventList");
	List<RestInfoVO> restList = (List<RestInfoVO>)request.getAttribute("restList");
%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
      <!-- Sidebar Widgets Column -->
	      <div class="col-md-4">
	        <!-- Categories Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">울트라콜 중인 세호불백</h5>
	          <img class="col-12" src="<%=request.getContextPath() %>/assets/img/restau/seho.jpg">
	          <div class="card-body">
	            <div class="row">
	              <div class="col-lg-12 justify-content-center">
	              	<table class="table">
						<tr class="d-flex">
			              	<td class="col-lg-4">가격&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-success">8000원</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">거리&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-info">10분(600m)</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">분류&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-danger">한식</a></td>
			              	<td class="col-lg-3"></td>
			              	
	              		</tr>
			              	<hr>
						<tr class="d-flex">
			              	<td class="col-lg-4">평점&nbsp;</td>
			              	<td class="col-lg-8">
			              	<div class="starRev">
							  <span class="starR on">별1</span>
							  <span class="starR">별2</span>
							  <span class="starR">별3</span>
							  <span class="starR">별4</span>
							  <span class="starR">별5</span>
							</div>
						<span class='star-rating'>
						<span style ="width:80%"></span>
						</span>
			              	</td>
	              		</tr>
						<tr class="d-flex">
			              	<td class="col-lg-4">주력메뉴&nbsp;</td>
			              	<td class="col-lg-5"><a class="btn btn-md btn-warning">뚝불</a></td>
			              	<td class="col-lg-3"></td>
	              		</tr>
	              	</table>
	              </div>
	              <div class="col-lg-6">
	              </div>
	            </div>
	          </div>
	        </div>
		<!-- Search Widget -->
	        <div class="card my-4 d-flex justify-content-end">
	          <h5 class="card-header">다른식당 검색하러 가기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <a class="btn btn-md btn-primary " href="">목록</a></h5>
	          
	          <div class="card-body">
	            <div class="input-group">
	              <input type="text" class="form-control" placeholder="식당이름으로 찾기">
	              <span class="input-group-append">
	                <button class="btn btn-secondary" type="button">찾기</button>
	              </span>
	            </div>
	          </div>
	        </div>
	
	      </div>
			<!-- Blog Entries Column -->
			<div class="col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
			  <label class="btn active" role="button">
			    <input type="radio" name="options" id="option1" value="1" required="required" checked="checked" onchange="divDis()">이벤트
			  </label>
			  <label class="btn" role="button">
			    <input type="radio" name="options" id="option0" value="0" onchange="divDis()">홍보
			  </label>
			</div>
			<div id="divEve" >
				<h1 class="my-4">
					이벤트 게시판
				</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12" >
					<h2 class="card-title">이벤트중인 식당 목록</h2>
						<table class="table col-12">
							<tbody class="col-12">
								<tr class="d-flex justify-content-start">
									<th class="col-1.5">식당이름</th>
									<th class="col-6">제목</th>
									<th class="col-1.5">거리</th>
									<th class="col-1.5">분류</th>
									<th class="col-1.5">종료일</th>
								</tr>
								<%
								int eventSize = eventList.size();
                                
                               	if(eventSize > 0){
                               		for(int i = 0; i < eventSize; i++){
                               			if("EVE".equals(eventList.get(i).getCode())){
										String endDate = eventList.get(i).getBoardEnd().substring(0, 10);
								%>
								<tr class="d-flex justify-content-start">
                              		<th class="col-1.5"><%=restList.get(i).getRestName() %></th>
									<th class="col-6"><a href="select.do?boardSeq=<%=eventList.get(i).getBoardSeq() %>"><%=eventList.get(i).getBoardTitle() %></a></th>
                              		<th class="col-1.5"><%=restList.get(i).getRestDistance() %></th>
                              		<th class="col-1.5"><%=restList.get(i).getRestType() %></th>
                              		<th class="col-1.5"><%=endDate %></th>
								</tr>
								<% 		}
                              		}
                                }else{ %>
										<tr class="d-flex justify-content-start">
                                  			<th class="col-12">게시글이 없습니다.</th>
                                  		</tr> 
                                 <% } %>
							</tbody>
						</table>
					</div>
					<%
 					if("식당회원".equals(session.getAttribute("USERTYPE"))){
						%>
					<div>
							<a type="button" class="btn btn-lg btn-secondary" href="insert.do">게시글 작성하기</a>
					</div>
						<%
 					}
					%>
				</div>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer
							&rarr;</a></li>
				</ul>
			</div>
			<div id="divPromo" style="display: none">
				<h1 class="my-4">
					홍보 게시판
				</h1>
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12" >
					<h2 class="card-title">홍보중인 식당 목록</h2>
						<table class="table col-12">
							<tbody class="col-12">
								<tr class="d-flex justify-content-start">
									<th class="col-1.5">식당이름</th>
									<th class="col-6">제목</th>
									<th class="col-1.5">거리</th>
									<th class="col-1.5">분류</th>
									<th class="col-1.5">종료일</th>
								</tr>
								<%
                               	if(eventSize > 0){
                               		for(int i = 0; i < eventSize; i++){
                               			if("PROMO".equals(eventList.get(i).getCode())){
                               				
										String endDate = eventList.get(i).getBoardEnd().substring(0, 10);
								%>
								<tr class="d-flex justify-content-start">
                              		<th class="col-1.5"><%=restList.get(i).getRestName() %></th>
									<th class="col-6"><a href="select.do?boardSeq=<%=eventList.get(i).getBoardSeq() %>"><%=eventList.get(i).getBoardTitle() %></a></th>
                              		<th class="col-1.5"><%=restList.get(i).getRestDistance() %></th>
                              		<th class="col-1.5"><%=restList.get(i).getRestType() %></th>
                              		<th class="col-1.5"><%=endDate %></th>
								</tr>
								<%	 }
                             		}
                                }else{ %>
										<tr class="d-flex justify-content-start">
                                  			<th class="col-12">게시글이 없습니다.</th>
                                  		</tr> 
                                 <% } %>
							</tbody>
						</table>
					</div>
					<%
					if("식당회원".equals(session.getAttribute("USERTYPE"))){
						%>
					<div>
							<a type="button" class="btn btn-lg btn-secondary" href="insert.do">게시글 작성하기</a>
					</div>
						<%
					}
					%>
				</div>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer
							&rarr;</a></li>
				</ul>
			</div>
			</div>
			</div>
		</div>
	<!-- /.container -->
	<script type="text/javascript">
	function divDis(){
		 if($('#option1').prop("checked")){
       		 $('#divEve').show();
       		 $('#divPromo').hide();
       	 }else if($('#option0').prop("checked")){
       		 $('#divEve').hide();
       		 $('#divPromo').show();
       	 }
	}
	</script>
	<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>