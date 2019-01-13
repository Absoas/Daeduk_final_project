package kr.or.ddit.common.board.freeboard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.PagingInfoVO;

@Repository
public interface IFreeboardDAO {
	public List<FreeboardVO> selectBoardList(PagingInfoVO<FreeboardVO> pagingVO);
	
	public long selectTotalRecord(PagingInfoVO<FreeboardVO> pagingVO);
}
