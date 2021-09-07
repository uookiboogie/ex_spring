package co.hans.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.hans.app.board.domain.BoardVO;

@Controller
public class AjaxTestController {

	@GetMapping("/ajax1")
	@ResponseBody
	public BoardVO test1(BoardVO vo) {

		vo.setContent("하이요");
		return vo;
	}
	@PostMapping("/ajax2") //get은 안됨
	@ResponseBody
	public BoardVO test2(@RequestBody BoardVO vo) { //제이슨으로 보내기

		vo.setContent("하이요");
		return vo;
	}
}
