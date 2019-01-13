package kr.or.ddit.common.board.freeboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.board.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.PagingInfoVO;

@Service
public class FreeboardServiceImpl implements IFreeboardService{
	
	@Inject
	IFreeboardDAO dao;

	@Override
	public List<FreeboardVO> retrieveBoardList(PagingInfoVO<FreeboardVO> pagingVO) {
		return dao.selectBoardList(pagingVO);
	}

	@Override
	public long retrieveBoardCount(PagingInfoVO<FreeboardVO> pagingVO) {
		return dao.selectTotalRecord(pagingVO);
	}

	
}
