package kr.or.ddit.member.handler;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.comm.util.HashSha256Test;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class LoginFormHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/jsp/member/loginForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else {
			System.out.println("process 진입 ");
			
			// 파라미터 가져오기
			MemberVO memberVo = new MemberVO();
			BeanUtils.populate(memberVo, req.getParameterMap());
			
			// 비밀번호 암호화 메서드 호출 
			String memPass = HashSha256Test.hashSha256(memberVo.getMemPass());
			memberVo.setMemPass(memPass);
			
			IMemberService memberService = MemberServiceImpl.getInstance();
			memberVo = memberService.checkLoginMember(memberVo);
			
			boolean chk = false;
			PrintWriter out = resp.getWriter();
			
			
			if(memberVo != null) { // 회원이 있다는 뜻
				chk = true;
				HttpSession session = req.getSession(true); // 세션 생성 
				
				String memId = memberVo.getMemId();
				
				session.setAttribute("MEMID", memId);
				session.setAttribute("USERTYPE","관리자");
				
				// 게시글 목록으로 이동 
				String redirectUrl = req.getContextPath() + 
						"/member/memberList.do?login=true";
				return redirectUrl;
			}
			
			return VIEW_PAGE; // 처리 결과에 대한 이동은 js에서 처리함 
		}		
	}

}
