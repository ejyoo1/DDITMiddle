package kr.or.ddit.qna.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.qna.service.IQnABoardService;
import kr.or.ddit.qna.service.QnABoardServiceImpl;
import kr.or.ddit.qna.vo.QnABoardVO;

public class DeleteQnABoardHandler implements CommandHandler{
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		IQnABoardService qnaService = QnABoardServiceImpl.getInstance();
		QnABoardVO qna = new QnABoardVO();
		BeanUtils.populate(qna, req.getParameterMap());
		
		qnaService.deleteQnABoard(qna);
		String redirectUrl = req.getContextPath() + "/qnaBoard/list.do?msg=";
		return redirectUrl;
	}
}
