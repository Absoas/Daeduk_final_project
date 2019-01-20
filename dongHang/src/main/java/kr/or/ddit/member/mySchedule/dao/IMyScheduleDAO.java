package kr.or.ddit.member.mySchedule.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MyScheduleVO;

/**
 * @author 서신원
 * @since 2019. 1. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 1. 14.      서신원        최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IMyScheduleDAO {
	
	/**
	 * 달에 맞는 일정 내역 조호;
	 * @param mem_id TODO
	 * @return 조건에 맞는 글이 없다면 size()==0
	 */
	public List<MyScheduleVO> selectMyScheduleList(String mem_id);
	
	/**
	 * 일정 상세조회
	 * @param myschedule_no 일정 번호
	 * @return 없다면 null 반환
	 */
	public MyScheduleVO selectMySchedule(long myschedule_no);
	
	/**
	 * 일정을 등록
	 * @param myschedule 등록할 일정 정보를 가진 VO
	 * @return 성공(>0) 실패
	 */
	public int insertMySchedule(MyScheduleVO myschedule);
	
	/**
	 * 일정 수정
	 * @param myschedule 등록할 일정 정보를 가진 VO
	 * @return 성공(>0) 실패
	 */
	public int updateMySchedule(MyScheduleVO myschedule);
	
	/**
	 * 일정 삭제
	 * @param myschedule_no 일정 번호
	 * @return성공(>0) 실패
	 */
	public int deleteMySchedule(long myschedule_no);
}
