package kr.or.ddit.member.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class ListMemberJsonHandler implements CommandHandler {
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false; // foward
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) {
		try {
			// 1. 서비스 객체 생성하기
			IMemberService memberService = 
					MemberServiceImpl.getInstance();
			
			// 2. 회원정보 조회
			List<MemberVO> memList = memberService.getAllMemberList();
			
			/** Gson 적용 부분 *********/
			Gson gson = new Gson();
			String strJson = gson.toJson(memList);
			
			PrintWriter out = resp.getWriter();
			out.print(strJson);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/************************/
		
		return null; // 이동할 페이지 없이 js ajax에서 처리 
	}

}
