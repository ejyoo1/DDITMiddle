package kr.or.ddit.restInfo.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.restInfo.dao.RestInfoDaoImpl;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestInfoVO;

public class DetailRestHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/restaurant/restaurantDetail.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//식당 번호 가져오기
		String restCode = (String)req.getParameter("restCode");
		
		//서비스 호출
		IRestInfoService restService = RestInfoServiceImpl.getInstance();
		
		RestInfoVO rv = restService.getRest(restCode);
		req.setAttribute("restVO", rv);
		
		return VIEW_PAGE;
	}

}
