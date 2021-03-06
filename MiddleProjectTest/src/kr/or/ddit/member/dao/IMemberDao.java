package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행하여 결과를 작성한다.
 * @author 유은지
 *
 */
public interface IMemberDao {
	
	/**
	 * MemberVO 객체에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param mv DB에 insert할 자료가 저장된 MemberVO 객체
	 * @return DB작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환된다.
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int insertMember(SqlMapClient smc, MemberVO mv) throws SQLException;
	
	/**
	 * 주어진 회원 ID가 존재하는지 여부를 알아내는 메서드
	 * @param smc SqlMapClient 객체
	 * @param memId 회원 ID
	 * @return 해당 회원 ID가 존재하면 true, 존재하지 않으면 false
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public boolean checkMember(SqlMapClient smc, String memId) throws SQLException;
	
	/**
	 * 로그인 시 회원 ID와 회원 PW에 일치하는 회원이 존재하는지 여부를 알아내는 메서드 
	 * @param smc SqlMapClient 객체
	 * @param memId 회원 ID
	 * @param memPass 회원 PW
	 * @return ID,PW를 가지는 회원이 존재하면 true, 존재하지 않으면 false
	 * @throws SQLException
	 */
	public MemberVO checkLoginMember(SqlMapClient smc, MemberVO mv) throws SQLException;
	
	/**
	 * DB의 mymember 테이블의 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapClient 객체
	 * @return 회원정보를 담고있는 List 객체
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<MemberVO> getAllMemberList(SqlMapClient smc) throws SQLException;
	
	/**
	 * 하나의 회원정보를 이용하여 DB를 update하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param mv 회원정보 객체
	 * @return 작업성공 : 1, 작업 실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int updateMember(SqlMapClient smc, MemberVO mv) throws SQLException;
	
	/**
	 * 회원ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param memId 삭제할 회원ID
	 * @return 작업성공 : 1, 작업 실패 : 0
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public int deleteMember(SqlMapClient smc, String memId) throws SQLException;
	
	/**
	 * MemberVO 객체에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param smc SqlMapClient 객체
	 * @param mv 검색할 자료가 들어있는 MemberVO 객체
	 * @return 검색된 결과를 담은 List
	 * @throws SQLException
	 */
	public List<MemberVO> getSearchMember(SqlMapClient smc, MemberVO mv) throws SQLException;
	
	/**
	 * 주어진 회원 ID에 해당하는 회원정보를 조회하는 메서드
	 * @param memId 검색할 회원 ID
	 * @return 해당 회원 ID 에 해당하는 회원 정보
	 */
	public MemberVO getMember(SqlMapClient smc, String memId) throws SQLException;
}
