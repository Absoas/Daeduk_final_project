package kr.or.ddit.common.board.tipboard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.board.tipboard.service.ITReplyService;
import kr.or.ddit.vo.Travel_Tip_ReplyVO;

/**
 * @author 서신원
 * @since 2019. 1. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 1. 25.      서신원        최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TReplyUpdateController {
	
	@Inject
	ITReplyService service;
	
	@RequestMapping(value="/tipboard/replyUpdate.do")
	public String process(
			Travel_Tip_ReplyVO reply,
			Model model
			){
		ServiceResult result = service.modifyReply(reply);
		String view = null;
		Map<String, String> errors = new HashMap<>();
		view = "jsonView";
		if (ServiceResult.OK.equals(result)) {
			view = "redirect:/tipboard/replyList.do?travel_tip_no="+reply.getTravel_tip_no();
		} else {
			errors.put("error", "true");
			errors.put("message", "서버오류");
		}
		model.addAttribute("errors", errors);
		return view;
	}
}
