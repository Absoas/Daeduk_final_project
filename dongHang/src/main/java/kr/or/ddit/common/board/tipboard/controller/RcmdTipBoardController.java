package kr.or.ddit.common.board.tipboard.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.board.tipboard.service.ITBoardService;

@Controller
public class RcmdTipBoardController {
	@Inject
	ITBoardService service;

	@RequestMapping(value="/tipboard/tipboardRcmd.do")
	public String process(
			@RequestParam(name="what",required=true)long review_no, 
			RedirectAttributes redirectAttributes
			){
		ServiceResult result =
				service.rcmdBoard(review_no);
		String viewName = null;
		switch (result) {
			case OK:
				viewName = "redirect:/tipboard/tipboardView.do?what="+review_no;
				redirectAttributes.addFlashAttribute("message", review_no+"번 글을 추천하였습니다.");
				break;
			default:
				viewName = "redirect:/tipboard/tipboardView.do?what="+review_no;
				redirectAttributes.addFlashAttribute("message", "서버 오류");
				break;
		}
		return viewName;
	}

}
