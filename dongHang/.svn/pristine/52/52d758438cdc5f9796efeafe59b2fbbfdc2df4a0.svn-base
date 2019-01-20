package kr.or.ddit.signup.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.signup.dao.ISignupDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PersonVO;

@Service
public class AuthenticateServiceImpl implements IAuthenticateService {
	ISignupDAO signUpDAO;
	
	@Inject
	public AuthenticateServiceImpl(ISignupDAO signUpDAO) {
		super();
		this.signUpDAO = signUpDAO;
	}


	@Override
	public Object authenticate(PersonVO person) {
		Object result = null;
		PersonVO savedMember = signUpDAO.selectPerson(person.getPerson_id());
		
		if(savedMember!=null) {
			if(savedMember.getPerson_pass().equals(person.getPerson_pass())) {
				result = savedMember;
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
		}else {
			result = ServiceResult.PKNOTFOUND;
		}
		return result;
	}

}





