package kr.or.ddit.groupCode.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.groupCode.service.GroupCodeInfoServiceImpl;
import kr.or.ddit.groupCode.service.IGroupCodeInfoService;
import kr.or.ddit.groupCode.vo.GroupCodeInfoVO;

public class GetGroupCodeHandler implements CommandHandler {
	
	private static final String VIEW_PAGE = "/WEB-INF/view/code/update.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String groupCode = req.getParameter("groupCode");
		
		IGroupCodeInfoService groupCodeService = GroupCodeInfoServiceImpl.getInstance();
		
		GroupCodeInfoVO gv = groupCodeService.getGroupCode(groupCode);
		
		req.setAttribute("groupCodeVO", gv);
		
		
		return null;
	}
	
	
}
