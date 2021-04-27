package kr.or.ddit.partyBoard.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comment.service.CommentServiceImpl;
import kr.or.ddit.comment.service.ICommentService;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.partyBoard.service.IPartyBoardService;
import kr.or.ddit.partyBoard.service.PartyBoardServiceImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.qna.service.QnABoardServiceImpl;

public class GetPartyBoardHandler implements CommandHandler {

	private static final String VIEW_PAGE = "/WEB-INF/view/partyBoard/mealPartyDetail.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 서비스
		IPartyBoardService partyService = PartyBoardServiceImpl.getInstance();
		ICommentService commentService = CommentServiceImpl.getInstance();
		
		// 게시글
		long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		PartyBoardVO pv = partyService.getPartyBoard(boardSeq);
		req.setAttribute("partyVO", pv);
		
		// 조회수 + 1
		partyService.countHits(boardSeq);
		
		// 댓글 목록
		CommentVO cv = new CommentVO();
		cv.setCode("PARTY");
		cv.setBoardSeq(boardSeq);
		req.setAttribute("commentList", commentService.getCommentList(cv));
		
		// 댓글 수
		req.setAttribute("cnt", commentService.getCommentCount(cv));
		
		return VIEW_PAGE;
	}
}
