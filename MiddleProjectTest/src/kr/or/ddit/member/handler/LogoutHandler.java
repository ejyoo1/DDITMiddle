package kr.or.ddit.member.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comm.handler.CommandHandler;

public class LogoutHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/jsp/member/memberList.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true);
		
		session.invalidate();
		
		return VIEW_PAGE;
	}
	
}
