<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commBoard.vo.CommBoardVO"%>
<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommBoardVO cv = (CommBoardVO) request.getAttribute("boardVO");
	int commentCount = (Integer) request.getAttribute("commentCnt");
	List<CommentVO> commentList = (List<CommentVO>) request.getAttribute("commentList");
	if(commentList == null) commentList = new ArrayList<CommentVO>();
%>

<%@include file="/WEB-INF/view/common/mainNav.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-12">
				<h1 class="my-4">
					<%=cv.getCode() %> 커뮤니티 게시판
				</h1>

				<!-- Blog Post -->
				<div class="card mb-4">
					<div class="card-body">
						<table class="table" >
							<tbody>
								<tr class="d-flex text-left">
									<th class="col-1 ">제목</th>
									<th class="col-3 " name="boardTitle"><%=cv.getBoardTitle() %></th>
									<th class="col-6 "></th>
									<th class="col-1 "><small>조회수</small></th>
									<th class="col-1 "name="boardHitsNumber"><small><%=cv.getBoardHitsNumber() %></small></th>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-1 ">작성자</td>
									<td class="col-3 "name="userId"><%=cv.getUserId()%></td>
									<th class="col-6 "></th>
									<td class="col-1 "><small>작성일</small></td>
									<td class="col-1 "name="boardDate"><small><%=cv.getBoardDate() %></small></td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12"><img id="atchFile" class="col-12" src="<%=request.getContextPath() %>/filedownload.do?fileId=<%=cv.getAtchFileId() %>">
									<%if(cv.getAtchFileId() == -1){
										%>
										<script type="text/javascript">
											$("#atchFile").hide();
										</script>
										<% }
										%>
									
									</td>
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12">
								<%=cv.getBoardContent() %>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer d-flex justify-content-center">
							<a class="btn btn-lg btn-secondary" type="button" href="main.do">목록으로 돌아가기</a>
								&nbsp;&nbsp;

							<a id="upd" class="btn btn-lg btn-secondary" type="submit" href="update.do">수정하기</a>
								&nbsp;&nbsp;
							<a id="del" class="btn btn-lg btn-secondary" type="reset" href="delete.do">삭제하기</a>
					</div>
						</div>
					</div>
 					<div class="card-footer">
						<h2 class="card-title">댓글<small class="ml-5"><%=commentCount %> 개</small></h2>
						
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover" >
							<tbody>
							<%
								for (CommentVO commentVO : commentList) {
							%>
								<tr class="d-flex text-left">
									<th class="col-3"><%=commentVO.getUserId() %></th>
									<th class="col-7"><small><%=commentVO.getReplyDate() %></small></th>
									
							<%
								if(commentVO.getUserId().equals(userId)) {
							%>		
									<td class="col-1 text-sm-right">
										<a class="small" id="upBtn<%=commentVO.getReplySeq()%>" onclick="fn_update_click('<%=commentVO.getReplySeq()%>')">수정</a>
										<a class="small" id="cnBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update_cancel('<%=commentVO.getReplySeq()%>');">취소</a>
									</td>
									<td class="col-1 text-sm-right">
										<a class="small" id="dlBtn<%=commentVO.getReplySeq()%>" onclick="fn_delete('<%=commentVO.getReplySeq()%>');">삭제</a>
                						<a class="small" id="cmBtn<%=commentVO.getReplySeq()%>" style="display: none;" onclick="fn_update('<%=commentVO.getReplySeq()%>');">등록</a>
									</td>
							<%
								}
							%>		
								</tr>
								<tr class="d-flex text-left">
									<td class="col-12" id=content<%=commentVO.getReplySeq()%>><%=commentVO.getReplyContent() %></td>
								</tr>
							<%
								}
							%>
							</tbody>
							<%
								if(userId == null) {
								} else {
							%>
							<tbody id="replyArea">
								<tr class="d-flex text-left">
									<th class="col-12 table-info" id="rUserId"><%=userId %></th>
								</tr>
								<tr class="d-flex text-left table-info">
									<td class ="input-group-append col-11">
									<input type="text" class="form-control input-lg" id="rContent" placeholder="댓글을 입력해주세요.">
									</td>
									<td class ="input-group-append col-1">
									<button type="button" class="btn btn-outline-secondary" id="commentBtn" onclick="fn_insert()">등록</button>
									</td>
								</tr>
							</tbody>
							<%								
								}
							 %>	
						</table>
					</div>
				</div>
				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">&larr;Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer&rarr;</a></li>
				</ul>

			</div>
		</div>
	</div>
<!-- 들고나갈 값 -->
<form id="fm" method="post">
	<input type="hidden" name="code" value="DEV">
	<input type="hidden" id="boardSeq" name="boardSeq" value="<%=cv.getBoardSeq()%>">
	<input type="hidden" id="userId" name="userId" value=<%= userId%>>
	<input type="hidden" id="replyContent" name="replyContent">
	<input type="hidden" id="tmpContent">
	<input type="hidden" id="replySeq" name="replySeq">
</form>	
<script type="text/javascript">
	
	function fn_insert() {
		$("#fm").attr("action", "<%=request.getContextPath()%>/comment/insert.do");
		$("#replyContent").val($("#rContent").val());
		$("#fm").submit();
	}
	
	function fn_update(seq) {
	    if(confirm("댓글을 수정하시겠습니까?")) {
	        $('#fm').attr("action", "<%=request.getContextPath()%>/comment/update.do");
	        $('#replySeq').val(seq);
	        var text = $('#newContent').val();
	        $('#replyContent').val(text);
	        $('#fm').submit();
	    }
	}

	function fn_update_click(seq) {
	    $('#upBtn' + seq).hide();
	    $('#cnBtn' + seq).show();
	    $('#dlBtn' + seq).hide();
	    $('#cmBtn' + seq).show();
	    var text = $('#content' + seq).text();
	    $('#content' + seq).html('<textarea class="form-control" id="newContent">' + text + '</textarea>');
	    $('#tmpContent').val(text);
	}

	function fn_update_cancel(seq) {
		$('#upBtn' + seq).show();
	    $('#cnBtn' + seq).hide();
	    $('#dlBtn' + seq).show();
	    $('#cmBtn' + seq).hide();
	    $('#content' + seq).html($('#tmpContent').val());
	}
	
	function fn_delete(seq) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			$('#fm').attr("action", "<%=request.getContextPath()%>/comment/delete.do");
			$('#replySeq').val(seq);
			$('#fm').submit();
		}
	}
	
	
</script>
	
<%@include file="/WEB-INF/view/common/mainFooter.jsp"%>
