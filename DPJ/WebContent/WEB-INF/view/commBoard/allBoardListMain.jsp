<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<CommBoardVO> boardList = (List<CommBoardVO>) request.getAttribute("boardList");
%>
    
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

<!-- Page Content -->
<div class="container">
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-8">
			<h1>
				통합 커뮤니티 게시판<br>
				<small>[개발, 취업, 잡담, 반별]</small>
			</h1>

			<!-- Blog Post -->
			<div class="card mb-4">

				<div class="card-body">
					<h2 class="card-title">통합 커뮤니티</h2>
					<p class="card-text">굿끼제먹 공식 BGM 브레이브걸스 - rollin</p>
				</div>
				<div class="card-footer text-muted">
					<table class="table">
						<tbody>
							<tr>
								<td>게시글번호</td>
								<td>분류</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
							<%
								int boardSize = boardList.size();
								String atchFile = "N";
								if(boardSize > 0) {
									for(int i = 0; i < boardSize; i++) {
										if(boardList.get(i).getAtchFileId() > 0) {
											atchFile="Y";
										}
							%>

							<tr>
								<td><a href="select.do?boardSeq=<%=boardList.get(i).getBoardSeq()%>"><%=boardList.get(i).getBoardSeq()%></a></td>
								<td><%=boardList.get(i).getCode() %></td>
								<td><%=boardList.get(i).getBoardTitle() %></td>
								<td><%=boardList.get(i).getUserId() %></td>
								<td><%=boardList.get(i).getBoardDate() %></td>
								<td><%=boardList.get(i).getBoardHitsNumber() %></td>
							</tr>
							<%
									}
								} else {
		
							%>
							<tr>
								<td colspan="8">게시판 정보가 없습니다.</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<% if(userId ==null){}
					else if(userType.equals("일반회원") || userType.equals("관리자")){
					%>
					<div class="d-flex justify-content-center mb-4">
						<div class="btn-info"><a class="btn btn-lg" href="insert.do">게시글 등록</a></div>
					</div>
					<% }
					else{}%>

				</div>
			</div>
		</div>

		<!-- Sidebar Widgets Column -->
		<div class="col-md-4">

			<!-- Search Widget -->
			<div class="card my-4">
				<h5 class="card-header">Search</h5>
				<div class="card-body">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="구현중입니다. 2일만 더주세요.">
						<span class="input-group-append">
							<button class="btn btn-secondary" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>

			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">Categories</h5>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<li><span class="text-info">커뮤니티 게시판</span></li>
								<li><a class="text-info" href="<%=request.getContextPath() %>/devBoard/list.do">개발 커뮤니티</a></li>
								<li><a class="text-info" href="#">취업 커뮤니티</a></li>
								<li><a class="text-info" href="#">잡담 커뮤니티</a></li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<li><span class="text-info">반별 커뮤니티</span></li>
								<li><a class="text-info" href="#">401호</a></li>
								<li><a class="text-info" href="#">402호</a></li>
								<li><a class="text-info" href="#">403호</a></li>
								<li><a class="text-info" href="#">404호</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
