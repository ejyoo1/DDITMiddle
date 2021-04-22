package kr.or.ddit.main.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;

public class MainLoadHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/login/main.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return VIEW_PAGE;
	}

}
