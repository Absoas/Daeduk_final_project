package kr.or.ddit.common.board.tipboard.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.common.board.tipboard.service.ITReplyService;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.Travel_Tip_ReplyVO;

@RestController
public class TReplyListController{
	private ITReplyService replyService;
	@Inject
	public void setReplyService(ITReplyService replyService) {
		this.replyService = replyService;
	}
	
	@RequestMapping(value="/tipboard/replyList.do", produces="application/json;charset=UTF-8")
	public PagingInfoVO<Travel_Tip_ReplyVO> process(@RequestParam(required=true) long travel_tip_no,
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			){
	
		
		PagingInfoVO<Travel_Tip_ReplyVO> pagingVO = new PagingInfoVO<>();
		pagingVO.setCurrentPage(currentPage);
		
		Travel_Tip_ReplyVO searchVO = new Travel_Tip_ReplyVO();
		searchVO.setTravel_tip_no(travel_tip_no);
		pagingVO.setSearchVO(searchVO);
		long totalRecord = replyService.retriveReplyCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<Travel_Tip_ReplyVO> replyList = replyService.retriveReplyList(pagingVO);
		pagingVO.setDataList(replyList);
				
		return pagingVO;
	}

}













