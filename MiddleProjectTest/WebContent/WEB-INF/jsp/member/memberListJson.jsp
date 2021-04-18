<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    System.out.println("memberListResult.jsp JSON 변환 시작");
    %>
[
<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("memList"); // 조회 결과를 "list"로 담아줬음. [MemberServlet.java 48 line]
	for(int i = 0 ; i < list.size() ; i++){
		MemberVO vo = list.get(i);
		String memId = vo.getMemId();
		String memName = vo.getMemName();
	
	// json 타입으로 만들기 시작 ==> {"name" : "~", "id" : "~"}
	
	// 번호, id, 이름, 생년월일, 전화번호, 직업
	// 번호, id, 이름, 비밀번호, 생년월일, 전화번호, 메일, 직업
		if(i>0){
			%>,<%
		}
 %>
  {
    "memName" : "<%=memName %>"
    , "memId" : "<%=memId %>"
    , "memPass" : "<%=vo.getMemPass() %>"
    , "memBir" : "<%=vo.getMemBir() %>"
    , "memHp" : "<%=vo.getMemHp() %>"
    , "memMail" : "<%=vo.getMemMail() %>"
    , "memJobName" : "<%=vo.getMemJobName() %>"
  }
<%
}
%>
]