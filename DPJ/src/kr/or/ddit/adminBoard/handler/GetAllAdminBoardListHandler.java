package kr.or.ddit.adminBoard.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminBoard.service.AdminBoardServiceImpl;
import kr.or.ddit.adminBoard.service.IAdminBoardService;
import kr.or.ddit.adminBoard.vo.AdminBoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class GetAllAdminBoardListHandler implements CommandHandler{
	private static String VIEW_PAGE = "";

	@Override
	public boolean isRedirect(HttpServletRequest req) {

		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if("notice".equals("code")) {
			VIEW_PAGE = "/WEB-INF/view/adminBoard/noticeGetAll.jsp";
		}else if("faq".equals("code")){
			VIEW_PAGE = "/WEB-INF/view/adminBoard/faqGetAll.jsp";
		}
		//1. 서비스 객체 생성
		IAdminBoardService boardService = AdminBoardServiceImpl.getInstance();
		
		//2. 게시글 정보 조회
		List<AdminBoardVO> boardList = boardService.getAllAdminBoardList();
		
//		VIEW_PAGE = "/WEB-INF/view/adminBoard/"+ pageVal +"GetAll.jsp";
		req.setAttribute("boardList", boardList);
		return VIEW_PAGE;
	}
}