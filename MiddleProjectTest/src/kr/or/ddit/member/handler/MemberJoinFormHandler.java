package kr.or.ddit.member.handler;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.comm.util.HashSha256Test;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberJoinFormHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/jsp/member/insertForm.jsp";
	
	private static final Logger RESULT_LOGGER = Logger.getLogger(MemberJoinFormHandler.class); // 최종 결과에 대한 로거

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
			System.out.println("POST 진입 ");
			
			// 파라미터 가져오기
			MemberVO memberVo = new MemberVO();
			BeanUtils.populate(memberVo, req.getParameterMap());
			
			// 비밀번호 암호화 메서드 호출
			String memPw = HashSha256Test.hashSha256(memberVo.getMemPass());
			memberVo.setMemPass(memPw);
			
			IMemberService memberService = MemberServiceImpl.getInstance();
			int cnt = memberService.insertMember(memberVo);
			RESULT_LOGGER.info("★★insert 수행 결과★★ [1:삽입성공,0:삽입실패] : " + cnt);
			
			String redirectUrl = req.getContextPath() + "/member/memberList.do?msg=" + URLEncoder.encode("성공","UTF-8");
			
			return redirectUrl; // 처리 결과에 대한 페이지 이동은 js에서 처리함.
		}
	}
}

