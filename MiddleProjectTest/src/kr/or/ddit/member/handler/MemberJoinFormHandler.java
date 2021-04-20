package kr.or.ddit.member.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class MemberJoinFormHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/jsp/member/insertForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else {
			return true; // Post방식일 때 회원 등록하였으므로 페이지 이동 
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else {
			System.out.println("POST");
			return null;
		}
	}

}
