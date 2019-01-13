package kr.or.ddit.common.board.freeboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.PagingInfoVO;

@Service
public interface IFreeboardService {
	public List<FreeboardVO> retrieveBoardList(PagingInfoVO<FreeboardVO> pagingVO);
	
	public long retrieveBoardCount(PagingInfoVO<FreeboardVO> pagingVO);
}
