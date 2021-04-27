package kr.or.ddit.restInfo.service;

import java.util.List;

import kr.or.ddit.restInfo.vo.RestInfoVO;

/**
 * 회원 정보 처리를 수행하는 서비스
 * @author 유은지
 *
 */
public interface IRestInfoService {
	
	/**
	 * 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @return 회원 정보를 담고있는 List 객체
	 */
	public List<RestInfoVO> getAllRestInfoList();
	
	/**
	 * 하나의 회원 정보를 이용하여 DB를 update 하는 메서드
	 * @param restInfoVo RestInfoVO 객체
	 * @return 작업성공 : 1, 작업 실패 : 0
	 */
	public int updateRestInfo(RestInfoVO restInfoVo);
	
	/**
	 * RestInfoVO에 담긴 자료를 이용하여 회원을 검색하는 메서드
	 * @param restInfoVo 검색할 자료가 들어있는 RestInfoVO 객체
	 * @return 검색 결과를 담은 List
	 */
	public List<RestInfoVO> getSearchRestInfo(RestInfoVO restInfoVo);
	
	/**
	 * restCode를 이용해서 RestInfoVO를 가져오는 메서드
	 * @param restCode
	 * @return
	 */
	public RestInfoVO getRest(String restCode);
	
}
