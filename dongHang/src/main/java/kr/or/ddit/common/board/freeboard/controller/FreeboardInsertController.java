package kr.or.ddit.common.board.freeboard.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.board.freeboard.service.IFreeboardService;

//자유게시판 작성 기능
//자유게시판에 게시글을 작성하기 위한 로직

@Controller
public class FreeboardInsertController {
	
	@Inject
	IFreeboardService service;
	
	@RequestMapping("/freeboard/freeboardInsert.do")
	public String getProcess(){
		return "";
	}
}
