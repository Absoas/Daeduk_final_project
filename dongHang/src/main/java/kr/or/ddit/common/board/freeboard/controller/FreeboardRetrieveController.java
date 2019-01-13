package kr.or.ddit.common.board.freeboard.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.board.freeboard.service.IFreeboardService;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.PagingInfoVO;

//자유게시판 조회 기능
//자유게시판의 게시글을 조회할 수 있는 로직

@Controller
public class FreeboardRetrieveController {
	
	@Inject
	IFreeboardService service;
	
	@RequestMapping(value="/freeboard/freeboardRetrieve.do", produces="application/json;charset=UTF-8")
	public PagingInfoVO<FreeboardVO> processAsync(
			@RequestParam(required=false) String searchType,	
			@RequestParam(required=false) String searchWord,
				@RequestParam(name="page", required=false, defaultValue="1") int currentPage
			){
		FreeboardVO searchVO = new FreeboardVO();
		if(StringUtils.isNotBlank(searchWord)) {
			if(StringUtils.isBlank(searchType)) {
				searchVO.setMem_id(searchWord);
				searchVO.setBoard_title(searchWord);
				searchVO.setBoard_content(searchWord);
			}else {
				switch (searchType) {
				case "writer":
					searchVO.setMem_id(searchWord);
					break;
				case "title":
					searchVO.setBoard_title(searchWord);
					break;
				case "content":
					searchVO.setBoard_content(searchWord);	
					break;
				}
			}
		}
		PagingInfoVO<FreeboardVO> pagingVO = new PagingInfoVO<>(5,5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSearchVO(searchVO);
		long totalRecord = service.retrieveBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);;
		
		List<FreeboardVO> boardList = service.retrieveBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		return pagingVO;
		
	}
	
	@RequestMapping(value="/freeboard/freeboardRetrieve.do")
	public String setProcess(
			@RequestParam(required=false) String searchType,	
			@RequestParam(required=false) String searchWord,
			@RequestParam(name="page", required=false, defaultValue="1") int currentPage,
			Model model
			){
		PagingInfoVO<FreeboardVO> pagingVO =
				processAsync(searchType, searchWord, currentPage);
		model.addAttribute("pagingVO", pagingVO);
		return "common/board/freeboard/freeboardList";
	}
}