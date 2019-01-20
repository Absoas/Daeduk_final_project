package kr.or.ddit.admin.memberManage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.admin.memberManage.dao.IMemberManagementDAO;
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
@Service
public class MemberManagementServiceImpl implements IMemberManagementService {

	@Inject
	IMemberManagementDAO memberManagementDAO;
	
	@Override
	public long retrieveTotalRecord(PagingInfoVO<MemberVO> pagingVO) {
		return memberManagementDAO.selectTotalRecord(pagingVO);
	}

	@Override
	public List<MemberVO> retrieveMemberManagementList(PagingInfoVO<MemberVO> pagingVO) {
		return memberManagementDAO.selectMemberManagementList(pagingVO);
	}

	@Override
	public MemberVO retrieveMemberManagement(String mem_id) {
		return memberManagementDAO.selectMemberManagement(mem_id);
	}

}
