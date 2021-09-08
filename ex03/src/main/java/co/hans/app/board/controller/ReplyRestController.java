package co.hans.app.board.controller;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.ReplyPageVO;
import co.hans.app.board.domain.ReplyVO;
import co.hans.app.board.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {
  
  @Autowired ReplyService replyService;
  
  //해당 게시글의 댓글만 조회
//  @GetMapping("/")
//  public List<ReplyVO> getList(Criteria cri, @RequestParam Long bno){
//	  return replyService.getList(cri, bno);
//  }
  @GetMapping("/")
  public ReplyPageVO getListWithPaging(Criteria cri, @RequestParam Long bno){
	  return replyService.getListWithPaging(cri, bno);
  }
  
  //댓글조회
  @GetMapping("/{rno}")
  public ReplyVO read(@PathVariable Long rno, ReplyVO vo){
	  vo.setRno(rno);
	  return replyService.read(vo);
  }
  //등록
  @PostMapping("/")  //post, get : 파라미터 질의문자열(query string) ->id=100&pw111&name=choi
  public ReplyVO insert(ReplyVO vo) {
	  replyService.insert(vo);
	  return replyService.read(vo);
  }
  //수정
  @PutMapping("/")  //put, delete : 파라미터가 json 이어야 한다 -> {id:100, pw:"111", name:"choi"}
  public ReplyVO update(@RequestBody ReplyVO vo) {
	  replyService.update(vo);
	  return replyService.read(vo);
  }
  //삭제
  @DeleteMapping("/{rno}")
  public boolean delete(@PathVariable Long rno,ReplyVO vo) {
	  vo.setRno(rno);
	  int r =replyService.delete(vo);
	  return r==1 ? true : false;
  }
}
