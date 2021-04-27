package kr.or.ddit.restInfo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestInfoVO;

public class RestInfoDaoImpl implements IRestInfoDao{
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(RestInfoDaoImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private static IRestInfoDao restInfoDao;
	private RestInfoDaoImpl() {}
	
	public static IRestInfoDao getInstance() {
		if(restInfoDao == null) { restInfoDao = new RestInfoDaoImpl(); }
		return restInfoDao;
	}

	@Override
	public List<RestInfoVO> getAllRestInfoList(SqlMapClient smc) throws SQLException {
		List<RestInfoVO> restInfoList = smc.queryForList("restinfo.selectRestInfoListAll");
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + restInfoList.size());
		return restInfoList;
	}

	@Override
	public int updateRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException {
		int cnt = 0;
		cnt = smc.update("restinfo.updateRestInfo", restInfoVo);
		RESULT_LOGGER.info("■■■ DAO [0:수정실패] : " + cnt);
		return cnt;
	}

	@Override
	public List<RestInfoVO> getSearchRestInfo(SqlMapClient smc, RestInfoVO restInfoVo) throws SQLException {
		List<RestInfoVO> restInfoList = smc.queryForList("restinfo.getSearchRestInfo", restInfoVo);
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + restInfoList.size());
		return restInfoList;
	}
}
