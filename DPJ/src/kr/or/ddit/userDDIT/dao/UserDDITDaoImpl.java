package kr.or.ddit.userDDIT.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.userDDIT.vo.UserDDITVO;

public class UserDDITDaoImpl implements IUserDDITDao {
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(UserDDITDaoImpl.class); // 최종 결과에 대한 로거

	// 필요한 객체 생성
	private static IUserDDITDao userDDITDao;
	private UserDDITDaoImpl() {}
	
	public static IUserDDITDao getInstance() {
		if(userDDITDao == null) { userDDITDao = new UserDDITDaoImpl(); }
		return userDDITDao;
	}

//	@Override
//	public int checkUserDDIT(SqlMapClient smc, String userId) throws SQLException {
//		int cnt = (int) smc.queryForObject("userddit.checkUser", userId);
//		RESULT_LOGGER.info("■■■ DAO [0:자료없음] : " + cnt);
//		return cnt;
//	}

	@Override
	public int insertUserDDIT(SqlMapClient smc, UserDDITVO userDDITVo) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("userddit.insertUserDDIT", userDDITVo);
		if(obj == null) { cnt = 1; }; // 데이터 삽입 성공
		RESULT_LOGGER.info("■■■ DAO [0:삽입 실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<UserDDITVO> getAllUserDDITList(SqlMapClient smc) throws SQLException {
		List<UserDDITVO> userDDITList = smc.queryForList("userddit.selectUserDDITListAll");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + userDDITList.size());
		return userDDITList;
	}

	@Override
	public int updateUserDDIT(SqlMapClient smc, UserDDITVO userDDITVo) throws SQLException {
		int cnt = 0;
		cnt = smc.update("userddit.updateUserDDIT", userDDITVo);
		RESULT_LOGGER.info("■■■ DAO [0:수정실패] : " + cnt);
		return cnt;
	}

//	@Override
//	public int deleteUserDDIT(SqlMapClient smc, String userId) throws SQLException {
//		int cnt = 0;
//		cnt = smc.delete("userddit.deleteUserDDIT", userId);
//		RESULT_LOGGER.info("■■■ DAO [0:삭제실패] : " + cnt);
//		return cnt;
//	}

	@Override
	public List<UserDDITVO> getSearchUserDDIT(SqlMapClient smc, UserDDITVO userDDITVo) throws SQLException {
		List<UserDDITVO> userDDITList = smc.queryForList("userddit.getSearchUserDDIT", userDDITVo);
		RESULT_LOGGER.info("■■■ DAO [가져온 목록 수] : " + userDDITList.size());
		
		return userDDITList;
	}
	

}
