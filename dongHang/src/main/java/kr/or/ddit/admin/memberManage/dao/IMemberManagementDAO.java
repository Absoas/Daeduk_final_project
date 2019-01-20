package kr.or.ddit.admin.memberManage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

/**
 * @author 서신원
 * @since 2019. 1. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 1. 18.      서신원        최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IMemberManagementDAO {
	
	/**
	 * 검색과 페이징을 위한 전체 게시글 수 조회
	 * @param pagingVO 조건을 가진 VO
	 * @return 조건에 맞는 글이 없다면 0 반환
	 */
	public long selectTotalRecord(PagingInfoVO<MemberVO> pagingVO);
	
	/**
	 * 검색조건에 맞는 게시글 목록 조회
	 * @param pagingVO 조건과 페이징 속성을 가진 VO
	 * @return 조건에 맞는 글이 없다면 size()==0
	 */
	public List<MemberVO> selectMemberManagementList(PagingInfoVO<MemberVO> pagingVO);
	
	/**
	 * 회원 상세조회 
	 * @param mem_id 회원 아이디
	 * @return 없다면 null 반환
	 */
	public MemberVO selectMemberManagement(String mem_id);
	
	
}
