package kr.or.ddit.signup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.signup.dao.ISignupDAO;
import kr.or.ddit.vo.CorporationVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

@Service
public class SignUpServiceImpl implements ISignUpService {

	@Inject
	ISignupDAO dao;
	
	@Override
	@Transactional
	public ServiceResult createMember(MemberVO member) {
		ServiceResult result = null;
		
		if(dao.selectMember(member.getMem_id())==null) {
			int personCnt = dao.insertPerson(member.getPerson());
			int memberCnt = dao.insertMember(member);
			
			if((memberCnt+personCnt) == 2){
				result = ServiceResult.OK;
			}else{
				result = ServiceResult.FAILED;
			}
		}else{
			result = ServiceResult.PKDUPLICATED;
		}
		
		return result;
	}
	
	

	@Override
	@Transactional
	public ServiceResult createCorp(CorporationVO corp) {
		ServiceResult result = null;
		
		if(dao.selectCorporation(corp.getCompany_id())==null) {
			int personCnt = dao.insertPerson(corp.getPerson());
			int corpCnt = dao.insertCorporation(corp);
			
			if((corpCnt+personCnt) == 2){
				result = ServiceResult.OK;
			}else{
				result = ServiceResult.FAILED;
			}
		}else{
			result = ServiceResult.PKDUPLICATED;
		}
		
		return result;
	}



	@Override
	public long retrieveMemberCount(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO retrieveMember(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
