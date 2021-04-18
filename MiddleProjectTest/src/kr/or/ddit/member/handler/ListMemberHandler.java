package kr.or.ddit.member.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;

public class ListMemberHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/jsp/member/memberList.jsp"; // 서블릿이기에 이 경로로 접근 가능함. 웹은 접근할 수 없음.
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false; // foward
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		
		return VIEW_PAGE;
	}

}
