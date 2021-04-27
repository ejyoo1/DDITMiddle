<%@page import="kr.or.ddit.partyBoard.vo.PartyBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/common/mainNav.jsp"%>


<%

List<PartyBoardVO> partyList = (List<PartyBoardVO>)request.getAttribute("list");  

%>



        <!-- Masthead-->
        <header class="masthead2">
            <div class="container">
            	<div class="text-light bg-gray ">
	                <div class="masthead-heading text-uppercase">맛집 ㄱㄱ하실?</div>
	            </div>
                <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="#services">게시판 보기</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					Meal파티 게시판
				</h1>
				
				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-footer text-muted col-12">
					<h2 class="card-title">모집중인 밀파티 목록</h2>
						<table class="table col-12 ">
							<tbody class="col-12">
								<tr class="col-12 d-flex justify-content-start">
									<th class="p-2 col-2">식당이름</th>
									<th class="p-2 col-1">가격</th>
									<th class="p-2 col-1">거리</th>
									<th class="p-2 col-1">분류</th>
									<th class="p-2 col-2">작성자</th>
									<th class="p-2 col-2">모집시간</th>
									<th class="p-2 col-2">완료시간</th>
									<th class="p-2 col-1"></th>
								</tr>
								
															<%
								int partySize = partyList.size();
								if(partySize > 0) {
									for(int i = 0; i < partySize; i++) {
										if(partyList.get(i).getAtchFileId() > 0) {
										}
							%>
								
								
								<tr class="d-flex d-flex justify-content-start">
									<td class="p-2 col-2"><%=partyList.get(i).getRestCode() %></td>
									<td class="p-2 col-1"><%=partyList.get(i).getPrice() %></td>
									<td class="p-2 col-1"><%=partyList.get(i).getDistance() %></td>
									<td class="p-2 col-1"><%=partyList.get(i).getCode() %></td>
									<td class="p-2 col-2"><%=partyList.get(i).getUserId() %></td>
									<td class="p-2 col-2"><%=partyList.get(i).getPartyStart() %></td>
									<td class="p-2 col-2"><%=partyList.get(i).getPartyEnd() %></td>
									<td class="p-2 col-1 btn-info">
									<a id="seq" type="btn btn-md" href="select.do?boardSeq=<%=partyList.get(i).getBoardSeq()%>">참석</a>
									
									</td>
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
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>

        </section>
	
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
